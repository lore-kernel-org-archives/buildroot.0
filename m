Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33760C41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 12:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53C7F43591;
	Tue, 19 Dec 2023 12:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53C7F43591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ATI1JIkW4kNV; Tue, 19 Dec 2023 12:15:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 493F54358F;
	Tue, 19 Dec 2023 12:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 493F54358F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2EE81BF360
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4EFD43579
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4EFD43579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqVRiNHQy29s for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 12:15:17 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D62243571
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 12:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D62243571
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5534abbc637so2922352a12.0
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 04:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702988115; x=1703592915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWrPjI2BPMcGGbu2JP9aXXloJjjUpLGZNgiinpGXiqE=;
 b=iydOcAvKPEuxh7nt8/3CrwuY/1bfMSZEKLSEdTmMTmz0jiEVVmSOEkYDHOsH8BC9v1
 fobIDVoAR5TjB6Y6NEVw94pUXv6MmI+3RJILQ32AHqkb4KxlxpzoikLVH7DYWo/K7Paf
 LoAnqaOZ1ciNmPeod9S7+ygszXZoS8B7EGdbQZ+fhbOqw7XRayJpgJ9SsYSZFqywOLRS
 r2XFScNxZDgf8V1lEI+IsIhtIYLz+CKOzjWRmmVhB4qwPk9oLWb5zgEN87SpENZBmUHQ
 Au4KbUgYG9FQ/hcH0JiG7h8CF6I9NuFf6O2YyuLUR5vjpiaRYUShqPKDyhK0ImClPVEa
 3Z6g==
X-Gm-Message-State: AOJu0YxApShFn4n/U3TMdbeEhSLi4B3zSNRX8d2UMfwnEeE99fBzLMnh
 m9k99b9E584SzuY3gXzU4hvCOJGGZ2+K30C1BD8=
X-Google-Smtp-Source: AGHT+IEcj9e0h2T3jsDsQDLRCmAb3MZkHk6ke9VGbamgNbliQK1yOM3yd95MlPBFn2nQt+bPt2XlRA==
X-Received: by 2002:a50:9992:0:b0:553:97fd:c42e with SMTP id
 m18-20020a509992000000b0055397fdc42emr361146edb.31.1702988115256; 
 Tue, 19 Dec 2023 04:15:15 -0800 (PST)
Received: from marleenlaptop.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 bq18-20020a056402215200b0054db440489fsm11371363edb.60.2023.12.19.04.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 04:15:14 -0800 (PST)
X-Google-Original-From: marleen.vos@mind.be
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 13:15:02 +0100
Message-Id: <20231219121508.1695768-2-marleen.vos@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219121508.1695768-1-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1702988115; x=1703592915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWrPjI2BPMcGGbu2JP9aXXloJjjUpLGZNgiinpGXiqE=;
 b=cf+Jexdg5SHRtIynkU93y3E6Puv9zF0ThevcAFJE4rIfsGQH9xm5q4mjut8TgT8LUb
 xgWw3skZ0axeKdkX/nnKJZ7toMsDMbkXlTpjJPKRe6Us4oR2YetludT6uAXJ2l/zwiSN
 TstItraV13Wi5pTZ/ujin/lPOCxvltbMUqYCljSCNGzy4I8pFBWdT550jp1y+JLIyU5m
 oON2+KtXXzgRtOQC9RvXlzdmaHGTEc8oJdvAhW+qZXPsKOfhpzlWy2TVNBaMy6nkqM5y
 Talt4NxH7akE9n6s7coUkcfbKbD5xGWM990RwkeKqWKeHeB/UV2Z1zITUf/RCTPI/LLT
 QN3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=cf+Jexdg
Subject: [Buildroot] [PATCH 1/7] DEVELOPERS: added marleen.vos@mind.be for
 boards/configs based on stm32mp15
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
From: Marleen Vos via buildroot <buildroot@buildroot.org>
Reply-To: marleen.vos@essensium.com
Cc: Marleen Vos <marleen.vos@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marleen Vos <marleen.vos@mind.be>

The buildroot manual says this kind of commit should be done together
with the actual changes made to a config/board. But since a number of
changes will follow for some boards and configs, it seemed more
logical to make a separate commit for this.

Signed-off-by: Marleen Vos <marleen.vos@mind.be>
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 311dcd9504..810f853c64 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2053,6 +2053,12 @@ F:	board/qemu/riscv64-virt/
 F:	configs/qemu_riscv32_virt_defconfig
 F:	configs/qemu_riscv64_virt_defconfig
 
+N:	Marleen Vos <marleen.vos@mind.be>
+F:	board/stmicroelectronics/common/stm32mp157/
+F:	configs/avenger96_defconfig
+F:	configs/stm32mp157a_dk1_defconfig
+F:	configs/stm32mp157c_dk2_defconfig
+
 N:	Martin Bark <martin@barkynet.com>
 F:	board/raspberrypi/
 F:	configs/raspberrypi3_defconfig
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
