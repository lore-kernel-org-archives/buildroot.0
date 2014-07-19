From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 18:06:19 +0200
Subject: [Buildroot] [git commit] openssl: drop libdl from pc file
Message-ID: <20140719160636.964E69D25A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c130c5d4635e2a4c7338161953152faf8fca07c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/2a2/2a274e2dbffd268a391b0e8a15dae5a759b870a1/

[Thomas: move registration of the hook inside the condition.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssl/openssl.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 743ca52..7e49a65 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -115,6 +115,14 @@ define OPENSSL_INSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
 
+# libdl has no business in a static build
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define OPENSSL_FIXUP_STATIC_PKGCONFIG
+	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/openssl.pc
+endef
+OPENSSL_POST_INSTALL_STAGING_HOOKS += OPENSSL_FIXUP_STATIC_PKGCONFIG
+endif
+
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
 # libraries gets installed read only, so strip fails
 define OPENSSL_INSTALL_FIXUPS_SHARED
