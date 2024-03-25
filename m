Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CAEC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48319608C1;
	Mon, 25 Mar 2024 22:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aer6wWffzYM9; Mon, 25 Mar 2024 22:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C67608CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57C67608CC;
	Mon, 25 Mar 2024 22:36:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72CCF1BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F9EA608CC
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8W_W49EFSzvz for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDF76608C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDF76608C1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDF76608C1
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:36:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4148cd86470so3455585e9.0
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406208; x=1712011008;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FwRDuY5UndIE89X6MgWk8c9rgYdTJIWBWnrSvJAImCE=;
 b=Bw1fV0hgBrd/ipQWa94XVPyoLLZeOfzdCLriREPFDoILoGbG3e+n34GetbnSJ7xy6+
 29lMf1FMJAdkq1kutcpQlK0pmvDR+BFT19VU9yRq7GOPEDShMK0AC/DcsiKq9JgbMHNT
 yypq2HsOl2TdlbXgIlgo6YR1aQXZA11kM5Shoe7VFDq/IdP2ZvyoxM+x+b10yplS8xSp
 tcOg4A8ByOtGyT66WxCgWoHGBIyP0Zx1vLW1IBFuaoteof3vZzIo7nnV7QVcP8sBH0JJ
 kNnMZZ1X93l7ewa2EI1LCTwQnwe/UCRaY2C8ii75H9B9QpWcZ99hkjuKnLg2D5p1Ekm/
 DVNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU31Q/MxHym0oiFH2CdWtyqWRKpew38C4TDoDc6D014vbXhGNNIWm3jr5W1GGLU5yAD9TE6LlI7bONqMpD5lsvC0hvWLin5aA==
X-Gm-Message-State: AOJu0YzQUUDf07OR7q26kP4KRVSAzfyLO+RkVe6jLnXMGXDF67xFStjT
 CQD2ihWkb4mwWhPi16x2zB2nyLvBeZ140h7NF18LQ/n7do727bnemZx2TjxDWsdvMi8szf1JY8g
 s
X-Google-Smtp-Source: AGHT+IHqabutq/8MRLuj3zWIK+32LIgzZf68zsWy+BmXj4ge98i3S7/axAVMDchZMKVaMDeOKJsSSg==
X-Received: by 2002:a05:600c:4e8c:b0:414:854a:8167 with SMTP id
 f12-20020a05600c4e8c00b00414854a8167mr5644127wmq.18.1711406207677; 
 Mon, 25 Mar 2024 15:36:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c315300b004147c8dd13fsm9639657wmo.30.2024.03.25.15.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 15:36:47 -0700 (PDT)
Message-ID: <3ba00771-3514-4daa-94f5-879f6ddd632b@mind.be>
Date: Mon, 25 Mar 2024 23:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
References: <20240307015107.2908128-1-christian@aperture.us>
Content-Language: en-GB
In-Reply-To: <20240307015107.2908128-1-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711406208; x=1712011008; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FwRDuY5UndIE89X6MgWk8c9rgYdTJIWBWnrSvJAImCE=;
 b=TnRrktejK/YdbOzxlOVIpevK/3oFS20iYf9m49fU5h7CB7hwRZcMSfQ/EU9hfMfdHh
 HzgOjd9baCL0UpP4lNYjvc4YViBc/eHtDcS3aY2Qv1+V7UK5EC6/sT1Ge0H6af/SWWl0
 uIcKwiKDdSsuXRB+vRTEpydF/wLevXA6cDygT+NrJFA++sjL3rQ57aWZGjC9pWPpBZMH
 eJ8GKslBquiYhZjSSA1RqoV2METPMihNnY6kmXG9/3Ou2axPDLePNkApsqdT20f6wT79
 Bacn2UdZwL93iFJeM8hGHcq4+BRLdTjOAFddold/Q+9d+N7TtMxVIYmd2hb3qRYcJRg0
 go1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TnRrktej
Subject: Re: [Buildroot] [PATCH v1 1/3] package/go-bootstrap-stage2: bump
 version to go1.19.13
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/03/2024 02:51, Christian Stewart via buildroot wrote:
> Update to the latest 1.19.x version available.
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>


  Applied all 3 to master, thanks, with a modification to patch 2 (see separate 
mail).

  Regards,
  Arnout

> ---
>   package/go-bootstrap-stage2/go-bootstrap-stage2.hash | 2 +-
>   package/go-bootstrap-stage2/go-bootstrap-stage2.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
> index 6d4c718a40..d61663cac9 100644
> --- a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
> +++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
> @@ -1,3 +1,3 @@
>   # From https://go.dev/dl
> -sha256  e25c9ab72d811142b7f41ff6da5165fec2d1be5feec3ef2c66bc0bdecb431489  go1.19.11.src.tar.gz
> +sha256  ccf36b53fb0024a017353c3ddb22c1f00bc7a8073c6aac79042da24ee34434d3  go1.19.13.src.tar.gz
>   sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
> index 72f3200a2e..98bf624b57 100644
> --- a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
> +++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
> @@ -6,7 +6,7 @@
>   
>   # Use last Go version that go-bootstrap-stage1 can build: v1.19.x
>   # See https://golang.org/doc/install/source#bootstrapFromSource
> -GO_BOOTSTRAP_STAGE2_VERSION = 1.19.11
> +GO_BOOTSTRAP_STAGE2_VERSION = 1.19.13
>   GO_BOOTSTRAP_STAGE2_SITE = https://storage.googleapis.com/golang
>   GO_BOOTSTRAP_STAGE2_SOURCE = go$(GO_BOOTSTRAP_STAGE2_VERSION).src.tar.gz
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
