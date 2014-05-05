From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 May 2014 23:53:06 +0200
Subject: [Buildroot] [git commit] busybox: allow build with musl
Message-ID: <20140506081939.253559C5E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43b1cd320991b1632972d343e8884ba5061fa7e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The musl C library does not yet implemented the getpwent_r() function,
needed by the Busybox password code when CONFIG_USE_BB_PWD_GRP is
disabled. So we enable it when the musl C library is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 793ffb9..150100b 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -153,6 +153,15 @@ define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
 endef
 endif
 
+# We also need to use internal functions when using the musl C
+# library, since some of them are not yet implemented by musl.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_PWD_GRP,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_SHADOW,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_SET_INIT
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INIT,$(BUSYBOX_BUILD_CONFIG))
