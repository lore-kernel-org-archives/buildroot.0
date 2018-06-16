From: Martin Bark <martin@barkynet.com>
Date: Sat, 16 Jun 2018 23:05:59 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/ca-certificates: don't hash
 certificates.crt
In-Reply-To: <20180616220601.4629-1-martin@barkynet.com>
References: <20180616220601.4629-1-martin@barkynet.com>
Message-ID: <20180616220601.4629-2-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently c_rehash mistakenly hashes the certificates bundle
certificates.crt resulting in ${TAGET_DIR}/etc/ssl/certs/128805a3.0
incorrectly linking to ca-certificates.crt when it should be linked to
EE_Certification_Centre_Root_CA_2.pem

To fix this install certificates.crt to /etc/ssl/certs after we run
c_rehash to prevent it getting hashed by mistake.

Note: $(TARGET_DIR)/etc/ssl/certs/ is already removed during install so
this fix also works for rebuilds.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2:
 - reword commit message and improve creation of ca-certificates.crt
   (Suggested By Peter Korsgaard)
---
 package/ca-certificates/ca-certificates.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index c19d37788b..9685d0e6f0 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -33,11 +33,15 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	cd $(TARGET_DIR) ;\
 	for i in `find usr/share/ca-certificates -name "*.crt"` ; do \
 		ln -sf ../../../$$i etc/ssl/certs/`basename $${i} .crt`.pem ;\
-		cat $$i >>etc/ssl/certs/ca-certificates.crt ;\
-	done
+		cat $$i ;\
+	done >$(@D)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
 	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+
+	# Install the certificates bundle
+	$(INSTALL) -D -m 644 $(@D)/ca-certificates.crt \
+		$(TARGET_DIR)/etc/ssl/certs/ca-certificates.crt
 endef
 
 $(eval $(generic-package))
-- 
2.17.1
