From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 21:21:12 +0100
Subject: [Buildroot] [git commit] libgsasl: fix auto dependencies
Message-ID: <20151126202156.12A1D816D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b4b915dd02b4c36568876350c3930ec357553d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

IDN can be picked up from the distro installation so use a prefix when
it's available or otherwise just disable it, fixes:
http://autobuild.buildroot.org/results/5d9/5d9baf528c47c5167ec8d2a6941cb06b4ca761ca/

Also disable libgcrypt support which wasn't accounted for and doesn't
seem to work either to possibly avoid the same problem.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgsasl/libgsasl.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index f2660ca..00ce8e0 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -9,6 +9,14 @@ LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPLv2.1+ (library), GPLv3+ (programs)
 LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
 LIBGSASL_INSTALL_STAGING = YES
-LIBGSASL_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBIDN),libidn)
+# It doesn't seem to build with our libgcrypt so better be safe
+LIBGSASL_CONF_OPTS = --without-libgcrypt
+
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+LIBGSASL_CONF_OPTS += --with-libidn-prefix=$(STAGING_DIR)/usr
+LIBGSASL_DEPENDENCIES += libidn
+else
+LIBGSASL_CONF_OPTS += --without-stringprep
+endif
 
 $(eval $(autotools-package))
