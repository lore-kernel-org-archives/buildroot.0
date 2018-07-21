From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Jul 2018 22:54:27 +0200
Subject: [Buildroot] [git commit] package/erlang: needs threads
Message-ID: <20180721204932.9F35889139@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4d26992560875930866a627cc936da2f938401b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the removal of the non-smp option threads are needed now:
https://github.com/erlang/otp/commit/ee297c32a768ec333e2a8a3ef829a7690e91d306#diff-900a5d0495caac38a1f51a2cae1b2594R974

Fixes
http://autobuild.buildroot.net/results/285/285ef07d8e0614dd90a1e4dd3ee28b116990dc0f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang/Config.in | 5 +++--
 package/erlang/erlang.mk | 7 +------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index bf745555e8..75ba17086a 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -12,15 +12,16 @@ config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	# erlang needs host-erlang
 	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 
-comment "erlang needs a toolchain w/ dynamic library"
+comment "erlang needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	help
 	  Erlang is a programming language used to build massively
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 786641e4bd..2ac903ffea 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -43,10 +43,6 @@ HOST_ERLANG_CONF_OPTS = --without-javac --with-ssl=$(HOST_DIR)
 
 HOST_ERLANG_CONF_OPTS += --without-termcap
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-ERLANG_CONF_OPTS += --disable-threads
-endif
-
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 ERLANG_CONF_OPTS += --with-termcap
 ERLANG_DEPENDENCIES += ncurses
@@ -61,8 +57,7 @@ else
 ERLANG_CONF_OPTS += --without-ssl
 endif
 
-# ODBC support in erlang requires threads
-ifeq ($(BR2_PACKAGE_UNIXODBC)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
 ERLANG_DEPENDENCIES += unixodbc
 ERLANG_CONF_OPTS += --with-odbc
 else
