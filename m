Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BA9C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:08:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E493E60FD9
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E493E60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCAA361495;
	Thu, 26 Aug 2021 22:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kREM54ecIed1; Thu, 26 Aug 2021 22:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 445536149D;
	Thu, 26 Aug 2021 22:08:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 389791C113E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92EAB426BF
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPUTk0mIzydf for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86750426B0
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DC3938DC52; Thu, 26 Aug 2021 22:01:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 23:20:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c20d31baf471daeeec50d62cb8baa79bac06fa51
X-Git-Newrev: 3d8ce1975ff90f06818e74aa9b6a0c8ecc6f3d2d
X-Patchwork-Hint: ignore
Message-Id: <20210826220128.DC3938DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perl-net-ssh2: fix
 gcrypt build
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d8ce1975ff90f06818e74aa9b6a0c8ecc6f3d2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Pass crypto_backend option to avoid the following build failure raised
since bump to version 0.72 in commit
cd1d56bcde2a571062a1943c88506a8d9d2db357 and
https://github.com/rkitover/net-ssh2/commit/86a1274534dd7e0da03d98fb88c9c7ad4b1adb9b:

/tmp/instance-7/output-1/per-package/perl-net-ssh2/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lssl
/tmp/instance-7/output-1/per-package/perl-net-ssh2/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lcrypto

Fixes:
 - http://autobuild.buildroot.org/results/25747ec239e0b92775aa883e4f531f77d45f352e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-ssh2/perl-net-ssh2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index 5572e23257..20e45b6287 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -18,7 +18,7 @@ PERL_NET_SSH2_CONF_OPTS += \
 	inc="$(STAGING_DIR)/usr/include"
 
 ifeq ($(BR2_PACKAGE_LIBSSH2_LIBGCRYPT),y)
-PERL_NET_SSH2_CONF_OPTS += gcrypt
+PERL_NET_SSH2_CONF_OPTS += crypto_backend=gcrypt
 endif
 
 $(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
