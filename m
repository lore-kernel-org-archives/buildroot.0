Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4BEC77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 15:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D4C281F79;
	Mon, 10 Apr 2023 15:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D4C281F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2_WFECanMVV; Mon, 10 Apr 2023 15:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D32281AEA;
	Mon, 10 Apr 2023 15:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D32281AEA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 549CF1C3B71
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 15:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E0F240B9D
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 15:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E0F240B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DShYiWa9i9Oc for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 15:31:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27F46404B9
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27F46404B9
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 15:31:47 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e22so4710910wra.6
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 08:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681140705;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JQXA2xeSbIgPxjOQK0SEqjGIRST7sHpwgkE8n2EAKow=;
 b=V4LZlYOG/fzHk+KySqxpmWq8+XqGpVKOWKA7LfxG5Lt/P9v0bH/8FeCOukwvh/Ta2h
 WLD66PvjYLaw42wdwHZTCfxhTEoemf01V3Wpv2zxnlpJd7W4z2zEY6iC4nHLTXW5sbjI
 kVabJFdTwqAOxRGMIPI6Ln/b7zOBruGEE4wfW52JJ7rT+dfKVtkzpEzKsvOBhbDJtj/5
 u/wyPw3LtEJR/bHTkPN3d7DeJEH7KZYzOisn0nTe7vABWBpZkFgtJWeH47YMF7iOjfQ/
 zfTvPTdJ4GA8AyNmTr/qVhw82ob9LPtvXPTuqOr+CIAe3zRcK25GStrlkiB9CyuMJpDD
 QLlQ==
X-Gm-Message-State: AAQBX9c48ZITN+DmIdlEyrkd3t7OWbbFaE9o4HfDogz8WQ1jMkvDWoxO
 D8JAy6tytN+QEV/540XqJiZN/EndmuwDloPOMuw=
X-Google-Smtp-Source: AKy350ZwDwL34q9M1gYbJSNaaluiFCkoJoolHcd+uqX0k6e/xB0x38dHWauys68LGIMixKIzE2jS2A==
X-Received: by 2002:adf:de8d:0:b0:2ef:eb06:f9c7 with SMTP id
 w13-20020adfde8d000000b002efeb06f9c7mr5022322wrl.18.1681140705044; 
 Mon, 10 Apr 2023 08:31:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 b2-20020adff242000000b002d322b9a7f5sm12082979wrp.88.2023.04.10.08.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 08:31:44 -0700 (PDT)
Message-ID: <1fb38bf6-b6a2-4987-22c2-410b1b77b041@mind.be>
Date: Mon, 10 Apr 2023 17:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Gerd Kautzmann <G.Kautzmann@PRIMES.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <1619D009AA8C9E469331A8EE22395AEC8C24E81A@Exchange2013.PRIMES.local>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <1619D009AA8C9E469331A8EE22395AEC8C24E81A@Exchange2013.PRIMES.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681140705;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JQXA2xeSbIgPxjOQK0SEqjGIRST7sHpwgkE8n2EAKow=;
 b=SRCSfar3TX/VeViHOUg0tCYs+kcxJv4GLhcRpsQaR0S/t4dnL0s7TeJ+U6kQX+vCFl
 7KfPU60ApXQ9sGEKavDQd/LVVTv75/70FvhPRvwLXR80ZwuDpD3VAMciuLGWrMkQKWQb
 NS7SQB8VWGXdtuQWRpnLmBKLE5xyYkS11SqgoEUw2sgR2QKa2Z49CjUtP1z4heBOLmFd
 Ie0uAr8NF6GLn9Qfi/F8jTnQuPg3Of8NRD7He/4tywOEURe4N/R1duCcXclonTyw8zwS
 bGLgAN8fiF3Aqm7AC4uJS+Ob/pIm7gUQc/D6KH8oR5SK+MUjJuKnFWLiZFJ4kWkRaSho
 85fQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SRCSfar3
Subject: Re: [Buildroot] depmod / drivers
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

CgpPbiAwNS8wNC8yMDIzIDA4OjQxLCBHZXJkIEthdXR6bWFubiB3cm90ZToKPiBIZWxsbyBNTCwK
PiAKPiBmb3IgcG9zdCBpbnN0YWxsYXRpb24gb2YgZGV2aWNlIGRyaXZlcnMgSSBuZWVkIGEgdG9v
bCBjYWxsZWQg4oCaZGVwbW9k4oCYIG9uIG15IAo+IFJhc3BiZXJyeSwuCgogIEkgYmVsaWV2ZSB0
aGlzIGhhcyBiZWVuIGV4cGxhaW5lZCBzb21ld2hlcmUgZWxzZSBhbHJlYWR5IGJ1dCBJIGNhbid0
IGZpbmQgdGhlIAptYWlsIC0gYW55d2F5OgoKICBZb3UgZG9uJ3QgbmVlZCBkZXBtb2Qgb24gdGhl
IFJhc3BiZXJyeS4gWW91IG5lZWQgZGVwbW9kIGR1cmluZyB0aGUgYnVpbGQgKGFuZCAKeW91IGNh
bid0IGJ1aWxkIG9uIHRoZSBSYXNwYmVycnkgYmVjYXVzZSBidWlsZHJvb3QgZG9lc24ndCBnaXZl
IHlvdSBhIGNvbXBpbGVyIApvbiB0aGUgUmFzcGJlcnJ5KS4KCiAgZGVwbW9kIGlzIHBhcnQgb2Yg
dGhlIGhvc3Qta21vZCBwYWNrYWdlLCB3aGljaCB3aWxsIGJlIGJ1aWx0IGF1dG9tYXRpY2FsbHkg
YnkgCkJ1aWxkcm9vdCB3aGVuIHlvdSBlbmFibGUgYSBrZXJuZWwgdG8gYmUgYnVpbHQgKGFuZCB5
b3UgY2FuIG9ubHkgYnVpbGQgbW9kdWxlcyAKaWYgeW91IGFsc28gYnVpbGQgdGhlIGtlcm5lbCku
CgogIEF0IHRoZSBlbmQgb2YgdGhlIGJ1aWxkLCBCdWlsZHJvb3Qgd2lsbCBydW4gZGVwbW9kIG9u
IGFsbCB0aGUgaW5zdGFsbGVkIAptb2R1bGVzIChpLmUuIHRoZSBtb2R1bGVzIGluICQoVEFSR0VU
X0RJUikvdXNyL2xpYi9tb2R1bGVzKS4KCiAgVGhlIGRvY3VtZW50YXRpb24gaGFzIGEgc2VjdGlv
biBvbiBob3cgdG8gYnVpbGQgZXh0ZXJuYWwga2VybmVsIG1vZHVsZXMgd2l0aCAKQnVpbGRyb290
LgoKICBJbiBvdGhlciB3b3JkczogeW91IGRvbid0IG5lZWQgYW55IGRlcG1vZCwgb25seSBidWls
ZCB0aGUgbW9kdWxlIGluIHRoZSBwcm9wZXIgCndheS4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4g
Cj4gV2hhdCBwYWNrYWdlcyBkbyBJIG5lZWQgdG8gaW5jbHVkZSBpbiBidWlsZHJvb3Q/Cj4gCj4g
VGhhbmtzCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
