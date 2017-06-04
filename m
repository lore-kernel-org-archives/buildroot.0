From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 14:40:36 +0200
Subject: [Buildroot] [git commit] package/ipsec-tools: allow autoreconf
Message-ID: <20170604170601.126ED8282E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd51f806517464185bb259e12231c7f28e71fd73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream release is broken w.r.t autoreconf, patch 0002 fixes it.
Needed to prepare for upcoming patch to fix linking against newer
flex versions.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipsec-tools/0002-configure-automake.patch | 21 +++++++++++++++++++++
 package/ipsec-tools/ipsec-tools.mk                |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/package/ipsec-tools/0002-configure-automake.patch b/package/ipsec-tools/0002-configure-automake.patch
new file mode 100644
index 0000000..a006516
--- /dev/null
+++ b/package/ipsec-tools/0002-configure-automake.patch
@@ -0,0 +1,21 @@
+Needed to fix broken autoreconf
+
+Downloaded from
+https://sources.debian.net/src/ipsec-tools/1:0.8.2%2B20140711-8/debian/patches/automake-options/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Index: pkg-ipsec-tools/configure.ac
+===================================================================
+--- pkg-ipsec-tools.orig/configure.ac	2014-06-28 17:25:22.000000000 +0200
++++ pkg-ipsec-tools/configure.ac	2014-06-28 17:28:13.818373322 +0200
+@@ -6,7 +6,8 @@ AC_INIT(ipsec-tools, 0.8.2)
+ AC_CONFIG_SRCDIR([configure.ac])
+ AC_CONFIG_HEADERS(config.h)
+ 
+-AM_INIT_AUTOMAKE(dist-bzip2)
++AC_CONFIG_MACRO_DIR([.])
++AM_INIT_AUTOMAKE([dist-bzip2 foreign serial-tests])
+ 
+ AC_ENABLE_SHARED(no)
+ 
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index eb910bc..c0b180d 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -10,6 +10,8 @@ IPSEC_TOOLS_SITE = http://sourceforge.net/projects/ipsec-tools/files/ipsec-tools
 IPSEC_TOOLS_INSTALL_STAGING = YES
 IPSEC_TOOLS_MAKE = $(MAKE1)
 IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
+# we patch configure.ac
+IPSEC_TOOLS_AUTORECONF = YES
 
 # configure hardcodes -Werror, so override CFLAGS on make invocation
 IPSEC_TOOLS_MAKE_OPTS = CFLAGS='$(TARGET_CFLAGS)'
