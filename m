From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 21:43:49 +0200
Subject: [Buildroot] [git commit] nftables: new package
Message-ID: <20140417194447.48B069C0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d01461f3365aff8bffae9ee537716b86394bfcf3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/nftables/Config.in   |   25 +++++++++++++++++++++++++
 package/nftables/nftables.mk |   15 +++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 51f2515..748d28e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -959,6 +959,7 @@ source "package/net-tools/Config.in"
 endif
 source "package/network-manager/Config.in"
 source "package/nfacct/Config.in"
+source "package/nftables/Config.in"
 source "package/ngircd/Config.in"
 source "package/ngrep/Config.in"
 source "package/nmap/Config.in"
diff --git a/package/nftables/Config.in b/package/nftables/Config.in
new file mode 100644
index 0000000..4ddfdbd
--- /dev/null
+++ b/package/nftables/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_NFTABLES
+	bool "nftables"
+	depends on BR2_INET_IPV6
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_LIBMNL
+	select BR2_PACKAGE_LIBNFTNL
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	help
+	  nftables is the project that aims to replace the existing
+	  {ip,ip6,arp,eb}tables framework.
+	  Basically, this project provides a new packet filtering framework,
+	  a new userspace utility and also a compatibility layer
+	  for {ip,ip6}tables.
+
+	  http://www.netfilter.org/projects/nftables/index.html
+
+comment "nftables needs a toolchain w/ IPv6, largefile, threads, wchar, headers >= 3.4"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
new file mode 100644
index 0000000..1cfeeeb
--- /dev/null
+++ b/package/nftables/nftables.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# nftables
+#
+################################################################################
+
+NFTABLES_VERSION = 0.2
+NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
+NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
+NFTABLES_DEPENDENCIES = gmp libmnl libnftnl readline host-bison host-flex \
+	host-pkgconf $(if $(BR2_NEEDS_GETTEXT),gettext)
+NFTABLES_LICENSE = GPLv2
+NFTABLES_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
