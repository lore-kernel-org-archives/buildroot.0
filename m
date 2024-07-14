Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2E6C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 08:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 126E1405D9;
	Sun, 14 Jul 2024 08:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uk4MlDBWwgpo; Sun, 14 Jul 2024 08:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B39E5404E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B39E5404E8;
	Sun, 14 Jul 2024 08:45:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 568601BF576
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 08:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43C2160614
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 08:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNr7ZWXfgBSM for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 08:45:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44CB0605DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44CB0605DD
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44CB0605DD
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 08:45:07 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52ea1a69624so3430900e87.1
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 01:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720946706; x=1721551506;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OmrtFa+OOa9KdOdW1hMB2i/8WTHPTh9ahrG80GxR+aQ=;
 b=aAQ7hav7KTV/AU3XUmcnFSfvBZXB/76+kBK5SV5ZQI9y9DD+DxVNjRZsUN57ThNQ0h
 XkJpuZeDBRRHGGBqhzNVgn9Sk5dsgqGMmNrI/BJ+QNeHjvgs6bSHI1Mh4dA/Vn8aLPnI
 rgFpEUsWFurW6kHI82js65Ui3vNDIT5X5gUglUHwYPGRAToLOq7711vqk+jNGaqdqSed
 MrsJXwrqo+YnRyieYRQCr/8OGVOBuRgg1ZnyMr9p9BGh5McnhRD82rupr4PA8lsnZCLX
 DMj6+ABGrq72Ab09ZQjOaoMjLJiY3lXmKIRdYULwUK8mlX8rOEmEAzuZAdN21J1V3ZVC
 9T/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNq5/XPZYI/6RKhUVCq1YBJ1sTyipStPc7twzE65OWxnB5nyd7v3kedXfo4W6QUy+IcwkXH5IBxWl+Y7dFVBJPex1CwGH79A==
X-Gm-Message-State: AOJu0YyH0Jww3/3Q69n5/oZIg+d0V/kZb05wpzMZqAfri6Tn3g7zdkCe
 som0PBjd/k9HZbWKfnBcEkIrT+dDgZvyEVu4YBOBga9IFwiTDQ/ncS3gjbdJS2RuH8MVq0DLY0u
 93hg=
X-Google-Smtp-Source: AGHT+IFUzljJBlMJxDZvEzjF8Zs0zRBTn7ZbNMqCiIceqQuDIeTv6hwuo7Dm6AxEtSBoSzbwk3CbAA==
X-Received: by 2002:a05:6512:12c2:b0:52e:9e53:6ccb with SMTP id
 2adb3069b0e04-52eb99942a7mr10934071e87.17.1720946705532; 
 Sun, 14 Jul 2024 01:45:05 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5edb454sm44247735e9.32.2024.07.14.01.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 01:45:05 -0700 (PDT)
Message-ID: <896256be-0dab-40d6-9983-e4f1b1dc950e@mind.be>
Date: Sun, 14 Jul 2024 10:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717779951.git.yann.morin.1998@free.fr>
 <c3cab5d7365dfd9153a6b03311bd5f029eea236f.1717779951.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <c3cab5d7365dfd9153a6b03311bd5f029eea236f.1717779951.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720946706; x=1721551506; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OmrtFa+OOa9KdOdW1hMB2i/8WTHPTh9ahrG80GxR+aQ=;
 b=EIMk+Ay1wyfI6K/gNL2ttLTqrvAOwz5ynDxaJq7VsF51LFX+qmI6HWNmLSJ5MaC/yx
 C6+jIGPv56Fvua4POOwitbrgQ4ADjEUmSrnlUkIA1lg7/fB8yXwj16yNH4HUsWvzXNAd
 R+ZALYPUC+NwakyCgw4HI2votLNvxD1/jdjWhBa/OcxgNrq7j4ZaIi0ljy5BK+88C+SN
 oHDpWvlQK9BMzImvUmmzGjTWtKQi0FAhAtGC7XskTZ+OdiEK4iT+w0WkEQ6dVFq5AbuD
 KQ+7ebCHktboxc5Xw1faeDyD3wcn22eybd1dnHrMa/kYLlbzPVAaE37Dh7Wq73Y0ypja
 aYZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EIMk+Ay1
Subject: Re: [Buildroot] [PATCH 14/20 v2] docs/manual: rephrase end of
 vendoring section
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2024 19:05, Yann E. MORIN wrote:
> The current phrasing is dubious: the vendoring does not detect any
> change in the dependencies; quite the opposite, in fact: once the
> archive has been generated locally, no update to the vendored
> dependencies is ever done.

  Well, but it _does_ detect a change in the dependencies (before vendoring), 
because any change will change the contents of the final tarball and therefore 
its hash. You rephrasing completely skips that fact and it's the essence of what 
is attempted to explain here.

  So I took another stab at it and rephrased it like this:

A crate can depend on other libraries from crates.io or git
repositories, listed in its +Cargo.toml+ file. Buildroot automatically
takes care of downloading such dependencies as part of the download
step of packages that use the +cargo-package+ infrastructure. Such
dependencies are then kept together with the package source code in
the tarball cached in Buildroot's +DL_DIR+, and therefore the hash of
the package's tarball doesn't only cover the source of the package
itself, but also covers the sources of the dependencies. Thus, a change
injected into one of the dependencies will also be discovered by the
hash check. In addition,  this mechanism allows the build to be
performed completely offline since cargo will not do any downloads
during the build.


  Feel free to send another patch if you think it's still not clear enough :-)

  (BTW I took authorship of this patch of the series so you don't get the blame 
for the text above.)

  Regards,
  Arnout

> 
> Rephrase the end of the section to mention the term "vendoring", and
> to drop the dubious claim; retain the off-line build reference, though,
> as this is indeed correct.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   docs/manual/adding-packages-cargo.adoc | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-cargo.adoc b/docs/manual/adding-packages-cargo.adoc
> index e18fd9ce23..8a2292e7b6 100644
> --- a/docs/manual/adding-packages-cargo.adoc
> +++ b/docs/manual/adding-packages-cargo.adoc
> @@ -93,8 +93,5 @@ repositories, listed in its +Cargo.toml+ file. Buildroot automatically
>   takes care of downloading such dependencies as part of the download
>   step of packages that use the +cargo-package+ infrastructure. Such
>   dependencies are then kept together with the package source code in
> -the tarball cached in Buildroot's +DL_DIR+, and therefore the hash of
> -the package's tarball includes such dependencies.
> -
> -This mechanism ensures that any change in the dependencies will be
> -detected, and allows the build to be performed completely offline.
> +the tarball cached in Buildroot's +DL_DIR+. This is referred to as
> +_vendoring_. Vendoring allows for a completely off-line build.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
