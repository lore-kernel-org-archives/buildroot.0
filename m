From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:03:28 +0200
Subject: [Buildroot] [git commit branch/2020.08.x]
 support/scripts/pycompile: add main entry point
Message-ID: <20200915185503.8CC83868C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17bcb6e15721c0eb47c508c6d8255e9368dbab27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Only run code when the script is executed directly (not imported).
Factorize command description by using the script's __doc__ variable.
Fix typo in --force help message.

Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7b3025f93ef47ac0ce980d0847748c363ab4176b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pycompile.py | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index 9192a7016a..fb1a12b2b7 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -58,12 +58,19 @@ class ReportProblem(int):
         return not self == other
 
 
-parser = argparse.ArgumentParser(description='Compile Python source files in a directory tree.')
-parser.add_argument("target", metavar='DIRECTORY',
-                    help='Directory to scan')
-parser.add_argument("--force", action='store_true',
-                    help="Force compilation even if alread compiled")
+def main():
+    parser = argparse.ArgumentParser(description=__doc__)
+    parser.add_argument("target", metavar="TARGET",
+                        help="Directory to scan")
+    parser.add_argument("--force", action="store_true",
+                        help="Force compilation even if already compiled")
 
-args = parser.parse_args()
+    args = parser.parse_args()
 
-compileall.compile_dir(args.target, force=args.force, quiet=ReportProblem())
+    compileall.compile_dir(args.target, force=args.force, quiet=ReportProblem())
+
+    return 0
+
+
+if __name__ == "__main__":
+    sys.exit(main())
