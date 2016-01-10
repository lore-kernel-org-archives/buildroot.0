From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2016 21:46:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/libldns: Fix build error with
	target install-manpages
Message-ID: <1452458817-2184-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using this minimal defconfig

BR2_PACKAGE_LIBLDNS=y

the build fails due to the non-existing directory share/man/man3/

./install-sh: doc/man/man3/* does not exist.
Makefile:297: recipe for target 'install-manpages' failed
make[1]: *** [install-manpages] Error 1

Since we do not need manpages anyway this patch disables the
corresponding make target.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libldns/libldns.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 3d4d356..5595407 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -10,6 +10,12 @@ LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3c
 LIBLDNS_LICENSE_FILES = LICENSE
 LIBLDNS_INSTALL_STAGING = YES
+
+define LIBLDNS_DISABLE_INSTALL_MANPAGES
+	$(SED) 's/ install-manpages / /' $(@D)/Makefile.in
+endef
+LIBLDNS_POST_PATCH_HOOKS += LIBLDNS_DISABLE_INSTALL_MANPAGES
+
 LIBLDNS_CONF_OPTS = \
 	--without-examples \
 	--without-p5-dns-ldns \
-- 
2.6.4
