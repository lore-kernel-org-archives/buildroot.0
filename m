Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47138C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 12:06:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 951AC601FF
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 12:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 951AC601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FADA83E5A;
	Sat, 28 Aug 2021 12:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L_wnD2amAhXu; Sat, 28 Aug 2021 12:06:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02F9B83E5E;
	Sat, 28 Aug 2021 12:06:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6801BF319
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 12:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09C4C4280D
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 12:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_ZBBip9PVJV for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 12:06:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 426D24280B
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 12:06:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v10so14674282wrd.4
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 05:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IIeDw6/oY9J6SxL6ypq6GmYuRvU2oEZByNx10D2N5gI=;
 b=dEZWKE/MjECKS06kQNaW1Yuu8tv8GCJfSVkUbDWb+C10K4PIY74or+Ow66H7sUUMDZ
 Rm6BYZ09tOxcqrGgh0wTbv11l9MvE7hMdtB2gK0YJZoZopN+GDLLqWRJVdCcYcGqq9wT
 3DvshB710hNBKbIHyYqmNP9uuigkqk6guO6A/NBtCWCx0MWkzStwRZwhC73ZY4ouVaZ7
 eh1+1g6WZDiSoQlHHl3lgF3fllyVCeJY/esCZBqUaKT9f68933+8nHEaUNAwot+vYEYA
 A3e273xiI42b6DG5oX+G+daV0y5qffQVL42qdC3qi4A3fqYIch+WYqRLE8OVlaG2A5a7
 DeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IIeDw6/oY9J6SxL6ypq6GmYuRvU2oEZByNx10D2N5gI=;
 b=H2J+dXXEeXo5gyXUDh6XpzdG/o10QSL/vV4IuizuFzCsKu1vUhMu6qvXeLKIViraKX
 6ZyUtv2W7+YdeFNcNTim8Yt5UAMpv63B+WBvhrXIDXQ/UgJRHzaHO+ObY9WQU22jUwa5
 alaHWI/AhBMeRSqY+eh0TbLimFVueOZ7MbQaCGw0NSs8Pxy4qiWfmYcDXInQoaVURlzP
 BUBSca99DlqSMR2kKRgr5fk66U7lPum+AOtVTnf25iqdAYg2/++7L4GS2vWAl/L4GVG6
 CcL/ub/PwNUm5/ECozT4ZoU31s6HBqHACzCvCLAMVDeuWQ55QF0h1+H8zZGpv6qoaohF
 z3zg==
X-Gm-Message-State: AOAM531AwUXn8piaQWuPizM6kCW5yzOH4/wsSt6x5WpBXL2EMnjRxBRQ
 vPtWodz2Ifoq0k3jk0iecIrK0A==
X-Google-Smtp-Source: ABdhPJyrSLNM2XU4D/rfCTsW2SuC6qXGAuyRpOPGdqNwHR2BIjemD3Ycu2CFPIxV4RvC6L+KuO1UEQ==
X-Received: by 2002:adf:df0c:: with SMTP id y12mr15489192wrl.155.1630152388522; 
 Sat, 28 Aug 2021 05:06:28 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id z5sm13913371wmp.26.2021.08.28.05.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 05:06:28 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210827223432.1961888-1-giulio.benetti@benettiengineering.com>
 <20210827223432.1961888-2-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <86602fc9-9d62-0b7b-4ce3-25bf3de27254@mind.be>
Date: Sat, 28 Aug 2021 14:06:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827223432.1961888-2-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_83143
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 28/08/2021 00:34, Giulio Benetti wrote:
> ruby package fails to build for the SH4 architecture with optimization
> enabled with gcc = 9.3.0:
> http://autobuild.buildroot.net/results/f57/f5742e7fb6e8142bcdb53b7f4f5e9c1bea3558cd/
> 
> It's already been reported upstream:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  toolchain/Config.in | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index bf2bb3efe4..4419443930 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -133,6 +133,15 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
>  	bool
>  	default y if BR2_microblaze
>  
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143
> +# Error: invalid operands (*UND* and .text sections) for `-' on sh4.
> +# This bug no longer exists in gcc 10.x but reappeared on gcc 11.x and
> +# it still not been fixed yet.
> +config BR2_TOOLCHAIN_HAS_GCC_BUG_83143
> +	bool
> +	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_10

 The condition doesn't correspond to the comment above...


 Regards,
 Arnout

> +	depends on BR2_sh4
> +
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
>  # longer exists in gcc 8.x.
>  config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
