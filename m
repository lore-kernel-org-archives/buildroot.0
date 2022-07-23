Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D54C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 09:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A89D6072A;
	Sat, 23 Jul 2022 09:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A89D6072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQmbkrImx8pU; Sat, 23 Jul 2022 09:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C9BC606FF;
	Sat, 23 Jul 2022 09:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C9BC606FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3B4F1BF38A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 09:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDF5D40AB6
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 09:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDF5D40AB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ggyWD90ipjgr for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 09:07:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DD3840142
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DD3840142
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D3204842E0; Sat, 23 Jul 2022 08:53:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 11:06:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b832f6eb9d86920907c50901a99f13b44dd94647
X-Git-Newrev: 27b8d0ba8c4004819e092fb81c0f64f284b3aa4a
X-Patchwork-Hint: ignore
Message-Id: <20220723085333.D3204842E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntpsec: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0644036054785423506=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0644036054785423506==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=27b8d0ba8c4004819e092fb81c0f64f284b3aa4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- set 'CC="$(HOSTCC)"' to avoid cross-compile failure (see [1]):

  /bin/sh: line 1: .../build/ntpsec-1_2_0/build/host/ntpd/keyword-gen: cannot execute binary file: Exec format error

  Waf: Leaving directory `.../build/ntpsec-1_2_0/build/host'
  Build failed
   -> task in 'ntp_keyword.h' failed with exit status 126 (run with -v to display more information)

- set '-std=gnu99"' to avoid compile failure with old compilers

- explicitly set PYTHON_CONFIG

- add patch 001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch to
  fix ntptime jfmt5/ofmt5 jfmt6/ofmt6 related compile failure

- add patch 0002-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch to
  fix host-compile failure in case target libbsd is detected

- add SYSV init file (S49ntp)

- add example ntpd.conf (with legacy option enabled and provide skeleton
  for NTS configuration)

- add config option for NTS support

- add ntp user/group and run ntpd as restricted user

- add libcap dependency (compile time optional but needed for droproot
  support)

[1] https://gitlab.com/NTPsec/ntpsec/-/issues/694

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Thomas: S49ntp -> S49ntpd]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch | 90 ++++++++++++++++++++++
 ...ove-checks-for-bsd-string.h-fixes-host-co.patch | 73 ++++++++++++++++++
 package/ntpsec/Config.in                           | 28 +++++++
 package/ntpsec/S49ntpd                             | 58 ++++++++++++++
 package/ntpsec/ntpd.etc.conf                       | 33 ++++++++
 package/ntpsec/ntpsec.hash                         |  4 +
 package/ntpsec/ntpsec.mk                           | 68 ++++++++++++++++
 9 files changed, 356 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 54eb08c1d6..eb8606559f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2314,6 +2314,7 @@ F:	package/libcamera-apps/
 F:	package/libevdev/
 F:	package/libuev/
 F:	package/log4cplus/
+F:	package/ntpsec/
 F:	package/postgresql/
 F:	package/python-colorzero/
 F:	package/python-flask-wtf/
diff --git a/package/Config.in b/package/Config.in
index 1a55e10f79..433b62eae3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2314,6 +2314,7 @@ endif
 	source "package/nmap/Config.in"
 	source "package/noip/Config.in"
 	source "package/ntp/Config.in"
+	source "package/ntpsec/Config.in"
 	source "package/nuttcp/Config.in"
 	source "package/odhcp6c/Config.in"
 	source "package/odhcploc/Config.in"
diff --git a/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch b/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch
new file mode 100644
index 0000000000..aa3cb183c3
--- /dev/null
+++ b/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch
@@ -0,0 +1,90 @@
+From aa9ed14c7f4d0edbda9370760b44be045638f8a0 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 4 Oct 2021 22:25:58 +0200
+Subject: [PATCH] ntptime: fix jfmt5/ofmt5 jfmt6/ofmt6 related compile failure
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use same define guard for definiton as for usage ('HAVE_STRUCT_NTPTIMEVAL_TAI'
+instead of 'NTP_API && NTP_API > 3').
+
+While at it use HAVE_STRUCT_NTPTIMEVAL_TAI define guard for the two remaining
+places using NTP_API (which is not defined by the uclibc sys/timex.h header).
+
+Fixes:
+
+  ../../ntptime/ntptime.c: In function ‘main’:
+  ../../ntptime/ntptime.c:349:17: error: ‘jfmt5’ undeclared (first use in this function); did you mean ‘jfmt6’?
+    349 |   printf(json ? jfmt5 : ofmt5, (long)ntv.tai);
+        |                 ^~~~~
+        |                 jfmt6
+  ../../ntptime/ntptime.c:349:17: note: each undeclared identifier is reported only once for each function it appears in
+  ../../ntptime/ntptime.c:349:25: error: ‘ofmt5’ undeclared (first use in this function); did you mean ‘ofmt6’?
+    349 |   printf(json ? jfmt5 : ofmt5, (long)ntv.tai);
+        |                         ^~~~~
+        |                         ofmt6
+  ../../ntptime/ntptime.c:321:15: warning: unused variable ‘jfmt6’ [-Wunused-variable]
+    321 |   const char *jfmt6 = "";
+        |               ^~~~~
+  ../../ntptime/ntptime.c:311:15: warning: unused variable ‘ofmt6’ [-Wunused-variable]
+    311 |   const char *ofmt6 = "\n";
+        |               ^~~~~
+
+[Upstream: https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1245]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ ntptime/ntptime.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/ntptime/ntptime.c b/ntptime/ntptime.c
+index ff861cb3b..7fbd09977 100644
+--- a/ntptime/ntptime.c
++++ b/ntptime/ntptime.c
+@@ -138,7 +138,7 @@ main(
+ 			ntx.modes |= MOD_NANO;
+ 			break;
+ #endif
+-#if defined NTP_API && NTP_API > 3
++#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)
+ 		case 'T':
+ 			ntx.modes = MOD_TAI;
+ 			ntx.constant = atoi(ntp_optarg);
+@@ -222,7 +222,7 @@ main(
+ #else
+ "",
+ #endif
+-#if defined NTP_API && NTP_API > 3
++#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)
+ "-T tai_offset	set TAI offset\n",
+ #else
+ "",
+@@ -305,21 +305,21 @@ main(
+ 		const char *ofmt2 = "  time %s, (.%0*d),\n";
+ 		const char *ofmt3 = "  maximum error %lu us, estimated error %lu us";
+ 		const char *ofmt4 = "  ntptime=%x.%x unixtime=%x.%0*d %s";
+-#if defined NTP_API && NTP_API > 3
++#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)
+ 		const char *ofmt5 = ", TAI offset %ld\n";
+ #else
+ 		const char *ofmt6 = "\n";
+-#endif /* NTP_API */
++#endif /* HAVE_STRUCT_NTPTIMEVAL_TAI */
+ 		/* JSON formats */
+ 		const char *jfmt1 = "{\"gettime-code\":%d,\"gettime-status\":\"%s\",";
+ 		const char *jfmt2 = "\"time\":\"%s\",\"fractional-time\":\".%0*d\",";
+ 		const char *jfmt3 = "\"maximum-error\":%lu,\"estimated-error\":%lu,";
+ 		const char *jfmt4 = "\"raw-ntp-time\":\"%x.%x\",\"raw-unix-time\":\"%x.%0*d %s\",";
+-#if defined NTP_API && NTP_API > 3
++#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)
+ 		const char *jfmt5 = "\"TAI-offset\":%d,";
+ #else
+ 		const char *jfmt6 = "";
+-#endif /* NTP_API */
++#endif /* HAVE_STRUCT_NTPTIMEVAL_TAI */
+ 		printf(json ? jfmt1 : ofmt1, status, timex_state(status));
+ 		time_frac = ntv.time.tv_frac_sec;
+ #ifdef STA_NANO
+-- 
+2.34.1
+
diff --git a/package/ntpsec/0002-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch b/package/ntpsec/0002-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
new file mode 100644
index 0000000000..d6ac61fc70
--- /dev/null
+++ b/package/ntpsec/0002-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
@@ -0,0 +1,73 @@
+From 54fbeaa68a59f536819d1cfb2e9204176fbff54b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 16 Dec 2021 23:27:35 +0100
+Subject: [PATCH] wscript: remove checks for bsd/string.h, fixes host-compile
+ failure
+
+Fixes the following host-compile failure while cross-compiling
+in case target libbsd is found:
+
+  [2/2] Compiling build/host/ntpd/ntp_parser.tab.c
+  In file included from ../../include/ntp.h:15,
+                   from .../build/ntpsec-1_2_1/ntpd/ntp_parser.y:16:
+  ../../include/ntp_stdlib.h:20:10: fatal error: bsd/string.h: No such file or directory
+     20 | #include <bsd/string.h>
+        |          ^~~~~~~~~~~~~~
+  compilation terminated.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ include/ntp_stdlib.h |  4 ----
+ wscript              | 14 --------------
+ 2 files changed, 18 deletions(-)
+
+diff --git a/include/ntp_stdlib.h b/include/ntp_stdlib.h
+index fe4d78e5c..73d97084f 100644
+--- a/include/ntp_stdlib.h
++++ b/include/ntp_stdlib.h
+@@ -16,10 +16,6 @@
+ #include "ntp_malloc.h"
+ #include "ntp_syslog.h"
+ 
+-#ifdef HAVE_BSD_STRING_H
+-#include <bsd/string.h>
+-#endif
+-
+ #ifdef __GNUC__
+ #define NTP_PRINTF(fmt, args) __attribute__((__format__(__printf__, fmt, args)))
+ #else
+diff --git a/wscript b/wscript
+index 641073f00..aa04b1d1c 100644
+--- a/wscript
++++ b/wscript
+@@ -660,19 +660,6 @@ int main(int argc, char **argv) {
+                        prerequisites=ft[1], use=ft[2],
+                        mandatory=ft[3])
+ 
+-    # check for BSD versions outside of libc
+-    if not ctx.get_define("HAVE_STRLCAT"):
+-        ret = probe_function(ctx, function='strlcat',
+-                             prerequisites=['bsd/string.h'])
+-        if ret:
+-            ctx.define("HAVE_STRLCAT", 1, comment="Using bsd/strlcat")
+-
+-    if not ctx.get_define("HAVE_STRLCPY"):
+-        ret = probe_function(ctx, function='strlcpy',
+-                             prerequisites=['bsd/string.h'])
+-        if ret:
+-            ctx.define("HAVE_STRLCPY", 1, comment="Using bsd/strlcpy")
+-
+     # Nobody uses the symbol, but this seems like a good sanity check.
+     ctx.check_cc(header_name="stdbool.h", mandatory=True,
+                  comment="Sanity check.")
+@@ -691,7 +678,6 @@ int main(int argc, char **argv) {
+     optional_headers = (
+         "alloca.h",
+         ("arpa/nameser.h", ["sys/types.h"]),
+-        "bsd/string.h",     # bsd emulation
+         ("ifaddrs.h", ["sys/types.h"]),
+         ("linux/if_addr.h", ["sys/socket.h"]),
+         ("linux/rtnetlink.h", ["sys/socket.h"]),
+-- 
+2.34.1
+
diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in
new file mode 100644
index 0000000000..1e88046420
--- /dev/null
+++ b/package/ntpsec/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_NTPSEC
+	bool "ntpsec"
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PYTHON3
+	help
+	  NTPsec project - a secure, hardened, and improved
+	  implementation of Network Time Protocol derived
+	  from NTP Classic, Dave Mills’s original.
+
+	  Provides things like ntpd, ntpdate, ntpq, etc...
+
+	  https://www.ntpsec.org/
+
+if BR2_PACKAGE_NTPSEC
+
+config BR2_PACKAGE_NTPSEC_CLASSIC_MODE
+	bool "classic-mode"
+	help
+	  Enable strict configuration and log-format compatibility
+	  with NTP Classic.
+
+config BR2_PACKAGE_NTPSEC_NTS
+	bool "NTS support"
+	help
+	  Enable Network Time Security (NTS) support.
+
+endif
diff --git a/package/ntpsec/S49ntpd b/package/ntpsec/S49ntpd
new file mode 100644
index 0000000000..f3db51418e
--- /dev/null
+++ b/package/ntpsec/S49ntpd
@@ -0,0 +1,58 @@
+#!/bin/sh
+#
+# Starts Network Time Protocol daemon
+#
+
+DAEMON="ntpd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+NTPD_ARGS="-g -u ntp:ntp -s /var/run/ntp"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+mkdir -p /var/run/ntp && chown ntp:ntp /var/run/ntp
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $NTPD_ARGS -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/ntpsec/ntpd.etc.conf b/package/ntpsec/ntpd.etc.conf
new file mode 100644
index 0000000000..e0f45c1438
--- /dev/null
+++ b/package/ntpsec/ntpd.etc.conf
@@ -0,0 +1,33 @@
+#
+# legacy NTP configuration
+#
+pool 0.pool.ntp.org iburst
+pool 1.pool.ntp.org iburst
+pool 2.pool.ntp.org iburst
+pool 3.pool.ntp.org iburst
+
+#
+# NTS configuration
+#
+# Notes:
+#  - uncomment the following lines to enable NTS support (but
+#    make sure the initial clock is up-to-date (otherwise the
+#    NTS certificate validation will fail with 'NTSc: certificate invalid:
+#    9=>certificate is not yet valid' as on boards without RTC support)
+#    and/or keep at least one line from the legacy NTP lines
+#  - enable BR2_PACKAGE_CA_CERTIFICATES to gain access to the certificate
+#    files
+#
+# server time.cloudflare.com nts  # Global, anycast
+# server nts.ntp.se:4443 nts      # Sweden
+# server ntpmon.dcs1.biz nts      # Singapore
+# server ntp1.glypnod.com nts     # San Francisco
+# server ntp2.glypnod.com nts     # London
+#
+# ca /usr/share/ca-certificates/mozilla
+
+# Allow only time queries, at a limited rate, sending KoD when in excess.
+# Allow all local queries (IPv4, IPv6)
+restrict default nomodify nopeer noquery limited kod
+restrict 127.0.0.1
+restrict [::1]
diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
new file mode 100644
index 0000000000..49dc4e4d52
--- /dev/null
+++ b/package/ntpsec/ntpsec.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  71c9f4bde6953bbc048bbaf278da81c451a56cc08d6772542b4ad37c67d72e89  ntpsec-NTPsec_1_2_1.tar.bz2
+sha256  b4db4de3317c3b0554ed91eb692968800bdfd6ad2c16ffbeee8ce4895ed91da4  LICENSE.adoc
+sha256  d3b21470adadd9abd9c6d675378f8c371ac5a4ea6dbec91859e02fadca3c0856  docs/copyright.adoc
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
new file mode 100644
index 0000000000..25ae69ebf6
--- /dev/null
+++ b/package/ntpsec/ntpsec.mk
@@ -0,0 +1,68 @@
+################################################################################
+#
+# ntpsec
+#
+################################################################################
+
+NTPSEC_VERSION_MAJOR = 1
+NTPSEC_VERSION_MINOR = 2
+NTPSEC_VERSION_POINT = 1
+NTPSEC_VERSION = $(NTPSEC_VERSION_MAJOR)_$(NTPSEC_VERSION_MINOR)_$(NTPSEC_VERSION_POINT)
+NTPSEC_SOURCE = ntpsec-NTPsec_$(NTPSEC_VERSION).tar.bz2
+NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(NTPSEC_VERSION)
+NTPSEC_LICENSE = BSD-2-Clause, NTP, BSD-3-Clause, MIT
+NTPSEC_LICENSE_FILES = LICENSE.adoc docs/copyright.adoc
+
+NTPSEC_CPE_ID_VENDOR = ntpsec
+NTPSEC_CPE_ID_VERSION = $(NTPSEC_VERSION_MAJOR).$(NTPSEC_VERSION_MINOR)
+NTPSEC_CPE_ID_UPDATE = $(NTPSEC_VERSION_POINT)
+
+NTPSEC_DEPENDENCIES = \
+	host-pkgconf \
+	python3 \
+	libcap \
+	openssl
+
+# CC="$(HOSTCC)" is strange but needed to build some host tools, the
+# cross-compiler will properly be used to build target code thanks to
+# --cross-compiler
+NTPSEC_CONF_OPTS = \
+	CC="$(HOSTCC)" \
+	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config" \
+	--libdir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/ntp \
+	--cross-compiler="$(TARGET_CC)" \
+	--cross-cflags="$(TARGET_CFLAGS) -std=gnu99" \
+	--cross-ldflags="$(TARGET_LDFLAGS)" \
+	--notests \
+	--enable-early-droproot \
+	--disable-mdns-registration \
+	--enable-pylib=ffi \
+	--nopyc \
+	--nopyo \
+	--nopycache \
+	--disable-doc \
+	--disable-manpage
+
+ifeq ($(BR2_PACKAGE_NTPSEC_CLASSIC_MODE),y)
+NTPSEC_CONF_OPTS += --enable-classic-mode
+endif
+
+# no '--enable-nts' option available
+ifeq ($(BR2_PACKAGE_NTPSEC_NTS),)
+NTPSEC_CONF_OPTS += --disable-nts
+endif
+
+define NTPSEC_INSTALL_NTPSEC_CONF
+	$(INSTALL) -m 644 package/ntpsec/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
+endef
+NTPSEC_POST_INSTALL_TARGET_HOOKS += NTPSEC_INSTALL_NTPSEC_CONF
+
+define NTPSEC_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/ntpsec/S49ntpd $(TARGET_DIR)/etc/init.d/S49ntpd
+endef
+
+define NTPSEC_USERS
+	ntp -1 ntp -1 * - - - ntpd user
+endef
+
+$(eval $(waf-package))

--===============0644036054785423506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0644036054785423506==--
