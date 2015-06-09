From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 22:55:48 +0200
Subject: [Buildroot] [git commit] package/matchbox: make matchbox-lib a real
	package
Message-ID: <20150609211051.9D0FD81D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c1280ed853f1340fc8c07a62807879abc6ba3a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the matchbox package is using weird, legacy constructs to
build its different parts.

Notably, it adds matchbox-lib to the list of packages to build, even
though it is not a real package since it does not have a Kconfig entry.

Fix that:
  - add a Kconfig entry for matchbox-lib
  - select it from the top-level matchbox package

Note that matchbox-common already depends on matchbox-lib.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/Config.in              |    3 +++
 package/matchbox/matchbox-lib/Config.in |    2 ++
 package/matchbox/matchbox.mk            |    2 +-
 3 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 7867ae3..70cc168 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_MATCHBOX
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_MATCHBOX_LIB
 	help
 	  Matchbox is an Open Source base environment for the X Window
 	  System running on non-desktop embedded platforms such as
@@ -17,6 +18,8 @@ config BR2_PACKAGE_MATCHBOX
 
 if BR2_PACKAGE_MATCHBOX
 
+source "package/matchbox/matchbox-lib/Config.in"
+
 config BR2_PACKAGE_MATCHBOX_PANEL
 	bool "Matchbox Panel"
 	help
diff --git a/package/matchbox/matchbox-lib/Config.in b/package/matchbox/matchbox-lib/Config.in
new file mode 100644
index 0000000..480e6fe
--- /dev/null
+++ b/package/matchbox/matchbox-lib/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_MATCHBOX_LIB
+	bool
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index fe1a7db..e367df2 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -1,4 +1,4 @@
 ifeq ($(BR2_PACKAGE_MATCHBOX),y)
 include $(sort $(wildcard package/matchbox/*/*.mk))
-PACKAGES += matchbox-lib matchbox-wm
+PACKAGES += matchbox-wm
 endif
