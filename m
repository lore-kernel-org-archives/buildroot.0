Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D22C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B64761217;
	Sat,  6 May 2023 14:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B64761217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1p97dorCF-z; Sat,  6 May 2023 14:43:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D40260812;
	Sat,  6 May 2023 14:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D40260812
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B5571BF859
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 457CE41F8F
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 457CE41F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MT5HPl1cLS5a for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:41:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB45541FD7
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB45541FD7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E940A85DB4; Sat,  6 May 2023 14:41:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 16:29:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fde7eeea4c0049afbfe167ddb358f57e68e38a23
X-Git-Newrev: 7b1a980465452af44636b06197abe1835da9ed9f
X-Patchwork-Hint: ignore
Message-Id: <20230506144102.E940A85DB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: disable NTLM support
 definitely
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b1a980465452af44636b06197abe1835da9ed9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- do not only disable NTLM delegation to winbinds ntlm_auth but
  disable NTLM support overall (and drop enforced libopenssl DES
  dependency introduced by 'package/libcurl: make sure openssl
  supports DES' (commit f25c820a4f93ad0ca7eaf5e504667bd4099b878c)
- change man page hint to https URL
- rearrange configure options to one option per line

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcurl/Config.in  |  1 -
 package/libcurl/libcurl.mk | 21 ++++++++++++++-------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 218309ed56..adab1ca3e6 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -57,7 +57,6 @@ choice
 config BR2_PACKAGE_LIBCURL_OPENSSL
 	bool "OpenSSL"
 	depends on BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 
 config BR2_PACKAGE_LIBCURL_BEARSSL
 	bool "BearSSL"
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a5313e686f..0f7ae640f6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -16,15 +16,22 @@ LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_CPE_ID_PRODUCT = libcurl
 LIBCURL_INSTALL_STAGING = YES
 
-# We disable NTLM support because it uses fork(), which doesn't work
-# on non-MMU platforms. Moreover, this authentication method is
-# probably almost never used. See
-# http://curl.se/docs/manpage.html#--ntlm.
+# We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
+# support because it uses fork(), which doesn't work on non-MMU platforms.
+# Moreover, this authentication method is probably almost never used (see
+# https://curl.se/docs/manpage.html#--ntlm), so disable NTLM support overall.
+#
 # Likewise, there is no compiler on the target, so libcurl-option (to
 # generate C code) isn't very useful
-LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
-	--with-random=/dev/urandom --disable-curldebug \
-	--disable-libcurl-option --disable-ldap --disable-ldaps
+LIBCURL_CONF_OPTS = \
+	--disable-manual \
+	--disable-ntlm \
+	--disable-ntlm-wb \
+	--with-random=/dev/urandom \
+	--disable-curldebug \
+	--disable-libcurl-option \
+	--disable-ldap \
+	--disable-ldaps
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
