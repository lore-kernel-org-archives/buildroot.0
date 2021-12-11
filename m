Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8632EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 08:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F07EE83EED;
	Sat, 11 Dec 2021 08:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSVcvUakl6eV; Sat, 11 Dec 2021 08:31:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F8483EF6;
	Sat, 11 Dec 2021 08:31:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA9BE1BF471
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 08:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2A16401DC
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 08:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0oWVL_XgSHG for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 08:31:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BC7E4018B
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 08:31:01 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w1so36555934edc.6
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 00:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Nopjl26XkyGms0rQGq2hA+jUTYA9QRd7ayvw4vi+4yA=;
 b=DcCkScXQ05saP3vmNwT3U7W6k/9FIH7dl4BG0YWE0xU9v0s1wGj9Z7O2HUHcjf6DKK
 WMXyaGcsxH9XJlai13dOhGQZmtDqPjPXFgK+Td8gPBoiQ7B57Qi8QOIsIUax9pCyMKn4
 pw0HSNCVepuzv0lOkv/jsnEwgsJw1DA31uUici5Wem2htvauoAK+G2UXbRI8d1AytIiJ
 xW7VnfMS+RcOJnCMSHILucPTrj1xphesXA1Zta4s5ka84xJ/WBWoeT4oyy6Y2wCKzJ1N
 SGctcf1r+mqrHjaAUmwVCwmjfsO2RPZcMOZRxVrVbbNocLwJNxcqavS0UWtWd7xBfuwf
 9SrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Nopjl26XkyGms0rQGq2hA+jUTYA9QRd7ayvw4vi+4yA=;
 b=WKSCgzdkxXSUv/RQIcrsG5bcxUI0kBgtSYnRZJnFMBDGzPnWBU6mJh1dAX1LVFtEtb
 4o2mc4+T4HZ18+wbxbdACFY4cCkaDu23Z+zt5UyfvnCfjq6tqypVduiAiq5Thipw3YBE
 LMY6PIqnNkVuFQB/QYUmRFHlMxtMFraJmQA6IGkPiWK6ggbVRyT58+lgBynlyAGCRDbp
 kqA/HZlN6L7L45nJuTkyx2JAJx1BF6h+cISipuFrSA68eMSj5mljWlJwMb1mPcaeFZrk
 TqBuk/D1nDUjwnSJE7TEwOu34aFj3BO/bKEyy5yNc/yU4nKic3j6Glfke14D/pQ4orts
 wt+Q==
X-Gm-Message-State: AOAM531ZIaWRipXylIiAwogsEve1ZcmwBL1uUGOpGMlmTOdbjH4Ptv/t
 c6bDnjVw3kQprVfnKUzZl1T+Mw==
X-Google-Smtp-Source: ABdhPJwn5n9Ri2W5Ve7lzGaVK4+GsOcHcQFPzwYURD9UOEzLK8CFXDakHMqJX6YxsnCez323mfsJjQ==
X-Received: by 2002:a17:906:dfe4:: with SMTP id
 lc4mr30902512ejc.125.1639211459285; 
 Sat, 11 Dec 2021 00:30:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id nc24sm2828288ejc.94.2021.12.11.00.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 00:30:58 -0800 (PST)
Message-ID: <fc9dab66-647f-f64c-a277-b2686858c46f@mind.be>
Date: Sat, 11 Dec 2021 09:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <c2931bcc-68eb-e00e-5fc1-a67357c853b1@mind.be>
 <DFCC6A00-0724-4619-90D8-8D76A172442C@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <DFCC6A00-0724-4619-90D8-8D76A172442C@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 2/7] package/minijail: new package
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
Cc: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8xMi8yMDIxIDIxOjI2LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIaSBBcm5vdXQs
IFlhbm4sIEFsbCwKPiAKPj4gSWwgZ2lvcm5vIDEwIGRpYyAyMDIxLCBhbGxlIG9yZSAxOToxNSwg
QXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiAKPj4gaGEgc2NyaXR0bzoKPj4K
Pj4g77u/Cj4+Cj4+IE9uIDEwLzEyLzIwMjEgMTU6NDgsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+
Pj4gSGkgSm9zw6ksCj4+PiBPbiAxMC8xMi8yMSAxNToxMiwgSm9zw6kgUGVra2FyaW5lbiB3cm90
ZToKPj4+PiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgcGFja2FnZSBmb3IgbWluaWphaWwuCj4+PiBS
ZXdvcmQgIlRoaXMgcGF0Y2ggYWRkIHBhY2thZ2UgbWluaWphaWwiCj4+Cj4+IEFjdHVhbGx5LCBu
by4gRm9yIHNvbWV0aGluZyB0aGlzIHNpbXBsZSwgaXQncyBiZXR0ZXIgdG8gbGVhdmUgdGhlIGJv
ZHkgZW1wdHkgCj4+IChpLmUuIGp1c3QgdGhlIFNvQiksIGJlY2F1c2UgdGhlIHN1YmplY3Qgc2F5
cyBpdCBhbGwgYWxyZWFkeS4KPiAKPiBJIGFncmVlIHdpdGggeW91LiBCdXQgSSBkb27igJl0IGtu
b3cgd2h5IEnigJl2ZSBiZWVuIGFza2VkIHRvIHJlcGVhdCB0aGUgc3VtbWFyeSAKPiBpbnRvIHRo
ZSBib2R5IG9mIGNvbW1pdCBsb2csIGxpa2UgaW4gdGhpcyBjb21taXQ6Cj4gaHR0cHM6Ly9zb3Vy
Y2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vY29tbWl0LzRjYTI4ZTk4YWNlNWQxMjUzZWQ4Y2I5
NjIzZGZhYzkyOTZkNzA5NzEgCj4gPGh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9v
dC8tL2NvbW1pdC80Y2EyOGU5OGFjZTVkMTI1M2VkOGNiOTYyM2RmYWM5Mjk2ZDcwOTcxPgo+IAo+
IFRoaXMgaXMgYSBMaW51eCBwYXRjaCB0aGF0IGhhcyBiZWVuIGNvbW1pdHRlZCB0byBwaW5jdHJs
IG5leHQ6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIxMTEyNTIxMTQ0My4xMTUw
MTM1LTUtTXIuQm9zc21hbjA3NUBnbWFpbC5jb20vIAo+IDxodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMjExMTI1MjExNDQzLjExNTAxMzUtNS1Nci5Cb3NzbWFuMDc1QGdtYWlsLmNvbS8+
CgogIFdlbGwsIEkgaGF2ZSBubyBpZGVhIGFib3V0IHRoZSBwcmluY2lwbGVzIHRoYXQgbGllIGJl
aGluZCB0aGUgY29tbWVudHMgZ2l2ZW4gCmluIHRob3NlIG90aGVyIHByb2plY3RzLiBTbyBJIHRy
aWVkIHRvIGZpbmQgdGhlIG1haWwgdGhhdCBhc2tlZCBmb3IgaXQsIGJ1dCBJIApjb3VsZG4ndCBm
aW5kIGl0IGVpdGhlciBvbiB1LWJvb3QgcGF0Y2h3b3JrIFsxXSBvciBvbiBsb3JlLmtlcm5lbC5v
cmcuLi4KCiAgUmVnYXJkcywKICBBcm5vdXQKClsxXSAKaHR0cDovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvdWJvb3QvbGlzdC8/c2VyaWVzPSZzdWJtaXR0ZXI9Nzc0Nzkmc3RhdGU9KiZx
PTEwNTArY2xrJmFyY2hpdmU9JmRlbGVnYXRlPQoKCgo+IAo+IE1heWJlIGl0IGlzIGJlY2F1c2Ug
d2hlbiB5b3Ugc2VlIHRoZSBwYXRjaCBpbiBhIG1haWwgY2xpZW50KEnigJltIHRoaW5raW5nIGFi
b3V0IAo+IHRodW5kZXJiaXJkKSB0aGUgc3VtbWFyeSBpcyBzZXBhcmF0ZWQgYW5kIOKAnGRpZmZp
Y3VsdOKAnSB0byByZWFkLgo+IAo+IEkgZG9u4oCZdCBrbm93IHdoYXQgZWxzZSA6LSkKPiAKPiBC
ZXN0IHJlZ2FyZHMKPiBHaXVsaW8gQmVuZXR0aQo+IEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4g
Cj4+Cj4+IFJlZ2FyZHMsCj4+IEFybm91dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
