From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:12:05 +0200
Subject: [Buildroot] [git commit] erlang: Remove BR2_TOOLCHAIN_HAS_THREADS
	dependency
Message-ID: <20151021201210.49B7681D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbcecc2453ec7f94d82f32a1acd33a09e576ecee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Erlang can be built without threads support, by passing an
appropriate config option.

This commit drops the config dependency on BR2_TOOLCHAIN_HAS_THREADS
and instead passes --disable-threads if the toolchain doesn't support
threads.

While here, change the wording of the config comment to "dynamic
library" to be consistent with similar comments elsewhere.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/Config.in |    5 ++---
 package/erlang/erlang.mk |    4 ++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 625b7c1..0ec01bb 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,12 +1,11 @@
-comment "erlang needs a toolchain w/ threads, shared library"
+comment "erlang needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBATOMIC_OPS
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 499f62c..848d1dd 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -40,6 +40,10 @@ HOST_ERLANG_CONF_OPTS = --without-javac --with-ssl=$(HOST_DIR)/usr
 
 HOST_ERLANG_CONF_OPTS += --without-termcap
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+ERLANG_CONF_OPTS += --disable-threads
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 ERLANG_CONF_OPTS += --with-termcap
 ERLANG_DEPENDENCIES += ncurses
