Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDB0C83F3D
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 09:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CCF841506;
	Sun, 20 Jul 2025 09:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMqaINSQP_Ck; Sun, 20 Jul 2025 09:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8008541774
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8008541774;
	Sun, 20 Jul 2025 09:57:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 357F1117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 09:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C31B61044
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 09:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plfKCk_G0Aq5 for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 09:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A7C761062
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A7C761062
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 09:57:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39138867BD; Sun, 20 Jul 2025 09:57:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 11:54:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b84226a51f8314209b2dd5d32f891abf8a0fdff8
X-Git-Newrev: 6a20660c5aefc804be21b1eeefacac8fbe973fe4
X-Patchwork-Hint: ignore
Message-Id: <20250720095706.39138867BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntp: fix OpenSSL detection
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a20660c5aefc804be21b1eeefacac8fbe973fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.org/results/261e630f20dd20b7f606a7bcbd8fa7b50ce82fbe/

The build error occurs when libatomic is needed for linking.
In ntp_openssl.m4 the result of OpenSSL's pkgconf was omitted.

Enable configure option --enable-verbose-ssl to help future debugging:
configure: ntp_ssl_libs_l:   (-lssl -lcrypto -latomic)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ntp/0005-fix-openssl-configure.patch | 18 ++++++++++++++++++
 package/ntp/ntp.mk                           |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
