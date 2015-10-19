From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 00:19:36 +0200
Subject: [Buildroot] [git commit] ntp: add ntptime option
Message-ID: <20151019222225.881257FA90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c6629444dab52649b17a73dbd978c959f7d6b3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow the `ntptime` utility to be included on a target.

[Peter: add comment why AUTORECONF is needed]
Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/0002-ntp-syscalls-fallback.patch |   27 ++++++++++++++++++++++++++
 package/ntp/Config.in                        |    6 +++++
 package/ntp/ntp.mk                           |    3 ++
 3 files changed, 36 insertions(+), 0 deletions(-)

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
index 5997247..863717e 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -17,6 +17,8 @@ NTP_CONF_OPTS = \
 	--disable-tickadj \
 	--with-yielding-select=yes \
 	--disable-local-libevent
+# 0002-ntp-syscalls-fallback.patch
+NTP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NTP_CONF_OPTS += --with-crypto
@@ -46,6 +48,7 @@ NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDATE) += ntpdate/ntpdate
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDC) += ntpdc/ntpdc
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPQ) += ntpq/ntpq
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPSNMPD) += ntpsnmpd/ntpsnmpd
+NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPTIME) += util/ntptime
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPTRACE) += scripts/ntptrace/ntptrace
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_SNTP) += sntp/sntp
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_TICKADJ) += util/tickadj
