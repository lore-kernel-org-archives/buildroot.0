Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A079C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 15:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C6096115E;
	Fri, 12 Aug 2022 15:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C6096115E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1dPWhRjXNEnh; Fri, 12 Aug 2022 15:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8502E6115B;
	Fri, 12 Aug 2022 15:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8502E6115B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 192E21BF215
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 15:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 017098126D
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 15:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 017098126D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXvhl-BMqo87 for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 15:59:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0E668124A
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0E668124A
 for <buildroot@busybox.net>; Fri, 12 Aug 2022 15:59:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n4so1632017wrp.10
 for <buildroot@busybox.net>; Fri, 12 Aug 2022 08:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=m6ekFuEAPtxrvHFsB4GY1TXeYEH1Abrnfh2mMV+HCpg=;
 b=M8olPX90GUawM8Z304shxMXBmnyNmePmi1wJE/HSRofj5ZfCy4Hyvh6Z856kR2iLa6
 wtGCN0AQHxM426MJ8opoZhy+Fl0UgymFzgDTbY+4RBEah2SeQN2GHpz/Ta1sBqdWy1vA
 v1TnThhNqIL1kJlpMXYhw8AvmZy8OAOEGnf9ArN+eqJYTGQQ5k53kJLwZERmHEg9ZVEo
 wxWpnUZqTyoVs5ZfPFwM9mUPQqQFB7megGcrS2UA+48J3TOw0p9QMT03T1JgWGg1GNCG
 TYsLYMUo63m3yhjyKzq3pcd1o1FhQPiBiLwp/dPwGQGpr097usHhOZwv4ijwIDA/SffZ
 odXA==
X-Gm-Message-State: ACgBeo2hGK/0/Eiej717YPB6kMlu6FoCmp6EmIH9tLbjvauKzk8UjZ0z
 ecrd9LuIui5TBa8k8PHn98HgUcgNjZk=
X-Google-Smtp-Source: AA6agR7VXaM+NUUCZLNW7Agz7ThJ+w6EuC0lfRmu0KPssh/gondc3lKjMpqvcK8rt/Qs4YiOkvhfBw==
X-Received: by 2002:a5d:6a01:0:b0:21a:338c:4862 with SMTP id
 m1-20020a5d6a01000000b0021a338c4862mr2415018wru.631.1660319961663; 
 Fri, 12 Aug 2022 08:59:21 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a5d570a000000b002211fc70174sm2750429wrv.99.2022.08.12.08.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 08:59:20 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 12 Aug 2022 17:58:55 +0200
Message-Id: <20220812155855.293755-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=m6ekFuEAPtxrvHFsB4GY1TXeYEH1Abrnfh2mMV+HCpg=;
 b=HxbSSOU1yzzxOtNpHPddPzaTJxUx117SmfuQ0qssM4Lt9WtXtYXAGixB7dstFekAOj
 NURgf26afeJJjAgrTTV0E56pz5X+tq2YzlxaKrT7f2cOlvajKZXZEjNN9BY5QENBZ6rf
 G7viceIXCqbzBqzTjd+bzKuHZDSdtHfnGxmayld/92etgSKRmlPLcd5JSqgVk9pr72sS
 jZzhxPy61xzKiRbqS3M4/O5jL/Ysp77zwR6dFN+BJ9Wu7EwRhkHastnL2gLHyVYY6XGT
 97/U7p7IFT51ZJ9RVVLTJMStWcQHYbYlfQcrusefl+SyAcyZpjSSogv1EQ09RHKmIg2G
 PSSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HxbSSOU1
Subject: [Buildroot] [PATCH] linux/linux: fix firmware-imx dependency
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
Cc: c.leger@borea-dental.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

introduced by https://patchwork.ozlabs.org/project/buildroot/patch/20220504094006.1541643-1-c.leger@borea-dental.com/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 322ccabbd..ffe68ded9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -77,7 +77,7 @@ LINUX_DEPENDENCIES = host-kmod
 LINUX_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
 	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
-	$(if $(BR2_PACKAGE_FREESCALE_IMX),firmware-imx) \
+	$(if $(BR2_PACKAGE_FIRMWARE_IMX),firmware-imx) \
 	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
 
 # Starting with 4.16, the generated kconfig paser code is no longer
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
