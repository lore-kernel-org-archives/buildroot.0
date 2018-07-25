From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 23:04:09 +0200
Subject: [Buildroot] [git commit] perl-net-ssh2: add support for libgcrypt
 crypto backend
Message-ID: <20180725205908.D09A58A402@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b361e7b459d62af4cc5e85427dee603e3ee4ff3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix usage of libgcrypt as crypto backend to libssh2, when building
perl-net-ssh2. In order to achieve that, we need to use 'depends on' the
libssh2 backends, which means the user will first need to enable libssh2 and
one of the supported backends, before being able to enable perl-net-ssh2.

Fixes
http://autobuild.buildroot.net/results/6ee18e7dd17f168c52f79e49cb5e94cf3aa3df1a/

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-ssh2/Config.in        | 8 +++++++-
 package/perl-net-ssh2/perl-net-ssh2.mk | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/perl-net-ssh2/Config.in b/package/perl-net-ssh2/Config.in
index 8f359b7015..4dfd6e1dd3 100644
--- a/package/perl-net-ssh2/Config.in
+++ b/package/perl-net-ssh2/Config.in
@@ -1,12 +1,18 @@
 config BR2_PACKAGE_PERL_NET_SSH2
 	bool "perl-net-ssh2"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBSSH2
+	depends on BR2_PACKAGE_LIBSSH2_OPENSSL || BR2_PACKAGE_LIBSSH2_LIBGCRYPT
 	select BR2_PACKAGE_ZLIB
 	help
 	  Support for the SSH 2 protocol via libssh2.
 
+	  Note: only the OpenSSL and Libgcrypt backends of libssh2 are
+	  supported.
+
 	  https://metacpan.org/release/Net-SSH2
 
 comment "perl-net-ssh2 needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+
+comment "perl-net-ssh2 needs libssh2 with OpenSSL or Libgcrypt backend"
+	depends on !(BR2_PACKAGE_LIBSSH2_OPENSSL || BR2_PACKAGE_LIBSSH2_LIBGCRYPT)
diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index 77d39edef5..ebd5803826 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -15,4 +15,8 @@ PERL_NET_SSH2_CONF_OPTS += \
 	lib="$(STAGING_DIR)/usr/lib" \
 	inc="$(STAGING_DIR)/usr/include"
 
+ifeq ($(BR2_PACKAGE_LIBSSH2_LIBGCRYPT),y)
+PERL_NET_SSH2_CONF_OPTS += gcrypt
+endif
+
 $(eval $(perl-package))
