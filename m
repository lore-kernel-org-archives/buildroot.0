Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C988C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B66C403AD;
	Thu,  7 Aug 2025 17:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ke1FqV1dU4L7; Thu,  7 Aug 2025 17:00:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37E2840395
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37E2840395;
	Thu,  7 Aug 2025 17:00:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDCA31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FA1B80C33
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypRsUbJjIN_o for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B97B680C01
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B97B680C01
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B74CC822E3; Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ff48d831e813681560ff4be337461ecbe094826a
X-Git-Newrev: fa3df2b7d6e3debd96b022cece123c545bc568b2
X-Patchwork-Hint: ignore
Message-Id: <20250807170020.B74CC822E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ntp: fix OpenSSL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fa3df2b7d6e3debd96b022cece123c545bc568b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
