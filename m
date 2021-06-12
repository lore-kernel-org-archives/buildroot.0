Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7ECC432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:01:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A548C60F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A548C60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 791D3421E8;
	Tue,  3 Aug 2021 23:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0xhvW-f8Psd; Tue,  3 Aug 2021 23:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1B5421E3;
	Tue,  3 Aug 2021 23:01:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4459B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDE8A40544
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAGtWU88JQby for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82FA2405A0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CA72E88523; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Jun 2021 16:26:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7f4429dd907868bcbe09ebcfb4aa40f77b3d5acc
X-Git-Newrev: 5d5c619410bdb164ce0371e81e67ac3157e63394
X-Patchwork-Hint: ignore
Message-Id: <20210803210949.CA72E88523@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rsync: fix
 CVE-2020-14387
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=5d5c619410bdb164ce0371e81e67ac3157e63394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A flaw was found in rsync in versions since 3.2.0pre1. Rsync improperly
validates certificate with host mismatch vulnerability. A remote,
unauthenticated attacker could exploit the flaw by performing a
man-in-the-middle attack using a valid certificate for another hostname
which could compromise confidentiality and integrity of data transmitted
using rsync-ssl. The highest threat from this vulnerability is to data
confidentiality and integrity. This flaw affects rsync versions before
3.2.4.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: add a comment explaining what patch fixes this CVE]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ame-in-the-certificate-when-using-openssl.patch | 29 ++++++++++++++++++++++
 package/rsync/rsync.mk                             |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch b/package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
new file mode 100644
index 0000000000..13edeff944
--- /dev/null
+++ b/package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
@@ -0,0 +1,29 @@
+From c3f7414c450faaf6a8281cc4a4403529aeb7d859 Mon Sep 17 00:00:00 2001
+From: Matt McCutchen <matt@mattmccutchen.net>
+Date: Wed, 26 Aug 2020 12:16:08 -0400
+Subject: [PATCH] rsync-ssl: Verify the hostname in the certificate when using
+ openssl.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://git.samba.org/?p=rsync.git;a=commitdiff;h=c3f7414c450faaf6a8281cc4a4403529aeb7d859]
+---
+ rsync-ssl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rsync-ssl b/rsync-ssl
+index 8101975a..46701af1 100755
+--- a/rsync-ssl
++++ b/rsync-ssl
+@@ -129,7 +129,7 @@ function rsync_ssl_helper {
+     fi
+ 
+     if [[ $RSYNC_SSL_TYPE == openssl ]]; then
+-	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -connect $hostname:$port
++	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -verify_hostname $hostname -connect $hostname:$port
+     elif [[ $RSYNC_SSL_TYPE == gnutls ]]; then
+ 	exec $RSYNC_SSL_GNUTLS --logfile=/dev/null $gnutls_cert_opt $gnutls_opts $hostname:$port
+     else
+-- 
+2.25.1
+
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 3ebf3a6883..f57e471ef9 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -20,6 +20,9 @@ RSYNC_CONF_OPTS = \
 	--disable-lz4 \
 	--disable-asm
 
+# 0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
+RSYNC_IGNORE_CVES += CVE-2020-14387
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 RSYNC_DEPENDENCIES += acl
 else
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
