Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C88C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:34:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5B661211
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E5B661211
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1482E608D2;
	Tue,  5 Oct 2021 19:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZdhC4HADRtV; Tue,  5 Oct 2021 19:34:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C724607A3;
	Tue,  5 Oct 2021 19:34:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3489E1BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07A20407C1
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErCYQGwMANq5 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:34:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E13464024E
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:33:59 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id l7so905184edq.3
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 12:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aQuEeFYirH8BQ6xkapXEDmzeqOarqiHS+HwtwT91Pow=;
 b=D/3u+nimJju43zFhP+j4aKvSBkS9FFvQFZpUyBpSK03uPfwQapuIzkNQVy+Gsb6zmq
 RAUPb/jq0hkZES9mEJXfHgNtKxdmm5vKY/DloCst2e3E9yjjeKSiIzhCvTc3wHWRCGtr
 aH/yq8S/0GE+rt9LI+MUp5Ial0Nlpd/X4S2VBbqV3ClkUkGlUt4iigqe6Msy7kSa9IgU
 qgMDZhIw3thbbn3BJ+TvQXe/b3t3BJvjfeD4U7nx79UoH1okghWCdjAYqx7UlIXEn95f
 CL98Oh5o956zPMS0cV/aJE7rTDSExiiXibieGluR8AzqTZ0ICweBqnqXpPqUbABgI9s7
 oO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aQuEeFYirH8BQ6xkapXEDmzeqOarqiHS+HwtwT91Pow=;
 b=APLYnVH2Czep4V2NRwcAcymvkDD4xCi0i85NVGzRreHk0TYBy9ZIWokxb1uLKakwxY
 o5/3jRkVGylkRfou56TA9fFg/XDuY+f6cyBLQPKW4Ym2e11MhPRMX1aFHY0Sg8a/bLDj
 TShknis0OpJs1YF7eDGtE171qspOuQyaJ+rM0Z9nXv0Fuj5w5axcHLX6k3d6E8aQHvsT
 0vqH+9SeVEyTCfRYnjdRnrvWNFL8SaIUBDLWhkrdqX3KDLEUDx0vw4oay92hwt6JCCmc
 7jAZju4XD8xQbOJbGc7Cpda3ybZr4rPcRSgoRLEPHAMCNaDBPpfzXG7/PNpDIZ8g+CaT
 VqPA==
X-Gm-Message-State: AOAM530xpT1ViktM2lCOpo8ih2LGo66cehNs6Pcj68HlS6zM/os48W8M
 LtorSG0tvgeouhq8zUQY6QP2vpIArbKlg4we
X-Google-Smtp-Source: ABdhPJw7p9fv8LHc2OEg8EJhVADlWvXV0HxAFB1VXhD8+uHLcG6KOOdYOBhjdVPo7RfWhKbdewh5ww==
X-Received: by 2002:a17:906:a2c9:: with SMTP id
 by9mr22427959ejb.305.1633462438058; 
 Tue, 05 Oct 2021 12:33:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 6sm8212382ejx.82.2021.10.05.12.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:33:57 -0700 (PDT)
Message-ID: <4e27ebb6-413f-e886-f150-158436dfb6e3@mind.be>
Date: Tue, 5 Oct 2021 21:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210927164306.1488012-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927164306.1488012-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/3] package/autoconf: bump to version 2.71
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/09/2021 18:43, Fabrice Fontaine wrote:
> - Update hash of license files due to links being updated:
>    http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=61024bf52ba8a58f8992490134280eb9575e2525
> - Update indentation in hash file (two spaces)
> 
> https://git.savannah.gnu.org/cgit/autoconf.git/tree/NEWS?h=v2.71
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  All 3 applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/autoconf/autoconf.hash | 6 +++---
>   package/autoconf/autoconf.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/autoconf/autoconf.hash b/package/autoconf/autoconf.hash
> index f53e8979c0..de0840dd84 100644
> --- a/package/autoconf/autoconf.hash
> +++ b/package/autoconf/autoconf.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -sha256	64ebcec9f8ac5b2487125a86a7760d2591ac9e1d3dbd59489633f9de62a57684  autoconf-2.69.tar.xz
> -sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYINGv3
> -sha256	23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2  COPYING.EXCEPTION
> +sha256  f14c83cfebcc9427f2c3cea7258bd90df972d92eb26752da4ddad81c87a0faa4  autoconf-2.71.tar.xz
> +sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYINGv3
> +sha256  1f1cde9fb68b9b3cff18c420894bec5bd4defacd700b7d13df54a887301e5350  COPYING.EXCEPTION
> diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
> index 336ac59b42..5742ea6c55 100644
> --- a/package/autoconf/autoconf.mk
> +++ b/package/autoconf/autoconf.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -AUTOCONF_VERSION = 2.69
> +AUTOCONF_VERSION = 2.71
>   AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.xz
>   AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
