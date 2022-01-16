Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF78C433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 12:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F4EF60777;
	Sun, 16 Jan 2022 12:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bt0CalkGZiYt; Sun, 16 Jan 2022 12:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DED46076C;
	Sun, 16 Jan 2022 12:01:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8E821BF3F3
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 12:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C760880E7E
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 12:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPGzTwDsDyY1 for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 12:01:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51F3380DA8
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 12:01:28 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id 15so20007353edx.9
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 04:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oNwTXEhoNnrTi2sdJe6E9CVWINvy2Zvat93JAQ4wAzw=;
 b=JKGIhnkOxpcPm/QZr2g3cY7RR+oty0UIl2Yf3F2fv8403/FqmifCGTrnsfgH9y1Dq0
 AlPc4KGqLKh8t9FoiNscYSglmSxHkZ4wvcKhhgYgvJbCJxS0J/hDcfy9lkODLnW+G3S2
 Uz47G6mhAKXsK0VF/L7+prVuLGzOHb94YosUg4N6Lgq/aLuQScPkxVLpjQ85XzqkZJi7
 2BPPENpfThbyQKcIjsUiKt9wQr9jJvnkmXGSHJCsLEMMCyd0oUsRCxX98nnf2/JOxjnu
 RLMtpgmX55eqsbN9zsP7zXvtTSUO/Ye0h95/q/SCTCe+6Uj8J0t5DHP6Y6IhwjaPVgkj
 rr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oNwTXEhoNnrTi2sdJe6E9CVWINvy2Zvat93JAQ4wAzw=;
 b=G1nl229jvcVieusEUIaUjolg0fBqklHKZhZP0udFuifsFoJo78bqMYfnILyjIbYjEv
 L1kj0OartdP2k+DYzGOzCMINwl1/SfzrK2vqZo6h82hJcCkmPy6JWOgWd2XlFRmXrW8Q
 P1g5hKKpfXwucmpK0YM2Ja0mDbfakf8ayy/DOlTdg3Bk4YhfTrQEnO1Oi2M/zod4hW07
 hjAo7+zgABAG6TCZMfY1pmm4nZA0RS4rPSu1lrx58Phv6u5y6dw9IIheFzOFEmbocnZA
 23UNFcQSBoSkJJx/jRjWJxkzZTAPkeyOP0LYor8IU+Z891Q50rN6DbhnCsh7TqjpPGq3
 qjzA==
X-Gm-Message-State: AOAM533dXiHZJTv7mVFS05ii64gI66x68twyJWWrY3IxN4jCvCySLNwF
 yRHG+4Y6i6gw64WMluuQHOKoN+pn4Nx8Fg==
X-Google-Smtp-Source: ABdhPJwfaX1lmZDmzmnQFve+GfVZAxnPT+KcRe8nrOCORrDWkZ9okxAtEoRMMUqaaFosgQ2799wZPA==
X-Received: by 2002:a05:6402:518d:: with SMTP id
 q13mr16537650edd.377.1642334485981; 
 Sun, 16 Jan 2022 04:01:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o18sm483238ejd.52.2022.01.16.04.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 04:01:25 -0800 (PST)
Message-ID: <6ece845a-20a1-4d79-c544-21e0f1f2fc6f@mind.be>
Date: Sun, 16 Jan 2022 13:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220110200151.830192-1-ju.o@free.fr>
 <20220113215104.02a734a1@windsurf> <77b72a63fdde563f496649641a0efab1@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <77b72a63fdde563f496649641a0efab1@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gnupg: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNi8wMS8yMDIyIDExOjU1LCBKdWxpZW4gT2xpdmFpbiB3cm90ZToKPiBIaSBUaG9tYXMs
Cj4gCj4gT24gMTMvMDEvMjAyMiAyMTo1MSwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPj4gSGVs
bG8gSnVsaWVuLAo+Pgo+PiBPbiBNb24sIDEwIEphbiAyMDIyIDIxOjAxOjUxICswMTAwCj4+IEp1
bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+IHdyb3RlOgo+Pgo+Pj4gwqBbLi4uXQo+Pj4gK2Nv
bmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fR05VUEcKPj4+ICvCoMKgwqAgYm9vbCAicHl0aG9uLWdu
dXBnIgo+Pj4gK8KgwqDCoCBzZWxlY3QgQlIyX1BBQ0tBR0VfR05VUEcyIGlmICFCUjJfUEFDS0FH
RV9HTlVQRyAjIHJ1bnRpbWUKPj4KPj4gVGhpcyBnZW5lcmF0ZXMgYSBjaXJjdWxhciBkZXBlbmRl
bmN5IHJlcG9ydGVkIGJ5IGtjb25maWcsIGJlY2F1c2UKPj4gYW5vdGhlciBwYWNrYWdlIGRvZXMg
ZXhhY3RseSB0aGUgb3Bwb3NpdGUuIFNvIEkgaGF2ZSBpbnZlcnRlZCB0aGUgbG9naWMKPj4gaGVy
ZToKPj4KPj4gc2VsZWN0IEJSMl9QQUNLQUdFX0dOVVBHIGlmICFCUjJfUEFDS0FHRV9HTlVQRzIg
IyBydW50aW1lCj4gCj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgcmV2ZXJzaW5nIHRoZSBsb2dp
YyBvZiBhbGwgQnVpbGRyb290IHBhY2thZ2VzCj4gc2VsZWN0aW5nIGdudXBnIHNvIHRoZXkgZGVm
YXVsdCB0byBnbnVwZzI/Cj4gCj4gUXVvdGluZzogaHR0cHM6Ly9nbnVwZy5vcmcvZG93bmxvYWQv
aW5kZXguaHRtbAo+ICIiIgo+IEdudVBHIDEuNCBpcyB0aGUgb2xkLCBzaW5nbGUgYmluYXJ5IHZl
cnNpb24gd2hpY2ggc3RpbGwgc3VwcG9ydCB0aGUKPiB1bnNhZmUgUEdQLTIga2V5cy4gVGhpcyBi
cmFuY2ggaGFzIG5vIGRlcGVuZGVuY2llcyBvbiB0aGUgYWJvdmUgbGlzdGVkCj4gbGlicmFyaWVz
IG9yIHRoZSBQaW5lbnRyeS4gSG93ZXZlciwgaXQgbGFja3MgbWFueSBtb2Rlcm4gZmVhdHVyZXMg
YW5kCj4gd2lsbCByZWNlaXZlIG9ubHkgaW1wb3J0YW50IHVwZGF0ZXMuCj4gIiIiCj4gCj4gVGhl
cmUgaXMgY3VycmVudGx5IG9ubHkgdHdvIHBhY2thZ2VzIHNlbGVjdGluZyBnbnVwZzoKPiBncGdt
ZSBhbmQgcHl0aG9uLWdudXBnCj4gCj4gTW9zdCBMaW51eCBkaXN0cmlidXRpb25zIGFyZSBub3cg
c2hpcHBpbmcgZ251cGcyIGJ5IGRlZmF1bHQuwqAgZ251cGcgdjEKPiBpcyBub3cgbW9yZSBmb3Ig
bGVnYWN5L2NvbXBhdGliaWxpdHkgY2FzZXMuCgogIFBlcmhhcHMgd2Ugc2hvdWxkIHNpbXBseSBy
ZW1vdmUgZ251cGcgaW5zdGVhZC4gV2UndmUgaGFkIGdudXBnMiBmb3IgNy41IHllYXJzIApub3cs
IHRoYXQgc2hvdWxkIGJlIGVub3VnaCB0byBtaWdyYXRlLgoKICBSZWdhcmRzLAogIEFybm91dAoK
PiAKPiBJZiB5b3UgYWdyZWUsIEkgY2FuIHNlbmQgYSBwYXRjaCBmb3IgdGhpcy4KPiAKPiBCZXN0
IHJlZ2FyZHMsCj4gCj4gSnVsaWVuLgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
