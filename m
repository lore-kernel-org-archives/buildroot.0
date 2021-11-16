Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC35C433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 17:21:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED95C61A03
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 17:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED95C61A03
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B53140224;
	Tue, 16 Nov 2021 17:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bjnz1ZoEJpPx; Tue, 16 Nov 2021 17:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF9134039C;
	Tue, 16 Nov 2021 17:21:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EDBF1BF3FB
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 17:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AA8240224
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 17:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DGZV7p-ddO0W for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 17:21:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A0034039C
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 17:20:59 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y13so16104259edd.13
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 09:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=UGLlZ7e7l0UQs12+ni5FvDPzJ9ZXtNpfLpJ0ZYjXTF4=;
 b=CT1rARWWxNefqYlnXGIvvcdo7i9MT6J4Mq1SBocVec6jc02NRVnh0IRZoAnGA0D5dC
 LfP3dBYAgX5MQ4KCndCNAq2LMz+8uLN8ATPb9WGB79IjsOtIebZJ69S0h6g7MNdwVTx3
 RS0+6DDY2s+rkZAn4azUeq8q7NLlVEbdoR9o5EyLim/6xBxyjWgJk2XpcK2W9xX5+4F5
 Kz9fMMARI+Y+OJ/kRvZtpiaT5wbDjB2vumSshE+SVXj2pdsXFxhZfa5jTK7wJGKbUh7A
 CA3HGNk33cMl1dTJ16pUTAyLILW0KMYbAY9uw3+GFmS1a1mkhgo2TdCRpo9ke7J8YtkO
 IE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UGLlZ7e7l0UQs12+ni5FvDPzJ9ZXtNpfLpJ0ZYjXTF4=;
 b=ObuT8T/FBSPy9rn7WiCVidNstnadHczov6SFByK9/oe/+ilNbhFrB3ASq0sZig5zpU
 Gxs4dnudq/rIWyFOF8KO+yItC6Q5vUL4nTQ4Ygqvhh+NLDjd07qAAtDhXCiK/F5EvcnF
 VK5k3DkSQlUjUz/dPAmXG3wwbkyY0Wi7JiJYjmr86SBiDhMiUJKSMccgKaug595OkP9Y
 3zl03S2LrlGVH7bWPAqU/YBVPwY7yMCBA9PvJMsRtUHttwklYwpuHd5gRHkFmDXCUUgO
 ovX/CDgzcYl9FEKzlAZ2HrjJe/luBOOnnJfPqHUD/vncYbp5iuULZyu1urFCCGEUCCxw
 57nw==
X-Gm-Message-State: AOAM532DvzqfNvVBUS3AIFP7xqpOH9D4Le/TwbSpeVkrgkljdL8tOP3d
 JxqkWEOcSc3uYH3NPg8V1nEYOgoPV2e4jhtB
X-Google-Smtp-Source: ABdhPJxRVCqeQ/XxY2lds7BidmX8ci5OYBnJ583w3C5nsfPw5WC0b4rFNDbw2RCxJBwzlQSa97L1ag==
X-Received: by 2002:aa7:ca4f:: with SMTP id j15mr12311476edt.178.1637083258081; 
 Tue, 16 Nov 2021 09:20:58 -0800 (PST)
Received: from ?IPv6:2a02:a03f:6bfb:d00:7eb0:c2ff:fef4:f493?
 ([2a02:a03f:6bfb:d00:7eb0:c2ff:fef4:f493])
 by smtp.gmail.com with ESMTPSA id de37sm8465205ejc.60.2021.11.16.09.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 09:20:57 -0800 (PST)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211115173344.3861620-1-fontaine.fabrice@gmail.com>
From: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <a6dad847-a0ec-aeba-90ce-252d8907ad43@mind.be>
Date: Tue, 16 Nov 2021 18:20:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115173344.3861620-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] package/mupdf: disable objcopy
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiAxMS8xNS8yMSA2OjMzIFBNLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IERy
b3AgZm91cnRoIHBhdGNoIGFuZCBkaXNhYmxlIG9iamNvcHkgYXMgc3VnZ2VzdGVkIGJ5IHVwc3Ry
ZWFtIGluCj4gaHR0cHM6Ly9idWdzLmdob3N0c2NyaXB0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9NzA0
NDQyI2MyCj4gCj4gVGhpcyB3aWxsIGFsc28gZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVy
ZSBvbiBzcGFyYzoKPiAKPiAgICAgIE9CSkNPUFkgYnVpbGQvcmVsZWFzZS9yZXNvdXJjZXMvZm9u
dHMvdXJ3L0RpbmdiYXRzLmNmZi5vCj4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5j
ZS0zL291dHB1dC0xL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2Mvc3BhcmM2
NC1idWlsZHJvb3QtbGludXgtZ251LzkuMy4wLy4uLy4uLy4uLy4uL3NwYXJjNjQtYnVpbGRyb290
LWxpbnV4LWdudS9iaW4vbGQ6IC0tcmVsYXggYW5kIC1yIG1heSBub3QgYmUgdXNlZCB0b2dldGhl
cgoKTmljZSEKClRoaXMgd2lsbCBhbHNvIGZpeCB0aGUgYnVpbGQgZm9yIHh0ZW5zYToKICAgICAg
T0JKQ09QWSBidWlsZC9yZWxlYXNlL3Jlc291cmNlcy9mb250cy91cncvRGluZ2JhdHMuY2ZmLm8K
ICAgICAgT0JKQ09QWSBidWlsZC9yZWxlYXNlL3Jlc291cmNlcy9mb250cy91cncvTmltYnVzTW9u
b1BTLUJvbGQuY2ZmLm8KIAovdG1wL2luc3RhbmNlLTEvb3V0cHV0LTEvaG9zdC9vcHQvZXh0LXRv
b2xjaGFpbi9iaW4vLi4vbGliL2djYy94dGVuc2EtYnVpbGRyb290LWxpbnV4LXVjbGliYy85LjMu
MC8uLi8uLi8uLi8uLi94dGVuc2EtYnVpbGRyb290LWxpbnV4LXVjbGliYy9iaW4vbGQ6IAotLXJl
bGF4IGFuZCAtciBtYXkgbm90IGJlIHVzZWQgdG9nZXRoZXIKaHR0cDovL2F1dG9idWlsZC5idWls
ZHJvb3QubmV0L3Jlc3VsdHMvMDk0NWYzMDVkMzE1MzA2NzcyODJmMzhmYTdjOTlhZjUyOTVkNDdi
ZAoKCkkgaGF2ZW4ndCBoYWQgYSBjaGFuY2UgdG8gcnVudGltZS10ZXN0IGl0LCBidXQgSSBjYW4g
Y29uZmlybSBpdCBidWlsZHMgZm9yOgogICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi14ODYt
NjQtbXVzbCBbMS82XTogT0sKICAgICAgICAgICAgICAgICAgICBib290bGluLW1pcHNlbC11Y2xp
YmMgWzIvNl06IE9LCiAgICAgICAgICAgICAgICAgYm9vdGxpbi1taXBzZWwzMnI2LWdsaWJjIFsz
LzZdOiBPSwogICAgICAgICAgICAgICAgICAgICBib290bGluLXNwYXJjLXVjbGliYyBbNC82XTog
U0tJUFBFRAogICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tc3BhcmM2NC1nbGliYyBbNS82XTog
T0sKICAgICAgICAgICAgICAgICAgICBib290bGluLXh0ZW5zYS11Y2xpYmMgWzYvNl06IE9LCgoK
VGhhbmtzIQoKUmFwaGHDq2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
