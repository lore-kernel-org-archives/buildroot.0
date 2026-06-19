Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B582ACD4F26
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 13:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27DC7407A9;
	Fri, 19 Jun 2026 13:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkXqFxzSpRFp; Fri, 19 Jun 2026 13:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C04440703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781874369;
	bh=4D1HECpqK6N3nEk4jT/+hcLwJmjyxl8AqAbcA2G2SUo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hmimx5g/ZDcA95BZPB1pQ99zmLhe28AeHIvvoO0KzpWvrIJAlL9MLRn7GszMjeQwT
	 cQj5sUS8kH2op8M2HGiivsybbTmMe7tgTN4WeYnEsOY3DC+hIq9XTYJuFuyEGYkC5/
	 jUoAqYsdkeQ02ipsWSLaKEpNDQL44CNfvusvosoMJkAmQ9XkqxgrclyRCVq9Hohi3Y
	 eJW9qoT3MKgWZ6djVyjkF6MGUdAtFlVuF4MxiACQFugwQ0LgzlU5vI+0lK2010Wpd3
	 LgETyFIiXLJMV2ad81dOQkpetdmourmQwdohDzRKlV48clRqvK9aGevSSXolyAY+yJ
	 U+F8enGFxUP6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C04440703;
	Fri, 19 Jun 2026 13:06:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 878BF279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 13:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78A3A40703
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 13:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaN0xfNYzgpj for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 13:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=thi.zirnstein@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EA33406F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA33406F2
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EA33406F2
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 13:06:06 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-6976b0c5adbso453202a12.2
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 06:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874364; x=1782479164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rtmuc5Wt1KGsH/pMT5tK5ERwojhMfF1ewxmdjxQhK4c=;
 b=OLN+06V4fcA2h3Kv6TBzJVdtUOHKDD9XD+JcZoax8EubWyClQvSHPpGVhN78TyVjzY
 /JGPuH0FE1d+R4psuWMJoAwK3y5uVjsgG4eqEQ3NU03y2qJvYGSKDLgkKDynABGDkmtr
 nqy2ESWGCFYaZYpJYQ5wEjybT8kpWEft22OYDoW8PvUZ+b+n6S3txLUv6WcQuMRwQAyY
 7Vmwr2rHhmeUAlX09M0dxaIZEp94q8f63kkCxFDXYHCUKmzn1F3had04YXqthOuqEVOY
 AKUx6wjDNZPlj3pBgmsDKTpMs3YZ2sZUIDuQqbUwJnuZbgB5vaufsE6Jy7x0nKUyq2uD
 cpag==
X-Gm-Message-State: AOJu0YyhdtC3ml+6UMhuWdTH1fgiGpBdhqTJVixahYIvSw9CBkXgFWH/
 58T1R/e5/NLj6rf5Gzd5Q9CJtgJzAFVLcSF09GbgcVui1GQhaVCH6U8jUmqwsK2q
X-Gm-Gg: AfdE7cmi3pGt76YoibknneiN/SHqeNB5vh34J9GNMANp9YncAdEDYXdymuAvmoQcYvB
 JaEwdSlFHmquB+2ChpmEO/7bW3sTOofYxqHyBagp5uEzSsfoKHr4hvWCraGzJVRPIE0pL+KCuhn
 7juEyFYg4CFxqPyEUlb0IiTW+Xqpm7NYx4fLOTKXc4tdS7UwcJtnLy6zTxHgSJ+4v0uyNtCt3zd
 +o1w6YjuUbFMI0DuzudvUyIFBfxapbBxbroYqrdxxclMQKOaKqjRRXPDLpEemODzZ8L6UMsDs5F
 K7S8xwP1PWzLfAvA71IoXtRVBv0eY4doiJLKeYu26v1zWjQArjf8bnvYMFcOaOtElUFc7OaTTBY
 z14Va2JSGIEvRnaGbGQkhns0lQOKzNR2BdByhqcjQ53Kc+GeYSNkCBdyVaS/CkZU83fRLj66Pph
 Db0KcoySpnw1xX4u9KUcO9HhmJSbhrXlhVG7Qov95+yMNvbPnfnsdh7I+BWtQ0HOoMSz3crwutI
 re//VuhbSEH1MgbAZrFon0=
X-Received: by 2002:a17:907:3f98:b0:c08:484e:d94a with SMTP id
 a640c23a62f3a-c0b60601e44mr139428966b.20.1781874363727; 
 Fri, 19 Jun 2026 06:06:03 -0700 (PDT)
Received: from thi-server.fritz.box
 (dslb-002-204-230-174.002.204.pools.vodafone-ip.de. [2.204.230.174])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c0a9a00dadesm87815066b.41.2026.06.19.06.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:06:03 -0700 (PDT)
From: thilo zirnstein <thi.zirnstein@gmail.com>
X-Google-Original-From: thilo zirnstein <thizirnstein@gmail.com>
To: buildroot@buildroot.org
Cc: thilo zirnstein <thizirnstein@gmail.com>
Date: Fri, 19 Jun 2026 15:06:00 +0200
Message-ID: <20260619130600.784622-1-thizirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781874364; x=1782479164; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rtmuc5Wt1KGsH/pMT5tK5ERwojhMfF1ewxmdjxQhK4c=;
 b=ZCm0x8ubEMUSmQ3wq4cGLq2QDfVdBpVSyTAcQz8sbZxv7fOckJCdQGbJOOpcueitjD
 bVw5EOCjb9ANRbPkvARpPmghr1nSWuXfV+uMxJL2b/ujUkx3oaCk7vRz0qrme9/uswDt
 et2iXclkaS5x6c7G5582x1aHsmU6m1RaT3HkqIHoH23F/LNbG8dflYANQGPLEidt3zLC
 KeHoj/1qXSJMaa/S060haKIZGF85t7MACpZRwg6tWi51nE5OMJfLHMs0rAnQ/3URHYHP
 yPDq2IYDnEyucJV/Tkl2VqurgmgqlBHVgfpWnVMxlMCV/ywPkYSFTMFfahnifNLCBp/q
 7QOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZCm0x8ub
Subject: [Buildroot] [PATCH 1/1] linux: provide host pahole to make
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the pahole built by buildroot instead of the system wide
installation.

Signed-off-by: thilo zirnstein <thizirnstein@gmail.com>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index e790daff66..1c9d3fcdf8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -166,6 +166,10 @@ LINUX_MAKE_FLAGS = \
 	REGENERATE_PARSERS=1 \
 	DEPMOD=true
 
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
+LINUX_MAKE_FLAGS += PAHOLE=$(HOST_DIR)/bin/pahole
+endif
+
 ifeq ($(BR2_REPRODUCIBLE),y)
 LINUX_MAKE_ENV += \
 	KBUILD_BUILD_VERSION=1 \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
