From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 23:00:25 +0100
Subject: [Buildroot] [git commit] pycompile: allow to force compilation
Message-ID: <20170320222804.144E981DD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e45c5500ba31890d7f91c1c4ad50d314715affc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, compile_dir() relies on the modification time to know if a
python file has to be built again. However in some circumstances (when
doing reproducible builds), modification times are not reliable. Thus,
this patch adds a way to force the rebuild of all python sources.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pycompile.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index 9f7eb9f..8e164ab 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -10,6 +10,7 @@ from __future__ import print_function
 import sys
 import py_compile
 import compileall
+import argparse
 
 def check_for_errors(comparison):
     '''Wrap comparison operator with code checking for PyCompileError.
@@ -54,4 +55,12 @@ class ReportProblem(int):
     def __ne__(self, other):
         return not self == other
 
-compileall.compile_dir(sys.argv[1], quiet=ReportProblem())
+parser = argparse.ArgumentParser(description='Compile Python source files in a directory tree.')
+parser.add_argument("target", metavar='DIRECTORY',
+                    help='Directory to scan')
+parser.add_argument("--force", action='store_true',
+                    help="Force compilation even if alread compiled")
+
+args = parser.parse_args()
+
+compileall.compile_dir(args.target, force=args.force, quiet=ReportProblem())
