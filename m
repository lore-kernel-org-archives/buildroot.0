From: James Knight <james.knight@rockwellcollins.com>
Date: Wed, 14 Oct 2015 19:45:33 -0400
Subject: [Buildroot] [PATCH v2 1/1] ntp: add ntptime option
Message-ID: <1444866333-4256-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow the `ntptime` utility to be included on a target.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
Changes v1 -> v2:
  - In order to support C libraries other than glibc, a change has been
     made to NTP's autoconf (and the introduction of `NTP_AUTORECONF` to
     the package). The `ntptime` utility requires ntp system calls to
     build. The NTP code already supports falling back to inline calls
     which make use of the `adjtimex` method (supported by uClibc and
     musl; see 'include/sys/timex.h'). This adjustment flags the
     configuration that ntp system calls are supported when `adjtimex`
     or `__adjtimex` are defined (issue brought up by Thomas Petazzoni
     when the initial ntptime support patch failed to build). For more
     information, see:
      https://bugs.ntp.org/show_bug.cgi?id=769
---
 package/ntp/0002-ntp-syscalls-fallback.patch | 27 +++++++++++++++++++++++++++
 package/ntp/Config.in                        |  6 ++++++
 package/ntp/ntp.mk                           |  2 ++
 3 files changed, 35 insertions(+)
 create mode 100644 package/ntp/0002-ntp-syscalls-fallback.patch

diff --git a/package/ntp/0002-ntp-syscalls-fallback.patch b/package/ntp/0002-ntp-syscalls-fallback.patch
new file mode 100644
index 0000000..535fc93
--- /dev/null
+++ b/package/ntp/0002-ntp-syscalls-fallback.patch
@@ -0,0 +1,27 @@
+inline ntp syscalls fallback
+
+Reference:
+ https://bugs.ntp.org/show_bug.cgi?id=769
+
+Signed-off-by: James Knight <james.knight@rockwellcollins.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -1523,11 +1523,11 @@ AC_CACHE_CHECK(
+     [ntp_cv_var_ntp_syscalls],
+     [
+ 	ntp_cv_var_ntp_syscalls=no
+-	case "$ac_cv_func_ntp_adjtime$ac_cv_func_ntp_gettime$ac_cv_func___adjtimex" in
++	case "$ac_cv_func_ntp_adjtime$ac_cv_func_ntp_gettime$ac_cv_func___adjtimex$ac_cv_func_adjtimex" in
+ 	 yesyes*)
+ 	    ntp_cv_var_ntp_syscalls=libc
+ 	    ;;
+-	 *yes)
++	 *yesyes | *yesno | *noyes)
+ 	    ntp_cv_var_ntp_syscalls=inline
+ 	    ;;
+ 	 *)
diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index d4caddf..1763225 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -67,6 +67,12 @@ config BR2_PACKAGE_NTP_NTPSNMPD
 	help
 	  Install ntpsnmpd NTP SNMP MIB agent.
 
+config BR2_PACKAGE_NTP_NTPTIME
+	bool "ntptime"
+	help
+	  The ntptime utility program is used to read and set kernel time
+	  variables.
+
 config BR2_PACKAGE_NTP_NTPTRACE
 	bool "ntptrace"
 	depends on BR2_PACKAGE_PERL
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 5997247..2b8be42 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -17,6 +17,7 @@ NTP_CONF_OPTS = \
 	--disable-tickadj \
 	--with-yielding-select=yes \
 	--disable-local-libevent
+NTP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NTP_CONF_OPTS += --with-crypto
@@ -46,6 +47,7 @@ NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDATE) += ntpdate/ntpdate
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDC) += ntpdc/ntpdc
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPQ) += ntpq/ntpq
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPSNMPD) += ntpsnmpd/ntpsnmpd
+NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPTIME) += util/ntptime
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPTRACE) += scripts/ntptrace/ntptrace
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_SNTP) += sntp/sntp
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_TICKADJ) += util/tickadj
-- 
1.9.5.msysgit.1
