Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEC6C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D959C41845;
	Tue, 14 Jun 2022 16:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uT_twY-bQykR; Tue, 14 Jun 2022 16:57:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFA3E417CE;
	Tue, 14 Jun 2022 16:57:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C87C81BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6E5D40B77
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ynUkjCVc20Cb for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:56:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E45540B70
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:56:06 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id c2so12513313edf.5
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cS0V5tUzf5AjUzuRAnK3JEFmwf2xn8hkEgxXJ+cXMUQ=;
 b=apE2WTeWiB/SGN1ViWYY1xj00s0jSlDVmHVaA0IbLxK9AiHdgTZFnjnd7IoZvEnYVL
 fD62xhZ9Hy+rajUwHDQYEIKGrZdHugweuyYO++iEICOXuxLV6e5w7ILPu5KpQoDBteGx
 Of80lDBl2rytIBrtH6ay671El5wtSEXFQSWkxoX1/5HWSYa9qex9/otxNOIliNNmgkWg
 DhHeHlcCT2psblKQIFr9tI0UH+wq2/9gGHaBtlRgLWylUiAuVl9Syq+vxDixF4S/xZnk
 XOb9jy/CYQqyITwwlnpwdqHxw/dyZ5m9/1guPQWsUtfXPjbsS4O78P3uV741Txu+gf6j
 WdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cS0V5tUzf5AjUzuRAnK3JEFmwf2xn8hkEgxXJ+cXMUQ=;
 b=GRBDLYKCiWrvxxDmOhTaHDC2EV7WE9lpQZFdxH1HMO58VNUrr4Pm3yLDGZQRzuFemt
 jGayv4yfxbNm/hGr/jUmsgduKpYBhLMF8r9AGb3eyM6H/ukJVHKFkTlZ34SYcdP+uEnU
 megoF7Je8Wqoqvdt5ZABo/ZBReUqYi2q30xTCxhGrdmsvrOXscqHBEgUhQ3/ymWvtRjQ
 zKpD374Ik+ab55HCiAFhgeX++eXoyfOnvKMnp2lha4c35kVFGxPo7wxSXWaexGqwrZOm
 by5Ogxs56vvS90USJeZuYEmeTAP4FvjnUEQCntXUYIpfrNGS2/7TKbe555BXRJhPPQxe
 8//Q==
X-Gm-Message-State: AOAM533fxPQVThda6orhtG74NCE0sP2+iEUApVZXZ09RNYCsDsXL++6d
 nmTbBTI03ZV51edDz6nC8lwrKg==
X-Google-Smtp-Source: AGRyM1u4cZHG3e9+PNRUlTA7Qj8tASJP1S7mYD9JapXwiUUSkxNvlG04w3aJmAVh9vvmUQcJT9LmCw==
X-Received: by 2002:aa7:d586:0:b0:433:5467:8ebf with SMTP id
 r6-20020aa7d586000000b0043354678ebfmr7291579edq.214.1655225765319; 
 Tue, 14 Jun 2022 09:56:05 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 o11-20020a056402438b00b0042dc9aafbfbsm7589038edc.39.2022.06.14.09.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:56:04 -0700 (PDT)
Message-ID: <f780e253-f0da-781a-ffd8-e3381bf2d190@mind.be>
Date: Tue, 14 Jun 2022 18:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
 <20220608071027.3384469-8-thomas.petazzoni@bootlin.com>
 <12178427-e595-be4e-5da5-d4cf1718b9e2@mind.be>
 <20220614175844.45509426@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220614175844.45509426@windsurf>
Subject: Re: [Buildroot] [PATCH v2 07/14] toolchain/toolchain-external: add
 BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER option
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/06/2022 17:58, Thomas Petazzoni wrote:
> On Tue, 14 Jun 2022 17:34:20 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>    This could have been simplified to
>>
>> 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
>>
>> but this way is more flexible so better I guess.
> 
> Yes, I thought about this (should maybe have written it in the commit
> log), but I thought: external toolchains can very well rely on patched
> GDB versions that could potentially have support for an architecture
> that's not supported in upstream GDB.

  I wrote exactly that in the commit log :-)

  Regards,
  Arnout

> 
> I agree this is a corner case, so if we decide that's not worth
> considering, I would totally support using
> BR2_PACKAGE_GDB_ARCH_SUPPORTS.
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
