Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EDFC25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 14:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A96608B7;
	Mon, 27 May 2024 14:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgDbbEmxKkKy; Mon, 27 May 2024 14:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00EF5608E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00EF5608E3;
	Mon, 27 May 2024 14:44:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D021C1D1DF6
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9391401DC
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxIO3Q6Pgd85 for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 14:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 740224017D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 740224017D
 for <buildroot@buildroot.org>; Mon, 27 May 2024 14:44:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A4BE876CD; Mon, 27 May 2024 14:44:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 16:40:31 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9a40ae8b989ae040fd7aa1295cafb847df0ea729
X-Git-Newrev: 41ef581ac5681396ac19372ecdf4c53d58bc28be
X-Patchwork-Hint: ignore
Message-Id: <20240527144424.5A4BE876CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/suricata: fix
 static build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=41ef581ac5681396ac19372ecdf4c53d58bc28be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following static build failure raised since bump to version
version 6.0.14 in commit ce17f93e828a07292e03653be04a49480250f23f and
https://github.com/OISF/suricata/commit/31ba4fd1522dd0d7f933767b9205c67a4e726fe5:

configure:22378: checking for pcap_open_dead in -lpcap
configure:22407: /home/buildroot/autobuild/run/instance-3/output-1/host/bin/x86_64-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -static -std=c11 -march=native -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -rdynamic conftest.c -lpcap  -ljansson -lpthread -lyaml -lpcre -latomic -lz >&5
/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/12.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libpcap.a(pcap-linux.o): in function `nl80211_init':
pcap-linux.c:(.text+0xc34): undefined reference to `nl_socket_alloc'

[...]

checking for pcap_open_dead in -lpcap... no

Fixes: ce17f93e828a07292e03653be04a49480250f23f
 - http://autobuild.buildroot.org/results/9e25c2508bd4100d2d1d3180e79060d762361213

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a3ee47ef22f4035d715461e98ff8a2c4f76735ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-configure.ac-fix-static-build.patch       | 52 ++++++++++++++++++++++
 package/suricata/suricata.mk                       |  1 +
 2 files changed, 53 insertions(+)

diff --git a/package/suricata/0002-configure.ac-fix-static-build.patch b/package/suricata/0002-configure.ac-fix-static-build.patch
new file mode 100644
index 0000000000..fc5384a114
--- /dev/null
+++ b/package/suricata/0002-configure.ac-fix-static-build.patch
@@ -0,0 +1,52 @@
+From 6e1d8aceea8c4e49f00d8e630b681641a36c688f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 6 May 2024 09:31:05 +0200
+Subject: [PATCH] configure.ac: fix static build
+
+static build is broken since
+https://github.com/OISF/suricata/commit/31ba4fd1522dd0d7f933767b9205c67a4e726fe5
+because AC_CHECK_LIB is called before PKG_CHECK_MODULES:
+
+configure:22378: checking for pcap_open_dead in -lpcap
+configure:22407: /home/buildroot/autobuild/run/instance-3/output-1/host/bin/x86_64-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -static -std=c11 -march=native -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -rdynamic conftest.c -lpcap  -ljansson -lpthread -lyaml -lpcre -latomic -lz >&5
+/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/12.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libpcap.a(pcap-linux.o): in function `nl80211_init':
+pcap-linux.c:(.text+0xc34): undefined reference to `nl_socket_alloc'
+
+[...]
+
+checking for pcap_open_dead in -lpcap... no
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9e25c2508bd4100d2d1d3180e79060d762361213
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://redmine.openinfosecfoundation.org/issues/7008
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 232ee9bed..6277cb9b6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1219,6 +1219,8 @@
+         fi
+     fi
+ 
++    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}"],[:])
++
+     if test "$have_wpcap" != "yes"; then
+         AC_CHECK_LIB(pcap, pcap_open_dead, [], [
+             echo
+@@ -1234,8 +1236,6 @@
+         PCAP_LIB_NAME="pcap"
+     fi
+ 
+-    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}"],[:])
+-
+     AC_PATH_PROG(HAVE_PCAP_CONFIG, pcap-config, "no")
+     if test "$HAVE_PCAP_CONFIG" = "no" -o "$cross_compiling" = "yes"; then
+         AC_MSG_RESULT(no pcap-config is use)
+-- 
+2.43.0
+
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 2083e0caba..e60ed2fce8 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -10,6 +10,7 @@ SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
 SURICATA_CPE_ID_VENDOR = oisf
 # 0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
+# 0002-configure.ac-fix-static-build.patch
 SURICATA_AUTORECONF = YES
 
 SURICATA_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
