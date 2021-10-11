Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66642C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:36:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CC2F60273
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CC2F60273
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32FCF80F35;
	Mon, 11 Oct 2021 20:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DjicuH5DFTz; Mon, 11 Oct 2021 20:36:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8109D80F26;
	Mon, 11 Oct 2021 20:36:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C97331BF279
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C52FC40478
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rp07rtYdkdyD for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 20:35:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C98D4036F
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 20:35:57 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w14so20586415edv.11
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 13:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=jf+sEP/P6Ep6H/WdYgkJHmFX1eOsbdHgU1YOiwQ42fA=;
 b=Pq/IbVndGGV/N8/aNw2VaIkXUDQYeMbYK9kKNxX/zTSaATCEZA15JiTm59I8/2ZENi
 HMYNC9auEpK3Si3XBxilHDpKZKT9rHPNgVihnci6Q6phYWrST4zxvuWMYgCqZ3VmDFc8
 Fl6K2HB5c7zCRAdF0fONxbmuk3Lh/OCJKf3es4iTt4JsgE/C9HPs+uY0yTH6vObmsCdY
 DEQ+ImRZoBJRTySU5/DHSW6RlNJi6EapG4eW8OdmuGya6FvTzqPhUb2MmXaI8HSZOW7j
 eTdsj7c+obXPc3rpsRBJeniWaEAItkUbP5HXtRDbx7QUiVKqPGmI10GAkCF75N8r7+fV
 zZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jf+sEP/P6Ep6H/WdYgkJHmFX1eOsbdHgU1YOiwQ42fA=;
 b=WekgtJpx+uyJN4RUOPIq0epyrxNHcWH52zcneQ4xdaPWVg/mRyLK7C6bullvZ7y063
 uzxTFfLTLOv2RdqKdGdJS7sKaOVXCMA3lI9umjlSjoHTHQ1AjsbjvXXj3fDRaBlBqsJg
 9PBBfqhvBvPnYpSHFShCEJo9jSqiIMgKP4sSzuX8rRL6Z2hcbebMhuE3c8U54rAs5QMQ
 l5lOt67qhdunxvvLbshqsg5XPaOW2OaoSWyxUbO6ivV8ihUBCoISuoiiV4ko8jRV6CFI
 ZmjTs/K4/wvUcpMPO+ZLGf+tLAhMyWcE/EzUDf/SbWW80vpcAMHyd4s4WEYQuemwCVsM
 fgtw==
X-Gm-Message-State: AOAM533BkQGC2vfflvpHL6XJEtVDLWgKNgTMKkBcbUZJeuhSyKYGw7Qb
 73zcZVe+0kRpm+uHbMJW+XqN55hmwi+ZryT8
X-Google-Smtp-Source: ABdhPJzk7W1cK+SivxiiC3j09k/wGxMnSBODHhLSehDVA0R0MJrse/wzp/PbUXAhTDZVy8qOHk9S8w==
X-Received: by 2002:aa7:c948:: with SMTP id h8mr45187492edt.380.1633984555460; 
 Mon, 11 Oct 2021 13:35:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m15sm1722593edd.5.2021.10.11.13.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 13:35:54 -0700 (PDT)
Message-ID: <cc8e2b1a-9111-4ef7-2341-354e79f098f4@mind.be>
Date: Mon, 11 Oct 2021 22:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org
References: <CAN=fXj2_ph7V-0yj2CfMe_S1cZK+_oacpXOE_CQ=WeeNyfwwYg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAN=fXj2_ph7V-0yj2CfMe_S1cZK+_oacpXOE_CQ=WeeNyfwwYg@mail.gmail.com>
Subject: Re: [Buildroot] Host aarch64 external toolchain support?
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



On 11/10/2021 20:16, Charles Hardin wrote:
> Just checking to see if this support is already being considered in next or a 
> new revision, it seems that all of the external toolchains are based on HOSTARCH 
> x86_64 at this moment.
> 
> We have some server arms for the buildfarm and likely will have some people 
> building on Apple M1 chips as well - which means we are going to need prebuilt 
> toolchains for multiple hostarchs.
> 
> So, it would seem that the flow should be to make sdk on the both x86_64 and 
> aarch64 HOSTARCHs and then push the tarballs up. However, the 
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM options seem to provide only a single download 
> path without a selection on BR2_HOSTARCH or a conditional.

  You can use make variables in the config string. So you can set the URL to e.g.

"https://example.com/toolchain/toolchain_$(HOSTARCH)_$(ARCH)-gnu-linux.tar.xz"

If you have no control over the name, you can even put conditionals there, but 
then it quickly becomes complicated. Like

toolchain_$(if $(find aarch64,$(HOSTARCH)),arm64,amd64).tar.xz


  If you can think of a way to support this better at kconfig level, ideas (and 
patches) ar definitely welcome!

  Regards,
  Arnout

> 
> Is this the incorrect approach to use? or what has worked for people dealing 
> with this already?
> 
> Thanks in advance,
> Charles
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
