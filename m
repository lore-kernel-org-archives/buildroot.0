From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:12 +0200
Subject: [Buildroot] [PATCH 26/74] libdnet: convert old-style hook to
	new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <84d37d15e3edc028ff6f1d2b5e2071024d6e1ef5.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdnet/libdnet.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 28304be..eb67b05 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -24,9 +24,11 @@ LIBDNET_INSTALL_TARGET_OPT = $(LIBDNET_MAKE_OPT) DESTDIR=$(TARGET_DIR) INSTALL_S
 LIBDNET_INSTALL_STAGING_OPT = $(LIBDNET_MAKE_OPT) DESTDIR=$(STAGING_DIR) install
 endif
 
-$(eval $(call AUTOTARGETS,package,libdnet))
+# Needed for autoreconf to work properly
+define LIBDNET_FIXUP_ACINCLUDE_M4
+	ln -sf config/acinclude.m4 $(@D)
+endef
 
-$(LIBDNET_HOOK_POST_EXTRACT):
-	ln -sf config/acinclude.m4 $(LIBDNET_DIR)
-	touch $@
+LIBDNET_POST_EXTRACT_HOOKS += LIBDNET_FIXUP_ACINCLUDE_M4
 
+$(eval $(call AUTOTARGETS,package,libdnet))
-- 
1.7.0.4
