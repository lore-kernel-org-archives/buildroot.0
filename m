From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 12:25:11 +0200
Subject: [Buildroot] [git commit] size-stats: fix bug when parsing file
	names with comma
Message-ID: <20160809102728.3746D800D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34b1bdeba40bf303dc8821421745d5b38a729984
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The size-stats script fails when the usb_modeswitch_data is enabled,
because this package installs files that contain commas in their
name. However, the size-stats script also uses comma as a separator for
its CSV files, causing a "ValueError: too many values to unpack" in:

  pkg, fpath = l.split(",")

Fix this by splitting only the two fields that need to be split.

The bug was reported by Matthias <porto.rio@gmx.net>, who also suggested
a fix.

Fixes bug #9136.

Reported-by: Matthias <porto.rio@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/size-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 81d96ca..0ddcc07 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -66,7 +66,7 @@ def build_package_dict(builddir):
     filesdict = {}
     with open(os.path.join(builddir, "build", "packages-file-list.txt")) as filelistf:
         for l in filelistf.readlines():
-            pkg, fpath = l.split(",")
+            pkg, fpath = l.split(",", 1)
             # remove the initial './' in each file path
             fpath = fpath.strip()[2:]
             fullpath = os.path.join(builddir, "target", fpath)
