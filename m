From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 15 Jan 2019 15:11:31 +0100
Subject: [Buildroot] [PATCH] scripts/autobuild-run: add --branches option
Message-ID: <20190115141131.22754-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle <arnout.vandecappelle@essensium.com>

The autobuild-run script will retrieve the list of branches to test
from autobuild.buildroot.org. However, it the autobuild script is used
to test some local configuration, this is probably not appropriate. The
new --branches option allows to override the URL of the branches CSV
file. A file:/// URL can be used for a local file.

Signed-off-by: Arnout Vandecappelle <arnout.vandecappelle@essensium.com>
---
 scripts/autobuild-run | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 3d2e99a..77272f5 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -69,6 +69,7 @@ defaults = {
     '--http-url': 'http://autobuild.buildroot.org/submit/',
     '--toolchains-csv': 'support/config-fragments/autobuild/toolchain-configs.csv',
     '--repo': 'https://github.com/buildroot/buildroot.git',
+    '--branches': 'http://autobuild.buildroot.org/branches',
 }
 
 doc = """autobuild-run - run Buildroot autobuilder
@@ -106,6 +107,8 @@ Options:
   --toolchains-csv CSVFILE       Toolchain configuration file
   -r, --repo URL                 URL of Buildroot repository to clone
                                  Defaults to %(--repo)s
+  --branches URL                 URL of CSV file with branches to test
+                                 Defaults to %(--branches)s
 
 Format of the configuration file:
 
@@ -185,7 +188,7 @@ def check_version():
         print("ERROR: script version too old, please upgrade.")
         sys.exit(1)
 
-def get_branch():
+def get_branch(url):
     """Returns the branch that should be built. It fetches a CSV file from
     autobuild.buildroot.org that provides the list of branches to test
     (first field) and their weight (second field). We build a list of
@@ -194,7 +197,7 @@ def get_branch():
     list. This way, branches with a higher weight are more likely to
     be selected.
     """
-    with urlopen_closing('http://autobuild.buildroot.org/branches') as r:
+    with urlopen_closing(url) as r:
         csv_branches = r.readlines()
     branches = []
     for branch in csv.reader(csv_branches):
@@ -314,7 +317,7 @@ def prepare_build(**kwargs):
                   os.path.relpath(f, dldir))
         os.remove(f)
 
-    branch = get_branch()
+    branch = get_branch(kwargs['branches'])
     log_write(log, "INFO: testing branch '%s'" % branch)
 
     # Clone Buildroot. This only happens if the source directory
@@ -764,6 +767,7 @@ def main():
                 nice = (args['--nice'] or 0),
                 toolchains_csv = args['--toolchains-csv'],
                 repo = args['--repo'],
+                branches = args['--branches'],
                 upload = upload,
                 buildpid = buildpid,
                 debug = args['--debug']
-- 
2.20.1
