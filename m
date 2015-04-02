From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Apr 2015 01:09:06 +0200
Subject: [Buildroot] [PATCH] package/ca-certificates: generate the bundle of
	certs
Message-ID: <1428016146-15442-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glib-networking wants to use the certificates bundle, not the individual
certificates.

Generating the bundle is usually done with update-ca-certificates, but
that does not support running out-of-tree.

Fortiunately, and as Gustavo put it, update-ca-certificates is jsut a
glorified 'cat'. It is supposed to be fed a config file stating which
certificate to add/remove to/from the bundle, otherwise nothing fancy
(Oh, yes, running hooks after updating the bundle).

Since we do not need any of this in Buidlroot, we jsut generate a bundle
with all certificates unconditionally.

Reported-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ca-certificates/ca-certificates.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 271985a..8fe26c9 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -25,9 +25,11 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	rm -f  $(TARGET_DIR)/etc/ssl/certs/*
 
 	# Create symlinks to certificates under /etc/ssl/certs
+	# and generate the bundle
 	cd $(TARGET_DIR) ;\
 	for i in `find usr/share/ca-certificates -name "*.crt"` ; do \
 		ln -sf ../../../$$i etc/ssl/certs/`basename $${i} .crt`.pem ;\
+		cat $$i >>etc/ssl/certs/ca-certificates.crt ;\
 	done
 
 	# Create symlinks to the certificates by their hash values
-- 
1.9.1
