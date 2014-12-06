From: Alexander Clouter <alex+buildroot@digriz.org.uk>
Date: Sat, 6 Dec 2014 23:21:53 +0000
Subject: [Buildroot] [PATCH] Support making nftables interactive console
 optional
Message-ID: <E1XxOqO-0002FW-5i@marmot.wormnet.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This lets you (by default enabled) compile out its readline dependency.

Signed-off-by: Alexander Clouter <alex+buildroot@digriz.org.uk>
---
 package/nftables/Config.in                         |   12 ++-
 .../nftables/nftables-001-make-cli-optional.patch  |   87 ++++++++++++++++++++
 package/nftables/nftables.mk                       |   11 ++-
 3 files changed, 107 insertions(+), 3 deletions(-)
 create mode 100644 package/nftables/nftables-001-make-cli-optional.patch

diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 4ddfdbd..09a4c07 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_NFTABLES
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNFTNL
-	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  nftables is the project that aims to replace the existing
@@ -19,6 +18,17 @@ config BR2_PACKAGE_NFTABLES
 
 	  http://www.netfilter.org/projects/nftables/index.html
 
+if BR2_PACKAGE_NFTABLES
+
+config BR2_PACKAGE_NFTABLES_INTERACTIVE
+	bool "include the interactive cli"
+	select BR2_PACKAGE_READLINE
+	help
+	  This requires readline (and thus ncurses) which might may eat into
+	  your available storage space.
+
+endif
+
 comment "nftables needs a toolchain w/ IPv6, largefile, threads, wchar, headers >= 3.4"
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
diff --git a/package/nftables/nftables-001-make-cli-optional.patch b/package/nftables/nftables-001-make-cli-optional.patch
new file mode 100644
index 0000000..bb9001a
--- /dev/null
+++ b/package/nftables/nftables-001-make-cli-optional.patch
@@ -0,0 +1,87 @@
+This makes nftables a bit more embedded-friendly.
+
+Signed-off-by: Steven Barth <cyrus@openwrt.org>
+---
+ configure.ac       | 9 +++++++--
+ include/nftables.h | 7 +++++++
+ src/Makefile.in    | 2 ++
+ src/main.c         | 6 +++++-
+ 4 files changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3a7647f..a2dd415 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -71,8 +71,13 @@ AC_CHECK_LIB([nftnl], [nft_rule_alloc], ,
+ AC_CHECK_LIB([gmp], [__gmpz_init], ,
+ 	     AC_MSG_ERROR([No suitable version of libgmp found]))
+ 
+-AC_CHECK_LIB([readline], [readline], ,
+-	     AC_MSG_ERROR([No suitable version of libreadline found]))
++AC_ARG_WITH([cli], [AS_HELP_STRING([--without-cli],
++            [disable interactive CLI (libreadline support)])],
++            [], [with_cli=yes])
++AS_IF([test "x$with_cli" != xno], [
++AC_CHECK_LIB([readline],[readline], , AC_MSG_ERROR([No suitable version of libreadline found]))
++])
++AC_SUBST(with_cli)
+ 
+ # Checks for header files.
+ AC_HEADER_STDC
+diff --git a/include/nftables.h b/include/nftables.h
+index 3394e32..c3d3dbf 100644
+--- a/include/nftables.h
++++ b/include/nftables.h
+@@ -31,7 +31,14 @@ extern unsigned int debug_level;
+ extern const char *include_paths[INCLUDE_PATHS_MAX];
+ 
+ struct parser_state;
++#ifdef HAVE_LIBREADLINE
+ extern int cli_init(struct parser_state *state);
++#else
++static inline int cli_init(struct parser_state *state)
++{
++	return -1;
++}
++#endif
+ extern void cli_exit(void);
+ extern void cli_display(const char *fmt, va_list ap) __fmtstring(1, 0);
+ 
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 8ac2b46..7ecc5f2 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -3,7 +3,9 @@ PROGRAMS		+= nft
+ nft-destdir		:= @sbindir@
+ 
+ nft-obj			+= main.o
++ifeq (@with_cli@,yes)
+ nft-obj			+= cli.o
++endif
+ nft-obj			+= rule.o
+ nft-obj			+= statement.o
+ nft-obj			+= datatype.o
+diff --git a/src/main.c b/src/main.c
+index 2685b0d..ee684ce 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -335,7 +335,11 @@ int main(int argc, char * const *argv)
+ 		if (scanner_read_file(scanner, filename, &internal_location) < 0)
+ 			goto out;
+ 	} else if (interactive) {
+-		cli_init(&state);
++		if (cli_init(&state) < 0) {
++			fprintf(stderr, "%s: interactive CLI not supported in this build\n",
++			argv[0]);
++			exit(NFT_EXIT_FAILURE);
++		}
+ 		return 0;
+ 	} else {
+ 		fprintf(stderr, "%s: no command specified\n", argv[0]);
+-- 
+2.1.1
+
+--
+To unsubscribe from this list: send the line "unsubscribe netfilter-devel" in
+the body of a message to majordomo at vger.kernel.org
+More majordomo info at  http://vger.kernel.org/majordomo-info.html
\ No newline@end of file
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 16d7c6f..da47182 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -7,12 +7,19 @@
 NFTABLES_VERSION = 0.3
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
-NFTABLES_DEPENDENCIES = gmp libmnl libnftnl readline host-bison host-flex \
+NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
 	host-pkgconf $(if $(BR2_NEEDS_GETTEXT),gettext)
+NFTABLES_AUTORECONF = YES
 NFTABLES_LICENSE = GPLv2
 NFTABLES_LICENSE_FILES = COPYING
 
-NFTABLES_LIBS = -lncurses
+ifeq ($(BR2_PACKAGE_NFTABLES_INTERACTIVE),y)
+NFTABLES_DEPENDENCIES += readline
+NFTABLES_LIBS += -lncurses
+else
+NFTABLES_CONF_OPTS = --without-cli
+endif
+
 ifeq ($(BR2_PREFER_STATIC_LIB)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
 NFTABLES_LIBS += -ljansson -lm
 endif
-- 
1.7.10.4
