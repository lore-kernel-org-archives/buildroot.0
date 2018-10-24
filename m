From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:31:38 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] package/ca-certificates:
 don't hash certificates.crt
Message-ID: <20181024122957.0F26D88965@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9bb8015f459021718abc353629abf46ee42e0d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

c_rehash looks at all files in /etc/ssl/certs, generates the hash for
the certificates in them, and makes a symlink from the hash to the
certificate file.

However, ca-certificates.crt is also installed in /etc/ssl/certs and
it contains all the certificates. c_rehash will take one of them (the
first?) and create a symlink from that hash to ca-certificates.crt.
Usually, this results in an error like:

WARNING: Skipping duplicate certificate ca-certificates.crt

and all is well. However, depending on filesystem order,
ca-certificates.crt may come first, and the actual certificate is
not symlinked.

To fix this install certificates.crt to /etc/ssl/certs *after* we run
c_rehash to prevent it getting hashed by mistake.

Note: $(TARGET_DIR)/etc/ssl/certs/ is already removed during install so
this fix also works for rebuilds.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d07ddd8e4ed576dbce4c33ab006f342e24d3bd6b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
