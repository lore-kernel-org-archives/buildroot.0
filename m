Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F506C4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:19:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D254F60C41
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D254F60C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B535401DF;
	Thu, 22 Jul 2021 21:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbvMJSSYiN_C; Thu, 22 Jul 2021 21:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A63401C5;
	Thu, 22 Jul 2021 21:19:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C435E1BF39A
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B39C982A53
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_Q7fjznhIbe for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 21:18:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA8DC82925
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 21:18:59 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id t2so8498981edd.13
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 14:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W+sqT3vpgyT2MNfnEn9WnYa7W4AYJsU5/pQSgA9VG10=;
 b=F7HwxsYghL0aLMdZSgL1lA2afyM2DcxuHc9ywduypn6B/YRFscQzKdHrjaj83M9E2z
 9wzpWuJUVCh2UJEzE1BzIMoHxsu9/ZL4zVPFR6pXUcCNFITZsAEzzsARHX9D3ffbGpan
 zbH3ct+5LeqYzG+ttC2+dADnpsC8wJ56/um0vxN/1nleGN0NCNbvhARrj35MlLKm1iSw
 KXU2us24U9BD3pwgxewYK1kTjHVooSbaARNpZuyOQccFSxfmhx6SGcwW/cRbm/Qe9zKD
 frKANlXExN9MCGU7NT/QUKEADWW/3jdpVYp96DyB8HFTc+Ninj3nHoP25HuHU7O5unTf
 wJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=W+sqT3vpgyT2MNfnEn9WnYa7W4AYJsU5/pQSgA9VG10=;
 b=Zb+P1SIBTlAiNts3TqchH/Fl4yCuqa7F4rQq8lFqBCrge7sWInQ2KdQys6jX1oKHWe
 mPZGRDKq0HkDhjqjwmhZlS7NxQRFW79sAeiwUgw/PoyV+4huyOZeAJysBlh2BayP0BZZ
 NTMXeW1qcJZ1Urwsee5oDiNQchFaVW7I2K3plkcqjHI5EdjauAW/SabR752fMOl+obNp
 s8Vpjwr5I3aYDz4LVfEtrtLeQyBo40fUy40LdgXXcCECYDebx/tXIMfSSNrpvfMg96qY
 kzCcq1Rg3kxjtp+Srr1H5n5rDetoLmwA5rdByp7Ek5SXZm2ZIauk9SnDP+VtwUNFmMeN
 VNOw==
X-Gm-Message-State: AOAM5320WQ94YBj4TLqo0yWiBssR6IE5o9MtYEl2W3In4n47MZoXeANx
 LQwDVC4tEjzzxeYhWn+foxu0Yg==
X-Google-Smtp-Source: ABdhPJyRGPAXH9gJ5gud9184lNXL+VyrQcrs9VqfmauPrRrl2FeLo3I0BS+rpJeQBlp2cdmcpIimDQ==
X-Received: by 2002:a05:6402:29a:: with SMTP id
 l26mr1789937edv.207.1626988737772; 
 Thu, 22 Jul 2021 14:18:57 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d19sm12940127eds.54.2021.07.22.14.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 14:18:57 -0700 (PDT)
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20210608194926.14477-1-ps.report@gmx.net>
 <20210608194926.14477-2-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <6e5aae0a-b4a0-edba-f817-ca6eabb05b64@mind.be>
Date: Thu, 22 Jul 2021 23:18:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608194926.14477-2-ps.report@gmx.net>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v1 2/2] package/libinput: bump version to
 1.18.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 08/06/2021 21:49, Peter Seiderer wrote:
> For details see [1].
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2021-June/041849.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 Why is this bump in two separate patches? If it's because 1.17.3 should be
applied to the 2021.05 branch, then it's better to make two distinct patches,
one for master that bumps directly to 1.18.0, and another for stable that is
marked explicitly as such with --subject-prefix.

 Regards,
 Arnout

> ---
>  package/libinput/libinput.hash | 6 +++---
>  package/libinput/libinput.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
> index 038859289a..de8e94f9fa 100644
> --- a/package/libinput/libinput.hash
> +++ b/package/libinput/libinput.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2021-May/041834.html
> -sha256  0d010e0bf601b5d3a06b3c4d77d67751cf554f3e6448e57aa046ea9ee8f818ac  libinput-1.17.3.tar.xz
> -sha512  3d1ab4362ede886996795d700a938d20e04cd922e8f9598fe9346f9f93e149119526fb324a096787b4b8a47bf3e5613130bcd874f10df86761031710d2acc792  libinput-1.17.3.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2021-June/041849.html
> +sha256  18c6a286583268d39841348e561fbb4713bde0c643b360f5d8a3f27800afdb9a  libinput-1.18.0.tar.xz
> +sha512  9a834f075d7a1f892416bb6b241eb052f749d3aa883c4b39c0f1c9616c115d6b9a541b587508646fddaf0d3fe57af92fe4629b522d1d51196499e7b523e0aa90  libinput-1.18.0.tar.xz
>  
>  # License files
>  sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
> diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
> index 8ce60c8639..32b822edb7 100644
> --- a/package/libinput/libinput.mk
> +++ b/package/libinput/libinput.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBINPUT_VERSION = 1.17.3
> +LIBINPUT_VERSION = 1.18.0
>  LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
>  LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
>  LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
