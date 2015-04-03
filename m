From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 15:39:39 +0200
Subject: [Buildroot] [git commit] package/ca-certificates: generate the
	bundle of certs
Message-ID: <20150403133947.285CC8191D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea6b7bd5455e733c9fb006c7ed3103459b62d0fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ca-certificates/ca-certificates.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
