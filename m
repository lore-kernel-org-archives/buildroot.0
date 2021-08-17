Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660A5C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 20:34:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E156023E
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 20:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7E156023E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80CDB60674;
	Tue, 17 Aug 2021 20:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jLdiy1Lk6S5z; Tue, 17 Aug 2021 20:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 072F960699;
	Tue, 17 Aug 2021 20:34:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A58321BF95A
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 20:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D43F80D3A
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 20:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2MBzey12TI7b for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 20:34:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D505F80D73
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 20:34:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b7so33360039edu.3
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 13:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VL8iCNTwDMd9l1NdPR3SQ35D9uoGaShz0q6h0ngrH9k=;
 b=g3VWM1N7SYezgOvVbmHvcRbZvkBN49wxj3k0tvACtnJ9nOwu9L7EPSgaV359Af0DTu
 hFkA7S0u7oAEz5TNIATcqLdEL9OeLvyrp0eOcxuc0TElraxNn/P2CZYDbAQztvB6tUXK
 sZue2yrcXmlhcWIJoC9REqy4yO4G98viIM5zciELLK0urxY6sMX8nXpfxS3gTfrQLS18
 0R8QPMkGieGsgld0ESC84j3eUrnXVhppnOinJD5nCBB+xyUXsgxAxD56CIj7628AAsaZ
 VTowF87thd1TuzE0xdb04KE7il5j+vnIY3I9snAqaXvYpRTxPHCfwZkWLCqy4Jx7nZjb
 eeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VL8iCNTwDMd9l1NdPR3SQ35D9uoGaShz0q6h0ngrH9k=;
 b=lQlNRxq0OSRFHDk/Ex85Uy7NLKw/YYPSEj4FNqUncrpYyrWJCm0QRNtEJgP8CF9P8x
 Os56XEapAZhdGwmYdUtJ7YmXVkVVAokgBAk4cZNOBiFmv+YxGm/LK366S7heS1VLb0HX
 9TCXYW+MzbFVruVUuxv5zle9ji8EG9g8y0cWUxVH/KaM/jPIv2LBd0wPfA9rmNXIFGiP
 1lJM0Dn1Qk4w9BG14VZiFpwJ+2uV/718dz8Z+ZZCooarsq9+pxa83+6e0bcGxLClCtFK
 YPpqCOF4NNAoclQyltkXh6ooEGz7hRJwpJDiEx21YUK+9m71PggU4B0AGEC9JschPVMB
 b/zA==
X-Gm-Message-State: AOAM530+WW2VcPvakjzuM2BmUWFrdv5Wk7bUxbmPF9x1S6RIYLX1vdqX
 mi9ghGUtZSPNR2ONz/J+3FevlQ==
X-Google-Smtp-Source: ABdhPJx6SIrsmZws2Q5K0ul5ulMOH6l73ftq0EbPhm+g/g7yOyIfdO6KUmL4bK/TTIqcxUvKEKEigQ==
X-Received: by 2002:a05:6402:5112:: with SMTP id
 m18mr6023876edd.47.1629232445909; 
 Tue, 17 Aug 2021 13:34:05 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n16sm1497330edv.73.2021.08.17.13.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 13:34:05 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
 <20210726223435.2906458-2-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <b89f7acd-3549-f167-f984-b08a5a597a18@mind.be>
Date: Tue, 17 Aug 2021 22:34:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726223435.2906458-2-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libgeos: fix build failure
 due to missing -mcmodel=large
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
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 27/07/2021 00:34, Giulio Benetti wrote:
> When building libgeos for or1k -mcmodel=large is needed to link, so let's
> add that gcc option in case we're building for or1k.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libgeos/libgeos.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
> index a355732af8..43211d0434 100644
> --- a/package/libgeos/libgeos.mk
> +++ b/package/libgeos/libgeos.mk
> @@ -23,6 +23,10 @@ ifeq ($(BR2_arm)$(BR2_armeb),y)
>  LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
>  endif
>  
> +ifeq ($(BR2_or1k),y)
> +LIBGEOS_CXXFLAGS += -mcmodel=large

 According to git, -mcmodel was added to GCC after the 11.2.0 release. Are you
sure that this works?

 Oooh, we have a patch that adds it. But that patch is missing for 11.1.0 for
some reason. Romain, you apparently didn't carry any of our patches when you
added GCC 11 in 2ab88dac293aed5adf2504e8b182f9d8a306b935. The commit message
doesn't say anything. Do you remember anything about the patches? The patch was
added to master on May 21 and you only submitted the GCC bump on June 12, but
perhaps you already had it lying around for a while?

 Giulio, maybe you can port the patch to 11.1.0?

 Regards,
 Arnout

> +endif
> +
>  LIBGEOS_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(LIBGEOS_CXXFLAGS)"
>  
>  $(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
