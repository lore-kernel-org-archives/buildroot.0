Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58742C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B65860681;
	Thu,  7 Aug 2025 17:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ry3aX3A_MEO4; Thu,  7 Aug 2025 17:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C52B86067B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C52B86067B;
	Thu,  7 Aug 2025 17:19:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03D8831
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52B6140088
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RdQWLYFSRwg for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 209F140012
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 209F140012
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EB4286FE1; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:29 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 4482f1de4fd6acfff821a80aa7cccde38b8203ae
X-Git-Newrev: b4ec33b69306bee5218cf3ffba732872096a2146
X-Patchwork-Hint: ignore
Message-Id: <20250807171915.1EB4286FE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/ntp: fix OpenSSL
 detection
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b4ec33b69306bee5218cf3ffba732872096a2146
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Fixes:
https://autobuild.buildroot.org/results/261e630f20dd20b7f606a7bcbd8fa7b50ce82fbe/

The build error occurs when libatomic is needed for linking.
In ntp_openssl.m4 the result of OpenSSL's pkgconf was omitted.

Enable configure option --enable-verbose-ssl to help future debugging:
configure: ntp_ssl_libs_l:   (-lssl -lcrypto -latomic)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6a20660c5aefc804be21b1eeefacac8fbe973fe4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
