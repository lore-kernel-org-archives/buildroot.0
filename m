From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 15:22:22 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 support/scripts/pkg-stats: import cve module only when needed
Message-ID: <20210119141354.3A83A87F36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21c2d104bc666d049ba0ef41ce52047bb1827d84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The cve module needs ijson, which may not be installed. Since cve
matching is only enabled when --nvd-path is passed, it is a bit silly
to error out about ijson being missing if it's not used.

So instead of unconditionally importing the cve module, only do it
conditionally.

However, instead of doing it right at the point where it is used, we
do it at the beginning of the main() function. Indeed, if the cve
module is needed but cannot be imported, we want to error out
immediately rather than doing a whole bunch of things, and failing on
the user later on in the middle of the pkg-stats execution.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 824032d16854ae3c0e6e67c534a7e8850199091a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index e642147b98..d9fb886305 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1062,7 +1062,13 @@ def parse_args():
 
 
 def __main__():
+    global cvecheck
+
     args = parse_args()
+
+    if args.nvd_path:
+        import cve as cvecheck
+
     if args.packages:
         package_list = args.packages.split(",")
     else:
