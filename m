Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2080C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:39:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C69A61041
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C69A61041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FE3360755;
	Thu, 14 Oct 2021 21:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8wOdzLCyI5C; Thu, 14 Oct 2021 21:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2E7C6074A;
	Thu, 14 Oct 2021 21:39:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04ABC1BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69C5640255
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7TbRUtzz2Ob for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:39:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89DF640114
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:39:24 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id ec8so29798990edb.6
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=l1du2xdDclBDI5bIaMKH/MaCMCQWA9nZQJ+QU89cAfc=;
 b=bP9K5ugpNvYEBx4UtX4eq6Ag0DL2iK0TvvPOIFYrV8W5bRs+Z6x8BPAYRYoqr+E106
 FBxnV9zWrlcGphvHmZ1f88MxId5p5SHuMwPWTAgbAkl9cRy/OdSydtL6KGzEhExOhur0
 Mh2RR8oSR58WfHwUU+pzbCYL73E0/5o25XG25j1hXqTbolHt3hmz5ZFVSWvkjUhxkvEM
 ooUqknjnFFQXjv5eSo+MAQS/JioYvHX9zUN5jm0p5ObHaOujLw0WlzB45NDY64bRlqPF
 GcNSnvbDAjLh9zy4k2pCZ7hhPeHw/uBNItICUqJ5HPzfyivQCLGMtLL1FolbcykvbyFp
 ZeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=l1du2xdDclBDI5bIaMKH/MaCMCQWA9nZQJ+QU89cAfc=;
 b=RynICJE/AEhUwZOYR7gXswavsmMEOY8J1EG9BG7Qw0ZO4C6aYzHINIMdLIRWwzMycw
 7HN4J2k3ccDxLTaB6axYe+hbLlCoT5g1v9hO4Dneqepwb6HIzZEyqMFoHNH3F9tJn6+k
 d6b42QjyIJIq1zo2FllWxMf3b8lcL8ycsZz2S3EdSucM+LR6yn+BjOAp/mVMIOnXNWoL
 ak5bOxWIPpYkoxdsRXi+UoNCWSoRVsGp9U05cjO/N0nidv+S06xX+ZiPBnSMUT9yB4v+
 lp0qhf/fvvc2g8myl2ldFdu+SQUpz0EpYPnGflMPNXBfFGc4T1E0+IpmXquyEftVSBFG
 O0hQ==
X-Gm-Message-State: AOAM5316Amg9uNW1M2zi+wM0Sl3hPEKIrtT5FyDn9X3L1p9bnyqKMYBP
 AC1kN1GKfDQgYwp+e6H06dCA+g==
X-Google-Smtp-Source: ABdhPJzkrzuks0gxJ8ESNg9h5CSqo49oifhYv/p5SejHBEHSiIFFle4ylkf/z15Y+aOvc0frXJqb0A==
X-Received: by 2002:a17:906:6a1d:: with SMTP id
 qw29mr1865746ejc.147.1634247562762; 
 Thu, 14 Oct 2021 14:39:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u18sm3181115eds.86.2021.10.14.14.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:39:22 -0700 (PDT)
Message-ID: <de7d66ea-c6a8-5352-0a42-47db0d114131@mind.be>
Date: Thu, 14 Oct 2021 23:39:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20211010061300.469361-1-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211010061300.469361-1-troglobit@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libuev: add myself as
 co-maintainer in DEVELOPERS
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
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  I changed the subject line to:

DEVELOPERS: add Joachim Wiberg for libuev


  Applied to master, thanks.

  Regards,
  Arnout


On 10/10/2021 08:13, Joachim Wiberg wrote:
> Adding myself as co-maintainer of libuev alongside Peter Seiderer, his
> initiative, and I am the upstream so seems logical.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7ebfc9234b..f8cacc3d10 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1331,6 +1331,7 @@ N:	Joachim Wiberg <troglobit@gmail.com>
>   F:	configs/globalscale_espressobin_defconfig
>   F:	board/globalscale/espressobin/
>   F:	package/libite/
> +F:	package/libuev/
>   F:	package/mg/
>   F:	package/netcalc/
>   F:	package/ssdp-responder/
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
