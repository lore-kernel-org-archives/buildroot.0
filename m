From: Nicolas Dechesne <ndec13@gmail.com>
Date: Mon, 4 Feb 2013 23:47:41 +0100
Subject: [Buildroot] [PATCH] scripts: xorg-release: handle case when version
	needs downgrade
Message-ID: <1360018061-6834-1-git-send-email-ndec13@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the initial implementation assumes that when a version found in
buildroot is different from the one in the X11 release, it
requires an upgrade. even though this is most likely the case, it
could be a downgrade too, and it's probably worth highlighting
such cases when it (rarely) happens.

LooseVersion from distutils is doing the low level job of sorting
version numbers represented in strings...

Signed-off-by: Nicolas Dechesne <ndec13@gmail.com>
---
 support/scripts/xorg-release |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/support/scripts/xorg-release b/support/scripts/xorg-release
index 70ba41c..4e18c68 100755
--- a/support/scripts/xorg-release
+++ b/support/scripts/xorg-release
@@ -9,6 +9,7 @@ import BeautifulSoup
 import re
 import os
 import urllib
+from distutils.version import LooseVersion
 
 # This can be customized
 XORG_VERSION = "X11R7.7"
@@ -131,6 +132,7 @@ def show_summary(packages):
     pkgs.sort()
     total_pkgs = 0
     upgrade_pkgs = 0
+    downgrade_pkgs = 0
     add_pkgs = 0
     remove_pkgs = 0
     nothing_todo_pkgs = 0
@@ -147,13 +149,16 @@ def show_summary(packages):
             xorg_version = "N/A"
             action = "Remove from Buildroot"
             remove_pkgs += 1
-        # For now, we assume that if a package version is different,
-        # it's because an upgrade is needed.
-        elif pkg[XORG_VERSION_KEY] != pkg[BR_VERSION_KEY]:
+        elif LooseVersion(pkg[XORG_VERSION_KEY]) > LooseVersion(pkg[BR_VERSION_KEY]):
             br_version = pkg[BR_VERSION_KEY]
             xorg_version = pkg[XORG_VERSION_KEY]
             action = "Upgrade"
             upgrade_pkgs += 1
+        elif LooseVersion(pkg[XORG_VERSION_KEY]) < LooseVersion(pkg[BR_VERSION_KEY]):
+            br_version = pkg[BR_VERSION_KEY]
+            xorg_version = pkg[XORG_VERSION_KEY]
+            action = "Downgrade"
+            downgrade_pkgs += 1
         else:
             br_version = pkg[BR_VERSION_KEY]
             xorg_version = pkg[XORG_VERSION_KEY]
@@ -165,6 +170,7 @@ def show_summary(packages):
     STAT_FORMAT_STRING = "%40s : %3d"
     print STAT_FORMAT_STRING % ("Total number of packages", total_pkgs)
     print STAT_FORMAT_STRING % ("Packages to upgrade", upgrade_pkgs)
+    print STAT_FORMAT_STRING % ("Packages to downgrade", downgrade_pkgs)
     print STAT_FORMAT_STRING % ("Packages to add", add_pkgs)
     print STAT_FORMAT_STRING % ("Packages to remove", remove_pkgs)
     print STAT_FORMAT_STRING % ("Packages with nothing to do", nothing_todo_pkgs)
-- 
1.7.10.4
