Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6AEC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2240410A0;
	Sun, 14 Aug 2022 23:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2240410A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lScZigvStlx8; Sun, 14 Aug 2022 23:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88EFD408BA;
	Sun, 14 Aug 2022 23:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88EFD408BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF7D31BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6110408BA
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6110408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VVurPWwzsyvg for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F03BF40298
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F03BF40298
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:32 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id m67so5820534vsc.12
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=H4DIz+wjmaqauWFen839SdvwoZNbJTlvtOrvRKBGX4k=;
 b=bdsmzX/ZWa1JKU3RG+eGrGYbfcjlkwshURNl/8PL6SFIpRoujhZxLWHf6qXTDzoBc4
 ZRhZp5t97at1Gh7BswCgoFlQyoWvxt5qtE4juw0+qo39BNbQrVso/uhkc2V0+Y/GNrnV
 vf9Xelbp4WBpin2j0CNUorGrEliIo7TzClVsFYURH9fIabzgFp7UJ1ZR+tZZ/F4ue0mI
 u+ZYSTHITPGC7ldRmdlI+7gW/N/VF6YCUf+Lg2AZi1gcavCKv9GAtMA4+F+QFIVa+S0P
 6XS3UnI3vSKvvdgXjAsXrzZEYxtS02heYlu2POZbPPGl0dauLrDc6LHkj04bRrHy5Q9M
 GOUA==
X-Gm-Message-State: ACgBeo03jVq2QhvvWbXjMTSf0chqRX0aGoo/j2zmpUCL/zZqu+q6a45Y
 HRIglvQhANA0r+/yt6NOZMV3B45ALTU=
X-Google-Smtp-Source: AA6agR6gjxbLezjuspnbBb5hh23VHVIC6gzojxzCiWc61AM6FRS7++o47n1idHChHTUSd6ZEnPFxEg==
X-Received: by 2002:a67:d71d:0:b0:387:d4bf:1578 with SMTP id
 p29-20020a67d71d000000b00387d4bf1578mr5270782vsj.13.1660520371778; 
 Sun, 14 Aug 2022 16:39:31 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:30 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:18 -0300
Message-Id: <20220814233845.2247022-7-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=H4DIz+wjmaqauWFen839SdvwoZNbJTlvtOrvRKBGX4k=;
 b=ZdNADm7+xiUbBR7JOgq+BZerSd7WlLG9ijWvtmVe7MM1L7Bdf17sDTDfmN93ztJ8CX
 k/2LoiCiAC3NbmWQIegePyalhnpyDCm6pLZxtqC0KsHo+lhZiflypRMdgDlRNj1GIUjW
 YT2jKZ1V0oKk6nLWdXHJeSXBZFaeKkPXw2A4KLq5NSfLUfnz07pilMg7+GMfFgU+EUyd
 C9JfPM9cGjLyxieZoCpTA5Dys4HKqfXLHeGAi0Hn00NxwnxOiNZJjvLhatMhLmlIGZDc
 t5XO4/R0HgVoZaKuOCVYJPjl2IZbY0iERjGO2V4QgCp+ctn8w6gOVWR5fIiIBtdBMrKA
 0QlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZdNADm7+
Subject: [Buildroot] [PATCH 06/33] package/kvm-unit-tests: do not use
 "select...if SYMBOL=y"
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All other occurrencies in the tree simply do:
select SYMBOL1 if SYMBOL2
instead of
select SYMBOL1 if SYMBOL2=y

So do the same here for consistency.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/kvm-unit-tests/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 7658877ce9..02ea8dd58c 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 	# x86-64 we use the host gcc (see .mk file for details)
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
 	depends on BR2_HOSTARCH = "x86_64" || !BR2_x86_64
-	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64
 	help
 	  kvm-unit-tests is a project as old as KVM. As its name
 	  suggests, it's purpose is to provide unit tests for KVM. The
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
