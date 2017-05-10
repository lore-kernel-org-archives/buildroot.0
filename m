From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 10 May 2017 23:33:46 +0200
Subject: [Buildroot] [PATCH 3/3] support/testing: simplify logging by
	keeping the log file open
In-Reply-To: <1494452026-21567-1-git-send-email-luca@lucaceresoli.net>
References: <1494452026-21567-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1494452026-21567-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently call infra.smart_open() to open log files each time we
need to write to them.

Opening the file once in the constructor of Builder and Emulator and
writing to it whenever needed is simpler and slightly more efficient.

Remove smart_open and instead create a new open_log_file() function
which just opens the logfile. Also let it compute the filename, in
order to simplify even further the Builder and Emulator code.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/testing/infra/__init__.py | 21 +++++++--------------
 support/testing/infra/builder.py  | 12 +++---------
 support/testing/infra/emulator.py | 15 +++++----------
 3 files changed, 15 insertions(+), 33 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index c3f645cf99d7..b0427e706ca6 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -8,24 +8,17 @@ from urllib2 import urlopen, HTTPError, URLError
 
 ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
 
- at contextlib.contextmanager
-def smart_open(filename=None):
+def open_log_file(builddir, stage, logtofile=True):
     """
-    Return a file-like object that can be written to using the 'with'
-    keyword, as in the example:
-    with infra.smart_open("test.log") as outfile:
-       outfile.write("Hello, world!\n")
+    Open a file for logging and return its handler.
+    If logtofile is True, returns sys.stdout. Otherwise opens a file
+    with a suitable name in the build directory.
     """
-    if filename and filename != '-':
-        fhandle = open(filename, 'a+')
+    if logtofile:
+        fhandle = open("{}-{}.log".format(builddir, stage), 'a+')
     else:
         fhandle = sys.stdout
-
-    try:
-        yield fhandle
-    finally:
-        if fhandle is not sys.stdout:
-            fhandle.close()
+    return fhandle
 
 def filepath(relpath):
     return os.path.join(os.getcwd(), "support/testing", relpath)
diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index 105da01ca2fa..a475bb0a3021 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -8,16 +8,12 @@ class Builder(object):
     def __init__(self, config, builddir, logtofile):
         self.config = config
         self.builddir = builddir
-        self.logtofile = logtofile
+        self.logfile = infra.open_log_file(builddir, "build", logtofile)
 
     def build(self):
         if not os.path.isdir(self.builddir):
             os.makedirs(self.builddir)
 
-        log = "{}-build.log".format(self.builddir)
-        if not self.logtofile:
-            log = None
-
         config_file = os.path.join(self.builddir, ".config")
         with open(config_file, "w+") as cf:
             cf.write(self.config)
@@ -25,14 +21,12 @@ class Builder(object):
         cmd = ["make",
                "O={}".format(self.builddir),
                "olddefconfig"]
-        with infra.smart_open(log) as log_fh:
-            ret = subprocess.call(cmd, stdout=log_fh, stderr=log_fh)
+        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile)
         if ret != 0:
             raise SystemError("Cannot olddefconfig")
 
         cmd = ["make", "-C", self.builddir]
-        with infra.smart_open(log) as log_fh:
-            ret = subprocess.call(cmd, stdout=log_fh, stderr=log_fh)
+        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile)
         if ret != 0:
             raise SystemError("Build failed")
 
diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 7c476cb0e494..2480b4654056 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -14,9 +14,7 @@ class Emulator(object):
         self.__tn = None
         self.downloaddir = downloaddir
         self.log = ""
-        self.log_file = "{}-run.log".format(builddir)
-        if logtofile is None:
-            self.log_file = None
+        self.logfile = infra.open_log_file(builddir, "run", logtofile)
 
     # Start Qemu to boot the system
     #
@@ -72,9 +70,8 @@ class Emulator(object):
         if kernel_cmdline:
             qemu_cmd += ["-append", " ".join(kernel_cmdline)]
 
-        with infra.smart_open(self.log_file) as lfh:
-            lfh.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
-            self.qemu = subprocess.Popen(qemu_cmd, stdout=lfh, stderr=lfh)
+        self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
+        self.qemu = subprocess.Popen(qemu_cmd, stdout=self.logfile, stderr=self.logfile)
 
         # Wait for the telnet port to appear and connect to it.
         while True:
@@ -88,8 +85,7 @@ class Emulator(object):
     def __read_until(self, waitstr, timeout=5):
         data = self.__tn.read_until(waitstr, timeout)
         self.log += data
-        with infra.smart_open(self.log_file) as lfh:
-            lfh.write(data)
+        self.logfile.write(data)
         return data
 
     def __write(self, wstr):
@@ -100,8 +96,7 @@ class Emulator(object):
     def login(self, password=None):
         self.__read_until("buildroot login:", 10)
         if "buildroot login:" not in self.log:
-            with infra.smart_open(self.log_file) as lfh:
-                lfh.write("==> System does not boot")
+            self.logfile.write("==> System does not boot")
             raise SystemError("System does not boot")
 
         self.__write("root\n")
-- 
2.7.4
