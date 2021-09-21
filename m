Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02982C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:35:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CB5760F6B
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CB5760F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65AE640695;
	Tue, 21 Sep 2021 20:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIQVVVSSjCav; Tue, 21 Sep 2021 20:35:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B20A940652;
	Tue, 21 Sep 2021 20:35:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFD141BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B4FB400E9
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fIFAlkguNvl6 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:35:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CC1F400CF
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:35:42 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id eg28so1292669edb.1
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=cI0Yolr4I0cpp5FGrjYBjA66VhJM6q9rQQKxAD5HdYc=;
 b=LaHYeTV0+pbJ9zAOwvbRa9Vd8TjyUl5OPHdq0sHi+F2Vx766VLoLK1Nwj1DF7/JPPk
 8yjqDuDoEfeQieYatmTfU/ELBXZDfqkArnXbFRSNBMQuq0Ek0GP9DwIMX0FGW7oBulUR
 XVr0BUx2cBWZSSihLGaFhLUh3ruICkXJI5i1x5/GbYoOckXayLMh1q00+eKewZa75jvH
 ZwHtRoVrJq4drM4DAWH/m/e7ui+rnBqUlViX9m5gmBdc4X6sPOmldOgHXTM0ofLag5+L
 nCvwCGij8X94xADOPw9Os5DrRTMiBHFGoWZyrv79NrBkUUmO58S3SlVWaLDtKn4ae9Hx
 28tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cI0Yolr4I0cpp5FGrjYBjA66VhJM6q9rQQKxAD5HdYc=;
 b=ajDw9c119B4N77QTeO2/MOxSFRHsAVa89keKKQnWNG5BL3Gd9D34mHl2ZnKjmRC4Kj
 uUCg9176JLmbmCfaBhApx90nJrIbUvP3J5rR9T6GQMPr2WNqSznmdX30WbFOAFJnn1Zh
 FL8J/hh2QhM98GUsjbcf3NRB20ZkjgDrdeqrdzHyqPGZ13octno3hWA738H2RuC24n0G
 CeukiPQdZh47a9UiNilIQYNYCfxkopMr2JWU4+jhhZEThcE6lXi5j/jmX4m4uKDvSTnm
 nXDnRc4MvwuxsOKL1v/3Z+w/kpsgmkvBacRKSPLsqurKDlooB9obui7FMg6t8gtRdMHe
 zqUg==
X-Gm-Message-State: AOAM5321hjy0iR3y3MXcrEzn2qofAKU3VFyZyanlmk89t/TJ9D3uzBUu
 pjKxv/3++54oJjaN3Up4x3cF1g==
X-Google-Smtp-Source: ABdhPJwDSQyviHvEJqtnJb5lL/gjw97jqpEVkwhhJ2MsR/Az+9dWEzWgR3wVGM/Mc2rNF/VOyoMGXQ==
X-Received: by 2002:a50:d94c:: with SMTP id u12mr18364256edj.371.1632256540690; 
 Tue, 21 Sep 2021 13:35:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h13sm8810edr.4.2021.09.21.13.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 13:35:40 -0700 (PDT)
Message-ID: <f90d298e-25c0-5dac-93e8-e477caaf4e4f@mind.be>
Date: Tue, 21 Sep 2021 22:35:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210912100455.1351513-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210912100455.1351513-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/diffutils: bump to version 3.8
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 12/09/2021 12:04, Fabrice Fontaine wrote:
> - Update indentation in hash file (two spaces)
> - Fix the following build failure with glibc 2.34 thanks to
>    https://git.savannah.gnu.org/cgit/diffutils.git/commit/?id=498f88de4de761c1b5741fd8c78d4f5db9f3ce8b
>    https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=f9e2b20a12a230efa30f1d479563ae07d276a94b
> 
> In file included from /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
>                   from ./signal.h:52,
>                   from c-stack.c:49:
> c-stack.c:55:26: error: missing binary operator before token "("
>     55 | #elif HAVE_LIBSIGSEGV && SIGSTKSZ < 16384
>        |                          ^~~~~~~~
> 
> https://savannah.gnu.org/forum/forum.php?forum_id=10031
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6abde124e3124932d3c14d3b699f0572a2f4632d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/diffutils/diffutils.hash | 4 ++--
>   package/diffutils/diffutils.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/diffutils/diffutils.hash b/package/diffutils/diffutils.hash
> index aa91fd4316..8cf4eb75c7 100644
> --- a/package/diffutils/diffutils.hash
> +++ b/package/diffutils/diffutils.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -sha256 b3a7a6221c3dc916085f0d205abf6b8e1ba443d4dd965118da364a1dc1cb3a26  diffutils-3.7.tar.xz
> +sha256  a6bdd7d1b31266d11c4f4de6c1b748d4607ab0231af5188fc2533d0ae2438fec  diffutils-3.8.tar.xz
>   # Locally calculated
> -sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
> index 107de79383..db8a5070a9 100644
> --- a/package/diffutils/diffutils.mk
> +++ b/package/diffutils/diffutils.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DIFFUTILS_VERSION = 3.7
> +DIFFUTILS_VERSION = 3.8
>   DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
>   DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
>   DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
