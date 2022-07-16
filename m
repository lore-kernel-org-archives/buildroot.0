Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F638C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 13:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BC2042176;
	Sat, 16 Jul 2022 13:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BC2042176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yY2xSn-Jxfth; Sat, 16 Jul 2022 13:50:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53B48418A7;
	Sat, 16 Jul 2022 13:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53B48418A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5A91BF390
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 13:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF9CC84E8A
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 13:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF9CC84E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZF92fRn0l6D4 for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 13:50:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBBFA84E86
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBBFA84E86
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 13:50:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e15so5111198wro.5
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 06:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V4dIN4oKkXUt+Tpb7wwY6/nIDFqqS2rv/RFLazwVW/s=;
 b=rfaJmy/QNxkGrnaRWKinbDUInaBUG4W+SVENsMHSMWeZvxIx8M1TXpz3SrAZP4LkYu
 Rg7Na1jNkNHF3cM4UFTMrbO+cf7d644Nt9hkCO1fyXwo6tTMv26r0Psg/qZVJZxND3fu
 vqwVnhxF5Jv+5lCZCBbLlBxjfbqd6fTtnsofSwfyeG8CJqjGSvyZmrBgwXn3oCsqhaNE
 +VvPzgNhxIEGAhYFpwsy7kQtV37X3sSyZ0f9pjLDXiIx7Ps4JL2LX5gpptdsBsPNi1st
 3Gv+jHz898Agfz/hhxehL7Fnuos55WFAkSQNOAh77x5fVjOtpEue9PGGnSbj2RGJmaIY
 xpFg==
X-Gm-Message-State: AJIora/OlPyF3GEj5ti7MmbkMj6BpOAOjyUr7g2JrfdIvr9osUXu9A+7
 t1wvENCRj4RdxJlma8mHSsBydgOSs3s=
X-Google-Smtp-Source: AGRyM1uUmWs6LVu+oT7rDrTvBkdAf869OWtKnAFeWyhpVVxUgK/X6i4VkCToC2GWZHEV8Trg7thqqw==
X-Received: by 2002:a05:6000:1acd:b0:21d:78be:8b63 with SMTP id
 i13-20020a0560001acd00b0021d78be8b63mr16468090wry.398.1657979426642; 
 Sat, 16 Jul 2022 06:50:26 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a7bc30f000000b0039c54bb28f2sm8752527wmj.36.2022.07.16.06.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 06:50:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 15:47:14 +0200
Message-Id: <20220716134714.611106-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V4dIN4oKkXUt+Tpb7wwY6/nIDFqqS2rv/RFLazwVW/s=;
 b=KDpLv0+B0SGbqLUK9VOjDytfH2j2C1xvaxd1Ig2wvO3kMxf2Am/kU/xshAon/Hk0rO
 a78Xax2PxizRF02qSzZdyPprPKvuiyX6+lfkT+shJ3GSsp4kzBF9xKr4UH7RHRH1Tf52
 GvP9bGB23Mge0hkOH5sRRaorKVAGNKBJkR2wQFGs/s73PXptYZPLZu7EuolFkEZyWSJD
 FgzUSDutBUSGQdbemX4R0zqWFxGC7pA2OAMy2ZmZP+96ASzZxgLStGaHclAdYYZZwUCL
 JVttVIzKe4xlY8qACZyPzAOuSbogB8Z0QuGxJS0IzBS7diC1Mp93258i7+hJ+jGFD+n4
 mxSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KDpLv0+B
Subject: [Buildroot] [PATCH 1/1] package/openssl: fix libressl dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libressl can be built with uclibc on noMMU since bump to version 3.0.2
in commit 26f42106e8acfd336d8e902da96cd2ac9e63c09d and
https://github.com/libressl-portable/openbsd/commit/f542e84c859e3fb2728075c702062cce8a0ea93f

However, uclibc-ng doesn't provide __register_atfork without NPTL
resulting in the following libressl build failure:

/nvmedata/autobuild/instance-28/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/10.3.0/../../../../arceb-buildroot-linux-uclibc/bin/ld: ../../tls/libtls.a(arc4random.c.o): in function `_rs_stir':
arc4random.c:(.text+0x50c): undefined reference to `__register_atfork'

So fix the dependency and, while at it, drop the double negation for
readability

Fixes:
 - http://autobuild.buildroot.org/results/2fa4fa10cf19f1f942b6b49b5f6f05339c008cd4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openssl/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 7bf49b05f6..c7641ecefa 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -34,8 +34,8 @@ config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# uClibc on noMMU doesn't provide __register_atfork()
-	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
+	# uClibc doesn't provide __register_atfork() without NPTL
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  LibreSSL is a version of the TLS/crypto stack forked from
 	  OpenSSL in 2014, with goals of modernizing the codebase,
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
