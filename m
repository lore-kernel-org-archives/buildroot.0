Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EB8CFA466
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82AEA80ACF;
	Wed, 23 Oct 2024 20:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGNx3_GTnVv4; Wed, 23 Oct 2024 20:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9893F80C44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9893F80C44;
	Wed, 23 Oct 2024 20:31:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EEFF84960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFEE9608F6
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nU6b056oujC3 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:31:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF7D960A3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF7D960A3C
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:31:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8E378642A; Wed, 23 Oct 2024 20:31:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:31:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c66981002e78a0f4adc5f4f29ab3b85bffb1d61
X-Git-Newrev: 7e739d49b235c1692edbb51dcc23671eaa79fd4f
X-Patchwork-Hint: ignore
Message-Id: <20241023203140.B8E378642A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: ignore CVE-2024-32928
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7e739d49b235c1692edbb51dcc23671eaa79fd4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This vulnerability only affects libcurl deployments in Nest products
because of incorrect use.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcurl/libcurl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 9bf7724e7d..71fb6152c7 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -32,6 +32,10 @@ LIBCURL_CONF_OPTS = \
 	--disable-ldap \
 	--disable-ldaps
 
+# Only affects Nest products.
+# https://nvd.nist.gov/vuln/detail/CVE-2024-32928
+LIBCURL_IGNORE_CVES += CVE-2024-32928
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
