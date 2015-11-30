From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 17:20:19 +0100
Subject: [Buildroot] [git commit] conntrack-tools: work around build issue
	with musl
Message-ID: <20151130164029.0F41080096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c17c29b9f87e0536db799f9fd5c94b85c1a32892
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building conntrack-tools with kernel headers >= 4.2 + musl fails due to
a well-known symbol clash that occurs when userspace and kernel headers
are included simultaneously (see [1], question 7, for details).

In the case of conntrack-tools, the inclusion of both 'netinet/in.h' and
'linux/in.h' occurs inside the C helper files (src/helpers/*.c)
indirectly via e.g. 'libnetfilter_conntrack/libnetfilter_conntrack.h',
which itself includes 'netinet/in.h', and 'linux/netfilter.h', which
includes 'linux/in.h' in kernel headers >= 4.2.

The approach to solving this type of conflict with musl usually involves
removing the inclusion of kernel headers or refactoring the code so as
to avoid the mentioned simultaneous inclusion. This is unfortunately
non-trivial in the case of conntrack-tools since the clashing headers
get included indirectly by headers that are strictly necessary (because
of definitions used in some helper callbacks).

Work around the issue by defining __GLIBC__ when musl is used. This
eliminates the conflicts as the kernel headers avoid redefining certain
symbols when they see __GLIBC__ defined (linux/libc-compat.h). Note that
other glibc-compatible libraries, like uClibc, already do that
internally.

Fixes:
  http://autobuild.buildroot.net/results/66e/66ec247fa0fc385bef8d2084c65bf5cad3a8e8ca/
  http://autobuild.buildroot.net/results/624/624a0d48decd819eb58cbb3c58ee904b87ebfb21/

[1] http://wiki.musl-libc.org/wiki/FAQ

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/conntrack-tools/conntrack-tools.mk |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index eac5841..7287587 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -13,10 +13,22 @@ CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
 CONNTRACK_TOOLS_LICENSE = GPLv2+
 CONNTRACK_TOOLS_LICENSE_FILES = COPYING
 
+CONNTRACK_TOOLS_CFLAGS = $(TARGET_CFLAGS)
+
+# Some of conntrack-tools source files include both linux/in.h (via
+# linux/netfilter.h for kernel headers >= 4.2) and netinet/in.h, which
+# causes some symbol conflicts when musl is used. Defining __GLIBC__
+# works around that issue since the kernel headers are prepared to
+# avoid redefinition of certain symbols when they see __GLIBC__.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+CONNTRACK_TOOLS_CFLAGS += -D__GLIBC__
+endif
+
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-CONNTRACK_TOOLS_CONF_ENV += \
-	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
+CONNTRACK_TOOLS_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 CONNTRACK_TOOLS_DEPENDENCIES += libtirpc host-pkgconf
 endif
 
+CONNTRACK_TOOLS_CONF_ENV = CFLAGS="$(CONNTRACK_TOOLS_CFLAGS)"
+
 $(eval $(autotools-package))
