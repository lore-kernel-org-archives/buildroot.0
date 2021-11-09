Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432BCC433FE
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:18:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E891D619E9
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E891D619E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C530660766;
	Tue,  9 Nov 2021 22:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DrBPpp_ERW47; Tue,  9 Nov 2021 22:18:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05AB3608A9;
	Tue,  9 Nov 2021 22:18:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8042D1BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 708D98176B
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLOcOcZL8ijg for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:18:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75D0881754
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:18:15 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id m14so2637788edd.0
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 14:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PoYJzQ/qbmm4TBRz3+P6W6xI+BP7hjiDvppy9vwTGJI=;
 b=L0EgsW1Q64wMgszM/Xwblwu0ACMrcjDkPzisklG28hSLK2HG2ERJobnN73+nq/cAvX
 x2VHCNps5q25PnI/69+HIJLes2DNu7t8QXi5IlWhQRxPCtfdr1R0EufXs3cPdOFdpZ/2
 R85kEip1+PG2hT/HLjBy55TJsayX9JB87610f9czzbQwVDGgly9bxWBRMfLbaNVB+5/7
 mSx8BlZMhyN+8qyUqYShJAG4GTeklkCfVYahxhx0WrgZaqB7o3agtIAbAVAoVpoJt1SO
 jRQi31mBz3EZG91yQIYvg4HHbXpLTi9wgNrgq7P6sNVUfreLsK2ju4SZ6MQEkF5H9sNN
 3UDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PoYJzQ/qbmm4TBRz3+P6W6xI+BP7hjiDvppy9vwTGJI=;
 b=1EeB0u1K6HphjPFRUjHjCH8bnTf21bIATeK/o/Bka441TgnWhYneFIBQEqolL9VSZn
 mCve2EDqxBO4/ASzx3dbRBrm0jXM499pItJOXoggBK70GBHQOthGBzqBu29GYx497XKT
 lW7k0xwq6a9zHTHpXgJhLLZZibmOuMlz61ZDOsZBgftCwIe8J6DmUKzL4jTJImvxKgv3
 rpszlbfvhtEYSvbVe2DpheLsy8vVVPHIX8sbsDHtaJmtpf0Lo8PZc6BMslUvLeKUPbcQ
 lwQWspqxIuhvGtwAJcY13g+A1Up/or2RWGm1E360yAebOCUgFDnRzrM+7/Nx8YGicEBb
 mryA==
X-Gm-Message-State: AOAM531cWGh/GeRg5DF11sL3r0Fzym7T+Zrdw8ObmrioutUfn5Guf/Fp
 IoFJE6huzE3Mz62Bw2P6eIV6Dw==
X-Google-Smtp-Source: ABdhPJxZ8bpqPP5goiBaTdIkB7wB43pLCOkPUCMb+aVGnRnjFAm5UOS8NT5gMgsB8f8omwHT9qHoAg==
X-Received: by 2002:a50:d518:: with SMTP id u24mr14969848edi.137.1636496293771; 
 Tue, 09 Nov 2021 14:18:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e13sm10068439eje.95.2021.11.09.14.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 14:18:13 -0800 (PST)
Message-ID: <9597a72b-eca9-5674-5989-8b0e23e3ed79@mind.be>
Date: Tue, 9 Nov 2021 23:18:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211028162532.1124296-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211028162532.1124296-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ujson: needs python3
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/10/2021 18:25, Fabrice Fontaine wrote:
> python 2 support has been dropped since version 3.0.0 and
> https://github.com/ultrajson/ultrajson/commit/0673d237cf5589a2a059771f694d5fbc5a293b13
> resulting in the following build failure since bump to version 4.1.0 in
> commit a47f332a20bf3f79ef4903c8ddd2b7917217e354:
> 
> ./python/ujson.c:79:15: error: variable 'moduledef' has initializer but incomplete type
>     79 | static struct PyModuleDef moduledef = {
>        |               ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/61cc675281ba25d6ebee4892175e9c7222aabb79
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-ujson/Config.in | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-ujson/Config.in b/package/python-ujson/Config.in
> index d185c98532..aee1d75fce 100644
> --- a/package/python-ujson/Config.in
> +++ b/package/python-ujson/Config.in
> @@ -1,7 +1,8 @@
>   config BR2_PACKAGE_PYTHON_UJSON
>   	bool "python-ujson"
> +	depends on BR2_PACKAGE_PYTHON3
>   	help
>   	  UltraJSON is an ultra fast JSON encoder and decoder written
> -	  in pure C with bindings for Python 2.5+ and 3.
> +	  in pure C with bindings for Python 3.
>   
>   	  https://pypi.python.org/pypi/ujson
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
