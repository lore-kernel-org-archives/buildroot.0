From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Dec 2015 14:01:39 -0300
Subject: [Buildroot] [PATCH] gnutls: needs argp-standalone for musl/uclibc
Message-ID: <1449248499-2852-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's required for crywrap (tools), fixes:
http://autobuild.buildroot.net/results/2d9/2d98fced7ff7c3b5c39a97eb1c8db7dd651fa86c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/Config.in | 2 ++
 package/gnutls/gnutls.mk | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index dde23ce..998e213 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -14,6 +14,8 @@ if BR2_PACKAGE_GNUTLS
 
 config BR2_PACKAGE_GNUTLS_TOOLS
 	bool "install tools"
+	select BR2_PACKAGE_ARGP_STANDALONE \
+		if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Install GnuTLS command line tools for various cryptographic tasks.
 
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 3b9fc7f..a7342d6 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -44,6 +44,12 @@ ifeq ($(BR2_PACKAGE_GNUTLS_TOOLS),)
 GNUTLS_CONF_OPTS += --disable-crywrap
 endif
 
+# Prerequisite for crywrap
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+GNUTLS_CONF_ENV += LIBS="-largp"
+GNUTLS_DEPENDENCIES += argp-standalone
+endif
+
 # libidn support for nommu must exclude the crywrap wrapper (uses fork)
 GNUTLS_CONF_OPTS += $(if $(BR2_USE_MMU),,--disable-crywrap)
 
-- 
2.4.10
