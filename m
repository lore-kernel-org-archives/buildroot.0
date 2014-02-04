From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 10:32:11 +0100
Subject: [Buildroot] [git commit] scripts: xorg-release: handle case when
	version needs downgrade
Message-ID: <20140204094014.BE79D9C7A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=136ede6f19bff8dcbc6eceab2bef0c1e6049541c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the initial implementation assumes that when a version found in
buildroot is different from the one in the X11 release, it
requires an upgrade. even though this is most likely the case, it
could be a downgrade too, and it's probably worth highlighting
such cases when it (rarely) happens.

LooseVersion from distutils is doing the low level job of sorting
version numbers represented in strings...

[Thomas & Thomas:

  - do not count packages more recent in Buildroot than in the latest
    X.org release as to be downgraded. If we have more recent version,
    it's generally for a good reason, so we want to keep them as
    is. Such packages are counted as "nothing to do", but for
    information, we indicate that there are "More recent"

  - also remove the "nothing to do" action indicator. It used to be a
    simple dash, which was not really useful.
]

Signed-off-by: Nicolas Dechesne <ndec13@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/xorg-release |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/support/scripts/xorg-release b/support/scripts/xorg-release
index 70ba41c..a4f090d 100755
--- a/support/scripts/xorg-release
+++ b/support/scripts/xorg-release
@@ -9,6 +9,7 @@ import BeautifulSoup
 import re
 import os
 import urllib
+from distutils.version import LooseVersion
 
 # This can be customized
 XORG_VERSION = "X11R7.7"
@@ -147,17 +148,20 @@ def show_summary(packages):
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
+            action = "More recent"
+            nothing_todo_pkgs += 1
         else:
             br_version = pkg[BR_VERSION_KEY]
             xorg_version = pkg[XORG_VERSION_KEY]
-            action = "-"
+            action = ""
             nothing_todo_pkgs += 1
 
         print FORMAT_STRING % (pkgname, br_version.center(15), xorg_version.center(15), action)
