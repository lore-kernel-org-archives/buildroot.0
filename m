Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46054C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:01:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 199E261090
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 199E261090
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7B3340877;
	Tue,  5 Oct 2021 19:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f0r2yCnOw_ZL; Tue,  5 Oct 2021 19:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 236DA4087B;
	Tue,  5 Oct 2021 19:01:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 938881BF3F6
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82D1060C03
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CEnWJHksnyFA for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:01:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA92D606BF
 for <buildroot@uclibc.org>; Tue,  5 Oct 2021 19:01:32 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g8so510522edt.7
 for <buildroot@uclibc.org>; Tue, 05 Oct 2021 12:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=euGyIRmUcCLqnq9VFgvGN040f/D1Cn6y8qxPKxq9agI=;
 b=BNznWtLfEwb98ymtRguKpL/1PhgBZKA4YX7VINf3LYZsHhLiXyMs5wsf13qg6u8YLh
 PqXdlvbvbuP+Yxd/XZ9j/OXF/7fLdTF4dyK3OTTgj+iX3VPFP0xD1zkXhmNVjOtn9yCh
 ofciC+u+1SX3P+uTHM85z6H2s48OZffXfG1ueLrAo0NQCst4ffPKny4KZDanqMSxcOlY
 EH5+BPwSR5MIufw/e9F6smEnMNLYRA/eqty2rcNURzFAmjUsW6PsHHvLzLOzTqXO+ZYA
 I+9sqbQAm9jE4NTCMQ6YA5Pi6HjhO/gbe7JzsCFjGVkk8TvzLLWE8aPcpnIPPnCD9nFM
 FD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=euGyIRmUcCLqnq9VFgvGN040f/D1Cn6y8qxPKxq9agI=;
 b=ZvdYcIXPL/GjPIXiUhd0xEz6mVYjcRGOTh6opVIRMQHzzX8f5e2uobRpJCNg356dkv
 HVs9n4uBNBbbLikziC9a0AWKcXlYsNjkBl/jJ3VF9QwOWrzmw/TayAjDYPqdDrrqOVGs
 fOUEzjbrnMQBbH1A4wiKrNhL5YbsHV9LsSlHO35ySxdZ+oaYG0E6O3WdWh77KfnQyVeb
 oOh/HYDVkC7YE6IyVf8xq5z666sYUdKgO03WVCeXq2pP8zBy7n6auBWUr+GFXjLWLMAs
 QW5BjSWw/K0+RC44j/9COxhnBWe4xC3Q1bJtixyETwCZDBOS/Po7OFGwnD1X+EUTD+mW
 zLfw==
X-Gm-Message-State: AOAM532SEYukNB2hPH2CywXcgZ746zQKExo3XhdpXxIzq+aDrf7uuKeC
 0jzdiBQJaljsNyRIQBOcQ1U0rA==
X-Google-Smtp-Source: ABdhPJzs3BC8ZVExXnLARw4nzlxMLudRmZstdl7ALkcbpxg+67drThAd2rPqqah+PRxGL/QsOTLd0A==
X-Received: by 2002:a50:e044:: with SMTP id g4mr28137046edl.46.1633460490841; 
 Tue, 05 Oct 2021 12:01:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h7sm9040450edt.37.2021.10.05.12.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:01:30 -0700 (PDT)
Message-ID: <cb2befb9-e57f-895e-50e7-e42f5b195123@mind.be>
Date: Tue, 5 Oct 2021 21:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matthew Weber <matthew.weber@collins.com>
References: <20211004094915.516ef395@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211004094915.516ef395@windsurf>
Subject: Re: [Buildroot] Adding new products in the CPE database ?
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
Cc: "buildroot@uclibc.org" <buildroot@uclibc.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/10/2021 09:49, Thomas Petazzoni wrote:
> Hello Matt,
> 
> I was wondering what was the process to add a new product in the CPE
> database.
> 
> Indeed, I was investigating
> https://security-tracker.debian.org/tracker/CVE-2011-3332, which is
> affecting our "argus" package.
> 
> However CVE-2011-3332 affects the Argus product from Iceni, a PDF
> extracting tool at https://www.iceni.com/legacy.htm.
> 
> This is completely different than the Argus package we have, which is
> https://openargus.org/.
> 
> The NVD CPE database has several Argus products known:
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=argus.
>  From Iceni, from Oracle, from Litronic. But none of them correspond to
> the Argus that we have packaged.
> 
> So I guess we need to tell the NVD people to add an entry in the CPE
> database for this other Argus product, so that we can then amend our
> argus.mk package with the appropriate CPE ID information.

  I believe it's simply sending mail to cpe_dictionary at nist.gov. From [1]:


"Organizations interested in submitting CPE Names should contact the NVD CPE 
team at cpe_dictionary at nist.gov for help with the processing of their 
submission."


  Regards,
  Arnout


[1] https://nvd.nist.gov/products/cpe
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
