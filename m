From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 16:49:43 +0100
Subject: [Buildroot] [git commit] package/busybox: change how its SELinux
 support is enabled
Message-ID: <20200203154034.9A021873EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc2e241bce5c1f70e93d22aceee180ee26db0e77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following commit 0dcb5513ef0db8266b107a7f9fbc5fc1fedc888d
("package/refpolicy: remove dependency on policycoreutils"), we have a
build failure on some configurations:

Makefile:571: *** libselinux is in the dependency chain of busybox that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

This is because refpolicy selects the busybox SELinux support when
Busybox is enabled, which it turns selects libselinux, but we no
longer pay attention to the libselinux dependencies while doing this.

Since it's quite weird to have refpolicy mess with Busybox SELinux
support, this commit changes the logic to have Busybox automatically
enable its SELinux support as soon as SELinux support is enabled,
while still allowing it to be disabled.

Fixes:

  http://autobuild.buildroot.net/results/5d8fda7c488a03c14942d87467d501acd633d24a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/Config.in   | 5 ++---
 package/refpolicy/Config.in | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index be8b0e4799..5e5c586762 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -38,10 +38,9 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 
 config BR2_PACKAGE_BUSYBOX_SELINUX
 	bool "Enable SELinux support"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
+	default y
+	depends on BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
-	select BR2_PACKAGE_LIBSELINUX
 	help
 	  Enable SELinux support in BusyBox. Please note that
 	  depending on your BusyBox configuration and the SELinux
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index f0c8a43563..b50b2f09ff 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_REFPOLICY
 	bool "refpolicy"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsepol
-	select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
 	# Even though libsepol is not necessary for building, we get
 	# the policy version from libsepol, so we select it, and treat
 	# it like a runtime dependency.
