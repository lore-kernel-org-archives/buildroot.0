Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17435CDB470
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 06:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75A4E60666;
	Wed, 24 Jun 2026 06:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYgi4wJK10CN; Wed, 24 Jun 2026 06:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 431E760B29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782281137;
	bh=MLCS9JWbmpd1+77H78IxDe/wjX/D53VTtzdUyj1toYs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cjz+Nc/+DP26LmywYayTtOl/NsZ5qcjFv373LbieK1ml6jUWUmNC3wgvJuPvCYCcb
	 wUas+GN1CKgtvQK8ab74n/F+PMQOv4f8syQPoVwQiUirbwBiXpG5eMfvTjUg5yQmFW
	 CfLCrwLc1qQs8X3qCRIpGuSFx536SohuMWWaN8p/E+cxL4IEptbZFgOw21GFWw54vc
	 f51oQJnjsfqzcKpoJwUI38QBEEeresKbz7dNdgEBRxn9FtVyWcE7h9nFyNlwFRi68V
	 xnyx7A9XZHd9wYfEL2MLaoCotOjgySJ6lbXFBE0LuBm02BQJcrpMREjdQPJolwvRsy
	 oHtYdkFbTZqDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 431E760B29;
	Wed, 24 Jun 2026 06:05:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30E3C367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 06:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16A3881A33
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 06:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6dNtFppbgCQ for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 06:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19BAB81A1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19BAB81A1C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19BAB81A1C
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 06:05:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c817.dip0.t-ipconnect.de [79.214.200.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F7ABA4C13D3
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 08:05:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47394)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wcGjp-000000006pO-27oB
 for buildroot@buildroot.org; Wed, 24 Jun 2026 06:05:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 08:05:29 +0200
Message-ID: <20260624060529.632135-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782281130;
 bh=K/SfH7HwvvrQPtz1lSIEHx48i9HA+7tBMkqe0h32stg=;
 h=From:To:Subject:Date:From;
 b=alPbQ24+jjhXyf0tDEW+iRDr8Any40e0NtuzTPUzriLzWzVyPwDvYcKHi3+BJeqVH
 5dbEQ3FpgxACsKh8g2fmm1PuQ7gMFtvAeJ4FOgAlnT9grladdtdG1+dEg+M/C/J6Vr
 LZbJdcxLTYSS/EH4P5TcRN5Vzu8olQ33Z3nNzuMIjhjk2m3r6CyoIdrrKjXFr32wKl
 1uz4VC/QFoYD2bYRXcIrf52PXYGlwlnILSOoIoZgs8sJkocWF+PxsVrnRgesf4Hau0
 52MW6GU9uEQbZLX6HFIthFBJnxbWq3G1VF+YmE/EPbMfLo03sl15b6o0YaPFG3w3I+
 bF9CW39xvn+cQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=alPbQ24+
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: add upstream patch to fix
 build of depending packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit ed27a33ba04fafdb28d5c74a53798c86aecd50e1 bumped the
package from 5.9.4 to 5.9.5.2 which includes upstream commit
https://github.com/net-snmp/net-snmp/commit/7536a8d6d363898e0f511aa81cf2dc000c452b89
that breaks the build of other packages depending on netsnmp like ntp:

ntpSnmpSubagentObject.c: In function 'init_ntpSnmpSubagentObject':
./ntpSnmpSubagentObject.h:51:1: error: ISO C90 forbids mixed
 declarations and code [-Werror=declaration-after-statement]
   51 | static oid oidname##_oid [] = { __VA_ARGS__ };

For details see https://github.com/net-snmp/net-snmp/issues/1035

Fixes:
https://autobuild.buildroot.net/results/395/395a3b18719e4ec0c0b94b0692caaa9566ee57c6/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/1a96666c0e8fd2e9dcd23ae797782a8f188be7bf

 ...claration-after-statement-to-only-fo.patch | 80 +++++++++++++++++++
 package/netsnmp/netsnmp.mk                    |  4 +
 2 files changed, 84 insertions(+)
 create mode 100644 package/netsnmp/0001-moving-Werror-declaration-after-statement-to-only-fo.patch

diff --git a/package/netsnmp/0001-moving-Werror-declaration-after-statement-to-only-fo.patch b/package/netsnmp/0001-moving-Werror-declaration-after-statement-to-only-fo.patch
new file mode 100644
index 0000000000..64192b0993
--- /dev/null
+++ b/package/netsnmp/0001-moving-Werror-declaration-after-statement-to-only-fo.patch
@@ -0,0 +1,80 @@
+From 6facf270a6b9850846f015e64b8347319069fd57 Mon Sep 17 00:00:00 2001
+From: Wes Hardaker <opensource@hardakers.net>
+Date: Mon, 29 Dec 2025 13:38:59 -0800
+Subject: [PATCH] moving -Werror=declaration-after-statement to only for
+ developers
+
+Upstream: https://github.com/net-snmp/net-snmp/commit/0f19435ecc8fd6c3ef9cf2a391bd7bca25539e80
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.d/config_os_progs | 39 +++++++++++++++++++------------------
+ 1 file changed, 20 insertions(+), 19 deletions(-)
+
+diff --git a/configure.d/config_os_progs b/configure.d/config_os_progs
+index b3ecf556cc..b029de6017 100644
+--- a/configure.d/config_os_progs
++++ b/configure.d/config_os_progs
+@@ -110,24 +110,6 @@ AC_SUBST(LIBTOOL_DEPS)
+ #   Build environment:
+ ##
+ 
+-for opt in -Werror=declaration-after-statement
+-do
+-    AC_MSG_CHECKING([whether the compiler supports $opt])
+-    netsnmp_save_CFLAGS="$CFLAGS"
+-    if test x$opt != x-Wstrict-prototypes; then
+-      CFLAGS="-Werror $opt $CFLAGS"
+-    else
+-      CFLAGS="$opt $CFLAGS"
+-    fi
+-    AC_LINK_IFELSE([AC_LANG_PROGRAM([], [])], [
+-      AC_MSG_RESULT([yes])
+-      CFLAGS="$opt $netsnmp_save_CFLAGS"
+-    ], [
+-      AC_MSG_RESULT([no])
+-      CFLAGS="$netsnmp_save_CFLAGS"
+-    ])
+-done
+-
+ #   developer build 
+ #       (enabled by default when building from SVN checkout)
+ #
+@@ -135,7 +117,7 @@ if test "x$developer" != "xno" -a -f $srcdir/remove-files; then
+     developer="yes"
+ fi
+ if test "x$developer" = "xyes" -a "x$GCC" = "xyes"; then
+-    AC_MSG_CHECKING([for developer gcc flags])
++    AC_MSG_NOTICE([Checking for developer compiler flags])
+     #       WWWXXX - strict type checking
+     #
+     netsnmp_save_CFLAGS="$CFLAGS"
+@@ -159,6 +141,25 @@ if test "x$developer" = "xyes" -a "x$GCC" = "xyes"; then
+       CFLAGS="$netsnmp_save_CFLAGS"
+     done
+     AC_MSG_RESULT($DEVFLAGS)
++
++    for opt in -Werror=declaration-after-statement
++    do
++        AC_MSG_CHECKING([whether the compiler supports $opt])
++        netsnmp_save_CFLAGS="$CFLAGS"
++        if test x$opt != x-Wstrict-prototypes; then
++          CFLAGS="-Werror $opt $CFLAGS"
++        else
++          CFLAGS="$opt $CFLAGS"
++        fi
++        AC_LINK_IFELSE([AC_LANG_PROGRAM([], [])], [
++          AC_MSG_RESULT([yes])
++          CFLAGS="$opt $netsnmp_save_CFLAGS"
++        ], [
++          AC_MSG_RESULT([no])
++          CFLAGS="$netsnmp_save_CFLAGS"
++        ])
++    done
++
+ else
+     DEVFLAGS=""
+ fi
+-- 
+2.47.3
+
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 0ec4cfaa76..55e5997734 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -13,6 +13,10 @@ NETSNMP_CPE_ID_VENDOR = net-snmp
 NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
 NETSNMP_SELINUX_MODULES = snmp
 NETSNMP_INSTALL_STAGING = YES
+
+# 0001-moving-Werror-declaration-after-statement-to-only-fo.patch
+NETSNMP_AUTORECONF = YES
+
 NETSNMP_CONF_ENV = \
 	ac_cv_NETSNMP_CAN_USE_SYSCTL=no \
 	ac_cv_path_PSPROG=/bin/ps
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
