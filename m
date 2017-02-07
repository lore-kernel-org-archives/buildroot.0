From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Feb 2017 12:35:59 +0100
Subject: [Buildroot] [PATCH 1/5] support/testing: core testing infrastructure
In-Reply-To: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1486467363-19881-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds the core of a new testing infrastructure that allows to
perform runtime testing of Buildroot generated systems. This
infrastructure uses the Python unittest logic as its foundation.

This core infrastructure commit includes the following aspects:

 - A base test class, called BRTest, defined in
   support/testing/infra/basetest.py. This base test class inherited
   from the Python provided unittest.TestCase, and must be subclassed by
   all Buildroot test cases.

   Its main purpose is to provide the Python unittest setUp() and
   tearDown() methods. In our case, setUp() takes care of building the
   Buildroot system described in the test case, and instantiate the
   Emulator object in case runtime testing is needed. The tearDown()
   method simply cleans things up (stop the emulator, remove the output
   directory).

 - A Builder class, defined in support/testing/infra/builder.py, simply
   responsible for building the Buildroot system in each test case.

 - An Emulator class, defined in support/testing/infra/emulator.py,
   responsible for running the generated system under Qemu, allowing
   each test case to run arbitrary commands inside the emulated system.

 - A run-tests script, which is the entry point to start the tests.

Even though I wrote the original version of this small infrastructure, a
huge amount of rework and improvement has been done by Maxime
Hadjinlian, and squashed into this patch. So many thanks to Maxime for
cleaning up and improving my Python code!

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/conf/unittest.cfg |   6 ++
 support/testing/infra/__init__.py |  61 ++++++++++++++++
 support/testing/infra/basetest.py |  66 +++++++++++++++++
 support/testing/infra/builder.py  |  50 +++++++++++++
 support/testing/infra/emulator.py | 144 ++++++++++++++++++++++++++++++++++++++
 support/testing/run-tests         |  77 ++++++++++++++++++++
 support/testing/tests/__init__.py |   0
 7 files changed, 404 insertions(+)
 create mode 100644 support/testing/conf/unittest.cfg
 create mode 100644 support/testing/infra/__init__.py
 create mode 100644 support/testing/infra/basetest.py
 create mode 100644 support/testing/infra/builder.py
 create mode 100644 support/testing/infra/emulator.py
 create mode 100755 support/testing/run-tests
 create mode 100644 support/testing/tests/__init__.py

diff --git a/support/testing/conf/unittest.cfg b/support/testing/conf/unittest.cfg
new file mode 100644
index 0000000..6eaa234
--- /dev/null
+++ b/support/testing/conf/unittest.cfg
@@ -0,0 +1,6 @@
+[unittest]
+plugins = nose2.plugins.mp
+
+[multiprocess]
+processes = 1
+always-on = True
diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
new file mode 100644
index 0000000..880e642
--- /dev/null
+++ b/support/testing/infra/__init__.py
@@ -0,0 +1,61 @@
+import contextlib
+import os
+import sys
+import tempfile
+import subprocess
+from urllib2 import urlopen, HTTPError, URLError
+
+ARTEFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
+
+ at contextlib.contextmanager
+def smart_open(filename=None):
+    if filename and filename != '-':
+        fhandle = open(filename, 'a+')
+    else:
+        fhandle = sys.stdout
+
+    try:
+        yield fhandle
+    finally:
+        if fhandle is not sys.stdout:
+            fhandle.close()
+
+def filepath(relpath):
+    return os.path.join(os.getcwd(), "support/testing", relpath)
+
+def download(dldir, filename):
+    finalpath = os.path.join(dldir, filename)
+    if os.path.exists(finalpath):
+        return finalpath
+
+    if not os.path.exists(dldir):
+        os.makedirs(dldir)
+
+    tmpfile = tempfile.mktemp(dir=dldir)
+    print "Downloading to {}".format(tmpfile)
+
+    try:
+        url_fh = urlopen(os.path.join(ARTEFACTS_URL, filename))
+        with open(tmpfile, "w+") as tmpfile_fh:
+            tmpfile_fh.write(url_fh.read())
+    except (HTTPError, URLError), err:
+        os.unlink(tmpfile)
+        raise err
+
+    print "Renaming from %s to %s" % (tmpfile, finalpath)
+    os.rename(tmpfile, finalpath)
+    return finalpath
+
+def get_elf_arch_tag(builddir, prefix, fpath, tag):
+    cmd = ["host/usr/bin/{}-readelf".format(prefix),
+           "-A", os.path.join("target", fpath)]
+    out = subprocess.check_output(cmd, cwd=builddir, env={"LANG": "C"})
+    for line in out.splitlines():
+        line = line.strip()
+        if not line.startswith(tag):
+            continue
+        return line.split(":")[1].strip()
+    return None
+
+def get_file_arch(builddir, prefix, fpath):
+    return get_elf_arch_tag(builddir, prefix, fpath, "Tag_CPU_arch:")
diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
new file mode 100644
index 0000000..eb9da90
--- /dev/null
+++ b/support/testing/infra/basetest.py
@@ -0,0 +1,66 @@
+import unittest
+import os
+import datetime
+
+from infra.builder import Builder
+from infra.emulator import Emulator
+
+BASIC_TOOLCHAIN_CONFIG = \
+"""
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.05-1190-g4a48479.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+"""
+
+MINIMAL_CONFIG = \
+"""
+BR2_INIT_NONE=y
+BR2_SYSTEM_BIN_SH_NONE=y
+# BR2_PACKAGE_BUSYBOX is not set
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+class BRTest(unittest.TestCase):
+    config = None
+    downloaddir = None
+    outputdir = None
+    logtofile = True
+    keepbuilds = False
+
+    def show_msg(self, msg):
+        print "[%s/%s/%s] %s" % (os.path.basename(self.__class__.outputdir),
+                                 self.testname,
+                                 datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
+                                 msg)
+    def setUp(self):
+        self.testname = self.__class__.__name__
+        self.builddir = os.path.join(self.__class__.outputdir, self.testname)
+        self.runlog = self.builddir + "-run.log"
+        self.emulator = None
+        self.show_msg("Starting")
+        self.b = Builder(self.__class__.config, self.builddir, self.logtofile)
+
+        if not self.keepbuilds:
+            self.b.delete()
+
+        if not self.b.is_finished():
+            self.show_msg("Building")
+            self.b.build()
+            self.show_msg("Building done")
+
+        self.emulator = Emulator(self.builddir, self.downloaddir, self.logtofile)
+
+    def tearDown(self):
+        self.show_msg("Cleaning up")
+        if self.emulator:
+            self.emulator.stop()
+        if self.b and not self.keepbuilds:
+            self.b.delete()
diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
new file mode 100644
index 0000000..4f72e2f
--- /dev/null
+++ b/support/testing/infra/builder.py
@@ -0,0 +1,50 @@
+import os
+import shutil
+import subprocess
+
+import infra
+
+class Builder(object):
+    def __init__(self, config, builddir, logtofile):
+        self.config = config
+        self.builddir = builddir
+        self.logtofile = logtofile
+
+    def build(self):
+        if not os.path.isdir(self.builddir):
+            os.makedirs(self.builddir)
+
+        log = "{}-build.log".format(self.builddir)
+        if self.logtofile is None:
+            log = None
+
+        config_file = os.path.join(self.builddir, ".config")
+        with open(config_file, "w+") as cfd:
+            cfd.write(self.config)
+
+        cmd = ["make",
+               "-C", os.getcwd(),
+               "O={}".format(self.builddir),
+               "olddefconfig"]
+        with infra.smart_open(log) as log_fh:
+            ret = subprocess.call(cmd, stdout=log_fh, stderr=log_fh)
+        if ret != 0:
+            raise SystemError("Cannot olddefconfig")
+
+        cmd = ["make", "-C", self.builddir]
+        with infra.smart_open(log) as log_fh:
+            ret = subprocess.call(cmd, stdout=log_fh, stderr=log_fh)
+        if ret != 0:
+            raise SystemError("Build failed")
+
+        open(self.stamp_path(), 'a').close()
+
+    def stamp_path(self):
+        return os.path.join(self.builddir, "build-done")
+
+    def is_finished(self):
+        return os.path.exists(self.stamp_path())
+
+    def delete(self):
+        if os.path.exists(self.builddir):
+            shutil.rmtree(self.builddir)
diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
new file mode 100644
index 0000000..5340f50
--- /dev/null
+++ b/support/testing/infra/emulator.py
@@ -0,0 +1,144 @@
+import socket
+import subprocess
+import telnetlib
+
+import infra
+import infra.basetest
+
+# TODO: Most of the telnet stuff need to be replaced by stdio/pexpect to discuss
+# with the qemu machine.
+class Emulator(object):
+
+    def __init__(self, builddir, downloaddir, logtofile):
+        self.qemu = None
+        self.__tn = None
+        self.downloaddir = downloaddir
+        self.log = ""
+        self.log_file = "{}-run.log".format(builddir)
+        if logtofile is None:
+            self.log_file = None
+
+    # Start Qemu to boot the system
+    #
+    # arch: Qemu architecture to use
+    #
+    # kernel: path to the kernel image, or the special string
+    # 'builtin' in which case a pre-built kernel image will be used
+    # (so far only armv5 and armv7 kernels are available). If None,
+    # then no kernel is used, and we assume a bootable device will be
+    # specified.
+    #
+    # kernel_cmdline: array of kernel arguments to pass to Qemu -append option
+    #
+    # options: array of command line options to pass to Qemu
+    #
+    def boot(self, arch, kernel=None, kernel_cmdline=None, options=None):
+        if arch in ["armv7", "armv5"]:
+            qemu_arch = "arm"
+
+        qemu_cmd = ["qemu-system-{}".format(qemu_arch),
+                    "-serial", "telnet::1234,server",
+                    "-display", "none"]
+
+        if options:
+            qemu_cmd += options
+
+        if kernel_cmdline is None:
+            kernel_cmdline = []
+
+        if kernel:
+            if kernel == "builtin":
+                if arch in ["armv7", "armv5"]:
+                    kernel_cmdline.append("console=ttyAMA0")
+
+                if arch == "armv7":
+                    kernel = infra.download(self.downloaddir,
+                                            "kernel-vexpress")
+                    dtb = infra.download(self.downloaddir,
+                                         "vexpress-v2p-ca9.dtb")
+                    qemu_cmd += ["-dtb", dtb]
+                    qemu_cmd += ["-M", "vexpress-a9"]
+                elif arch == "armv5":
+                    kernel = infra.download(self.downloaddir,
+                                            "kernel-versatile")
+                    qemu_cmd += ["-M", "versatilepb"]
+
+            qemu_cmd += ["-kernel", kernel]
+
+        if kernel_cmdline:
+            qemu_cmd += ["-append", " ".join(kernel_cmdline)]
+
+        with infra.smart_open(self.log_file) as lfh:
+            lfh.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
+            self.qemu = subprocess.Popen(qemu_cmd, stdout=lfh, stderr=lfh)
+
+        # Wait for the telnet port to appear and connect to it.
+        while True:
+            try:
+                self.__tn = telnetlib.Telnet("localhost", 1234)
+                if self.__tn:
+                    break
+            except socket.error:
+                continue
+
+    def __read_until(self, waitstr, timeout=5):
+        data = self.__tn.read_until(waitstr, timeout)
+        self.log += data
+        with infra.smart_open(self.log_file) as lfh:
+            lfh.write(data)
+        return data
+
+    def __write(self, wstr):
+        self.__tn.write(wstr)
+
+    # Wait for the login prompt to appear, and then login as root with
+    # the provided password, or no password if not specified.
+    def login(self, password=None):
+        with infra.smart_open(self.log_file) as lfh:
+            lfh.write("> waiting for login\n")
+
+        self.__read_until("buildroot login:", 10)
+        if "buildroot login:" not in self.log:
+            with infra.smart_open(self.log_file) as lfh:
+                lfh.write("==> System does not boot")
+            raise SystemError("System does not boot")
+
+        with infra.smart_open(self.log_file) as lfh:
+            lfh.write("> log in\n")
+
+        self.__write("root\n")
+        if password:
+            self.__read_until("Password:")
+            self.__write(password + "\n")
+        self.__read_until("# ")
+
+    # Run the given 'cmd' on the target
+    # return a tuple (output, exit_code)
+    def run(self, cmd):
+        with infra.smart_open(self.log_file) as lfh:
+            lfh.write("> running '{}'\n".format(cmd))
+
+        self.__write("{}\n".format(cmd))
+        output = self.__read_until("# ")
+        output = output.strip().splitlines()
+        output = output[1:len(output)-1]
+
+        self.__write("echo $?\n")
+        exit_code = self.__read_until("# ")
+        exit_code = exit_code.strip().splitlines()[1]
+        exit_code = int(exit_code)
+        with infra.smart_open(self.log_file) as lfh:
+            lfh.write("> command terminated, status {}\n".format(exit_code))
+
+        return output, exit_code
+
+    def stop(self):
+        if self.qemu is None:
+            return
+        self.qemu.terminate()
+        self.qemu.kill()
+
+    def showlog(self):
+        print "=== Full log ==="
+        print self.log
+        print "================"
diff --git a/support/testing/run-tests b/support/testing/run-tests
new file mode 100755
index 0000000..0155b71
--- /dev/null
+++ b/support/testing/run-tests
@@ -0,0 +1,77 @@
+#!/usr/bin/env python
+import argparse
+import sys
+import os
+import string
+import nose2
+
+from infra.basetest import BRTest
+
+def main():
+    parser = argparse.ArgumentParser(description='Run Buildroot tests')
+    parser.add_argument('testname', nargs='*',
+                        help='list of test cases to execute')
+    parser.add_argument('--list', '-l', action='store_true',
+                        help='list of available test cases')
+    parser.add_argument('--all', '-a', action='store_true',
+                        help='execute all test cases')
+    parser.add_argument('--stdout', '-s', action='store_true',
+                        help='log everything to stdout')
+    parser.add_argument('--output', '-o',
+                        help='output directory')
+    parser.add_argument('--download', '-d',
+                        help='download directory')
+    parser.add_argument('--keep', '-k',
+                        help='keep build directories',
+                        action='store_true')
+
+    args = parser.parse_args()
+
+    script_path = os.path.realpath(__file__)
+    test_dir = os.path.dirname(script_path)
+
+    if args.stdout:
+        BRTest.logtofile = False
+
+    if args.list:
+        print "List of tests"
+        nose2.discover(argv=[script_path,
+                             "-s", test_dir,
+                             "-v",
+                             "--collect-only"],
+                       plugins=["nose2.plugins.collect"])
+        return 0
+
+    if args.download is None:
+        print "Missing download directory, please use -d/--download"
+        return 1
+
+    BRTest.downloaddir = args.download
+
+    if args.output is None:
+        print "Missing output directory, please use -o/--output"
+        return 1
+
+    if not os.path.exists(args.output):
+        print "The selected output directory does not exist"
+        return 1
+
+    BRTest.outputdir = args.output
+
+    if args.all is False and len(args.testname) == 0:
+        print "No test selected"
+        return 1
+
+    BRTest.keepbuilds = args.keep
+
+    nose2_args = ["-v",
+                  "-s", "support/testing",
+                  "-c", "support/testing/conf/unittest.cfg"]
+
+    if len(args.testname) != 0:
+        nose2_args += args.testname
+
+    nose2.discover(argv=nose2_args)
+
+if __name__ == "__main__":
+    sys.exit(main())
diff --git a/support/testing/tests/__init__.py b/support/testing/tests/__init__.py
new file mode 100644
index 0000000..e69de29
-- 
2.7.4
