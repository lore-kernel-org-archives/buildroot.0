From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 17:59:06 +0200
Subject: [Buildroot] [git commit] mosh: bump to version 1.2.6
Message-ID: <20160902142939.5A5CF7FB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1091f0978c6808292ad8d088e82c4cd4c118ea99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now supports nettle as crypto backend too.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mosh/Config.in |  2 +-
 package/mosh/mosh.hash |  4 ++--
 package/mosh/mosh.mk   | 12 ++++++++++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index b4189ee..d1fbd63 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_MOSH
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_NETTLE if !BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	# runtime dependency
 	select BR2_PACKAGE_OPENSSH if !BR2_PACKAGE_DROPBEAR_CLIENT
diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
index ab925b5..31f59c7 100644
--- a/package/mosh/mosh.hash
+++ b/package/mosh/mosh.hash
@@ -1,2 +1,2 @@
-# From: http://mailman.mit.edu/pipermail/mosh-users/2015-July/000283.html
-sha256 1af809e5d747c333a852fbf7acdbf4d354dc4bbc2839e3afe5cf798190074be3 mosh-1.2.5.tar.gz
+# From https://mailman.mit.edu/pipermail/mosh-users/2016-August/000330.html
+sha256 7e82b7fbfcc698c70f5843bb960dadb8e7bd7ac1d4d2151c9d979372ea850e85 mosh-1.2.6.tar.gz
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index f8c45e8..2cd358b 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -4,12 +4,20 @@
 #
 ################################################################################
 
-MOSH_VERSION = 1.2.5
+MOSH_VERSION = 1.2.6
 MOSH_SITE = https://mosh.mit.edu
-MOSH_DEPENDENCIES = zlib ncurses protobuf openssl host-pkgconf
+MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPLv3+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MOSH_CONF_OPTS += --with-crypto-library=openssl
+MOSH_DEPENDENCIES += openssl
+else
+MOSH_CONF_OPTS += --with-crypto-library=nettle
+MOSH_DEPENDENCIES += nettle
+endif
+
 # help the detection of the SSP support: mosh configure.ac doesn't do
 # a link test, so it doesn't detect when the toolchain doesn't have
 # libssp.
