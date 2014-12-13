From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Dec 2014 18:08:33 +0100
Subject: [Buildroot] [PATCH] package/pcre: install headers in legacy location
Message-ID: <1418490513-10957-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nmap is looking for pcre headers in pcre/pcre.h which our current
version of pcre does not populates.

So, just create those as symlinks to the actual headers.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>

---
Note: this is not fixing anything for now, because the error in nmap is
hidden by another error. But this is relaticvely easy to fix, so here we
go... ;-)
---
 package/pcre/pcre.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 4ff7abd..f2cf02d 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -22,5 +22,13 @@ PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
 PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
 PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
 
+define PCRE_LEGACY_PATHS
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/pcre
+	for h in $(STAGING_DIR)/usr/include/pcre*.h; do \
+		ln -sf ../$${h##*/} $(STAGING_DIR)/usr/include/pcre/ || exit 1; \
+	done
+endef
+PCRE_POST_INSTALL_STAGING_HOOKS += PCRE_LEGACY_PATHS
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.9.1
