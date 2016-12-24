From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 23 Dec 2016 20:50:55 -0500
Subject: [Buildroot] [PATCH 1/1] luarocks: fix target-finalize hook
	processing
Message-ID: <1482544255-4158-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The LUAROCKS_TARGET_FINALIZE_HOOKS is not running, so detritus
it being left in /usr/lib/luarocks.  This is because luarocks is
built by being a dependency in the luarocks package infrastructure,
not by being selected by kconfig symbol. This means that the
$(PKG)_KCONFIG_VAR in pkg-generic.mk is not met, and
(HOST_)LUAROCKS_TARGET_FINALIZE_HOOKS is not added to the global
TARGET_FINALIZE_HOOKS.

This mod fixes this issue by adding the host-luarocks hook directly
to TARGET_FINALIZE_HOOKS when either lua or luajit is enabled.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/luarocks/luarocks.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 4e0d537..d18056a 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -60,4 +60,7 @@ define LUAROCKS_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
 endef
 
-LUAROCKS_TARGET_FINALIZE_HOOKS += LUAROCKS_FINALIZE_TARGET
+# Apply to global variable directly, as pkg-generic does not
+ifneq ($(BR2_PACKAGE_LUAJIT)$(BR2_PACKAGE_LUA),)
+TARGET_FINALIZE_HOOKS += LUAROCKS_FINALIZE_TARGET
+endif
-- 
2.7.4
