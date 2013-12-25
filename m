From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 17:14:44 +0100
Subject: [Buildroot] [git commit] gnutls: fix libopts detection causing
	build failures
Message-ID: <20131225161616.A4ED39C1A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87815fc695bcb4ef5a48c09ab1ffcd0c134da43a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the recent bump of gnutls to version 3.2.8, the build
started to fail on some machines where libopts is installed on the
system: gnutls configure script was incorrectly assuming that libopts
was available.

Since we don't have a package in Buildroot, this commit tells gnutls
to use its builtin libopts version.

Fixes (tested on gcc20):

  http://autobuild.buildroot.org/results/18f/18f61b3be6aed73f83b449b5082492a4a6ba8ffb/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnutls/gnutls.mk |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 7cbfcb1..9ad673e 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -15,8 +15,12 @@ GNUTLS_DEPENDENCIES = host-pkgconf nettle pcre \
 	$(if $(BR2_PACKAGE_LIBIDN),libidn) \
 	$(if $(BR2_PACKAGE_LIBTASN1),libtasn1) \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
-GNUTLS_CONF_OPT = --with-libnettle-prefix=$(STAGING_DIR)/usr --disable-rpath \
-	--disable-doc --disable-guile
+GNUTLS_CONF_OPT = \
+	--with-libnettle-prefix=$(STAGING_DIR)/usr \
+	--disable-rpath \
+	--disable-doc \
+	--disable-guile \
+	--enable-local-libopts
 GNUTLS_CONF_ENV = gl_cv_socket_ipv6=$(if $(BR2_INET_IPV6),yes,no) \
 	ac_cv_header_wchar_h=$(if $(BR2_USE_WCHAR),yes,no) \
 	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no) \
