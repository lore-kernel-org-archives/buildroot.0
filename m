Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92264C54E49
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 08:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C6EB40BC0;
	Mon,  4 Mar 2024 08:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Db4t6GSemI_V; Mon,  4 Mar 2024 08:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FC8B40BC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FC8B40BC3;
	Mon,  4 Mar 2024 08:51:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2C31BF580
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 08:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5D9C40B96
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 08:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id snqRsA-43OSU for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 08:51:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A237E40BB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A237E40BB4
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A237E40BB4
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 08:51:32 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a446b5a08f0so511033066b.1
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 00:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709542290; x=1710147090;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MXUOQ9K4m0Mb0c57Zo/0Hz7vOw4AyqkJ/hpmJ6Sj3qM=;
 b=Yl0v9zGpaXRvC/aJT2ieXcCfFa64Hp6m5za4VkbvJxt3Q8cdsC1Vn861oRAWyBeGH3
 okxdxUxQFcFtx4OiBpGnUAYtMWIXq1Pb0Z7eAknJqFniun+h09rGRtS+IgPJ9kZaQ/2p
 mDSY3RXCGG1V518Syd2034pVQlaSrg97DDuEn0duGYuc4nYLugWMVRkwF8oM03lfVQ6s
 bIUgNGc3QN9p2dajwH7w/G88ooGLy4prrvwY/s2Y81usF0712tMZ1eFT4zDjvEcCVdgF
 RtBa3s44Iv9nRMTFl3lloX/W1weQoWtZBDo0A5d28GR7ji1U8xxn7/20Xk/QYIZMA9/f
 Yzsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUZdE3A7Cic6h7blHU4jLw3Kp9zKgapydpOf2AXW3vV6Fpf2i3VGFTMb34MckqfisXXMVjJaArEQ5SKlYZuKhmZn4hp+oPrg==
X-Gm-Message-State: AOJu0YxMF9L5DQ9sX5093RCeWlCqLv2jXh/dMnAdZeyo2AoG9dDZ+YC6
 yL2K4o/iCsQzRZ1orntQJdl7XTOg07XDAFB9Ql2qCwX+pPvzgECpSy7ayQncev8=
X-Google-Smtp-Source: AGHT+IFoyIsMp6G/omoS9XhTDmgzQdDreGQXsJdDjd3zy6oaMO2Gn11/ygJnML+FketgI0BhAksOqQ==
X-Received: by 2002:a17:906:55c7:b0:a44:52ec:b9e7 with SMTP id
 z7-20020a17090655c700b00a4452ecb9e7mr7157849ejp.16.1709542290511; 
 Mon, 04 Mar 2024 00:51:30 -0800 (PST)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 mb17-20020a170906eb1100b00a4490267ecfsm3393779ejb.221.2024.03.04.00.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:51:30 -0800 (PST)
Message-ID: <41bfa29d-1ea6-4195-9be7-83ba91642ac2@mind.be>
Date: Sun, 3 Mar 2024 21:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20240213044219.1368954-1-kadambini.nema@gmail.com>
In-Reply-To: <20240213044219.1368954-1-kadambini.nema@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709542290; x=1710147090; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MXUOQ9K4m0Mb0c57Zo/0Hz7vOw4AyqkJ/hpmJ6Sj3qM=;
 b=gbo+kXq5xbh54P8aFpcrqZrW6JpHvzXJ8kdEkCmF9UQUyBCp4Gzx+2edIWAbgLJdkv
 50FTqOy1nf4Fa6wxQPvaZX7wtQ6/U5Ix5oLSj92Zzu6CECbD9OcwSpzrqdFAzrwiYiTi
 CfmIr/pg4lGZVnQ9WoQ4RmI9OgC/dOg8o4lb7W/8Zx5KPPN5O5K1k+Qg6JhX0CmTL5q/
 v4e0gcn6O65DoHkRpMGx5i3bYjztGUuorebO0sEirtdPWzCifXrD4uEsseECVOLyHOBR
 gsKLdmkrPw/EP2/08TDR0n7YCPfumZYudBgfFdOgMBZctrLIcnAw1APZ9bMNRp/w9DzV
 8qzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gbo+kXq5
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.379
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



On 13/02/2024 05:42, Kadambini Nema wrote:
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/hwdata/hwdata.hash | 2 +-
>   package/hwdata/hwdata.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
> index 6915e04e46..92b7eaab6d 100644
> --- a/package/hwdata/hwdata.hash
> +++ b/package/hwdata/hwdata.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  0db28dc635d5059ad23d068d2e56ef5dc540f95bc813ea5a3c0f5d63b03d20d6  hwdata-0.373.tar.gz
> +sha256  b98ef646d530d5fd3afa3180efbf7c8e22d3da0088f5836f41ee25380d87b092  hwdata-0.379.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
> diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
> index 025f5b4969..555fb58f14 100644
> --- a/package/hwdata/hwdata.mk
> +++ b/package/hwdata/hwdata.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HWDATA_VERSION = 0.373
> +HWDATA_VERSION = 0.379
>   HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
>   HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
>   HWDATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
