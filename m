From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 21:51:02 +0100
Subject: [Buildroot] [git commit] package/chrony: add option for debug
 logging
Message-ID: <20191027204454.633FA8A64D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cef093f665334216123909efe057685f891ed5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a BR2_PACKAGE_CHRONY_DEBUG_LOGGING config option to allow enabling
compiled-in support for debug logging in Chrony.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
[Arnout: don't enable by default]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/chrony/Config.in | 8 ++++++++
 package/chrony/chrony.mk | 3 ++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/chrony/Config.in b/package/chrony/Config.in
index 05d6fc1a25..158dc20530 100644
--- a/package/chrony/Config.in
+++ b/package/chrony/Config.in
@@ -6,3 +6,11 @@ config BR2_PACKAGE_CHRONY
 	  accuracy of the system clock.
 
 	  http://chrony.tuxfamily.org/
+
+config BR2_PACKAGE_CHRONY_DEBUG_LOGGING
+	bool "enable debug logging support"
+	depends on BR2_PACKAGE_CHRONY
+	help
+	  Enable support for debug logging output from Chrony when
+	  enabled at runtime. If disabled, code for debug logging will
+	  not be compiled in.
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 4a740d5067..f6dcb11794 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -13,7 +13,8 @@ CHRONY_CONF_OPTS = \
 	--host-system=Linux \
 	--host-machine=$(BR2_ARCH) \
 	--prefix=/usr \
-	--without-tomcrypt
+	--without-tomcrypt \
+	$(if $(BR2_PACKAGE_CHRONY_DEBUG_LOGGING),--enable-debug,--disable-debug)
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 CHRONY_DEPENDENCIES += libcap
