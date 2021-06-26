Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C46C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:11:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6CC2600EF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6CC2600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2CB182FDE;
	Tue,  3 Aug 2021 22:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvjuaSXxGvct; Tue,  3 Aug 2021 22:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE3B583083;
	Tue,  3 Aug 2021 22:11:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B35F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A97B608DD
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NE5wv9nCD8kH for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F22C46085C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4613388523; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 26 Jun 2021 15:06:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 20616a1b65aa718a2d18cac560404fa3b3e70fc8
X-Git-Newrev: ac2f121159cf28fdd879883e6bcee85fcf185a40
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.4613388523@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/usbguard: fix build
 with libgcrypt
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac2f121159cf28fdd879883e6bcee85fcf185a40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Building with libgcrypt fails since the addition of the package in
commit fbff7d7289cc95db991184f890f4ca1fcf8a101e:

checking for sparc64-buildroot-linux-gnu-libgcrypt-config... no
checking for libgcrypt-config... no
checking for LIBGCRYPT - version >= 1.5.0... no
configure: error: The selected crypto backend library is not available.

Fix this build failure by helping usbguard to find libgcrypt-config

Fixes:
 - http://autobuild.buildroot.org/results/4c19e50a2a5308cb31a62f1b4b538a30353022bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usbguard/usbguard.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index f3bd7c57ac..53d103346e 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -24,6 +24,8 @@ USBGUARD_DEPENDENCIES += libopenssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+USBGUARD_CONF_ENV += \
+	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 USBGUARD_CONF_OPTS += --with-crypto-library=gcrypt
 USBGUARD_DEPENDENCIES += libgcrypt
 endif
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
