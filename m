From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 20 Jun 2021 22:56:07 +0200
Subject: [Buildroot] [RFC v1 2/2] package/nrlsmf: new package
In-Reply-To: <20210620205607.25904-1-ps.report@gmx.net>
References: <20210620205607.25904-1-ps.report@gmx.net>
Message-ID: <20210620205607.25904-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- use src-nrlsmf-with-protolib-1.1b2a.tgz download (instead of plain
  git one) with bundled protolib as nrlsmf does not compile with an
  up to date protolib version

- needs thread support (pthread.h)

- select BR2_PACKAGE_IPTABLES_LIBIPQ to gain access to
  header linux/netfilter_ipv4/ip_queue.h

- overwrite CFLAGS to re-add nrlsmf specific include paths and
  defines (taken from unix/Makefile.common and unix/Makefile.linux)

- add -fpmerissive to avoid build error

- overwrite SYSTEM_LIBS to avoid libpcap linking

- overwrite CC to link usign g++ (instead of gcc, fixes linking
  error because of missing C++ libs)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/nrlsmf/Config.in   | 15 ++++++++++++++
 package/nrlsmf/nrlsmf.hash |  3 +++
 package/nrlsmf/nrlsmf.mk   | 42 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 62 insertions(+)
 create mode 100644 package/nrlsmf/Config.in
 create mode 100644 package/nrlsmf/nrlsmf.hash
 create mode 100644 package/nrlsmf/nrlsmf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f6621e9670..2761d6ccfa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2148,6 +2148,7 @@ F:	package/iwd/
 F:	package/libevdev/
 F:	package/libuev/
 F:	package/log4cplus/
+F:	package/nrlsmf/
 F:	package/postgresql/
 F:	package/python-colorzero/
 F:	package/python-flask-wtf/
diff --git a/package/Config.in b/package/Config.in
index cb8ece4919..c340ae515f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2232,6 +2232,7 @@ endif
 	source "package/nload/Config.in"
 	source "package/nmap/Config.in"
 	source "package/noip/Config.in"
+	source "package/nrlsmf/Config.in"
 	source "package/ntp/Config.in"
 	source "package/nuttcp/Config.in"
 	source "package/odhcp6c/Config.in"
diff --git a/package/nrlsmf/Config.in b/package/nrlsmf/Config.in
new file mode 100644
index 0000000000..61feba2ef6
--- /dev/null
+++ b/package/nrlsmf/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_NRLSMF
+	bool "nrlsmf"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_IPTABLES
+	select BR2_PACKAGE_IPTABLES_LIBIPQ # header linux/netfilter_ipv4/ip_queue.h
+	help
+	  The NRL Simplified Multicast Forwarding (nrlsmf) project is a
+	  user-space software implementation of the forwarding engine
+	  for Simplified Multicast Forwarding (SMF, RFC 6621).
+
+	  https://www.nrl.navy.mil/Our-Work/Areas-of-Research/Information-Technology/NCS/SMF
+
+comment "nrlsmf needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/nrlsmf/nrlsmf.hash b/package/nrlsmf/nrlsmf.hash
new file mode 100644
index 0000000000..9d066c6f0c
--- /dev/null
+++ b/package/nrlsmf/nrlsmf.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d72f0ea8d12d19ee30cbbbf96bcfc9d5f57c4e2d11fe0e336a4e8005fef7c5b0  src-nrlsmf-with-protolib-1.1b2a.tgz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/nrlsmf/nrlsmf.mk b/package/nrlsmf/nrlsmf.mk
new file mode 100644
index 0000000000..554291c880
--- /dev/null
+++ b/package/nrlsmf/nrlsmf.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# nrlsmf
+#
+################################################################################
+
+NRLSMF_VERSION = 1.1b2a
+#NRLSMF_SITE = $(call github,USNavalResearchLaboratory,nrlsmf,v$(NRLSMF_VERSION))
+NRLSMF_SOURCE = src-nrlsmf-with-protolib-$(NRLSMF_VERSION).tgz
+NRLSMF_SITE = https://github.com/USNavalResearchLaboratory/nrlsmf/releases/download/v$(NRLSMF_VERSION)
+NRLSMF_LICENSE = BSD-2-Clause (protolib)
+NRLSMF_DEPENDENCIES = iptables
+
+NRLSMF_CFLAGS = \
+	-I$(@D)/unix \
+	-I$(@D)/common \
+	-I$(@D)/protolib/common \
+	-I$(@D)/protolib/manet \
+	-DMNE_SUPPORT \
+	-DUNIX \
+	-DLINUX \
+	-DHAVE_IPV6 \
+	-DHAVE_GETLOGIN \
+	-DHAVE_LOCKF \
+	-DHAVE_OLD_SIGNALHANDLER \
+	-DHAVE_DIRFD \
+	-DHAVE_ASSERT \
+	-DNO_SCM_RIGHTS \
+	-DHAVE_SCHED \
+	-fpermissive
+
+define NRLSMF_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/unix -f Makefile.linux \
+		CFLAGS="$(NRLSMF_TARGET_CFLAGS) $(NRLSMF_CFLAGS)" \
+		CC="$(TARGET_CXX)" SYSTEM_LIBS="-ldl" all
+endef
+
+define NRLSMF_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/unix/nrlsmf $(TARGET_DIR)/usr/bin/nrlsmf
+endef
+
+$(eval $(generic-package))
-- 
2.31.1
