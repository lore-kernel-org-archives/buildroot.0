Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6BAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:35:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 470886103D
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 470886103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08CC1400CE;
	Tue, 12 Oct 2021 20:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZtg635y8MGG; Tue, 12 Oct 2021 20:35:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DCF040104;
	Tue, 12 Oct 2021 20:35:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 801C01BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C736607F6
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j1lTmd2Vy824 for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:35:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 906736062A
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:35:51 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id ec8so1073278edb.6
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ovvlzHBcZB/YgYy7OXO8pKYdPUHLosucg21KycTgCyY=;
 b=L0eUcqAL6w46Gcw/Vg4DYX04j0hinegjnfV6RtzQnBv9cb5PWybkr71mrc9FDXft63
 BCTVKNcjhZ31rCvNT0E7f3ViFY6gEOIYugkg+XTrcI9yXnBiV/sYt3x1Xt6f4hO2zvjg
 gz5IYSIHBssifsQpu7zUis/z0oa7EgK+tX/6YB2uhNvhCQpPi6pwTlPivQ+xYNEEDFo2
 +2FcZJkwDGOi5CgZ3B+IMpUc8pVSzcG3VUPxXw8qlGy+gGqYGep7oKV0BoDfJjZhj0Ui
 Xc1o5ggJ5OcIZeuOKZ6m5P82/FF8V1zYv4e0cbuttz2Mpi1eFiqbNbjgIlOq+H+OKPaq
 wBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ovvlzHBcZB/YgYy7OXO8pKYdPUHLosucg21KycTgCyY=;
 b=2hQI35HhtDTFo0OK0bqGia62WvWzUNb59bUFFylQlz90aKjZsKk70Yd4gH0rKmBfsc
 gxppKav3bpEhQHoNU0SKThqB8zqxTj4S7SajiXkd0/Rv4u9NCEEVV0Fiig9Zq7tjjjgi
 aW/vaVPKoELvCE9S8w7H/sVVq1pz1LHGcnW11pi7DDGLSeGJrjCEm+BDvg5JbvtF8Kpu
 gkkJkyNiDkfLhFrjfybea55zlp92QbUNLSWPe8Uxkj0GqGCHUWaR+R9X5xAURpOHGOio
 iHUagQM6VUdCYOyY3joNhFtdv/kN7PsG5qpesJacbU/+iFkxCEbvR/LVl/zGIewhh8tH
 EFPw==
X-Gm-Message-State: AOAM530DmG/6Io1Uff0/54+TJyxDW/F3WTUvw8IEASmDZ7JiVxwPNsVi
 GRXoE6Wl62U7Ep2/NJMivDZp4XqEqw+fA3ut
X-Google-Smtp-Source: ABdhPJxCi+RrWZmEgAWUgN0dHi2k4Sg1DsXybtkRBK7AqGSPlAkobn4qVZBraPiOdy9IKzVQ/KJpQg==
X-Received: by 2002:a05:6402:280b:: with SMTP id
 h11mr2988851ede.78.1634070949573; 
 Tue, 12 Oct 2021 13:35:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y8sm5401825ejm.104.2021.10.12.13.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:35:49 -0700 (PDT)
Message-ID: <b0e73c27-3014-af22-c93b-e420746f49db@mind.be>
Date: Tue, 12 Oct 2021 22:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20211004202528.50828-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211004202528.50828-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH] package/grpc: bump version to 1.41.0
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
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/10/2021 22:25, Michael Nosthoff via buildroot wrote:
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/grpc/grpc.hash | 2 +-
>   package/grpc/grpc.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
> index ed773c59d7..26d0d315d8 100644
> --- a/package/grpc/grpc.hash
> +++ b/package/grpc/grpc.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  13e7c6460cd979726e5b3b129bb01c34532f115883ac696a75eb7f1d6a9765ed  grpc-1.40.0.tar.gz
> +sha256  e5fb30aae1fa1cffa4ce00aa0bbfab908c0b899fcf0bbc30e268367d660d8656  grpc-1.41.0.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> index c61f90be7e..1bb4bd2b98 100644
> --- a/package/grpc/grpc.mk
> +++ b/package/grpc/grpc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GRPC_VERSION = 1.40.0
> +GRPC_VERSION = 1.41.0
>   GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
>   GRPC_LICENSE = Apache-2.0
>   GRPC_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
