Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF05C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F394861B49;
	Sun, 24 Jul 2022 12:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F394861B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id na5vG3768v8G; Sun, 24 Jul 2022 12:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DA6061B45;
	Sun, 24 Jul 2022 12:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA6061B45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D37DB1BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE25284BA3
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE25284BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jw6g84EqfsfF for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:30:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2AFD84BA2
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2AFD84BA2
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:30:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d13so4667095wrn.10
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qP48IgOLptzLlDpsu2KpuzQRexU9jn4RJv6yssbyKDg=;
 b=Y3lgPqmOASybM0RncENZheIYD4QwwIV2M49KTew3PC5yYRa4w6q3QtpBqr3TG8TPQC
 4Ima4CmCq6uTykFYBRzllO6zKmlnwYG8+5rD9d38VTHFCw30hKEvWy4il1bAX0t7686A
 GfH+wo5G+vKtY95ROEZ3i8HVuw15BoaquVYvIUZQ3qq153/hFCLu0KgcPCq+lmn1/8rd
 Bc4wwcZVwDzU56Sl8iBnmtSdu3uQtOEEpqyg+p4vK+PErh6u0c1AH461cWeoz4QINo9t
 jP99CZg1JjSBWul7VjtxhJA+EEJxNLUJf1JY7H9veCado4RJSdLjP75vgwzk/QxApBQ5
 FPbw==
X-Gm-Message-State: AJIora9I6qp+Czc5vH7gbTo14cE8eX66cJ7jV5osE9X2VLpvb1RcslNj
 3JG838ZBhoZmLP96ZY2VFBy4KGtyP1axkA==
X-Google-Smtp-Source: AGRyM1uz980qFom6kudNPCDwbPnLm1GX0Nq+181h+SUDk7VJXJCx/w3AI57vMzqzACsN/a/1I46SuA==
X-Received: by 2002:adf:f4d1:0:b0:21e:484e:ac59 with SMTP id
 h17-20020adff4d1000000b0021e484eac59mr4825164wrp.125.1658665841655; 
 Sun, 24 Jul 2022 05:30:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c304b00b003a320b6d5eesm13792307wmh.15.2022.07.24.05.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 05:30:41 -0700 (PDT)
Message-ID: <5d9492ee-42d5-3657-4e3e-2727d187a1d0@mind.be>
Date: Sun, 24 Jul 2022 14:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220724091004.4810-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724091004.4810-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qP48IgOLptzLlDpsu2KpuzQRexU9jn4RJv6yssbyKDg=;
 b=ZpW3HVbCHIoMQ/AT+iAWsCHJ+WppTQ3xvkrrnX4l6UPtbzR0fXMCJO69PV4QCapZzl
 xQa1LOxxo+7Y0thLiuh1X1cvMnCzdlIZ5ZoTr1nuQgumEvMz7/1YGvgQZnfTY3jerKS0
 Hd0DSR72Md7jMI7TlzJa4GddGisMPWgGunkXsrp8Ab8KWZ98BlS30RhAfkkJwyKOE/N6
 KbEKZRNXBcap0K+KPkiXwIzu4lSi4a5uQ6Js5MEygwk/fB4FMYkgqbiGR0IRjdpfpT99
 EL//pc2FwTEOqcHW2afUpMrDXqkx49LzmIus58kF0NNFXet57zYq1w6pQ23WdU6EnQrg
 8RvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZpW3HVbC
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: security bump to
 version 16.16.0
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 11:10, Fabrice Fontaine wrote:
> Fix CVE-2022-32213, CVE-2022-32214, CVE-2022-32215, CVE-2022-32212,
> CVE-2022-32223, CVE-2022-32222 and CVE-2022-2097
> 
> https://nodejs.org/en/blog/vulnerability/july-2022-security-releases
> https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V16.md#16.16.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nodejs/nodejs.hash | 4 ++--
>   package/nodejs/nodejs.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 716becccc9..12ae449ab4 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,5 +1,5 @@
> -# From https://nodejs.org/dist/v16.15.0/SHASUMS256.txt
> -sha256  a0f812efc43f78321eca08957960a48f5e6bf97004d5058c8dd3b03c646ea4f7  node-v16.15.0.tar.xz
> +# From https://nodejs.org/dist/v16.16.0/SHASUMS256.txt
> +sha256  145151eff3b2aa5ebe73384009c52271a83740ae687a93c98c628cd7d52736eb  node-v16.16.0.tar.xz
>   
>   # Hash for license file
>   sha256  6211cc77f9ceaf365db12faf050775b3a1e6da7a1eff3577ba006c4918103c33  LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index cfd9295d4e..3154dcd7ec 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NODEJS_VERSION = 16.15.0
> +NODEJS_VERSION = 16.16.0
>   NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>   NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>   NODEJS_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
