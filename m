From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Tue, 22 Nov 2016 17:32:51 -0800
Subject: [Buildroot] [RFC] external toolchain scanner
Message-ID: <303be768-557b-3b02-c4fd-ae11ec2858ec@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The attached python script inspects an external toolchain and spits out 
BR config settings, like so (with a Linaro toolchain):

    aurora:buildroot$ ./support/scripts/scan-ext-toolchain /foo/gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
    BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_7=y
    BR2_TOOLCHAIN_EXTERNAL_CXX=y
    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
    BR2_TOOLCHAIN_EXTERNAL_GF=y
    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="aarch64-linux-gnu"
    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
    BR2_TOOLCHAIN_EXTERNAL_PATH="/foo/gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux"

It also works with multi-arch toolchains (this one from Mentor Graphics):

    aurora:buildroot$ ./support/scripts/scan-ext-toolchain /foo/codesourcery/codebench/
    Toolchain supports multiple targets. Please choose one of the following: ['aarch64-linux-gnu', 'arm-none-eabi', 'arm-none-linux-gnueabi']
    aurora:buildroot$ ./support/scripts/scan-ext-toolchain -t arm-none-linux-gnueabi /foo/codesourcery/codebench/
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
    BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
    BR2_TOOLCHAIN_EXTERNAL_CXX=y
    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX=arm-none-linux-gnueabi
    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
    BR2_TOOLCHAIN_EXTERNAL_PATH="/foo/codesourcery/codebench/"

It complains about bare-metal toolchains:

    aurora:buildroot$ ./support/scripts/scan-ext-toolchain -t arm-none-eabi /foo/codesourcery/codebench/
    Is this a Linux toolchain? Couldn't find the sysroot in:
             /foo/codesourcery/codebench/arm-none-eabi/libc
             /foo/codesourcery/codebench/arm-none-eabi/sysroot


Current limitations that I know of:

1. I haven't run through a full build with it yet, but it looks like 
it's doing the right thing.

2. It detects MUSL and UCLIBC toolchains, but it looks like further work 
is needed to detect SSP, RPC, etc, for those toolchain types.

3. There is no guarantee that BR2_arch matches 
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX.

4. Users would run it something like this:

    ./support/scripts/scan-ext-toolchain > toolchain.defconfig
    cat board.defconfig toolchain.defconfig > defconfig
    make ... BR2_DEFCONFIG=defconfig

Creating and managing board.defconfig without toolchain configuration 
data is left as an (awkward?) exercise for the user.


Comments?

-- 
Hollis Blanchard <hollis_blanchard@mentor.com>
Mentor Graphics Emulation Division

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161122/9ddf9a99/attachment.html>
-------------- next part --------------
#!/usr/bin/env python

# Copyright 2016 Mentor Graphics Corporation
# All Rights Reserved
#
# THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY
# INFORMATION WHICH ARE THE PROPERTY OF MENTOR
# GRAPHICS CORPORATION OR ITS LICENSORS AND IS
# SUBJECT TO LICENSE TERMS.

import sys
import os
import subprocess
import re
from optparse import OptionParser

class ExtToolchainMetadata:
	def __init__(self, base_path):
		self.cfg = {}
		self.tools = {}
		self.base_path = base_path
		self.sysroot_path = None

	def get_buildroot_cfg(self):
		result = 'BR2_TOOLCHAIN_EXTERNAL=y\n'
		for k, v in self.cfg.items():
			result += 'BR2_TOOLCHAIN_EXTERNAL_%s=%s\n' % (k, v)
		return result

def probe_prefix(path, target, metadata):
	libexec_path = os.path.join(path, 'libexec', 'gcc') 

	if not os.path.isdir(libexec_path):
		raise RuntimeError("Couldn't examine directory %s" % libexec_path)

	targets = os.listdir(libexec_path)
	if len(targets) == 0:
		raise RuntimeError("Couldn't find any targets in %s" % libexec_path)

	if not target:
		if len(targets) > 1:
			raise RuntimeError('Toolchain supports multiple targets. '
					'Please choose one of the following: %s' % (targets))
		target = targets[0]
	else:
		if target not in targets:
			raise RuntimeError('Toolchain does not support target %s.' % target)
		target = target

	# XXX use ARCH instead?
	# cpu, vendor_os = target.split('-', 1)
	# metadata.cfg['CUSTOM_PREFIX'] = '"$(ARCH)-%s"' % vendor_os
	metadata.cfg['CUSTOM_PREFIX'] = '"%s"' % target

def probe_tools(path, metadata):
	class Tool:
		def __init__(self, executable, cfgname=None):
			self.executable = executable
			self.cfgname = cfgname

	tools = (
		Tool('gcc'),
		Tool('readelf'),
		Tool('g++', 'CXX'),
		Tool('gfortran', 'GF'),
	)

	prefix = metadata.cfg['CUSTOM_PREFIX'].strip('"')

	for tool in tools:
		full_name = '%s-%s' % (prefix, tool.executable)
		full_path = os.path.join(path, 'bin', full_name)

		if os.path.exists(full_path):
			metadata.tools[tool.executable] = full_path
			if tool.cfgname:
				metadata.cfg[tool.cfgname] = 'y'

def probe_gcc_version(metadata):
	argv = [
		metadata.tools['gcc'],
		'--version',
	]

	proc = subprocess.Popen(argv, stdout=subprocess.PIPE)
	output = proc.communicate()[0]
	line1 = output.splitlines()[0]

	m = re.match('^[^)]+\) ([^ ]+)', line1)
	if not m:
		raise RuntimeError("%s\n\tdidn't report a recognizable version:\n%s" %
				(metadata.tools['gcc'], line1))

	version = m.group(1) # E.g. 4.9.2
	major, minor = [ int(i) for i in version.split('.', 2)[:2] ]
	metadata.cfg['GCC_%d_%d' % (major, minor)] = 'y'

def probe_gcc_sysroot(metadata):
	# Sysroot directories could have a couple names:
	subdirs = ('libc', 'sysroot')

	# Construct a list of full paths so that in case of failure we can tell the
	# user exactly where we searched.
	base = metadata.base_path
	prefix = metadata.cfg['CUSTOM_PREFIX'].strip('"')
	sysroot_paths = [ os.path.join(base, prefix, d) for d in subdirs ]

	sysroot_path = None
	for path in sysroot_paths:
		if os.path.exists(path):
			sysroot_path = path
			break

	if not sysroot_path:
		msg = "Is this a Linux toolchain? Couldn't find the sysroot in:\n\t%s"
		raise RuntimeError(msg % '\n\t'.join(sysroot_paths))

	metadata.sysroot_path = sysroot_path

def probe_gcc_headers(metadata):
	version_path = os.path.join(metadata.sysroot_path,
		'usr',
		'include',
		'linux',
		'version.h'
	)
	version_re = '#define LINUX_VERSION_CODE ([0-9]+)'

	with open(version_path) as version_file:
		linux_version_code = version_file.readline()

	m = re.match(version_re, linux_version_code)
	if not m:
		msg = "Didn't recognize LINUX_VERSION_CODE in %s"
		raise RuntimeError(msg % version_path)

	version = int(m.group(1))
	major = (version >> 16) & 0xff
	minor = (version >> 8) & 0xff
	metadata.cfg['HEADERS_%d_%d' % (major, minor)] = 'y'

def probe_libc(metadata):
	libc_re = '  -m(glibc|musl|eglibc)\s+\[enabled\]'
	argv = [
		metadata.tools['gcc'],
		'-Q',
		'--help=target',
	]

	proc = subprocess.Popen(argv, stdout=subprocess.PIPE)
	output = proc.communicate()[0].splitlines()
	for line in output:
		m = re.match(libc_re, line)
		if m:
			libc = m.group(1)
			metadata.cfg['CUSTOM_%s' % libc.upper()] = 'y'
			break

def probe_rpc(metadata):
	rpc_path = os.path.join(metadata.sysroot_path,
		'usr',
		'include',
		'rpc',
		'rpc.h')
	if os.path.exists(rpc_path):
		metadata.cfg['HAS_RPC'] = 'y'

def probe(path, options, metadata):
	metadata.cfg['CUSTOM'] = 'y'
	metadata.cfg['PATH'] = '"%s"' % path

	probe_prefix(path, options.target, metadata)
	probe_tools(path, metadata)
	probe_gcc_version(metadata)
	probe_gcc_sysroot(metadata)
	probe_gcc_headers(metadata)
	probe_libc(metadata)
	probe_rpc(metadata)

def output_cfg(metadata):
	for k, v in metadata.items():
		sys.stdout.write('BR2_TOOLCHAIN_%s=%s\n' % (k, v))

def main():
	parser = OptionParser()
	parser.add_option('-t', '--target', dest='target')

	(options, arguments) = parser.parse_args()

	if len(arguments) < 1:
		print "Missing path to toolchain base directory"
		sys.exit(1)
	toolchain_dir = arguments[0]
	if not os.path.isdir(toolchain_dir):
		print "Not a directory: %s" % toolchain_dir
		sys.exit(2)

	metadata = ExtToolchainMetadata(toolchain_dir)
	probe(toolchain_dir, options, metadata)
	print metadata.get_buildroot_cfg().strip()

if __name__ == '__main__':
	try:
		main()
	except RuntimeError, e:
		print e
