From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 20 Sep 2010 14:54:23 -0700
Subject: [Buildroot] [PATCH 1/1] ntp: convert to autotargets and bump to
	4.2.6p2
In-Reply-To: <1285019663-30160-1-git-send-email-Martin.Banky@gmail.com>
References: <1285019663-30160-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285019663-30160-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also added additional options for ntp and fixed a build issue when IPv6 support
is not available.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/ntp/Config.in                   |   44 +++++++++++
 package/ntp/ntp-4.2.4_p5-adjtimex.patch |   33 --------
 package/ntp/ntp-4.2.4_p5-nano.patch     |   36 ---------
 package/ntp/ntp-4.2.6_p2-adjtimex.patch |   33 ++++++++
 package/ntp/ntp-optional-ipv6.patch     |   24 ------
 package/ntp/ntp.mk                      |  122 +++++++++++++------------------
 6 files changed, 128 insertions(+), 164 deletions(-)
 delete mode 100644 package/ntp/ntp-4.2.4_p5-adjtimex.patch
 delete mode 100644 package/ntp/ntp-4.2.4_p5-nano.patch
 create mode 100644 package/ntp/ntp-4.2.6_p2-adjtimex.patch
 delete mode 100644 package/ntp/ntp-optional-ipv6.patch

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 6213141..85633ba 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -11,3 +11,47 @@ config BR2_PACKAGE_NTP_SNTP
 	depends on BR2_PACKAGE_NTP
 	help
 	  Simple network time protocol program
+	  
+config BR2_PACKAGE_NTP_NTP_KEYGEN
+	bool "ntp-keygen"
+	depends on BR2_PACKAGE_NTP
+	help
+	  Create a NTP host key
+	  
+config BR2_PACKAGE_NTP_NTP_WAIT
+	bool "ntp-wait"
+	select BR2_PACKAGE_MICROPERL
+	depends on BR2_PACKAGE_NTP
+	help
+	  ntp-wait waits until the locally running ntpd is in state 4
+	  (synchronized). This could be useful at boot time, to delay the
+	  boot sequence until after "ntpd -g" has set the time.
+	  
+config BR2_PACKAGE_NTP_NTPDC
+	bool "ntpdc"
+	depends on BR2_PACKAGE_NTP
+	help
+	  The ntpdc utility program is used to query an NTP daemon about
+	  its current state and to request changes in that state.
+	  
+config BR2_PACKAGE_NTP_NTPQ
+	bool "ntpq"
+	depends on BR2_PACKAGE_NTP
+	help
+	  The ntpq utility program is used to query NTP servers requesting
+	  information about current state and/or changes in that state.
+	  
+config BR2_PACKAGE_NTP_NTPTRACE
+	bool "ntptrace"
+	select BR2_PACKAGE_MICROPERL
+	depends on BR2_PACKAGE_NTP
+	help
+	  ntptrace is a perl script that uses the ntpq utility program to
+	  follow the chain of NTP servers from a given host back to the
+	  primary time source
+	  
+config BR2_PACKAGE_NTP_TICKADJ
+	bool "tickadj"
+	depends on BR2_PACKAGE_NTP
+	help
+	  set time-related kernel variables
diff --git a/package/ntp/ntp-4.2.4_p5-adjtimex.patch b/package/ntp/ntp-4.2.4_p5-adjtimex.patch
deleted file mode 100644
index 40625fa..0000000
--- a/package/ntp/ntp-4.2.4_p5-adjtimex.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-https://support.ntp.org/bugs/show_bug.cgi?id=769
-http://bugs.gentoo.org/254030
-
---- ntp/util/tickadj.c
-+++ ntp/util/tickadj.c
-@@ -21,7 +21,8 @@
- # include <unistd.h>
- #endif /* HAVE_UNISTD_H */
- 
--#ifdef HAVE___ADJTIMEX		/* Linux */
-+/* proper handling here has been moved to upstream ntp bugzilla */
-+#ifdef linux
- 
- #include <sys/timex.h>
- struct timex txc;
-@@ -91,7 +92,7 @@
- 	}
- 
- 	if (!errflg) {
--		if (__adjtimex(&txc) < 0)
-+		if (adjtimex(&txc) < 0)
- 			perror("adjtimex");
- 		else if (!quiet)
- 			printf("tick     = %ld\ntick_adj = %d\n",
-@@ -146,7 +147,7 @@
- #endif
- 	}
-     
--	if (__adjtimex(&txc) < 0)
-+	if (adjtimex(&txc) < 0)
- 	{
- 		perror("adjtimex");
- 	}
diff --git a/package/ntp/ntp-4.2.4_p5-nano.patch b/package/ntp/ntp-4.2.4_p5-nano.patch
deleted file mode 100644
index f4097ee..0000000
--- a/package/ntp/ntp-4.2.4_p5-nano.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fixes the MOD_NANO build failure
-
-ntp_loopfilter.c: In function 'local_clock':
-ntp_loopfilter.c:571: error: 'MOD_NANO' undeclared (first use in this function)
-ntp_loopfilter.c:571: error: (Each undeclared identifier is reported only once
-ntp_loopfilter.c:571: error: for each function it appears in.)
-ntp_loopfilter.c: In function 'loop_config':
-ntp_loopfilter.c:896: error: 'MOD_NANO' undeclared (first use in this function)
-
-Taken from
-http://cvs.fedoraproject.org/viewvc/devel/ntp/ntp-4.2.4p7-nano.patch?revision=1.1&content-type=text/plain&view=co
-
-See the discussion at
-https://bugs.launchpad.net/ubuntu/+source/ntp/+bug/412242 for more
-details and links. The below fix is not a correct fix, but only a
-workaround. The real fix required changes to kernel/libc headers.
-
-Index: ntp-4.2.4p5/include/ntp_syscall.h
-===================================================================
---- ntp-4.2.4p5.orig/include/ntp_syscall.h	2010-05-14 17:34:48.000000000 +0200
-+++ ntp-4.2.4p5/include/ntp_syscall.h	2010-05-14 17:35:13.000000000 +0200
-@@ -14,6 +14,14 @@
- # include <sys/timex.h>
- #endif
- 
-+#if defined(ADJ_NANO) && !defined(MOD_NANO)
-+#define MOD_NANO ADJ_NANO
-+#endif
-+
-+#if defined(ADJ_TAI) && !defined(MOD_TAI)
-+#define MOD_TAI ADJ_TAI
-+#endif
-+
- #ifndef NTP_SYSCALLS_LIBC
- #ifdef NTP_SYSCALLS_STD
- # define ntp_adjtime(t)		syscall(SYS_ntp_adjtime, (t))
diff --git a/package/ntp/ntp-4.2.6_p2-adjtimex.patch b/package/ntp/ntp-4.2.6_p2-adjtimex.patch
new file mode 100644
index 0000000..40625fa
--- /dev/null
+++ b/package/ntp/ntp-4.2.6_p2-adjtimex.patch
@@ -0,0 +1,33 @@
+https://support.ntp.org/bugs/show_bug.cgi?id=769
+http://bugs.gentoo.org/254030
+
+--- ntp/util/tickadj.c
++++ ntp/util/tickadj.c
+@@ -21,7 +21,8 @@
+ # include <unistd.h>
+ #endif /* HAVE_UNISTD_H */
+ 
+-#ifdef HAVE___ADJTIMEX		/* Linux */
++/* proper handling here has been moved to upstream ntp bugzilla */
++#ifdef linux
+ 
+ #include <sys/timex.h>
+ struct timex txc;
+@@ -91,7 +92,7 @@
+ 	}
+ 
+ 	if (!errflg) {
+-		if (__adjtimex(&txc) < 0)
++		if (adjtimex(&txc) < 0)
+ 			perror("adjtimex");
+ 		else if (!quiet)
+ 			printf("tick     = %ld\ntick_adj = %d\n",
+@@ -146,7 +147,7 @@
+ #endif
+ 	}
+     
+-	if (__adjtimex(&txc) < 0)
++	if (adjtimex(&txc) < 0)
+ 	{
+ 		perror("adjtimex");
+ 	}
diff --git a/package/ntp/ntp-optional-ipv6.patch b/package/ntp/ntp-optional-ipv6.patch
deleted file mode 100644
index 20d6edf..0000000
--- a/package/ntp/ntp-optional-ipv6.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-[PATCH] ntpd: fix build without ipv6 support
-
-ntp_io.c was checkin the non-existing DISABLE_IPV6 define rather
-than WANT_IPV6 as defined in config.h, breaking the build if
-the toolchain doesn't have ipv6 support.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- ntpd/ntp_io.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: ntp-4.2.4p5/ntpd/ntp_io.c
-===================================================================
---- ntp-4.2.4p5.orig/ntpd/ntp_io.c
-+++ ntp-4.2.4p5/ntpd/ntp_io.c
-@@ -55,7 +55,7 @@
-  * Set up some macros to look for IPv6 and IPv6 multicast
-  */
- 
--#if defined(ISC_PLATFORM_HAVEIPV6) && !defined(DISABLE_IPV6)
-+#if defined(ISC_PLATFORM_HAVEIPV6) && defined(WANT_IPV6)
- 
- #define INCLUDE_IPV6_SUPPORT
- 
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 78a4d2c..06413f9 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -3,91 +3,71 @@
 # ntp
 #
 #############################################################
-NTP_VERSION:=4.2.4p5
-NTP_SOURCE:=ntp-$(NTP_VERSION).tar.gz
-NTP_SITE:=http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
-NTP_DIR:=$(BUILD_DIR)/ntp-$(NTP_VERSION)
-NTP_CAT:=$(ZCAT)
-NTP_BINARY:=ntpdate/ntpdate
-NTP_TARGET_BINARY:=usr/bin/ntpdate
+NTP_VERSION = 4.2.6p2
+NTP_SOURCE = ntp-$(NTP_VERSION).tar.gz
+NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
 
-$(DL_DIR)/$(NTP_SOURCE):
-	$(call DOWNLOAD,$(NTP_SITE),$(NTP_SOURCE))
+NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
 
-ntp-source: $(DL_DIR)/$(NTP_SOURCE)
-
-$(NTP_DIR)/.patched: $(DL_DIR)/$(NTP_SOURCE)
-	$(NTP_CAT) $(DL_DIR)/$(NTP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(NTP_DIR) package/ntp/ ntp\*.patch
-	$(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," \
-		$(NTP_DIR)/ntpd/refclock_pcf.c
-	$(SED) '/[[:space:](]index[[:space:]]*(/s/[[:space:]]*index[[:space:]]*(/ strchr(/g' $(NTP_DIR)/libisc/*.c $(NTP_DIR)/arlib/sample.c
-	$(SED) '/[[:space:](]rindex[[:space:]]*(/s/[[:space:]]*rindex[[:space:]]*(/ strrchr(/g' $(NTP_DIR)/ntpd/*.c
-	#$(SED) 's/\(^#[[:space:]]*include[[:space:]]*<sys\/var.h>\)/\/\/ \1/' $(NTP_DIR)/util/tickadj.c
-	$(CONFIG_UPDATE) $(NTP_DIR)
-	$(CONFIG_UPDATE) $(NTP_DIR)/sntp
-	touch $@
+ifneq ($(BR2_INET_IPV6),y)
+NTP_CONF_ENV += isc_cv_have_in6addr_any=no
+endif
 
-$(NTP_DIR)/.configured: $(NTP_DIR)/.patched
-	(cd $(NTP_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_lib_md5_MD5Init=no \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-		$(DISABLE_IPV6) \
-		--with-shared \
+NTP_CONF_OPT = --with-shared \
 		--program-transform-name=s,,, \
 		--without-crypto \
-		--disable-tickadj \
-	)
-	touch $@
+		--disable-tickadj
 
-$(NTP_DIR)/$(NTP_BINARY): $(NTP_DIR)/.configured
-	$(MAKE) -C $(NTP_DIR)
+define NTP_PATCH_FIXUPS
+	$(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," $(@D)/ntpd/refclock_pcf.c
+	$(SED) '/[[:space:](]rindex[[:space:]]*(/s/[[:space:]]*rindex[[:space:]]*(/ strrchr(/g' $(@D)/ntpd/*.c
+endef
 
-$(TARGET_DIR)/$(NTP_TARGET_BINARY): $(NTP_DIR)/$(NTP_BINARY)
-	install -m 755 $(NTP_DIR)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd
-	install -m 755 $(NTP_DIR)/$(NTP_BINARY) $(TARGET_DIR)/$(NTP_TARGET_BINARY)
 ifeq ($(BR2_PACKAGE_NTP_SNTP),y)
-	install -m 755 $(NTP_DIR)/sntp/sntp $(TARGET_DIR)/usr/bin/sntp
+NTP_INSTALL_BIN_FILES += sntp/sntp
+endif
+
+ifeq ($(BR2_PACKAGE_NTP_NTP_KEYGEN),y)
+NTP_INSTALL_BIN_FILES += util/ntp-keygen
+endif
+
+ifeq ($(BR2_PACKAGE_NTP_NTP_WAIT),y)
+NTP_INSTALL_BIN_FILES += scripts/ntp-wait
 endif
+
+ifeq ($(BR2_PACKAGE_NTP_NTPDC),y)
+NTP_INSTALL_BIN_FILES += ntpdc/ntpdc
+endif
+
+ifeq ($(BR2_PACKAGE_NTP_NTPQ),y)
+NTP_INSTALL_BIN_FILES += ntpq/ntpq
+endif
+
+ifeq ($(BR2_PACKAGE_NTP_NTPTRACE),y)
+NTP_INSTALL_BIN_FILES += scripts/ntptrace
+endif
+
+ifeq ($(BR2_PACKAGE_NTP_TICKADJ),y)
+NTP_INSTALL_BIN_FILES += util/tickadj
+endif
+
+define NTP_INSTALL_TARGET_CMDS
+	install -m 755 $(@D)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd
+	test -z "$(NTP_INSTALL_BIN_FILES)" || install -m 755 $(addprefix $(@D)/,$(NTP_INSTALL_BIN_FILES)) $(TARGET_DIR)/usr/bin/
 	install -m 755 package/ntp/ntp.sysvinit $(TARGET_DIR)/etc/init.d/S49ntp
 	@if [ ! -f $(TARGET_DIR)/etc/default/ntpd ]; then \
 		install -m 755 -d $(TARGET_DIR)/etc/default ; \
 		install -m 644 package/ntp/ntpd.etc.default $(TARGET_DIR)/etc/default/ntpd ; \
 	fi
+endef
 
-ntp: $(TARGET_DIR)/$(NTP_TARGET_BINARY)
-
-ntp-clean:
-	rm -f $(TARGET_DIR)/usr/sbin/ntpd $(TARGET_DIR)/usr/bin/sntp \
-		$(TARGET_DIR)/etc/init.d/S49ntp \
-		$(TARGET_DIR)/$(NTP_TARGET_BINARY)
-	-$(MAKE) -C $(NTP_DIR) clean
+define NTP_UNINSTALL_TARGET_CMDS
+	rm $(TARGET_DIR)/usr/sbin/ntpd
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(NTP_INSTALL_BIN_FILES))
+	rm $(TARGET_DIR)/etc/init.d/S49ntp
+	rm $(TARGET_DIR)/etc/default/ntpd
+endef
 
-ntp-dirclean:
-	rm -rf $(NTP_DIR)
+NTP_POST_PATCH_HOOKS += NTP_PATCH_FIXUPS
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_NTP),y)
-TARGETS+=ntp
-endif
+$(eval $(call AUTOTARGETS,package,ntp))
-- 
1.7.2.3
