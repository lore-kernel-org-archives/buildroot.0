From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 26 Jan 2017 11:14:59 -0500
Subject: [Buildroot] [PATCH 1/1] sngrep: fix dependency and configuration
	issues.
Message-ID: <20170126161459.17210-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the changes applied by thomas I noticed that sngrep will now
fail to configure if both openssl and gnutls are selected
(both can't be enabled at the same time.)  I set openssl to take
precidence over gnutls, mainly because it's the larger of the two
dependencies, and if the user has selected it they probably want
to use it.

I also noticed that sngrep will complain if libgcrypt isn't compiled
as well.  Not sure why I didn't notice this issue to begin with, but
I added it as a dependency and select it in the Config.in file now.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/sngrep/Config.in |  1 +
 package/sngrep/sngrep.mk | 13 +++++--------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/sngrep/Config.in b/package/sngrep/Config.in
index 4d0d80c..c3b8469 100644
--- a/package/sngrep/Config.in
+++ b/package/sngrep/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_SNGREP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBGCRYPT
 	help
 	  sngrep is a tool for displaying SIP calls message flows from
 	  terminal.  It supports live capture to display realtime SIP
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index f504771..e168bb1 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -9,22 +9,19 @@ SNGREP_SITE = $(call github,irontec,sngrep,$(SNGREP_VERSION))
 SNGREP_LICENSE = GPLv3+
 SNGREP_LICENSE_FILES = LICENSE
 SNGREP_AUTORECONF = YES
-SNGREP_DEPENDENCIES = libpcap ncurses
+SNGREP_DEPENDENCIES = libpcap ncurses libgcrypt
 
 # our ncurses wchar support is not properly detected
 SNGREP_CONF_OPTS += --disable-unicode
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-SNGREP_DEPENDENCIES += gnutls
-SNGREP_CONF_OPTS += --with-gnutls
-else
-SNGREP_CONF_OPTS += --without-gnutls
-endif
-
+# openssl and gnutls can't be enable at the same time.
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SNGREP_DEPENDENCIES += openssl
 SNGREP_CONF_OPTS += --with-openssl
+SNGREP_CONF_OPTS += --without-gnutls
 else
+SNGREP_DEPENDENCIES += gnutls
+SNGREP_CONF_OPTS += --with-gnutls
 SNGREP_CONF_OPTS += --without-openssl
 endif
 
-- 
2.9.3
