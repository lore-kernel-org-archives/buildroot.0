From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 23:06:44 +0200
Subject: [Buildroot] [git commit] gnutls: make crywrap a tools option
Message-ID: <20130605211328.26FA29A96A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=235b676a6670bfedc41a43543e0d34bc4dd85854
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

crywrap now needs wchar support so just build it when tools are enabled.
It's also a tool so it belongs there anyway.
Fixes:
http://autobuild.buildroot.net/results/418/418ce71eecc1db725e3b3f092131a01cb1666a60/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/gnutls.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 3089979..43ec977 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -37,6 +37,11 @@ GNUTLS_CONF_OPT += --with-regex-header=pcreposix.h \
 	--with-libregex-cflags="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --cflags`" \
 	--with-libregex-libs="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --libs`"
 
+# Consider crywrap as part of tools because it needs WCHAR, and it's so too
+ifeq ($(BR2_PACKAGE_GNUTLS_TOOLS),)
+	GNUTLS_CONF_OPT += --disable-crywrap
+endif
+
 # libidn support for nommu must exclude the crywrap wrapper (uses fork)
 GNUTLS_CONF_OPT += $(if $(BR2_USE_MMU),,--disable-crywrap)
 GNUTLS_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBIDN),libidn)
