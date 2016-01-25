From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Mon, 25 Jan 2016 16:48:51 +0200
Subject: [Buildroot] [PATCH v5 1/3] yp-tools: new package
In-Reply-To: <1453733333-18593-1-git-send-email-yba@tkos.co.il>
References: <1453733333-18593-1-git-send-email-yba@tkos.co.il>
Message-ID: <1453733333-18593-2-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds the yp-tools package that provides various NIS (yp) utilities.

Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
---
 package/Config.in                                  |  1 +
 ...0000-remove-Wcast-align-from-configure.ac.patch | 19 ++++++
 package/yp-tools/Config.in                         | 15 +++++
 package/yp-tools/mapv4v6addr.h                     | 69 ++++++++++++++++++++++
 package/yp-tools/yp-tools.hash                     |  2 +
 package/yp-tools/yp-tools.mk                       | 30 ++++++++++
 6 files changed, 136 insertions(+)
 create mode 100644 package/yp-tools/0000-remove-Wcast-align-from-configure.ac.patch
 create mode 100644 package/yp-tools/Config.in
 create mode 100644 package/yp-tools/mapv4v6addr.h
 create mode 100644 package/yp-tools/yp-tools.hash
 create mode 100644 package/yp-tools/yp-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 09c2b40..6d8caf7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1482,6 +1482,7 @@ endif
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
+	source "package/yp-tools/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/yp-tools/0000-remove-Wcast-align-from-configure.ac.patch b/package/yp-tools/0000-remove-Wcast-align-from-configure.ac.patch
new file mode 100644
index 0000000..f73728d
--- /dev/null
+++ b/package/yp-tools/0000-remove-Wcast-align-from-configure.ac.patch
@@ -0,0 +1,19 @@
+Remove "-Wcast-align" from the compiler warnings for compilation on arm arch.
+A patch to fix the cast-align warning was submitted to the package maintainer
+on December 16, 2015 and applied on January 20, 2016 in https://github.com/\
+thkukuk/yp-tools/commit/ea66fde92c228bf7b13612b07e4cf1b0667e8481.
+
+Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
+
+--- a/configure.ac	2015-04-16 13:08:34.000000000 +0300
++++ b/configure.ac	2015-12-23 18:38:55.358622278 +0200
+@@ -56,7 +56,7 @@
+ AM_PROG_CC_C_O
+ dnl If we're using gcc, we want warning flags
+ dnl test -n "$GCC" && WARNFLAGS="-Wall"
+-test -n "$GCC" && WARNFLAGS="-W -Wall -Wbad-function-cast -Wcast-align -Winline -Wnested-externs -Wshadow -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Werror"
++test -n "$GCC" && WARNFLAGS="-W -Wall -Wbad-function-cast -Winline -Wnested-externs -Wshadow -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Werror"
+ AC_SUBST(WARNFLAGS)
+ AC_PROG_CPP
+ AC_ISC_POSIX
+
diff --git a/package/yp-tools/Config.in b/package/yp-tools/Config.in
new file mode 100644
index 0000000..846bb1e
--- /dev/null
+++ b/package/yp-tools/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_YP_TOOLS
+	bool "yp-tools"
+	depends on BR2_TOOLCHAIN_USES_GLIBC # rpcsvc/nis.h
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_RPCBIND # runtime
+	help
+	  The yp-tools package contains the programs domainname,
+	  nisdomainname, ypcat, ypchfn, ypchsh, ypdomainname, ypmatch,
+	  yppoll, ypset, ypwhich and yppasswd. yp-tools 3.x is a port of
+	  yp-tools 2.x to support IPv6.
+
+	  http://www.linux-nis.org/nis/yp-tools/
+
+comment "yp-tools needs an (e)glibc toolchain with rpcsvc/nis.h"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/yp-tools/mapv4v6addr.h b/package/yp-tools/mapv4v6addr.h
new file mode 100644
index 0000000..7f85f7d
--- /dev/null
+++ b/package/yp-tools/mapv4v6addr.h
@@ -0,0 +1,69 @@
+/*
+ * ++Copyright++ 1985, 1988, 1993
+ * -
+ * Copyright (c) 1985, 1988, 1993
+ *    The Regents of the University of California.  All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 4. Neither the name of the University nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
+ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
+ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ * -
+ * Portions Copyright (c) 1993 by Digital Equipment Corporation.
+ *
+ * Permission to use, copy, modify, and distribute this software for any
+ * purpose with or without fee is hereby granted, provided that the above
+ * copyright notice and this permission notice appear in all copies, and that
+ * the name of Digital Equipment Corporation not be used in advertising or
+ * publicity pertaining to distribution of the document or software without
+ * specific, written prior permission.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS" AND DIGITAL EQUIPMENT CORP. DISCLAIMS ALL
+ * WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES
+ * OF MERCHANTABILITY AND FITNESS.   IN NO EVENT SHALL DIGITAL EQUIPMENT
+ * CORPORATION BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
+ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
+ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
+ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
+ * SOFTWARE.
+ * -
+ * --Copyright--
+ */
+
+#include <string.h>
+#include <arpa/nameser.h>
+
+static void
+map_v4v6_address (const char *src, char *dst)
+{
+  u_char *p = (u_char *) dst;
+  int i;
+
+  /* Move the IPv4 part to the right position.  */
+  memcpy (dst + 12, src, INADDRSZ);
+
+  /* Mark this ipv6 addr as a mapped ipv4. */
+  for (i = 0; i < 10; i++)
+    *p++ = 0x00;
+  *p++ = 0xff;
+  *p = 0xff;
+}
diff --git a/package/yp-tools/yp-tools.hash b/package/yp-tools/yp-tools.hash
new file mode 100644
index 0000000..9e8b532
--- /dev/null
+++ b/package/yp-tools/yp-tools.hash
@@ -0,0 +1,2 @@
+# Computed locally
+sha256 2dfa7ddfb797f2a5b4b7baaef7d6ee6fda41fe7066695fc7e3db998a32c1c698  yp-tools-yp-tools-3_5.tar.gz
diff --git a/package/yp-tools/yp-tools.mk b/package/yp-tools/yp-tools.mk
new file mode 100644
index 0000000..b47f797
--- /dev/null
+++ b/package/yp-tools/yp-tools.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# yp-tools
+#
+################################################################################
+
+# The github release tags are one to two releases ahead of the "Download"
+# links on http://www.linux-nis.org/nis/yp-tools/
+YP_TOOLS_VERSION = yp-tools-3_5
+YP_TOOLS_SITE = $(call github,thkukuk,yp-tools,$(YP_TOOLS_VERSION))
+YP_TOOLS_LICENSE = GPLv2
+YP_TOOLS_LICENSE_FILES = COPYING
+YP_TOOLS_AUTORECONF = YES
+YP_TOOLS_DEPENDENCIES = host-pkgconf
+YP_TOOLS_PRE_CONFIGURE_HOOKS += YP_TOOLS_LOCAL_MAPV4V6ADDR_H
+
+# If mapv4v6addr.h is not otherwise available we provide it here. It provides a
+# single function, map_v4v6_address is needed by a single yp-tools file,
+# nis-hosts.c. This mapv4v6addr.h code has BSD style licensing, whereas yp-tools
+# has GPLv2 licensing. In order not to confuse the licensing we maintain
+# mapv4v6addr.h as a separate file rather than patching the entire file with
+# it's copyright and license notice into nis-hosts.c, which is licensed under
+# GPLv2.
+
+define YP_TOOLS_LOCAL_MAPV4V6ADDR_H
+	$(INSTALL) -D -m 0644 $(YP_TOOLS_PKGDIR)/mapv4v6addr.h \
+		$(STAGING_DIR)/usr/include/resolv/mapv4v6addr.h
+endef
+
+$(eval $(autotools-package))
-- 
2.1.4
