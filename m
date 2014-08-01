From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 01 Aug 2014 21:53:43 +0200
Subject: [Buildroot] [PATCH 1 of 5 v3] uclibc: fixup config before calling
	menuconfig
In-Reply-To: <patchbomb.1406922822@localhost>
References: <patchbomb.1406922822@localhost>
Message-ID: <8fc7b26a491414b96420.1406922823@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uclibc-menuconfig command is currently run based on the user-specified
config file, while the fixup of the config file is done afterwards.
However, it makes more sense to do an initial fixup _before_ running
menuconfig, so that the options presented to the user are consistent with
the final configuration.

This patch changes the dependency of the menuconfig target from .config to
.stamp_config_fixup_done to achieve this.

Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: new patch

 package/uclibc/uclibc.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff -r 892938e37055 -r 8fc7b26a4914 package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk	Mon Apr 28 06:58:48 2014 +0200
+++ b/package/uclibc/uclibc.mk	Fri Aug 01 21:22:29 2014 +0200
@@ -542,7 +542,7 @@
 
 $(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.stamp_config_fixup_done
 
-uclibc-menuconfig: $(UCLIBC_DIR)/.config
+uclibc-menuconfig: $(UCLIBC_DIR)/.stamp_config_fixup_done
 	$(MAKE) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
