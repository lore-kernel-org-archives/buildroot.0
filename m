From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jan 2013 15:52:49 +0100
Subject: [Buildroot] [git commit] gnutls: fix build failure related to
	pthreads
Message-ID: <20130102145306.C72B39A5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50e562bc4ab83128f093f44b34327f8c23782b06
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pthreads autodetection poisons the linkpath thus making other
distribution libraries to take precedence over the cross ones.
Leading to failures such as:
http://autobuild.buildroot.net/results/tmp/3f979d4e2186ee31012c332fedec9591890b0b77

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/gnutls.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 0166a74..1cbcf70 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -17,6 +17,9 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=$(if $(BR2_INET_IPV6),yes,no) \
 	gt_cv_c_wint_t=$(if $(BR2_USE_WCHAR),yes,no)
 GNUTLS_INSTALL_STAGING = YES
 
+# libpthread autodetection poisons the linkpath
+GNUTLS_CONF_OPT += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
+
 # Some examples in doc/examples use wchar
 define GNUTLS_DISABLE_DOCS
 	$(SED) 's/ doc / /' $(@D)/Makefile.in
