Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D37C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 17:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F49340B7E;
	Tue, 14 Jun 2022 17:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGuWRoeF0F8t; Tue, 14 Jun 2022 17:27:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7803640A97;
	Tue, 14 Jun 2022 17:27:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7F1E1BF23C
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 17:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6FF160B95
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 17:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xff89HcYk6YU for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 17:27:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14E7760B3C
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 17:27:55 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id u12so18497627eja.8
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 10:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=vSn4lIHKrS35nzkEATeJIYWFPusZMgfbeai9SuzVFB4=;
 b=cjXdiwEX+Tj1zlXLwmEntaBTCl5osVEwzhgSQwdr/FikPXUie8M2ybzH9/l0tuQr1m
 KrvdzPKCpgjxz3g7OG3VRucNWaDgTvY3F8zcp3GUuWo3/BzhnDQ0qDSlkoaGrLEvjDsj
 ekiU/ZMo9dZ37LCjl4nF2TOybjOBZ7DPLpxm/qj07caAoQ8ptzxTg70+fvzrDkILESTZ
 ofbjzroJr/WJmfWtYG+xCJqJ8QfyG5HztLwZjbdmxDcypIesWzOIEQBNfFeV1z+IMVEn
 chpxBs0PIBonEVzKTNJKxDPHo3y5Njodvj4syvVdW5GNcOjRKuPxshrWdLxh0EuvA9nT
 cppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=vSn4lIHKrS35nzkEATeJIYWFPusZMgfbeai9SuzVFB4=;
 b=NPQdlq1bgly7ypLQdsAsZNLCv1rNoSkTl0X5gKriX4Wni2mb6YPiot1iFbhVxpMfvG
 dxune+Ocr1zYPUR1dwet1ja8hSQ79Ybwzuef4MIHvOIUbuv+Juw/hkRRjoMacZoYYj9U
 PXCDFAoV5ADXfJ5IrwtnRPtHmHDheZWQyjzTuEANUWWM76F3MNMTPmsKZH1OP7zelZGI
 mix7nsw+OSO/+r5tPMU9E01QfI4bOs3bwjERpKfbTs59v/CoX8UEqRpRhk4/xum7Iuvc
 RXaeiHcyd1LsTzt/GYF6f5N+HDwTs6/KUN9bDXtQF2JTp/F2uT1jngcb2BWsZyv2IC2/
 n+Qw==
X-Gm-Message-State: AOAM532USdx6mNLV+VUfx7SCmMIP7fkDBIOUcmIGlD4bMTBQPMH36bNu
 OGn5ghwRgW8qoLzHF0EoaGAzGftDST4DBw==
X-Google-Smtp-Source: ABdhPJxwEZpzplICF1lNJBOgcCJaOuyXZ5o4aYRAe12V4xHVE8dcs0pPsHgPZVj/G8sid+GS8MATVg==
X-Received: by 2002:a17:907:7d8e:b0:711:cf4b:9c5 with SMTP id
 oz14-20020a1709077d8e00b00711cf4b09c5mr5311226ejc.637.1655227674280; 
 Tue, 14 Jun 2022 10:27:54 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 e3-20020a056402104300b0042b5cf75d6esm7339286edu.97.2022.06.14.10.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 10:27:53 -0700 (PDT)
Message-ID: <9aaab01d-1e99-14a0-bff2-237da08206ca@mind.be>
Date: Tue, 14 Jun 2022 19:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
 <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
Organization: Essensium/Mind
In-Reply-To: <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE0LzA2LzIwMjIgMTk6MTQsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IMKgKE5v
IG5lZWQgdG8gcmVzZW5kIGZvciB0aGlzIG9yIGFueSBvZiBteSBvdGhlciBjb21tZW50cywganVz
dCBGWUkgZm9yIGZ1dHVyZSAKPiBzdWJtaXNzaW9ucy4pIAoKIMKgQWN0dWFsbHksIHRoZSBwYXRj
aCBkaWRuJ3QgYXBwZWFyIG9uIHBhdGNod29yayBmb3Igc29tZSByZWFzb24uIEl0IGFuYWx5emVk
IGl0IAphcyBhIHJlcGx5IHRvIHRoZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4gU28g
eW91IHdpbGwgaGF2ZSB0byByZXNlbmQgaXQgCmFmdGVyIGFsbC4KCgogwqBSZWdhcmRzLAogwqBB
cm5vdXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
