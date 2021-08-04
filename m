Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB286C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:46:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40D1F60F14
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40D1F60F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16ADA83C64;
	Wed,  4 Aug 2021 20:46:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3LqAekiMmD-p; Wed,  4 Aug 2021 20:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 663FB83D0C;
	Wed,  4 Aug 2021 20:46:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1F441BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC5A683D3F
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Lp1EMJA9P8P for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:46:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27FA483CB3
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:46:05 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z11so5181837edb.11
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h0kyoVJkM+Tx47NF8lwnf5VaMgRUAlQi+KRfvFDsYdE=;
 b=d+L9kJpulv2woSSDU3nk5exJQzJXj/1BfcmqdRPt5PnAER8MUt6Q9IoZAM7Vr1hi1W
 t5N97ocwBFH6bZkGYWIgzSRvh+XIbdUH0k8wuSnyrUYg6SONWEmQAs12/0mmReP4hl+T
 fIjcL5/FNu05WntIJQBNUiv8ij5HnR5T1YRZe97mCGKhFmVm/Ps9UHMyu8YV68Lx3BgA
 ri7uJ2+NPKkmnj0VEnasX2v7GPFaKOPtC5oSqd9xFuQa02XPcadM/z0UVYSJB5ZNGrtG
 Op+UbG/wOl6aGSUJKs+f7QCxdkT94LzKxYtGLYTl6u64flUqtJ0Z/GqbtchYd4JKn3ht
 cevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=h0kyoVJkM+Tx47NF8lwnf5VaMgRUAlQi+KRfvFDsYdE=;
 b=pnJe+mhgiuCPE9aeXxSSD13D06G+QdwnzWN87bBDOJL/5Gz2uuHusU8d2TF19h17u2
 mA5vPNwQbRp0phzJWk2ppk2Vk/fSPSMMn2YpFFWl4l+rDAZMHPGkiNHQfosZqymKqFI0
 fdSLrS2owRzWGYCwwTT9uUHcJFyxGk9VrG5TKY+MsxjpSwSFaNQ1kRZDATjN3uaff7Ti
 WdmKubzSABohaPncTXHoLMHipZyeBLCn53tprl+aKVMddeM9P7rjRykDV0HYego1mD8+
 9cYFk+8VHyU+R/F2TH4wOlmGY2GgSG/F20H+aAKIbBA9IbIcWkL/JBxCbKJVGZCrxeHe
 Y3Mg==
X-Gm-Message-State: AOAM530obEmJVgOHXmZ2Jlz4NKQY1DhriLTf5RxfFxrcTVXY5zcmc63s
 Oua0sGMwW7eC3V/Dni8S2AG0CS71e7jhWThedDk=
X-Google-Smtp-Source: ABdhPJzT2RAvCowQxpVpmWG3NrvXObKmp1BLfiFKEkCi4FzNEw+BIXzW8/gGFBA9SXlvMbkWSgYzyQ==
X-Received: by 2002:a05:6402:4246:: with SMTP id
 g6mr1876938edb.95.1628109963159; 
 Wed, 04 Aug 2021 13:46:03 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id n17sm1358550edr.84.2021.08.04.13.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 13:46:02 -0700 (PDT)
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
References: <20210803081615.879069-1-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a67de0fb-78da-bbe6-e2f7-a58c126ee43c@mind.be>
Date: Wed, 4 Aug 2021 22:46:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803081615.879069-1-joel@jms.id.au>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/pdbg: Fix alignment error on
 autobuilder
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 10:16, Joel Stanley wrote:
> The autobuilder fails when building for sh because of an alignment issue
> in assembly that includes an external data file.
> 
>  http://autobuild.buildroot.net/results/457b88c4ba85edb42b3a36cce48bf90712f590bf/
> 
> This fix has been submitted upstream.

 Has it? I'm looking at the PRs and issues on github and can't find anything. Is
there some other upstream that I can't find?


 Applied to master regardless, thanks.

 Regards,
 Arnout

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../pdbg/0001-template-Fix-alignment.patch    | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/pdbg/0001-template-Fix-alignment.patch
> 
> diff --git a/package/pdbg/0001-template-Fix-alignment.patch b/package/pdbg/0001-template-Fix-alignment.patch
> new file mode 100644
> index 000000000000..e95d8344e2d6
> --- /dev/null
> +++ b/package/pdbg/0001-template-Fix-alignment.patch
> @@ -0,0 +1,39 @@
> +From 0080d0a64da274207bc341491f87863952bb6e3b Mon Sep 17 00:00:00 2001
> +From: Joel Stanley <joel@jms.id.au>
> +Date: Tue, 3 Aug 2021 17:28:17 +0930
> +Subject: [PATCH] template: Fix alignment
> +
> +The assembler complains about unaliged data:
> +
> + ./template.S: Assembler messages:
> + ./template.S:21: Error: misaligned data
> +
> +If the included data is not an aligned size, the the symbols following
> +will be unaligned.
> +
> +We lost the alignment directive in commit 5f3deee1289e ("template: new
> +libfdt requires 8-byte aligned fdt"), so add it back as it was before
> +that commit.
> +
> +Reported by the buildroot autobuilder.
> +
> +Signed-off-by: Joel Stanley <joel@jms.id.au>
> +---
> + template.S | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/template.S b/template.S
> +index ecf9bba0656d..df8c064d6bc0 100644
> +--- a/template.S
> ++++ b/template.S
> +@@ -17,6 +17,7 @@
> + SYM_START(SYMBOL_PREFIX):
> + .incbin FILENAME
> + SYM_END(SYMBOL_PREFIX):
> ++.align 4
> + SYM_SIZE(SYMBOL_PREFIX):
> + 	.long	SYM_END(SYMBOL_PREFIX) - SYM_START(SYMBOL_PREFIX)
> + .globl SYM_START(SYMBOL_PREFIX)
> +-- 
> +2.32.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
