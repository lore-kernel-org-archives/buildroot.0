From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 8 Dec 2016 22:02:28 +0100
Subject: [Buildroot] [RFC] external toolchain scanner
In-Reply-To: <8037285d-a8b2-39c9-30c4-cba364583ae9@mentor.com>
References: <303be768-557b-3b02-c4fd-ae11ec2858ec@mentor.com>
 <8037285d-a8b2-39c9-30c4-cba364583ae9@mentor.com>
Message-ID: <20161208210228.GA27341@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis, All,

On 2016-12-07 10:14 -0800, Hollis Blanchard spake thusly:
> Newer copy attached. I've been using this version for a couple weeks.
> 
> This can be run with defconfig as an extra option, like so:
> 
>  ./scan-ext-toolchain <toolchain> [<files>]
> 
> That will prepend the content of <files> to the toolchain metadata, so that it can be used like so:
> 
>  ./scan-ext-toolchain -o output/combined_defconfig <toolchain> my-board-defconfig
>  make BR2_DEFCONFIG=output/combined_defconfig defconfig
> 
> I still haven't tried to probe SSP, RPC, etc, for non-glibc toolchains.

Thanks for working on this! :-)

Here are a few comments, plus a big question...

> #!/usr/bin/env python
> 
> # Copyright 2016 Mentor Graphics Corporation
> # All Rights Reserved
> #
> # THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY
> # INFORMATION WHICH ARE THE PROPERTY OF MENTOR
> # GRAPHICS CORPORATION OR ITS LICENSORS AND IS
> # SUBJECT TO LICENSE TERMS.

So, it has already been pointed out, but this boilerplate is not
acceptable. It really means what it says: one needs a license to this
script before using it in any way. Said license ios not specified, so it
is as good as no license.

One may argue that the license of the script defaults to the license of
Buidlroot, in which it is going to be distributed. However, before we
_accept_ the script in Buildroot, we need to be sure the license is
compatible with that of Buildroot. The boiulerplate is definitely not
saying it is.

It is totally acceptable that Mentor and you be identified as the
authors and/or copyright holders, but the license must be explicit. We
can only carry that script in Buildroot if the license is acceptable.
Buildroot is currently GPLv2, so GPLv2 would be the obvious choice of a
licnese. But we could very well accept any license that is compatible
with GPLv2 (BSD and such, for example...).

Please fix this before we can consider including it in Buildroot.

> import sys
> import os
> import subprocess
> import re
> from optparse import OptionParser
> 
> class ExtToolchainMetadata:
> 	def __init__(self, base_path):
> 		self.cfg = {}
> 		self.tools = {}
> 		self.base_path = base_path
> 		self.sysroot_path = None
> 
> 	def get_buildroot_cfg(self):
> 		result = 'BR2_TOOLCHAIN_EXTERNAL=y\n'
> 		for k, v in self.cfg.items():
> 			result += 'BR2_TOOLCHAIN_EXTERNAL_%s=%s\n' % (k, v)
> 		return result
> 
> def probe_prefix(path, target, metadata):
> 	libexec_path = os.path.join(path, 'libexec', 'gcc') 
> 
> 	if not os.path.isdir(libexec_path):
> 		raise RuntimeError("Couldn't examine directory %s" % libexec_path)
> 
> 	targets = os.listdir(libexec_path)
> 	if len(targets) == 0:
> 		raise RuntimeError("Couldn't find any targets in %s" % libexec_path)
> 
> 	if not target:
> 		if len(targets) > 1:
> 			raise RuntimeError('Toolchain supports multiple targets. '
> 					'Please choose one of the following: %s' % (targets))
> 		target = targets[0]
> 	else:
> 		if target not in targets:
> 			raise RuntimeError('Toolchain does not support target %s.' % target)
> 		target = target
> 
> 	# XXX use ARCH instead?
> 	# cpu, vendor_os = target.split('-', 1)
> 	# metadata.cfg['CUSTOM_PREFIX'] = '"$(ARCH)-%s"' % vendor_os
> 	metadata.cfg['CUSTOM_PREFIX'] = '"%s"' % target
> 
> def probe_tools(path, metadata):
> 	class Tool:
> 		def __init__(self, executable, cfgname=None):
> 			self.executable = executable
> 			self.cfgname = cfgname
> 
> 	tools = (
> 		Tool('gcc'),
> 		Tool('readelf'),
> 		Tool('g++', 'CXX'),
> 		Tool('gfortran', 'GF'),
> 	)
> 
> 	prefix = metadata.cfg['CUSTOM_PREFIX'].strip('"')
> 
> 	for tool in tools:
> 		full_name = '%s-%s' % (prefix, tool.executable)
> 		full_path = os.path.join(path, 'bin', full_name)
> 
> 		if os.path.exists(full_path):
> 			metadata.tools[tool.executable] = full_path
> 			if tool.cfgname:
> 				metadata.cfg[tool.cfgname] = 'y'
> 
> def probe_gcc_version(metadata):
> 	argv = [
> 		metadata.tools['gcc'],
> 		'--version',
> 	]
> 
> 	proc = subprocess.Popen(argv, stdout=subprocess.PIPE)
> 	output = proc.communicate()[0]
> 	line1 = output.splitlines()[0]
> 
> 	m = re.match('^[^)]+\) ([^ ]+)', line1)
> 	if not m:
> 		raise RuntimeError("%s\n\tdidn't report a recognizable version:\n%s" %
> 				(metadata.tools['gcc'], line1))
> 
> 	version = m.group(1) # E.g. 4.9.2
> 	major, minor = [ int(i) for i in version.split('.', 2)[:2] ]
> 	metadata.cfg['GCC_%d_%d' % (major, minor)] = 'y'
> 
> def probe_gcc_sysroot(metadata):
> 	# Sysroot directories could have a couple names:
> 	subdirs = ('libc', 'sysroot')
> 
> 	# Construct a list of full paths so that in case of failure we can tell the
> 	# user exactly where we searched.
> 	base = metadata.base_path
> 	prefix = metadata.cfg['CUSTOM_PREFIX'].strip('"')
> 	sysroot_paths = [ os.path.join(base, prefix, d) for d in subdirs ]
> 
> 	sysroot_path = None
> 	for path in sysroot_paths:
> 		if os.path.exists(path):
> 			sysroot_path = path
> 			break
> 
> 	if not sysroot_path:
> 		msg = "Is this a Linux toolchain? Couldn't find the sysroot in:\n\t%s"
> 		raise RuntimeError(msg % '\n\t'.join(sysroot_paths))
> 
> 	metadata.sysroot_path = sysroot_path

Well, finding the correct syseroot is not trivial: you need to know the
CFLAGS that are to be used, because they directly influence what sysroot
gcc will be searching for.

See in toolchain/toolchain-external/pkg-toolchain-external.mk how we
find the sysroot: It is a bit convoluted, but it basically goes as such:

  - we ask gcc where libc.a is, line 338:
        gcc $(CFLAGS) -print-file-name=libc.a

  - we strip the trailing relative path to get the sysroot path:

        echo $(libc.a) |sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::'

The worst part here is getting a hold on the CFLAGS. Without them, you
can't find the sysroot.

That's because the sysroot may change with various flags, like -march of
-mfpu or whatever. You can check by asking gcc what multilib and/or
multiarch it supports, and the flags that will redirect to another
sysroot:

    # host/opt/ext-toolchain/bin/mips-img-linux-gnu-gcc -print-multi-lib
    mips-r1-hard/lib;@mips32 at mabi=32 at EB
    mipsel-r1-hard/lib;@mips32 at mabi=32 at EL
    mips-r1-soft/lib;@mips32 at mabi=32 at EB@msoft-float
    mipsel-r1-soft/lib;@mips32 at mabi=32 at EL@msoft-float
    mips-r1-mips16-hard/lib;@mips32 at mips16@mabi=32 at EB
    mipsel-r1-mips16-hard/lib;@mips32 at mips16@mabi=32 at EL
    mips-r1-mips16-soft/lib;@mips32 at mips16@mabi=32 at EB@msoft-float
    mipsel-r1-mips16-soft/lib;@mips32 at mips16@mabi=32 at EL@msoft-float
    mips-r2-hard/lib;@mips32r2 at mabi=32 at EB
    mipsel-r2-hard/lib;@mips32r2 at mabi=32 at EL
    mips-r2-soft/lib;@mips32r2 at mabi=32 at EB@msoft-float
    mips-r2-hard-nan2008/lib;@mips32r2 at mabi=32 at EB@mnan=2008
    mipsel-r2-soft/lib;@mips32r2 at mabi=32 at EL@msoft-float
    mipsel-r2-hard-nan2008/lib;@mips32r2 at mabi=32 at EL@mnan=2008
    mips-r2-mips16-hard/lib;@mips32r2 at mips16@mabi=32 at EB
    mipsel-r2-mips16-hard/lib;@mips32r2 at mips16@mabi=32 at EL
    mips-r2-mips16-soft/lib;@mips32r2 at mips16@mabi=32 at EB@msoft-float
    mips-r2-mips16-hard-nan2008/lib;@mips32r2 at mips16@mabi=32 at EB@mnan=2008
    mipsel-r2-mips16-soft/lib;@mips32r2 at mips16@mabi=32 at EL@msoft-float
    mipsel-r2-mips16-hard-nan2008/lib;@mips32r2 at mips16@mabi=32 at EL@mnan=2008
    micromips-r2-soft/lib;@mips32r2 at mmicromips@mabi=32 at EB@msoft-float
    micromips-r2-hard-nan2008/lib;@mips32r2 at mmicromips@mabi=32 at EB@mnan=2008
    micromipsel-r2-soft/lib;@mips32r2 at mmicromips@mabi=32 at EL@msoft-float
    micromipsel-r2-hard-nan2008/lib;@mips32r2 at mmicromips@mabi=32 at EL@mnan=2008
    mips-r6-hard/lib;@mips32r6 at mabi=32 at EB@mnan=2008
    mips-r6-soft/lib;@mips32r6 at mabi=32 at EB@msoft-float at mnan=2008
    mipsel-r6-hard/lib;@mips32r6 at mabi=32 at EL@mnan=2008
    mipsel-r6-soft/lib;@mips32r6 at mabi=32 at EL@msoft-float at mnan=2008
    mipsel-r6-singleshort/lib;@mips32r6 at mabi=32 at EL@msingle-float at mnan=2008 at fshort-double
    micromips-r6-hard/lib;@mips32r6 at mmicromips@mabi=32 at EB@mnan=2008
    micromips-r6-soft/lib;@mips32r6 at mmicromips@mabi=32 at EB@msoft-float at mnan=2008
    micromipsel-r6-hard/lib;@mips32r6 at mmicromips@mabi=32 at EL@mnan=2008
    micromipsel-r6-soft/lib;@mips32r6 at mmicromips@mabi=32 at EL@msoft-float at mnan=2008
    mips-r1-hard/lib32;@mips64 at mabi=n32 at EB
    mipsel-r1-hard/lib32;@mips64 at mabi=n32 at EL
    mips-r1-soft/lib32;@mips64 at mabi=n32 at EB@msoft-float
    mipsel-r1-soft/lib32;@mips64 at mabi=n32 at EL@msoft-float
    mips-r1-hard/lib64;@mips64 at mabi=64 at EB
    mipsel-r1-hard/lib64;@mips64 at mabi=64 at EL
    mips-r1-soft/lib64;@mips64 at mabi=64 at EB@msoft-float
    mipsel-r1-soft/lib64;@mips64 at mabi=64 at EL@msoft-float
    mips-r2-hard/lib32;@mips64r2 at mabi=n32 at EB
    mipsel-r2-hard/lib32;@mips64r2 at mabi=n32 at EL
    mips-r2-soft/lib32;@mips64r2 at mabi=n32 at EB@msoft-float
    mips-r2-hard-nan2008/lib32;@mips64r2 at mabi=n32 at EB@mnan=2008
    mipsel-r2-soft/lib32;@mips64r2 at mabi=n32 at EL@msoft-float
    mipsel-r2-hard-nan2008/lib32;@mips64r2 at mabi=n32 at EL@mnan=2008
    mips-r2-hard/lib64;@mips64r2 at mabi=64 at EB
    mipsel-r2-hard/lib64;@mips64r2 at mabi=64 at EL
    mips-r2-soft/lib64;@mips64r2 at mabi=64 at EB@msoft-float
    mips-r2-hard-nan2008/lib64;@mips64r2 at mabi=64 at EB@mnan=2008
    mipsel-r2-soft/lib64;@mips64r2 at mabi=64 at EL@msoft-float
    mipsel-r2-hard-nan2008/lib64;@mips64r2 at mabi=64 at EL@mnan=2008
    mips-r6-hard/lib32;@mips64r6 at mabi=n32 at EB@mnan=2008
    mips-r6-soft/lib32;@mips64r6 at mabi=n32 at EB@msoft-float at mnan=2008
    mipsel-r6-hard/lib32;@mips64r6 at mabi=n32 at EL@mnan=2008
    mipsel-r6-soft/lib32;@mips64r6 at mabi=n32 at EL@msoft-float at mnan=2008
    mips-r6-hard/lib64;@mips64r6 at mabi=64 at EB@mnan=2008
    mips-r6-soft/lib64;@mips64r6 at mabi=64 at EB@msoft-float at mnan=2008
    mipsel-r6-hard/lib64;@mips64r6 at mabi=64 at EL@mnan=2008
    mipsel-r6-soft/lib64;@mips64r6 at mabi=64 at EL@msoft-float at mnan=2008
    mips-r2-hard-uclibc/lib;@muclibc at mips32r2@mabi=32 at EB
    mipsel-r2-hard-uclibc/lib;@muclibc at mips32r2@mabi=32 at EL
    mips-r2-hard-nan2008-uclibc/lib;@muclibc at mips32r2@mabi=32 at EB@mnan=2008
    mipsel-r2-hard-nan2008-uclibc/lib;@muclibc at mips32r2@mabi=32 at EL@mnan=2008

Yes, that's 65 different ways to use a specific sysroot. The last three
lines mean:

    when these flags flags are in use,              then use this sysroot
    -muclibc -mips32r2 -mabi=32 -EL                 mipsel-r2-hard-uclibc/lib
    -muclibc -mips32r2 -mabi=32 -EB -mnan=2008      mips-r2-hard-nan2008-uclibc/lib
    -muclibc -mips32r2 -mabi=32 -EL -mnan=2008      mipsel-r2-hard-nan2008-uclibc/lib

The last two are pretty obvious: big vs. little endian. But when you
look at the antepenultimate line, you'll see that it differs only by not
specifying the way to treat NaNs.

So, without the actual CFLAGS, you can't find the sysroot...

And you can't know the actual CFLAGS untill you actually have a
Buildroot .config file.

But you need the sysroot...

> def probe_gcc_headers(metadata):
> 	version_path = os.path.join(metadata.sysroot_path,
> 		'usr',
> 		'include',
> 		'linux',
> 		'version.h'
> 	)
> 	version_re = '#define LINUX_VERSION_CODE ([0-9]+)'
> 
> 	with open(version_path) as version_file:
> 		linux_version_code = version_file.readline()
> 
> 	m = re.match(version_re, linux_version_code)
> 	if not m:
> 		msg = "Didn't recognize LINUX_VERSION_CODE in %s"
> 		raise RuntimeError(msg % version_path)
> 
> 	version = int(m.group(1))
> 	major = (version >> 16) & 0xff
> 	minor = (version >> 8) & 0xff
> 	metadata.cfg['HEADERS_%d_%d' % (major, minor)] = 'y'
> 
> def probe_libc(metadata):
> 	libc_re = '  -m(glibc|musl|eglibc)\s+\[enabled\]'
> 	argv = [
> 		metadata.tools['gcc'],
> 		'-Q',
> 		'--help=target',
> 	]
> 
> 	proc = subprocess.Popen(argv, stdout=subprocess.PIPE)
> 	output = proc.communicate()[0].splitlines()
> 	for line in output:
> 		m = re.match(libc_re, line)
> 		if m:
> 			libc = m.group(1)
> 			metadata.cfg['CUSTOM_%s' % libc.upper()] = 'y'
> 			break
> 
> def probe_rpc(metadata):
> 	rpc_path = os.path.join(metadata.sysroot_path,
> 		'usr',
> 		'include',
> 		'rpc',
> 		'rpc.h')
> 	if os.path.exists(rpc_path):
> 		metadata.cfg['HAS_RPC'] = 'y'

... to find whther RPC is supoprted or not.

An alternative to testing RPC support would be to do a test-build, to
see if gcc can find rpc.h, but again you'd need the correct CFLAGS to do
such a build.

So, without CFLAGS, you can't know whether RPC is available or not.

We could see at using a shirtcut: if the default gcc can find a rpc.h,
we could infer that any variant would have it as well.

But that;s not necessarily the case. If the toolchain supports various C
libraries (like this one: it supports bith glibc and uClibc), we can't
do that supposition: if glibc is the default, then rpc.h will be present
[0], but uClibc can very well have been configured without RPC support
in that toolchain. So we can't even test the defaults either... :-/

[0] except for a few releases dating back a few years, where glibc did
not have rpc.h for two or three releases in a row.

Well, I can't see an easy path... :-/

OK, enough for tonight. Maybe more this WE...

Regards,
Yann E. MORIN.

> def probe(path, options, metadata):
> 	metadata.cfg['CUSTOM'] = 'y'
> 	metadata.cfg['PATH'] = '"%s"' % path
> 
> 	probe_prefix(path, options.target, metadata)
> 	probe_tools(path, metadata)
> 	probe_gcc_version(metadata)
> 	probe_gcc_sysroot(metadata)
> 	probe_gcc_headers(metadata)
> 	probe_libc(metadata)
> 	probe_rpc(metadata)
> 
> def cat_files(out_file, files):
> 	for path in files:
> 		with open(path) as f:
> 			for line in f.readlines():
> 				out_file.write(line)
> 
> def main():
> 	parser = OptionParser()
> 	parser.add_option('-t', '--target', dest='target')
> 	parser.add_option('-o', '--output', default='/dev/stdout')
> 
> 	(options, arguments) = parser.parse_args()
> 
> 	if len(arguments) < 1:
> 		print "Missing path to toolchain base directory"
> 		sys.exit(1)
> 
> 	toolchain_dir = arguments[0]
> 	if not os.path.isdir(toolchain_dir):
> 		print "Not a directory: %s" % toolchain_dir
> 		sys.exit(2)
> 
> 	metadata = ExtToolchainMetadata(toolchain_dir)
> 	probe(toolchain_dir, options, metadata)
> 
> 	with open(options.output, 'w') as out_file:
> 		if len(arguments) >= 1:
> 			cat_files(out_file, arguments[1:])
> 
> 		out_file.write(metadata.get_buildroot_cfg())
> 
> if __name__ == '__main__':
> 	try:
> 		main()
> 	except RuntimeError, e:
> 		print e


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
