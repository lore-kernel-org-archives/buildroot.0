From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:51:00 +0100
Subject: [Buildroot] [git commit] gnutls: remove manual doc disabling kludge
Message-ID: <20151215205918.B627B81DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5aca274c7b8fe60fb76903f6c408db4612b0891c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's no longer required, SUBDIRS += doc is guarded by ENABLE_DOC in
Makefile.am and the only place where it's used regardless is in
dist-hook which isn't used by buildroot.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnutls/gnutls.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index d97e5e5..2855e8f 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -80,17 +80,11 @@ else
 GNUTLS_CONF_OPTS += --without-zlib
 endif
 
-# Some examples in doc/examples use wchar
-define GNUTLS_DISABLE_DOCS
-	$(SED) 's/ doc / /' $(@D)/Makefile.in
-endef
-
 define GNUTLS_DISABLE_TOOLS
 	$(SED) 's/\$$(PROGRAMS)//' $(@D)/src/Makefile.in
 	$(SED) 's/) install-exec-am/)/' $(@D)/src/Makefile.in
 endef
 
-GNUTLS_POST_PATCH_HOOKS += GNUTLS_DISABLE_DOCS
 GNUTLS_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_GNUTLS_TOOLS),,GNUTLS_DISABLE_TOOLS)
 
 $(eval $(autotools-package))
