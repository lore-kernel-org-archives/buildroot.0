From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 13:16:36 +0200
Subject: [Buildroot] [git commit] iptables: add upstream patch to fix AR
	substitution
Message-ID: <20160705111713.26C218043E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcfe05a7e9ce49bcc447fd956f52da0032f534e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This ensures the correct AR is used for some of the iptables build
process. This is the same fix as
<https://bugs.gentoo.org/show_bug.cgi?id=444282>

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
[Thomas: use upstream patch instead of passing AR in the environment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-extensions-added-AR-substitution.patch    | 33 ++++++++++++++++++++++
 package/iptables/iptables.mk                       |  1 +
 2 files changed, 34 insertions(+)

diff --git a/package/iptables/0003-extensions-added-AR-substitution.patch b/package/iptables/0003-extensions-added-AR-substitution.patch
new file mode 100644
index 0000000..b522ba7
--- /dev/null
+++ b/package/iptables/0003-extensions-added-AR-substitution.patch
@@ -0,0 +1,33 @@
+From eca9b91b832dfc27d0e1a6d08e2ce4878f229373 Mon Sep 17 00:00:00 2001
+From: Jordan Yelloz <jordan@yelloz.me>
+Date: Fri, 24 Jun 2016 12:18:45 -0700
+Subject: [PATCH] extensions: added AR substitution
+
+This is to ensure that the correct AR is run in cross-compile jobs.
+Often a cross-compile build will succeed without this change but it
+fails on my Gentoo Linux system when I have binutils installed with the
+"multitarget" USE flag.
+This change substitues AR with the autotools-supplied AR for the
+extensions subdirectory.
+
+Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+---
+ extensions/GNUmakefile.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/extensions/GNUmakefile.in b/extensions/GNUmakefile.in
+index 53be2cd..33b06ef 100644
+--- a/extensions/GNUmakefile.in
++++ b/extensions/GNUmakefile.in
+@@ -11,6 +11,7 @@ libdir       = @libdir@
+ libexecdir   = @libexecdir@
+ xtlibdir     = @xtlibdir@
+ 
++AR                 = @AR@
+ CC                 = @CC@
+ CCLD               = ${CC}
+ CFLAGS             = @CFLAGS@
+-- 
+2.7.4
+
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 12e00f2..a8ebec8 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -16,6 +16,7 @@ IPTABLES_LICENSE_FILES = COPYING
 IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
 	$(if $(BR2_STATIC_LIBS),,--disable-static)
 # For 0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch
+# and 0003-extensions-added-AR-substitution.patch
 IPTABLES_AUTORECONF = YES
 
 # For connlabel match
