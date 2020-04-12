From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 14:49:45 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: add tilde '~'
 expansion for pathes
Message-ID: <20200412123726.540A98E6CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f41056ec4b423e2fb590b08e07a6dff297b15160
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the 'nvd-path', 'json' and 'html' are used like this:

  --html ~/foo

then the tilde expansion is properly done by the shell. However, when
they are used like this:

  --html=~/foo

The shell doesn't do the tilde expansion, and pkg-stats doesn't do
it. This commit modifies pkg-stats to ensure that tilde expansion is
done when parsing the 'nvd-path', 'json' and 'html' arguments.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[Thomas: improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 5adda6df08..c1f41fc9e8 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -989,12 +989,16 @@ def dump_json(packages, defconfigs, stats, date, commit, output):
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
@@ -1002,7 +1006,7 @@ def parse_args():
     packages.add_argument('-p', dest='packages', action='store',
                           help='List of packages (comma separated)')
     parser.add_argument('--nvd-path', dest='nvd_path',
-                        help='Path to the local NVD database')
+                        help='Path to the local NVD database', type=resolvepath)
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
