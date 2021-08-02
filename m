Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7C0C432BE
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 13:52:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723F661186
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 13:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 723F661186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=troodon-software.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4726783AD5;
	Mon,  2 Aug 2021 13:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g58AiDiCla2a; Mon,  2 Aug 2021 13:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D60A83AAF;
	Mon,  2 Aug 2021 13:52:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 205B01BF59F
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 13:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F6D4404B9
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 13:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=troodon-software-com.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKbydU3Ht6P1 for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 13:52:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CB2540467
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 13:52:26 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id 184so16605873qkh.1
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=troodon-software-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LKaHAyPRqBD4MxcTyzNsLGIo+6KZrz1Rwd0KZR1fa2k=;
 b=TeFM4i0U4hhmrPTQnRIeCDcXv7mfe4KTqhwDBSpFs+SOTt4uD+w4oQPkowXLThuraK
 K+48K9QWhENaEbvi5yisx2LiCrUthWCirc6y41/+0EeRX2ywLzNH4Ou6AcR0Ie08+8ir
 bm1dDVTt7ZIggjjXwiLt3sGHf/pCLECdmAqOh6kclxENqxCozuo2sw7xjPAT2zEMeAaa
 hAKRx/iATx8dtrJ40Q1vbr7g9YGW5DZm9LD5f7b/W5LI791pcpvo5T3SsrHfjTPVy6Ne
 Inzo1Ev+gWBmE3SD/wQ42gvy0PWdEFOtlbWqn/tnOp+YPFAj4OaF8rKfZTF5To9cRXJq
 VyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LKaHAyPRqBD4MxcTyzNsLGIo+6KZrz1Rwd0KZR1fa2k=;
 b=CLo7LQW7EGGl53mLNTtimO+ukRnkIPmtkVSGcq1Yoe+djLYT5IE3erOS7doj6RubOx
 iUR4wJhXJFRRiVxabWTliQJ88/mp6QuojaUrANMgrm04evCeGvushGJ3S6ODoLU8tqwN
 5AS/PGaLb3wUA4kEztju9gSiFh+JqthBQkO0nbaBXZC95/iqJwXrfkUBjHXUezuCwZya
 VT3sQuLRTpt1iQMZvFCXGqHYGDznMbrJadLJ/pHdZJHD7r6k1sq2ODrYnU3FJoyNYgpQ
 U8Dn4d6P4zWEsI2r3jSQenKr6buhAxNohT+m/BpX3AuBtZASszDSa6bHQ/NSLRgaFoG1
 JtjA==
X-Gm-Message-State: AOAM533wwusPaBQsiX8n9Jqahv1kA8ALxtXDA2H+FgdAQ5iDoL0WMuXK
 MegqNL3v7U/NKIOC53ugAmzjjyXw5brPtn0/rZs=
X-Google-Smtp-Source: ABdhPJx4Ihj96fRx4ye0ypimxNiw2wLYnyU1M/N0GFBmioe0l8nh91/RwRL5HDq2q/9egKqRacejvQ==
X-Received: by 2002:a05:620a:b1b:: with SMTP id
 t27mr15417865qkg.460.1627912345111; 
 Mon, 02 Aug 2021 06:52:25 -0700 (PDT)
Received: from sprint.hunleth.lan ([2001:470:8:3e7::18d])
 by smtp.gmail.com with ESMTPSA id g11sm4638401qtk.91.2021.08.02.06.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 06:52:24 -0700 (PDT)
From: Frank Hunleth <fhunleth@troodon-software.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 09:52:03 -0400
Message-Id: <20210802135203.3059317-1-fhunleth@troodon-software.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/erlang: risc-v should only add
 risc-v
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
Cc: Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This restricts the Erlang RISC-V update from
0bab8c1089983a4b5f0f2acfe5cad77b02d6f654 to only enabling RISCV_64
rather than enabling builds on all platforms with toolchains that
include atomics.

This fixes build errors on SPARCv8 and other platforms that look like
this:

/tmp/ccD9Q9F7.s: Assembler messages:
/tmp/ccD9Q9F7.s:230: Error: Architecture mismatch on "cas [%g3],%g2,%g1".
/tmp/ccD9Q9F7.s:230: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)

Fixes:
http://autobuild.buildroot.net/results/a57/a5779e22c41eb63b8400409f26f96b924fdde1bc/

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index b6b100f38b..15931b5896 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	# __atomic_* builtins
 	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
 		BR2_sparc_v9 || BR2_arm || BR2_aarch64 || BR2_mipsel || \
-		BR2_TOOLCHAIN_HAS_ATOMIC
+		BR2_RISCV_64
 	# erlang needs host-erlang
 	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
