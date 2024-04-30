Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00B1C10F16
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 11:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E76C60A69;
	Tue, 30 Apr 2024 11:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvQ_-rcJtBBG; Tue, 30 Apr 2024 11:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38D8860A6E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38D8860A6E;
	Tue, 30 Apr 2024 11:18:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B121F1BF47F
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 11:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EE2440471
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 11:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puYRBgVXAJUp for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 11:18:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCC1340230
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCC1340230
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCC1340230
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 11:18:05 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9CCAE352106B; Tue, 30 Apr 2024 13:18:01 +0200 (CEST)
Date: Tue, 30 Apr 2024 13:18:01 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZjDTadZMSCsL25gl@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1714475881; bh=RedyIoYzbh1F8rdrTn1uV1f79Vp4R523iYd985o5OGw=;
 h=Date:From:To:Subject:From;
 b=JjFMjR2sJvATPnjgf3+NELKVhbgT2/2CH2dEpTaBFQ6M+bXSC+As0ptp/ZDnjHKiU
 Fpr4Xq0EbE51RtbIKdbcG+6pLOBTDm0HO4knYvlY7cSbltwZ8UdqaQDsVWo+yhE25/
 8D6fVf+AZ/NckjlOYb3ewc+g3mCIcW1kXmr4zkwBO3ilNyEwA8j0Q6IgdK7UrdeDaM
 326AlYX6Gnp1aU5w/hcLjfWL7ooP/8AmHvZ5QmigIGaBaIdQ03zmr7GKSuSRH/0jpO
 lE9+Jyylcy0JBx852nceTk7iP4lRI94TIusE+ZAqJNVmXzZlklgd6UtVa9MFXEQe52
 MVPQ05is/gRRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=JjFMjR2s
Subject: [Buildroot] [PATCH] package/asterisk: fix compile issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix a compile issue when libyuv is enabled.
Detection of following function fails:
checking for pjsip_dlg_create_uas_and_inc_lock in -lpjsip... no

In config.log you see that libjpeg is missing.

Fixes:
 http://autobuild.buildroot.net/results/7bed9fc68fc9331ad12942c3eab9742ee8a7a4c4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 33d2e78bcf..138993b0ff 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -113,9 +113,15 @@ ASTERISK_CONF_ENV = \
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-ASTERISK_CONF_ENV += LIBS="-latomic"
+ASTERISK_LIBS += -latomic
 endif
 
+ifeq ($(BR2_PACKAGE_LIBYUV),y)
+ASTERISK_LIBS += -ljpeg
+endif
+
+ASTERISK_CONF_ENV += LIBS="$(ASTERISK_LIBS)"
+
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 ASTERISK_CONF_OPTS += --with-execinfo
 else
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
