Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630D5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 13:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E121B411F4;
	Sat, 11 Jun 2022 13:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeUXtHYdoCSO; Sat, 11 Jun 2022 13:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F0E740A8D;
	Sat, 11 Jun 2022 13:12:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 277F31BF2A5
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15DC560FF6
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fmJrMPXh1dNZ for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 13:12:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D91860F14
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 13:12:10 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k19so1765851wrd.8
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKplKs7H/+Vlf/BCywNeofm/yUyEb/nPzIY0bJCuDXY=;
 b=YC/SsGhd+y/nAypJ1bZ5ucI/Ue/MlVGgD1cweAtGXOeJjOExif/WlTFMuHL2JEpgOv
 WTWs4yTdFOAbT+Ptd0LQXgF3FKxqG2hlwfsVOn/hT8gEbKkzXviwEVb2j+8w2uZNY0ph
 a/DvJ6e1LIFqiHeh9u7UdFC3TBJ6f6T69OPW2Fn5jwb40+JNgAsOgbepOYOyGT7A++nR
 LTkTqb2hki8DVtF4lZwjNA2DFrKTtj9T4vjRg/7DTmZU8valRiO/cmInTxz6Er8VzieW
 iftc1lYMXm1AZPC9gcBxnz9/cij6doGgexnn9z1BEIKCriHGAjch5SKRS0Fjc1ZTzLM7
 cWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKplKs7H/+Vlf/BCywNeofm/yUyEb/nPzIY0bJCuDXY=;
 b=YR0iTxrY4226Wc//hUj5yGIbFZuSbQLUSoGpqp4jtXwZbOgy2Vrlfd7zcL6pvT87yP
 uekPxwR3b9461MSJSSC2vUztKQYy8jaKPyc2QdhmOzCdedM/qa75RgSU0LAXYlOk9HMV
 V2Ka02hH0kSk9EycQkvs2kKV+M3uGj4Efs/2tfJ+rq4JH8yQbbekff0WOnHEAJUrakVW
 tYYWW9eH9Ss3B7MN9QKLuaszH/mrDV/lj078HOsPsOEyRkkzagKZn3ErNhMldV6foP0n
 L8Wy0cJ7ptzfYyePzU3/mH5SelMu16D9I31SNjqiOGSKC3dD15JDjtZ3aFDnj+gMSmRJ
 3K9w==
X-Gm-Message-State: AOAM533qsQErpq/7cu0S2bjkqFfA1jv/BCfgjG+27aASG/g9v7hnDa38
 jObYKHKWHE9F1lLwH5SU86nXEzd0Om8=
X-Google-Smtp-Source: ABdhPJwlmU3EdHOa1jjH8ZEi09Wh/3iFxUmI7Vmlewh8d5zqEYkv9d/CRd4ixJd7SZ9l+DaLAVGGhg==
X-Received: by 2002:adf:f706:0:b0:20e:6788:c2b6 with SMTP id
 r6-20020adff706000000b0020e6788c2b6mr48910035wrp.633.1654953127929; 
 Sat, 11 Jun 2022 06:12:07 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 be5-20020a05600c1e8500b0039c5cecf206sm2486555wmb.4.2022.06.11.06.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 06:12:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 15:09:33 +0200
Message-Id: <20220611130933.359272-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libabseil-cpp: update
 BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
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

m68k is supported since version 20210324.0 and
https://github.com/abseil/abseil-cpp/commit/f3697b4fedc2d8f2311eaaebed051f6a44182bb2

s390x is supported since at least version 20180600 and
https://github.com/abseil/abseil-cpp/commit/a7e522daf1ec9cda69b356472f662142dd0c1215

sh is supported since version 20210324.0 and
https://github.com/abseil/abseil-cpp/commit/a2d7f453c635e90b356017dd47049b89407c2d88

sparc and sparc64 are supported since version 20210324.0 and
https://github.com/abseil/abseil-cpp/commit/3fcd00d7dddafe65ced638acca560105a414cba5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libabseil-cpp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index 222e3a092a..503e0ca3c2 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -5,9 +5,13 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386
+	default y if BR2_m68k	
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_riscv
+	default y if BR2_s390x
+	default y if BR2_sh
+	default y if BR2_sparc || BR2_sparc64
 	default y if BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
