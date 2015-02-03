From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Feb 2015 15:21:41 +0100
Subject: [Buildroot] [PATCH 01/10] kconfig infra: support built-in config
	files
In-Reply-To: <cover.1422972638.git.yann.morin.1998@free.fr>
References: <cover.1422972638.git.yann.morin.1998@free.fr>
Message-ID: <f6a18bb6296ece445bff538def6eff9f2d54576b.1422972638.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

When the configuration file of a package is located inside of the
package sources, a make dependency can only be expressed after the
package has been extracted (and patched).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
---
 package/pkg-kconfig.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index ec58d69..ef724e5 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -41,9 +41,13 @@ ifndef $(2)_KCONFIG_FILE
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
 
+# The config file could be in-tree, so before depending on it the package should
+# be extracted (and patched) first
+$$($(2)_KCONFIG_FILE): | $(1)-patch
+
 # The .config file is obtained by copying it from the specified source
 # configuration file, after the package has been patched.
-$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) | $(1)-patch
+$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE)
 	$$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
 
 # In order to get a usable, consistent configuration, some fixup may be needed.
-- 
1.9.1
