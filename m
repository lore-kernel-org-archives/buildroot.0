From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Dec 2016 23:55:11 +0100
Subject: [Buildroot] [git commit] luarocks: fix target-finalize hook
	processing
Message-ID: <20161228225810.E5B1B81829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e298cf06f6fe04bf6b52bddeee1a816054195ac4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LUAROCKS_TARGET_FINALIZE_HOOKS is not running, so detritus is being left
in /usr/lib/luarocks.  This is because host-luarocks is built by being a
dependency in the luarocks package infrastructure, not by being selected by
kconfig symbol.  This means that the $(PKG)_KCONFIG_VAR in pkg-generic.mk is
not met, and (HOST_)LUAROCKS_TARGET_FINALIZE_HOOKS is not added to the
global TARGET_FINALIZE_HOOKS.

This mod fixes this issue by adding the host-luarocks hook directly
to TARGET_FINALIZE_HOOKS when either lua or luajit is enabled.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
