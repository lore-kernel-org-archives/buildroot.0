From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Feb 2011 17:45:57 -0300
Subject: [Buildroot] [PATCH 3/3] ntp: add ntpdate option
In-Reply-To: <1296765957-5137-1-git-send-email-gustavo@zacarias.com.ar>
References: <1296765957-5137-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1296765957-5137-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add ntpdate option bug #2935.
Based on incomplete patch by Frederik Pasch <fpasch@googlemail.com>

Also enable crypto when openssl is enabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntp/Config.in |   16 ++++++++++++++++
 package/ntp/TODO      |   33 ---------------------------------
 package/ntp/ntp.mk    |   13 ++++++++++---
 3 files changed, 26 insertions(+), 36 deletions(-)
 delete mode 100644 package/ntp/TODO

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index afbf0d5..1b2ab4b 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -27,6 +27,22 @@ config BR2_PACKAGE_NTP_NTP_WAIT
 	  (synchronized). This could be useful at boot time, to delay the
 	  boot sequence until after "ntpd -g" has set the time.
 
+config BR2_PACKAGE_NTP_NTPD
+	bool "ntpd"
+	depends on BR2_PACKAGE_NTP
+	default y
+	help
+	  ntpd is the time synchronization daemon keeping your local
+	  system date and time in sync and optionally serving time and date
+	  information on the network via the NTP protocol.
+
+config BR2_PACKAGE_NTP_NTPDATE
+	bool "ntpdate"
+	depends on BR2_PACKAGE_NTP
+	help
+	  The ntpdate utility program is used to set the local date and time
+	  from an NTP server given as an argument.
+
 config BR2_PACKAGE_NTP_NTPDC
 	bool "ntpdc"
 	depends on BR2_PACKAGE_NTP
diff --git a/package/ntp/TODO b/package/ntp/TODO
deleted file mode 100644
index ba6d7fd..0000000
--- a/package/ntp/TODO
+++ /dev/null
@@ -1,33 +0,0 @@
-The obsolete patch tries to clear "BUILT_SOURCE"
-
-++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-***************
-*** 157,163 ****
-  bin_PROGRAMS = ntpdc
-  EXTRA_PROGRAMS = ntpdc-layout
-  EXTRA_DATA = check-layout
-- BUILT_SOURCES = maybe-layout
-  INCLUDES = -I$(top_srcdir)/include
-  # LDADD might need RESLIB and ADJLIB
-  ntpdc_LDADD = version.o ../libntp/libntp.a @READLINE_LIBS@
---- 157,163 ----
-  bin_PROGRAMS = ntpdc
-  EXTRA_PROGRAMS = ntpdc-layout
-  EXTRA_DATA = check-layout
-+ BUILT_SOURCES = 
-  INCLUDES = -I$(top_srcdir)/include
-  # LDADD might need RESLIB and ADJLIB
-  ntpdc_LDADD = version.o ../libntp/libntp.a @READLINE_LIBS@
-------------------------------------------------------------
-The current tarball contains a lot more:
-
-++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-AUTOMAKE_OPTIONS = ../util/ansi2knr
-EXTRA_DATA = check-layout
-BUILT_SOURCES = @MAKE_CHECK_LAYOUT@ ntpdc-opts.c ntpdc-opts.h ntpdc.1 \
-	ntpdc-opts.texi ntpdc-opts.menu
-AM_CPPFLAGS = -I$(top_srcdir)/include $(LIBOPTS_CFLAGS)
-# LDADD might need RESLIB and ADJLIB
-------------------------------------------------------------
-
-Do we need to remove "@MAKE_CHECK_LAYOUT@" in a new patch?
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 7e09b5e..bca5d6e 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -15,25 +15,32 @@ endif
 
 NTP_CONF_OPT = --with-shared \
 		--program-transform-name=s,,, \
-		--without-crypto \
 		--disable-tickadj \
 		--without-ntpsnmpd
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+NTP_CONF_OPT += --with-crypto
+NTP_DEPENDENCIES += openssl
+else
+NTP_CONF_OPT += --without-crypto
+endif
+
 define NTP_PATCH_FIXUPS
 	$(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," $(@D)/ntpd/refclock_pcf.c
 	$(SED) '/[[:space:](]rindex[[:space:]]*(/s/[[:space:]]*rindex[[:space:]]*(/ strrchr(/g' $(@D)/ntpd/*.c
 endef
 
-NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_SNTP) += sntp/sntp
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_KEYGEN) += util/ntp-keygen
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_WAIT) += scripts/ntp-wait
+NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDATE) += ntpdate/ntpdate
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDC) += ntpdc/ntpdc
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPQ) += ntpq/ntpq
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPTRACE) += scripts/ntptrace
+NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_SNTP) += sntp/sntp
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_TICKADJ) += util/tickadj
 
 define NTP_INSTALL_TARGET_CMDS
-	install -m 755 $(@D)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd
+	$(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 $(@D)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd)
 	test -z "$(NTP_INSTALL_FILES_y)" || install -m 755 $(addprefix $(@D)/,$(NTP_INSTALL_FILES_y)) $(TARGET_DIR)/usr/bin/
 	install -m 755 package/ntp/ntp.sysvinit $(TARGET_DIR)/etc/init.d/S49ntp
 	@if [ ! -f $(TARGET_DIR)/etc/default/ntpd ]; then \
-- 
1.7.3.4
