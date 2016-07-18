From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:29:01 +0200
Subject: [Buildroot] [git commit] package/busybox: add comment about
	BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
Message-ID: <20160718212925.71D9B81E0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=781c85eb38ba43735218e906e319d6acee6846d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is a bit special. When Busybox is
enabled, it is a Busybox option. When Busybox is not enabled, it is a
stand-alone option, forcibly enabled.

So we can safely 'select' it without ensuring (via a 'depends on' or
another 'select') that Busybox is enabled.

However, the name of this option does not express the fact that it is
safe to select it without checking Busybox, which can lead to a bit of
time-consuming head-scratching.

To avoid future puzzlement from an unsuspecting observer, add a a big
fat comment that this option can be selected without any dependency on
Busybox.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas: slightly improve the wording of one of the comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 91c5d9e..7ef3f0e 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -26,6 +26,8 @@ config BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES
 	  A space-separated list of configuration fragment files,
 	  that will be merged to the main BusyBox configuration file.
 
+# This option is not an option of Busybox, it can be selected even
+# if Busybox is not enabled.
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	bool "Show packages that are also provided by busybox"
 	help
@@ -75,8 +77,10 @@ endif
 
 if !BR2_PACKAGE_BUSYBOX # kconfig doesn't support else
 
-# add dummy config so the stuff with busybox alternatives are shown
-# when busybox is disabled
+# This option is not an option of Busybox, it can be selected even if
+# Busybox is not enabled. This dummy option ensures that packages that
+# depend on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS are visible when Busybox
+# is disabled.
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	default y
 endif
