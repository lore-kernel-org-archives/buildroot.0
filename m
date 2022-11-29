Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2875CC4321E
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 22:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8DC2415EB;
	Tue, 29 Nov 2022 22:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8DC2415EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMBLMYs3P-Qc; Tue, 29 Nov 2022 22:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92EEE4171E;
	Tue, 29 Nov 2022 22:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92EEE4171E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 184E01BF5AD
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0021C40194
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0021C40194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fA7EDkoEJIG for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 22:06:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF98E400DD
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF98E400DD
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 22:06:46 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id o5so15279565wrm.1
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 14:06:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vy5aDB/HPxwE2fFeH8f1/3WKR3X13EcyHNcBaTRwUNo=;
 b=SfiNFN3kX6b1kKRG9d36ia0f+k6NZhooFM4fpM6G6eIvrh61Wj8aIm7DXlnVfP/JMF
 rgY4c7cNGhD138qmBL63QzkdxtIY3+m3wxYrGRfSdNOXQIGjVUl3rA8fbdf0WDI6zHWM
 JV55fien3a4VxyijlV8A0NIwDlLxe9SxD2ZB/aZ0Ym6pYHwhgx+2uUUXAwud3MB3GQHc
 WGZ+Byse4VcsSwTO/f+kzuj7b69elHvQcqdkyw9TTKCTOGJv7jYmBM8wsbSzNCJXacay
 lFZMaH2ZqpsYtKzQ8hmr9CyYgVBfWFN+/NMZ/Egbvusb2i7QSCUu1W0zn+Zaij7yf0lg
 brsg==
X-Gm-Message-State: ANoB5pnl4KGigtM8KLPQMc37df7kVgrKfYF7DwjQQYnC0Da4LPYTcTKO
 TIkuNWaCYlrfhBtKPtuARpEbgcivK627bg==
X-Google-Smtp-Source: AA0mqf7OLNIE7O2Xdk0VDtpvfRFMsuJMdfNZac12edFBpRpmqRbOdrr1iKDXx2ewnI9T6sy0evIQ6w==
X-Received: by 2002:a5d:68c1:0:b0:242:15b5:59ac with SMTP id
 p1-20020a5d68c1000000b0024215b559acmr7851491wrw.128.1669759604668; 
 Tue, 29 Nov 2022 14:06:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a05600c1c8d00b003c6bd91caa5sm4002954wms.17.2022.11.29.14.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 14:06:44 -0800 (PST)
Message-ID: <63beead1-bbe5-e6cd-5c29-59eb3557aaf6@mind.be>
Date: Tue, 29 Nov 2022 23:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20221129140533.438862-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221129140533.438862-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vy5aDB/HPxwE2fFeH8f1/3WKR3X13EcyHNcBaTRwUNo=;
 b=WSAAoeZGOMMZ8J3kaeLXO46/jt4KNkim3PbVQE7c/48X0HtUPB+7nkd1VwRkxGKn+p
 MoQ42Vf8Izh+O6EZMUZgnixZyRz6XkXM25TrOemixAsatzqLRms1BzsGRWG/ocOSGa6m
 aQRnJOaloCOeoNqF1VbfH0IFbiGJ5JFCKr/kNN0zwCrdd2cOeWaxuMsxFSHkPvOavHSU
 3IhDIohBNne9Tf30mR/0VwuPArs8A51ewBrrqZaEBtFnc/ur1kNKx2Niraz8N+kkZ/Z8
 qGVGBvN9juBuA4BaM1g/YzHlWJRphtFhkgt71WLohqhKczlAqmBWP6izp4Hzyt5TEoN9
 CLAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WSAAoeZG
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: bump to latest version
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/11/2022 15:05, Giulio Benetti wrote:
> Fixes:
> http://autobuild.buildroot.net/results/8bcb4d0adabc141ff8144f9e22bd549e3cd8858a/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks, after updating the commit message to include the 
date instead of "latest" and the branch name.

  Regards,
  Arnout

> ---
>   package/rtl8188eu/rtl8188eu.hash | 2 +-
>   package/rtl8188eu/rtl8188eu.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
> index 0ad7786328..29ce0e32c2 100644
> --- a/package/rtl8188eu/rtl8188eu.hash
> +++ b/package/rtl8188eu/rtl8188eu.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  50529c110e0a45fbe3169d0e237c4d0959300840f5e162c24256452976fb2670  rtl8188eu-c4908ca4caf861d858c4d9e8452a2ad5c88cf2ba.tar.gz
> +sha256  c573529862861a7a75534a4f2bc34ba7e3b116125298b5bc0d432b3065bd7df6  rtl8188eu-f4af53305cb1e9a0d8d9957a042f7c01b7121bfc.tar.gz
>   sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
> index 199362d7ae..3698115d3c 100644
> --- a/package/rtl8188eu/rtl8188eu.mk
> +++ b/package/rtl8188eu/rtl8188eu.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8188EU_VERSION = c4908ca4caf861d858c4d9e8452a2ad5c88cf2ba
> +RTL8188EU_VERSION = f4af53305cb1e9a0d8d9957a042f7c01b7121bfc
>   RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
>   RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
>   RTL8188EU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
