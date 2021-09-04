Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B34CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:18:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E383560F55
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E383560F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92F660751;
	Sat,  4 Sep 2021 20:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84SuaVogfSiG; Sat,  4 Sep 2021 20:18:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 159B1606C7;
	Sat,  4 Sep 2021 20:18:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D6FB1BF95F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72BC282F8B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sb93guzZHGO6 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:17:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0D5B82FA2
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:17:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5D29088407; Sat,  4 Sep 2021 20:16:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:13:38 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 8cb6ff757f8201564d7f8178b48475b6acf0e1a5
X-Git-Newrev: ea06ae6bc790488d1e38418580d0e9956ab4ddad
X-Patchwork-Hint: ignore
Message-Id: <20210904201601.5D29088407@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/perl-net-ssh2:
 fix gcrypt build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ea06ae6bc790488d1e38418580d0e9956ab4ddad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
(cherry picked from commit 3d8ce1975ff90f06818e74aa9b6a0c8ecc6f3d2d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
