From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat,  7 Mar 2020 11:37:05 +0100
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: add tilde '~'
 expansion for pathes
Message-ID: <20200307103704.20524-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The script arguments 'nvd-path', 'json' and 'html' currently does not
allow to have '~' in path for user home directory. With this patch
this '~' is expanded to the real user home directory.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8a67e509e1..bfe3a3f8d4 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -861,12 +861,16 @@ def dump_json(packages, stats, date, commit, output):
         f.write('\n')
 
 
+def resolvepath(path):
+        return os.path.abspath(os.path.expanduser(path))
+
+
 def parse_args():
     parser = argparse.ArgumentParser()
     output = parser.add_argument_group('output', 'Output file(s)')
-    output.add_argument('--html', dest='html', action='store',
+    output.add_argument('--html', dest='html', type=resolvepath,
                         help='HTML output file')
-    output.add_argument('--json', dest='json', action='store',
+    output.add_argument('--json', dest='json', type=resolvepath,
                         help='JSON output file')
     packages = parser.add_mutually_exclusive_group()
     packages.add_argument('-n', dest='npackages', type=int, action='store',
@@ -874,7 +878,7 @@ def parse_args():
     packages.add_argument('-p', dest='packages', action='store',
                           help='List of packages (comma separated)')
     parser.add_argument('--nvd-path', dest='nvd_path',
-                        help='Path to the local NVD database')
+                        help='Path to the local NVD database', type=resolvepath)
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
-- 
2.20.1
