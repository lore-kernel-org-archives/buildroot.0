From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  1 Dec 2017 16:09:46 +0100
Subject: [Buildroot] [PATCH 3/3] infra/pkg-kconfig: do not
 update-(def)config to a directory
In-Reply-To: <cover.1512140974.git.yann.morin.1998@free.fr>
References: <cover.1512140974.git.yann.morin.1998@free.fr>
Message-ID: <d2b584aa49a8597e975fcc4dfe4b568011798318.1512140974.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, if the user specifies the path to an existing directory as
the path to the custom (def)config file (FOO_KCONFIG_FILE), then we
happily create a file in there, either 'defconfig' or '.config' (or
whatever the .config is named for that package), depending on whether
we're saving a defconfig or a full config.

So, we could save the file, but then the Buildroot defconfig file that
contains that path would no longer be reusable as-is, because we
interpret that path as a path to a file.

Furthermore, if the directory-portion of FOO_KCONFIG_FILE does not
exist yet, the update would fail, because cp does not create missing
directory components.

So we fix that by adding an explicit test for the directory-ness of the
target file, and then an explicit mkdir to create missing directory
components.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-kconfig.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 0da6d0ab4e..81bba5220c 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -18,6 +18,11 @@ define kconfig-package-update-config
 		echo "Unable to perform $(@) when fragment files are set"; exit 1)
 	@$(if $($(PKG)_KCONFIG_DEFCONFIG), \
 		echo "Unable to perform $(@) when using a defconfig rule"; exit 1)
+	$(Q)if [ -d $($(PKG)_KCONFIG_FILE) ]; then \
+		echo "Unable to perform $(@) when $($(PKG)_KCONFIG_FILE) is a directory"; \
+		exit 1; \
+	fi
+	$(Q)mkdir -p $(dir $($(PKG)_KCONFIG_FILE))
 	cp -f $($(PKG)_DIR)/$(1) $($(PKG)_KCONFIG_FILE)
 	$(Q)touch --reference $($(PKG)_DIR)/$($(PKG)_KCONFIG_DOTCONFIG) $($(PKG)_KCONFIG_FILE)
 endef
-- 
2.11.0
