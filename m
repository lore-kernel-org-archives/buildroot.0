From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 12:08:12 +0100
Subject: [Buildroot] [PATCH v3 12/18] pycompile: allow to force compilation
In-Reply-To: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
References: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479899298-14655-13-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 support/scripts/pycompile.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index fde711a..5598f8a 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -10,6 +10,7 @@ from __future__ import print_function
 import sys
 import py_compile
 import compileall
+import argparse
 
 class ReportProblem:
     def __nonzero__(self):
@@ -21,4 +22,12 @@ class ReportProblem:
 
 report_problem = ReportProblem()
 
-compileall.compile_dir(sys.argv[1], quiet=report_problem)
+parser = argparse.ArgumentParser(description='Compile Python source files in a directory tree.')
+parser.add_argument("target", metavar='DIRECTORY',
+        help='Directory to scan')
+parser.add_argument("--force", action='store_true',
+        help="Force compilation even if alread compiled")
+
+args = parser.parse_args()
+
+compileall.compile_dir(args.target, force=args.force, quiet=report_problem)
-- 
1.9.1
