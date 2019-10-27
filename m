From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sun, 27 Oct 2019 13:37:00 +0000
Subject: [Buildroot] [PATCH v3 3/4] support/testing: switch to Python 3 only
In-Reply-To: <20191027133630.7706-1-nicolas.carrier@orolia.com>
References: <20191027133630.7706-1-nicolas.carrier@orolia.com>
Message-ID: <20191027133630.7706-3-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Python 2.7 will not be maintained past 2020.

Many scripts on the tree are used during the build and should keep
Python 2 compatibility for a while.
This is not the case for the runtime test infra. It's meant to be run in
modern distros only, so it can safely switch to support Python 3 only.

An advantage of this approach is to have less scenarios to test in.
Otherwise every change to the test infra or runtime tests would need to
be tested against both versions of the interpreter, increasing the
effort of the developers, to ensure the compatibility to Python 2 was
not broken.

In order to accomplish the change to Python 3:
 - change the shebang for run-tests;
 - use Python 3 urllib as a drop-in replacement for Python 2 urllib2;
 - when writing the downloaded binary files, explicitly open the output
   file as binary;
 - when subprocess is used to retrieve the text output from commands,
   explicitly ask for text output. For this, use 'universal_newlines'
   because 'text' was added only on Python 3.7;
 - when pexpect is used to retrieve the text output from qemu or git,
   explicitly ask for text output using 'encoding';
 - the code using csv currently follows the example in the documentation
   for the Python 2 module, change it to follow the example in the
   documentation for the Python 3 module;
 - fix the relative import for test_git.py to be Python 3 compliant.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Romain Naour <romain.naour@smile.fr>
Tested-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

---

This is a re-submit of Ricardo Martincoski's original patch since it's required
for the next (and last patch) of the series, which relies on python 3.6+
features (notably f-strings).

Original comment of Romain Naour on the original series:

> I'm using Fedora 30 and there no python2-nose2 package anymore.
> So, I'm using this patch to avoid installing python2-nose2 from pypi.

I added my Tested-by tag since I used it for running the tests that are in the
next patch.

---
 support/testing/infra/__init__.py                 | 8 +++++---
 support/testing/infra/emulator.py                 | 1 +
 support/testing/run-tests                         | 2 +-
 support/testing/tests/core/test_post_scripts.py   | 2 +-
 support/testing/tests/download/gitremote.py       | 3 ++-
 support/testing/tests/download/test_git.py        | 2 +-
 support/testing/tests/utils/test_check_package.py | 3 ++-
 7 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index 43045d0173..6392aa679b 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -3,7 +3,8 @@ import re
 import sys
 import tempfile
 import subprocess
-from urllib2 import urlopen, HTTPError, URLError
+from urllib.request import urlopen
+from urllib.error import HTTPError, URLError
 
 ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
 BASE_DIR = os.path.realpath(os.path.join(os.path.dirname(__file__), "../../.."))
@@ -44,7 +45,7 @@ def download(dldir, filename):
 
     try:
         url_fh = urlopen(os.path.join(ARTIFACTS_URL, filename))
-        with open(tmpfile, "w+") as tmpfile_fh:
+        with open(tmpfile, "w+b") as tmpfile_fh:
             tmpfile_fh.write(url_fh.read())
     except (HTTPError, URLError) as err:
         os.unlink(tmpfile)
@@ -60,7 +61,8 @@ def run_cmd_on_host(builddir, cmd):
     out = subprocess.check_output(cmd,
                                   stderr=open(os.devnull, "w"),
                                   cwd=builddir,
-                                  env={"LANG": "C"})
+                                  env={"LANG": "C"},
+                                  universal_newlines=True)
     return out
 
 
diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 093a643a8b..5611ec96e8 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -76,6 +76,7 @@ class Emulator(object):
         self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
         self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:],
                                   timeout=5 * self.timeout_multiplier,
+                                  encoding='utf-8',
                                   env={"QEMU_AUDIO_DRV": "none"})
         # We want only stdout into the log to avoid double echo
         self.qemu.logfile_read = self.logfile
diff --git a/support/testing/run-tests b/support/testing/run-tests
index 813b927045..74741aee1b 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -1,4 +1,4 @@
-#!/usr/bin/env python2
+#!/usr/bin/env python3
 import argparse
 import sys
 import os
diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
index 40a36b7904..bc61f4af58 100644
--- a/support/testing/tests/core/test_post_scripts.py
+++ b/support/testing/tests/core/test_post_scripts.py
@@ -20,7 +20,7 @@ class TestPostScripts(infra.basetest.BRTest):
 
     def check_post_log_file(self, f, what, target_dir):
         lines = {}
-        with open(os.path.join(self.builddir, "build", f), 'rb') as csvfile:
+        with open(os.path.join(self.builddir, "build", f), newline='') as csvfile:
             r = csv.reader(csvfile, delimiter=',')
             for row in r:
                 lines[row[0]] = row[1]
diff --git a/support/testing/tests/download/gitremote.py b/support/testing/tests/download/gitremote.py
index 3b35456dd1..7df252d031 100644
--- a/support/testing/tests/download/gitremote.py
+++ b/support/testing/tests/download/gitremote.py
@@ -32,7 +32,8 @@ class GitRemote(object):
         for port in range(GIT_REMOTE_PORT_INITIAL, GIT_REMOTE_PORT_LAST + 1):
             cmd = daemon_cmd + ["--port={port}".format(port=port)]
             self.logfile.write("> starting git remote with '{}'\n".format(" ".join(cmd)))
-            self.daemon = pexpect.spawn(cmd[0], cmd[1:], logfile=self.logfile)
+            self.daemon = pexpect.spawn(cmd[0], cmd[1:], logfile=self.logfile,
+                                        encoding='utf-8')
             ret = self.daemon.expect(["Ready to rumble",
                                       "Address already in use"])
             if ret == 0:
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 2455557298..ec5b8f3fdd 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -1,7 +1,7 @@
 import os
 import shutil
 
-from gitremote import GitRemote
+from tests.download.gitremote import GitRemote
 
 import infra
 
diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index 17c2fcf3bc..c70ba02324 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -16,7 +16,8 @@ import infra
 def call_script(args, env, cwd):
     """Call a script and return stdout and stderr as lists."""
     out, err = subprocess.Popen(args, cwd=cwd, stdout=subprocess.PIPE,
-                                stderr=subprocess.PIPE, env=env).communicate()
+                                stderr=subprocess.PIPE, env=env,
+                                universal_newlines=True).communicate()
     return out.splitlines(), err.splitlines()
 
 
-- 
2.20.1
