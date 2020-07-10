From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 11 Jul 2020 01:41:47 +0200
Subject: [Buildroot] [PATCH 1/3] package/systemd: add option to enable SysV
 and utmp compatibility
Message-ID: <20200710234150.185609-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option BR2_PACKAGE_SYSTEMD_SYSV enables compatibility with SysV services-

BR2_PACKAGE_SYSTEMD_UTMP adds support for the utmp Database,
which is only used by tools like 'who' and 'last' nowadays AFAIK.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in  | 12 ++++++++++++
 package/systemd/systemd.mk | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index dd3b8c534d..5cc22b4b95 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -112,6 +112,18 @@ config BR2_PACKAGE_SYSTEMD_BOOT
 
 	  https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
 
+config BR2_PACKAGE_SYSTEMD_SYSV
+	bool "Enable compatibility for sysvinit services"
+	help
+	  Enable buildtime options for compatibility with sysv
+	  services, and install tools and services needed.
+
+config BR2_PACKAGE_SYSTEMD_UTMP
+	bool "Enable compatibility for utmp"
+	help
+	  Enable buildtime options for compatibility with
+	  services depending on utmp.
+
 config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
 	string
 	default "ia32"  if BR2_i386
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 05c1d1ff9a..05d8cb4934 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -199,6 +199,18 @@ else
 SYSTEMD_CONF_OPTS += -Dpcre2=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSV),y)
+SYSTEMD_CONF_OPTS += -Dsysvinit-path=/etc/init.d -Dsysvrcnd-path=/etc/rc.d
+else
+SYSTEMD_CONF_OPTS += -Dsysvinit-path= -Dsysvrcnd-path=
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_UTMP),y)
+SYSTEMD_CONF_OPTS += -Dutmp=true
+else
+SYSTEMD_CONF_OPTS += -Dutmp=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
 SYSTEMD_DEPENDENCIES += libmicrohttpd
 SYSTEMD_CONF_OPTS += -Dmicrohttpd=true
-- 
2.27.0
