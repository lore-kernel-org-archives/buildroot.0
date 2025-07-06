Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E74CC83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 06:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF98A60B27;
	Sun,  6 Jul 2025 06:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUUGKXDlYkwA; Sun,  6 Jul 2025 06:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C252560E3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C252560E3B;
	Sun,  6 Jul 2025 06:44:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26FF219C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 06:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1607A81F73
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 06:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xW7dpE0mUaFq for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 06:44:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D41A81F6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D41A81F6B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D41A81F6B
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 06:44:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 61A92A4C3997
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 08:44:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49540)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uYJ6m-000000008SG-3pPb
 for buildroot@buildroot.org; Sun, 06 Jul 2025 06:44:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Jul 2025 08:44:14 +0200
Message-Id: <20250706064416.276504-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751784257;
 bh=wbvCeF85qMA7il32WYG7lNO9LHqYil92UZ60fEolvUI=;
 h=From:To:Subject:Date:From;
 b=GyMPj72TzuoxV4C5MrZ628Ft9if68AQhXaX6dSsucYEE+oSMKu4ebMEg3VXPaNcb9
 B4s+H3KqNkrC9sX+MGNzkVrVJmhGxZ4yZWvuDkgMr33m1zDEvPcp0dU1B/uFU/dCKr
 PLeoInhtmdsTb0qAh6EnVM+2SxfIXVoTE1PrIhnPAnEN3gsjYtoeufoQaU9aMlMpFd
 ORqlwpjS32XP0js+c/JBsujYOnawOOvxMn09PW7n6kXtsQug4AvvRK5+yJ05sJgCDc
 68aDZZDUAcRUYtee+A9yttmLZ9nqahsv6EzNIglR9IbaP02t6zEtxWd4tNcUCYJNQR
 QuroHCJmEzIXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=GyMPj72T
Subject: [Buildroot] [PATCH 1/3] package/ntp: fix OpenSSL detection
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

Fixes:
https://autobuild.buildroot.org/results/261e630f20dd20b7f606a7bcbd8fa7b50ce82fbe/

The build error occurs when libatomic is needed for linking.
In ntp_openssl.m4 the result of OpenSSL's pkgconf was omitted.

Enable configure option --enable-verbose-ssl to help future debugging:
configure: ntp_ssl_libs_l:   (-lssl -lcrypto -latomic)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ntp/0005-fix-openssl-configure.patch | 18 ++++++++++++++++++
 package/ntp/ntp.mk                           |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 package/ntp/0005-fix-openssl-configure.patch

diff --git a/package/ntp/0005-fix-openssl-configure.patch b/package/ntp/0005-fix-openssl-configure.patch
new file mode 100644
index 0000000000..0a213fcee6
--- /dev/null
+++ b/package/ntp/0005-fix-openssl-configure.patch
@@ -0,0 +1,18 @@
+Fix OpenSSL detection
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=3985
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -uNr ntp-4.2.8p18.orig/sntp/m4/ntp_openssl.m4 ntp-4.2.8p18/sntp/m4/ntp_openssl.m4
+--- ntp-4.2.8p18.orig/sntp/m4/ntp_openssl.m4	2024-05-07 13:21:14.000000000 +0200
++++ ntp-4.2.8p18/sntp/m4/ntp_openssl.m4	2025-07-06 08:37:14.140657598 +0200
+@@ -326,7 +326,7 @@
+ 	     not_found) ;;
+ 	     *)
+ 		AC_MSG_NOTICE([Searching for libcrypto in $i])
+-		LIBS="-L$i $NTPSSL_SAVED_LIBS"
++		LIBS="-L$i $ntp_ssl_libs_l $NTPSSL_SAVED_LIBS"
+ 		AC_CHECK_LIB(
+ 		    [crypto],
+ 		    [EVP_MD_CTX_new],
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 1a7c7e7937..f481c5d79b 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -29,7 +29,7 @@ NTP_CONF_OPTS = \
 NTP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NTP_CONF_OPTS += --with-crypto --enable-openssl-random
+NTP_CONF_OPTS += --with-crypto --enable-openssl-random --enable-verbose-ssl
 NTP_DEPENDENCIES += openssl
 else
 NTP_CONF_OPTS += --without-crypto --disable-openssl-random
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
