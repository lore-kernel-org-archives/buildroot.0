Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2837C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0D7D60648;
	Tue, 14 Dec 2021 20:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAtWyfk5mSBJ; Tue, 14 Dec 2021 20:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4330360BF3;
	Tue, 14 Dec 2021 20:08:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 025AE1BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E565F813C7
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MoG5JZLvF9Po for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:08:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E81F813AA
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:08:01 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z7so5882478edc.11
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=TiC9XA7puyruZg0QeF/uNHZuiO1jUGgKqnIuxawFlXM=;
 b=Cx8TpE4e2P7tEPb9j1WLn3OSUgtsjBkkb3RQMVy3DJPc7Oi7eL5EjJGBr8ha4C4945
 kV5LH+ssLLpSwUqULE5kf5GpZUNP4DuZ4j511JZMhVJWBf8AZv07XHepbxTRBoSRD506
 6x38EgEkt+dzOL9suTHdp3Ygquu+5qwSVLndDGr17MfBDfTjamEUot/0ZHTC3asTVLAf
 6Xjx9HwYTokO6idZuJPmC9R1gqyItntV1Vr5lyLdjMzSOQzO3s08qFNYM/CLhiqYoFCL
 bQdtq63pDp3G/UP0ITkYYpOCYekQSGG2eqq+UzC/sX5mODSc3GTJ79zlIz650IaNxIft
 kxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TiC9XA7puyruZg0QeF/uNHZuiO1jUGgKqnIuxawFlXM=;
 b=JSHPd3+fqtfhto9Id9mBhyubcD4xiV5UgBVzxTDJCBGWRqR5yMmuLRGQ7MnVhpQBe8
 CnW7LWOnGgVQd3bRm/dBrjdsygKGnRR5W5gWvoq2Q8P0PZevZGg3fbJPC+YZLQ5W/K5K
 2VqfalIu/3lboML9IVe2nnSiX9NzMvQc4KsNG4LbTOBleai0dO6PF4ogZmgvaw+y8+QC
 V9BBey7s8FkFYHiNHRDXqKK2xbiknBT2rLFYv/awNeB88ewzalvqzTUMISsbjWWqUWdo
 kig91lWqJjSMKB0jdqjxnoLE7jB00wlfsMhBLnvuls25Nh5jgcWOTb6LaBSIfMuNCWnh
 ka3w==
X-Gm-Message-State: AOAM531c7McKqiEqlbeui+lMoqxHbHi24L+q9yUxJ7Htjmzcz2l1HxiQ
 SgCQA2YQFGx/7SrJ2RXj40DtNazXoY8lFQ==
X-Google-Smtp-Source: ABdhPJznUPcIOTh3mnXMGjvGwVrf+Ez6Lb80zL8mfXDOrEFueukVVaWeK1jcU8e1eEILoU2EyW4hDA==
X-Received: by 2002:a05:6402:42c6:: with SMTP id
 i6mr10886900edc.223.1639512479528; 
 Tue, 14 Dec 2021 12:07:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r24sm312326edv.18.2021.12.14.12.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:07:59 -0800 (PST)
Message-ID: <a9329e4f-fe59-8024-3d35-a4b4d878e969@mind.be>
Date: Tue, 14 Dec 2021 21:07:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211213202545.23647-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211213202545.23647-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/hwdata: bump version to 0.354
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/12/2021 21:25, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/hwdata/hwdata.hash | 2 +-
>   package/hwdata/hwdata.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
> index 8479e94339..43cca03b06 100644
> --- a/package/hwdata/hwdata.hash
> +++ b/package/hwdata/hwdata.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  14d120ae58f71da18d7731f44e65a818e4209d621b41fba6f0cd03278a002c1d  hwdata-0.353.tar.gz
> +sha256  ed9a2c8b90371ccf4f0ff88972d87770c1c644e63ca44d2ac72c33200642cdde  hwdata-0.354.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
> diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
> index 8341757a11..71b59b95ed 100644
> --- a/package/hwdata/hwdata.mk
> +++ b/package/hwdata/hwdata.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HWDATA_VERSION = 0.353
> +HWDATA_VERSION = 0.354
>   HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
>   HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
>   HWDATA_LICENSE_FILES = COPYING LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
