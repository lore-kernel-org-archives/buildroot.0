Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8437BC6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 20:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D7A81F01;
	Sat, 25 Mar 2023 20:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D7A81F01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhcppjYGlv_V; Sat, 25 Mar 2023 20:45:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 768CC81F03;
	Sat, 25 Mar 2023 20:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 768CC81F03
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 902DF1BF32D
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69AE140447
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69AE140447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPPvOEHjD6pY for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 20:45:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82D6640141
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82D6640141
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 20:45:23 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id i5so21252018eda.0
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 13:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679777121;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zcW4HtzudnL51Y1FnIBx9Zia/2Gj031WRx/XVIlZArM=;
 b=TXV81PP/5QS7tzFy6Uao/2UuDXxeZd4Y14qtpb9grOXYPzXInDkXpdzYvzSBAPgSV8
 cxJjBbt6WYuZ3UmSoU7iaQxd5F8D52iaa/VxkMe61lKW7YhZizfocbZ9PhScSDkEDUF1
 px2ruq5O+4UxR/9EfX+dbNer1CQdXdVCYOn8BOQSMfbJM+2rnPWpfWuCxiQtoXW/4g0H
 b8a2tab/u8S3EObV79ltAe64KjIBTWV8sE+QjZpQ3xuZsJyf/m+Ky70DhuGV2PR3MjSF
 HPhD4lcwKH/lHmxnGdJVtsOQyL5gpBDfmThuzIuF88k7lXXIKzE2iImV67MIdYkDeaZu
 AZ1Q==
X-Gm-Message-State: AAQBX9eTULTtDK2+blnrbDfQpdZqD9iMi31/ln6GxQTqw+q1bhjzUIYH
 LsYRFbfhXQI74HtEYFoRYDrHxA==
X-Google-Smtp-Source: AKy350aAeYTL2T07bORzpyNA162G0llp5OfoSM8HVqAfSpebprs1du0JY4SZ1/kUrq1TiZ2L7STcag==
X-Received: by 2002:a17:906:3d49:b0:930:2530:5f47 with SMTP id
 q9-20020a1709063d4900b0093025305f47mr7506519ejf.11.1679777121247; 
 Sat, 25 Mar 2023 13:45:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18?
 (ptr-9fplejqcmbwz6qb22hk.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a170906264b00b009255b14e91dsm12146508ejc.46.2023.03.25.13.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Mar 2023 13:45:20 -0700 (PDT)
Message-ID: <423f395d-007b-9145-48e7-1038666de5fd@mind.be>
Date: Sat, 25 Mar 2023 21:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
 <20230221172205.2450111-6-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230221172205.2450111-6-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1679777121;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zcW4HtzudnL51Y1FnIBx9Zia/2Gj031WRx/XVIlZArM=;
 b=aIcPvUqy7tPRhnC+m4l3GxhZSJbjJNDAjTCWwTtXXXoIYL2RcF7y0ngoIKQC9liaip
 qCly2gpcffbyqckDnYcl9Ah+GUGfGk3jbAeX1Kb1SZ08Vzc58TTLewprrVRsv2H2s5gW
 pI1t5yio8Lus5WiAOysx1EqZuXpHylRhJ5h3kFEUQYnp7R7j0r6aR9sAyLubEiZCsGOS
 +iECiHjrUdU8HlNdOueAwRiAutr/35e68tKYB+d+koO55xnuRBabKidjEs/ylnD9o2Pv
 ksfuyd6iUcL1kSRQsYstjdPk/X0SRq6aMdvYY9eNqymIX6vQ2ZEFE0g+bI7P8HqQxtZL
 w6hA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aIcPvUqy
Subject: Re: [Buildroot] [PATCH 06/15] package/dc3dd: migrate to new
 autopoint flag
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2023 18:21, Vincent Fazio wrote:
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>   package/dc3dd/dc3dd.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
> index cc89bb63d0..4d94194af6 100644
> --- a/package/dc3dd/dc3dd.mk
> +++ b/package/dc3dd/dc3dd.mk
> @@ -13,6 +13,6 @@ DC3DD_LICENSE_FILES = COPYING
>   # We are patching Makefile.am, so we need to autoreconf. We also need to
>   # enable gettextize as dc3dd comes with an old gettext infra.

  I've updated this comment as well.

  Regards,
  Arnout

>   DC3DD_AUTORECONF = YES
> -DC3DD_GETTEXTIZE = YES
> +DC3DD_AUTOPOINT = YES
>   
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
