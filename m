From: Martin Bark <martin@barkynet.com>
Date: Sun,  6 May 2018 17:19:43 +0100
Subject: [Buildroot] [PATCH 1/2] package/ca-certificates: don't hash
 certificates.crt
Message-ID: <20180506161944.7451-1-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Copy certificates.crt to /etc/ssl/certs after we run c_rehash to
prevent it getting hashed by mistake.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/ca-certificates/ca-certificates.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index cb0e961465..b99e6f47ca 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -30,14 +30,20 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 
 	# Create symlinks to certificates under /etc/ssl/certs
 	# and generate the bundle
+	rm -f $(@D)/ca-certificates.crt
 	cd $(TARGET_DIR) ;\
 	for i in `find usr/share/ca-certificates -name "*.crt"` ; do \
 		ln -sf ../../../$$i etc/ssl/certs/`basename $${i} .crt`.pem ;\
-		cat $$i >>etc/ssl/certs/ca-certificates.crt ;\
+		cat $$i >>$(@D)/ca-certificates.crt ;\
 	done
 
 	# Create symlinks to the certificates by their hash values
 	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+
+	# Install the certificates bundle we just created
+	$(INSTALL) -D -m 644 $(@D)/ca-certificates.crt \
+		$(TARGET_DIR)/etc/ssl/certs/ca-certificates.crt
+
 endef
 
 $(eval $(generic-package))
-- 
2.17.0
