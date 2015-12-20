From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 20 Dec 2015 17:05:27 -0300
Subject: [Buildroot] [PATCH] iptables: bump to version 1.6.0
Message-ID: <1450641927-24986-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add option for nftables compat utilies and for bpf compiler/nfsynproxy
configuration tool.

Drop symlink trickery since it's not required any more.

Switch homepage to proper one and drop the kernel v2.4+ note since
that's not supported by buildroot anyway.

Drop most patches (except musl build) since they're upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...h-musl.patch => 0001-fix-build-with-musl.patch} |  0
 package/iptables/0001-fix-static-link.patch        | 68 ----------------
 ...ip-6-tables-save.c-remove-dlfcn.h-include.patch | 47 -----------
 .../iptables/0003-consistently-use-errno.h.patch   | 92 ----------------------
 .../0004-include-remove-libc5-support-code.patch   | 51 ------------
 .../iptables/0006-fix-connlabel-conf-warning.patch | 72 -----------------
 package/iptables/Config.in                         | 29 ++++++-
 package/iptables/iptables.hash                     |  6 +-
 package/iptables/iptables.mk                       | 32 ++++----
 9 files changed, 45 insertions(+), 352 deletions(-)
 rename package/iptables/{0005-fix-build-with-musl.patch => 0001-fix-build-with-musl.patch} (100%)
 delete mode 100644 package/iptables/0001-fix-static-link.patch
 delete mode 100644 package/iptables/0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
 delete mode 100644 package/iptables/0003-consistently-use-errno.h.patch
 delete mode 100644 package/iptables/0004-include-remove-libc5-support-code.patch
 delete mode 100644 package/iptables/0006-fix-connlabel-conf-warning.patch

diff --git a/package/iptables/0005-fix-build-with-musl.patch b/package/iptables/0001-fix-build-with-musl.patch
similarity index 100%
rename from package/iptables/0005-fix-build-with-musl.patch
rename to package/iptables/0001-fix-build-with-musl.patch
diff --git a/package/iptables/0001-fix-static-link.patch b/package/iptables/0001-fix-static-link.patch
deleted file mode 100644
index ce2ea48..0000000
--- a/package/iptables/0001-fix-static-link.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 76e230e41947576efb96e86e605bb84015cdb287 Mon Sep 17 00:00:00 2001
-From: Jan Engelhardt <jengelh@inai.de>
-Date: Tue, 13 Aug 2013 19:02:06 +0000
-Subject: iptables: link against libnetfilter_conntrack
-
-Linking currently fails in --enable-static case:
-
-../extensions/libext.a(libxt_connlabel.o): In function `connlabel_get_name':
-iptables/extensions/libxt_connlabel.c:57: undefined reference to `nfct_labelmap_get_name'
-[..]
-It's libxtables.la(libxt_connlabel.o) using libnetfilter_conntrack.
-
-If libnetfilter_conntrack is not found, @libnetfilter_conntrack_CFLAGS@
-and @libnetfilter_conntrack_LIBS@ (and their ${} ones) should be empty,
-therefore producing no harm to include unconditionally.
-
-[Gustavo: update for iptables 1.4.21]
-Reported-and-tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Florian Westphal <fw@strlen.de>
----
-diff --git a/extensions/GNUmakefile.in b/extensions/GNUmakefile.in
-index 14e7c57..780e715 100644
---- a/extensions/GNUmakefile.in
-+++ b/extensions/GNUmakefile.in
-@@ -21,7 +21,7 @@ regular_CPPFLAGS   = @regular_CPPFLAGS@
- kinclude_CPPFLAGS  = @kinclude_CPPFLAGS@
- 
- AM_CFLAGS       = ${regular_CFLAGS}
--AM_CPPFLAGS     = ${regular_CPPFLAGS} -I${top_builddir}/include -I${top_builddir} -I${top_srcdir}/include ${kinclude_CPPFLAGS} ${CPPFLAGS}
-+AM_CPPFLAGS     = ${regular_CPPFLAGS} -I${top_builddir}/include -I${top_builddir} -I${top_srcdir}/include ${kinclude_CPPFLAGS} ${CPPFLAGS} @libnetfilter_conntrack_CFLAGS@
- AM_DEPFLAGS     = -Wp,-MMD,$(@D)/.$(@F).d,-MT,$@
- AM_LDFLAGS      = @noundef_LDFLAGS@
- 
-@@ -93,7 +93,7 @@ lib%.so: lib%.oo
- 	${AM_VERBOSE_CCLD} ${CCLD} ${AM_LDFLAGS} -shared ${LDFLAGS} -o $@ $< -L../libxtables/.libs -lxtables ${$*_LIBADD};
- 
- lib%.oo: ${srcdir}/lib%.c
--	${AM_VERBOSE_CC} ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init -DPIC -fPIC ${CFLAGS} ${$*_CFLAGADD} -o $@ -c $<;
-+	${AM_VERBOSE_CC} ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init -DPIC -fPIC ${CFLAGS} -o $@ -c $<;
- 
- libxt_NOTRACK.so: libxt_CT.so
- 	ln -fs $< $@
-@@ -103,9 +103,7 @@ libxt_state.so: libxt_conntrack.so
- # Need the LIBADDs in iptables/Makefile.am too for libxtables_la_LIBADD
- xt_RATEEST_LIBADD   = -lm
- xt_statistic_LIBADD = -lm
-- at HAVE_LIBNETFILTER_CONNTRACK_TRUE@xt_connlabel_LIBADD = @libnetfilter_conntrack_LIBS@
--
-- at HAVE_LIBNETFILTER_CONNTRACK_TRUE@xt_connlabel_CFLAGADD = @libnetfilter_conntrack_CFLAGS@
-+xt_connlabel_LIBADD = @libnetfilter_conntrack_LIBS@
- 
- #
- #	Static bits
-diff --git a/libxtables/Makefile.am b/libxtables/Makefile.am
-index c5795fe..4267cb5 100644
---- a/libxtables/Makefile.am
-+++ b/libxtables/Makefile.am
-@@ -10,7 +10,7 @@ libxtables_la_LIBADD  =
- if ENABLE_STATIC
- # With --enable-static, shipped extensions are linked into the main executable,
- # so we need all the LIBADDs here too
--libxtables_la_LIBADD += -lm
-+libxtables_la_LIBADD += -lm ${libnetfilter_conntrack_LIBS}
- endif
- if ENABLE_SHARED
- libxtables_la_CFLAGS  = ${AM_CFLAGS}
---
-cgit v0.9.2
diff --git a/package/iptables/0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch b/package/iptables/0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
deleted file mode 100644
index 1cdc6c0..0000000
--- a/package/iptables/0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 2efdcf332a40431c6584970bb0c68712d14d409b Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 27 Nov 2013 10:18:11 -0300
-Subject: [PATCH] iptables/ip(6)tables-save.c: remove dlfcn.h include
-
-It's not required and breaks on static-only uClibc builds which don't
-have the header file.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- iptables/ip6tables-save.c | 4 ----
- iptables/iptables-save.c  | 4 ----
- 2 files changed, 8 deletions(-)
-
-diff --git a/iptables/ip6tables-save.c b/iptables/ip6tables-save.c
-index d819b30..a86a64a 100644
---- a/iptables/ip6tables-save.c
-+++ b/iptables/ip6tables-save.c
-@@ -18,10 +18,6 @@
- #include "ip6tables.h"
- #include "ip6tables-multi.h"
- 
--#ifndef NO_SHARED_LIBS
--#include <dlfcn.h>
--#endif
--
- static int show_counters = 0;
- 
- static const struct option options[] = {
-diff --git a/iptables/iptables-save.c b/iptables/iptables-save.c
-index e599fce..2999c7f 100644
---- a/iptables/iptables-save.c
-+++ b/iptables/iptables-save.c
-@@ -17,10 +17,6 @@
- #include "iptables.h"
- #include "iptables-multi.h"
- 
--#ifndef NO_SHARED_LIBS
--#include <dlfcn.h>
--#endif
--
- static int show_counters = 0;
- 
- static const struct option options[] = {
--- 
-1.8.3.2
-
diff --git a/package/iptables/0003-consistently-use-errno.h.patch b/package/iptables/0003-consistently-use-errno.h.patch
deleted file mode 100644
index 0ec1e5a..0000000
--- a/package/iptables/0003-consistently-use-errno.h.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From a9214a0b718812d823a933ad580a96a3bf5f4dc6 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 2 May 2015 21:51:01 +0200
-Subject: [PATCH 1/3] consistently use <errno.h>
-
-On glibc, <sys/errno.h> is a synomym for <errno.h>.
-<errno.h> is specified by POSIX, so use that.
-
-Fixes compilation error with musl libc
-
-Backported from :
-http://git.netfilter.org/iptables/commit/?id=043e52bc42021f71b85229f6d78bf7e75b282765
-
-Upstream-Status: backport
-Signed-off-by: Florian Westphal <fw@strlen.de>
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
----
- iptables/ip6tables-restore.c | 2 +-
- iptables/ip6tables-save.c    | 2 +-
- iptables/iptables-restore.c  | 2 +-
- iptables/iptables-save.c     | 2 +-
- iptables/iptables-xml.c      | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/iptables/ip6tables-restore.c b/iptables/ip6tables-restore.c
-index b8b9e0d..0927e6d 100644
---- a/iptables/ip6tables-restore.c
-+++ b/iptables/ip6tables-restore.c
-@@ -9,7 +9,7 @@
-  */
- 
- #include <getopt.h>
--#include <sys/errno.h>
-+#include <errno.h>
- #include <stdbool.h>
- #include <string.h>
- #include <stdio.h>
-diff --git a/iptables/ip6tables-save.c b/iptables/ip6tables-save.c
-index d819b30..f0349d3 100644
---- a/iptables/ip6tables-save.c
-+++ b/iptables/ip6tables-save.c
-@@ -6,7 +6,7 @@
-  * This code is distributed under the terms of GNU GPL v2
-  */
- #include <getopt.h>
--#include <sys/errno.h>
-+#include <errno.h>
- #include <stdio.h>
- #include <fcntl.h>
- #include <stdlib.h>
-diff --git a/iptables/iptables-restore.c b/iptables/iptables-restore.c
-index 8c942ff..d00b9e7 100644
---- a/iptables/iptables-restore.c
-+++ b/iptables/iptables-restore.c
-@@ -6,7 +6,7 @@
-  */
- 
- #include <getopt.h>
--#include <sys/errno.h>
-+#include <errno.h>
- #include <stdbool.h>
- #include <string.h>
- #include <stdio.h>
-diff --git a/iptables/iptables-save.c b/iptables/iptables-save.c
-index e599fce..3fbdb77 100644
---- a/iptables/iptables-save.c
-+++ b/iptables/iptables-save.c
-@@ -6,7 +6,7 @@
-  *
-  */
- #include <getopt.h>
--#include <sys/errno.h>
-+#include <errno.h>
- #include <stdio.h>
- #include <fcntl.h>
- #include <stdlib.h>
-diff --git a/iptables/iptables-xml.c b/iptables/iptables-xml.c
-index 9628447..695cd67 100644
---- a/iptables/iptables-xml.c
-+++ b/iptables/iptables-xml.c
-@@ -7,7 +7,7 @@
-  */
- 
- #include <getopt.h>
--#include <sys/errno.h>
-+#include <errno.h>
- #include <string.h>
- #include <stdio.h>
- #include <stdlib.h>
--- 
-2.4.3
-
diff --git a/package/iptables/0004-include-remove-libc5-support-code.patch b/package/iptables/0004-include-remove-libc5-support-code.patch
deleted file mode 100644
index 8137ece..0000000
--- a/package/iptables/0004-include-remove-libc5-support-code.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 401673e9d37ea1e6da0bc335b1d7a2bbf445c690 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 2 May 2015 21:51:38 +0200
-Subject: [PATCH 2/3] include: remove libc5 support code
-
-Current code makes the assumption that !defined(__GLIBC__) means libc5
-which is very unlikely the case nowadays.
-
-Fixes compile error because of conflict between kernel and musl headers.
-
-Backported from :
-http://git.netfilter.org/iptables/commit/?id=0bb1859e2d6dd79a0a59c3ee65f6a78cba118b86
-
-Upstream-Status: backport
-Signed-off-by: Florian Westphal <fw@strlen.de>
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
----
- include/libiptc/ipt_kernel_headers.h | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/include/libiptc/ipt_kernel_headers.h b/include/libiptc/ipt_kernel_headers.h
-index 18861fe..a5963e9 100644
---- a/include/libiptc/ipt_kernel_headers.h
-+++ b/include/libiptc/ipt_kernel_headers.h
-@@ -5,7 +5,6 @@
- 
- #include <limits.h>
- 
--#if defined(__GLIBC__) && __GLIBC__ == 2
- #include <netinet/ip.h>
- #include <netinet/in.h>
- #include <netinet/ip_icmp.h>
-@@ -13,15 +12,4 @@
- #include <netinet/udp.h>
- #include <net/if.h>
- #include <sys/types.h>
--#else /* libc5 */
--#include <sys/socket.h>
--#include <linux/ip.h>
--#include <linux/in.h>
--#include <linux/if.h>
--#include <linux/icmp.h>
--#include <linux/tcp.h>
--#include <linux/udp.h>
--#include <linux/types.h>
--#include <linux/in6.h>
--#endif
- #endif
--- 
-2.4.3
-
diff --git a/package/iptables/0006-fix-connlabel-conf-warning.patch b/package/iptables/0006-fix-connlabel-conf-warning.patch
deleted file mode 100644
index 872dcb1..0000000
--- a/package/iptables/0006-fix-connlabel-conf-warning.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 825fbda5482a7d5ec5a6619c81fe07ff865c7d6e Mon Sep 17 00:00:00 2001
-From: Florian Westphal <fw@strlen.de>
-Date: Fri, 5 Sep 2014 20:45:56 +0200
-Subject: extensions: libxt_connlabel: do not open config file from _init hook
-
-else, static builds will print this for every iptables invocation,
-even 'iptables -L'.  Delay open until we need to translate a mapping.
-
-Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
-Signed-off-by: Florian Westphal <fw@strlen.de>
-[Thomas De Schampheleire: import unchanged into Buildroot]
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-
-diff --git a/extensions/libxt_connlabel.c b/extensions/libxt_connlabel.c
-index c84a167..1f83095 100644
---- a/extensions/libxt_connlabel.c
-+++ b/extensions/libxt_connlabel.c
-@@ -29,11 +29,26 @@ static const struct xt_option_entry connlabel_mt_opts[] = {
- 	XTOPT_TABLEEND,
- };
- 
-+/* cannot do this via _init, else static builds might spew error message
-+ * for every iptables invocation.
-+ */
-+static void connlabel_open(void)
-+{
-+	if (map)
-+		return;
-+
-+	map = nfct_labelmap_new(NULL);
-+	if (!map && errno)
-+		xtables_error(RESOURCE_PROBLEM, "cannot open connlabel.conf: %s\n",
-+			strerror(errno));
-+}
-+
- static void connlabel_mt_parse(struct xt_option_call *cb)
- {
- 	struct xt_connlabel_mtinfo *info = cb->data;
- 	int tmp;
- 
-+	connlabel_open();
- 	xtables_option_parse(cb);
- 
- 	switch (cb->entry->id) {
-@@ -54,7 +69,11 @@ static void connlabel_mt_parse(struct xt_option_call *cb)
- 
- static const char *connlabel_get_name(int b)
- {
--	const char *name = nfct_labelmap_get_name(map, b);
-+	const char *name;
-+
-+	connlabel_open();
-+
-+	name = nfct_labelmap_get_name(map, b);
- 	if (name && strcmp(name, ""))
- 		return name;
- 	return NULL;
-@@ -114,11 +133,5 @@ static struct xtables_match connlabel_mt_reg = {
- 
- void _init(void)
- {
--	map = nfct_labelmap_new(NULL);
--	if (!map) {
--		fprintf(stderr, "cannot open connlabel.conf, not registering '%s' match: %s\n",
--			connlabel_mt_reg.name, strerror(errno));
--		return;
--	}
- 	xtables_register_match(&connlabel_mt_reg);
- }
--- 
-cgit v0.10.1
-
diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index 8c4e989..ae7a634 100644
--- a/package/iptables/Config.in
+++ b/package/iptables/Config.in
@@ -1,6 +1,31 @@
 config BR2_PACKAGE_IPTABLES
 	bool "iptables"
 	help
-	  Linux kernel (2.4+) firewall, NAT, and packet mangling tools.
+	  Linux kernel firewall, NAT, and packet mangling tools.
 
-	  http://www.iptables.org/
+	  http://www.netfilter.org/projects/iptables/index.html
+
+if BR2_PACKAGE_IPTABLES
+
+config BR2_PACKAGE_IPTABLES_BPF_NFSYNPROXY
+	bool "bpfc and nfsynproxy"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Build bpf compiler and nfsynproxy configuration tool.
+
+config BR2_PACKAGE_IPTABLES_NFTABLES
+	bool "nftables compat"
+	# uses dlfcn
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	select BR2_PACKAGE_LIBMNL
+	select BR2_PACKAGE_LIBNFTNL
+	help
+	  Build nftables compat utilities.
+
+comment "nftables compat needs a toolchain w/ wchar, dynamic library, headers >= 3.4"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || \
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS
+
+endif
diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index a813f74..18d8b44 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,3 +1,3 @@
-# From ftp://ftp.netfilter.org/pub/iptables/iptables-1.4.21.tar.bz2.{md5sum,sha1sum}
-md5	536d048c8e8eeebcd9757d0863ebb0c0 	iptables-1.4.21.tar.bz2
-sha1	85d4160537546a23a7e42bc26dd7ee62a0ede4c8	iptables-1.4.21.tar.bz2
+# From ftp://ftp.netfilter.org/pub/iptables/iptables-1.6.0.tar.bz2.{md5sum,sha1sum}
+md5	27ba3451cb622467fc9267a176f19a31 	iptables-1.6.0.tar.bz2
+sha1	21a694e75b0d6863cc001f85fb15915d12b8cc22	iptables-1.6.0.tar.bz2
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index e425ec6..da8d48b 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.4.21
+IPTABLES_VERSION = 1.6.0
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
@@ -15,8 +15,6 @@ IPTABLES_LICENSE_FILES = COPYING
 # Building static causes ugly warnings on some plugins
 IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
 	$(if $(BR2_STATIC_LIBS),,--disable-static)
-# Because of iptables-01-fix-static-link.patch
-IPTABLES_AUTORECONF = YES
 
 # For connlabel match
 ifeq ($(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),y)
@@ -28,20 +26,20 @@ ifeq ($(BR2_PACKAGE_LIBNFNETLINK),y)
 IPTABLES_DEPENDENCIES += libnfnetlink
 endif
 
-define IPTABLES_TARGET_SYMLINK_CREATE
-	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/iptables
-	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/iptables-save
-	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/iptables-restore
-endef
-
-define IPTABLES_TARGET_IPV6_SYMLINK_CREATE
-	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/ip6tables
-	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/ip6tables-save
-	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/ip6tables-restore
-endef
-
-IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_SYMLINK_CREATE
+# For iptables-compat tools
+ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES),y)
+IPTABLES_CONF_OPTS += --enable-nftables
+IPTABLES_DEPENDENCIES += host-bison host-flex libmnl libnftnl
+else
+IPTABLES_CONF_OPTS += --disable-nftables
+endif
 
-IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_IPV6_SYMLINK_CREATE
+# bpf compiler support and nfsynproxy tool
+ifeq ($(BR2_PACKAGE_IPTABLES_BPF_NFSYNPROXY),y)
+IPTABLES_CONF_OPTS += --enable-bpf-compiler --enable-nfsynproxy
+IPTABLES_DEPENDENCIES += libpcap
+else
+IPTABLES_CONF_OPTS += --disable-bpf-compiler --disable-nfsynproxy
+endif
 
 $(eval $(autotools-package))
-- 
2.4.10
