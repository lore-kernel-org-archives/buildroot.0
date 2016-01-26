From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:26:52 +0100
Subject: [Buildroot] [git commit] pkg-kconfig: add missing -patch dependency
	for defconfig
Message-ID: <20160201224707.35A147F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c65612fff80f3ae5f9ab0a20a516ce20dd19981d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the introduction of _KCONFIG_DEFCONFIG in 8ef62b99, the package's
.config file no longer depends on anything (unless a fragment is
defined). Therefore, there is no dependency anymore between .config
and <pkg>-patch. Thus, it is possible that the .config file is
attempted to be built before the package is extracted and patched.
Usually this works out OK because <pkg>-patch will always be done
before <pkg>-configure, but it will fail when the user calls
<pkg>-menuconfig explicitly. It will also fail when we enable
top-level parallel build.

To solve this, just add an explicit order-only dependency on
<pkg>-patch. It really is only necessary when _KCONFIG_DEFCONFIG is
defined and _KCONFIG_FRAGMENT_FILES is not, but it doesn't hurt to
add it unconditionally.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reported-by: FrAnKenStEiN MC <chfakht@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index eaee572..90f3f9f 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -72,6 +72,11 @@ $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) oldconfig
 
+# If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
+# already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
+# it explicitly. It doesn't hurt to always have it though.
+$$($(2)_DIR)/.config: | $(1)-patch
+
 # In order to get a usable, consistent configuration, some fixup may be needed.
 # The exact rules are specified by the package .mk file.
 define $(2)_FIXUP_DOT_CONFIG
