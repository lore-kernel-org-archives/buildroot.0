Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D10C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:26:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF5DC60232
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF5DC60232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EDA380E9C;
	Mon,  8 Nov 2021 22:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZlIE33g3oWq; Mon,  8 Nov 2021 22:26:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC8DB80E8F;
	Mon,  8 Nov 2021 22:26:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8ED311BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D34A60630
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOpNm-L0x_D6 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:08:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4AC460603
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:08:58 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x15so37281003edv.1
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 14:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IPNUSSFRGzJhgDAYAQwY1PbWfPmtWs0Jimkkuc8YEcg=;
 b=XqD18eN/3+ZNVkyv0KFa7YgTLPkL4u8w/poOjlqstTFQLU+IcaTgtnSYDlsezKg8JT
 1gpMCovQYJpHFOgF4iENfqNBROmBcdvvwnBPNCiadjzuULK+zOtnB6FXfohwJ2JkPCiE
 FkT38Y9vk//334zPIVXJEdQClQgrhYqA2D9BWdvXVBhmDNsLZiYbPnw1HYYCCiB8wBx+
 2OgLfOJxnUBFe0AXYLfzG2X/5IsBfnc0JGz+RHVV2Ozwg5P1oownal64b+LVbY9LOYt+
 zn4KpaJPZWx5ghrJ94E2gYVsr2Z2J0oWX8fQoc6UGMpoXiEoOCU3NaaNHGzgL5DUU6ki
 siSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IPNUSSFRGzJhgDAYAQwY1PbWfPmtWs0Jimkkuc8YEcg=;
 b=SmCJKw+kADKJfqNrid+htMU3VTkYn4zXqQ/k8URjikfswb5n5nro48wr18ig19QXzy
 b8w1bmfOo7k5yxNyZxc7t47gU9dm/0R3fIUKsIxrPlJkSPA1BpV2d5l1+Qj9mKr+RUyE
 Vn9jimJ5TCacs6QNE8LffwB+Jbazn6geFvgh6arKbKZ+B18ElvP7qFCim1cPHm5nanpb
 6oVNlmDVBGPg0Y2L9gMTA6fb9oWyMujaiH/ed3pWgdpmwi72mY4NHE94JS1cOWELdTVD
 FUF5mygdVWWKg3A2+4N7UbBP1+uo6LaQKnNbuNed1S+XtfM5gZaVqyazn91rTGryd8da
 gC6w==
X-Gm-Message-State: AOAM533s4nduX0Ly/SXYtnzEdV5X6mBPlSCai+U/xKZ4/z9RtxEUH1XH
 wnVdhrC6Qe7xdeTjaMdSyrEPZg==
X-Google-Smtp-Source: ABdhPJw5+e/Vd+5v16/EYHNLVJQCXNqh94eoXDv/OzToPlEfYDHwxJeJopHyrSi56ISEhlvYGtAcyA==
X-Received: by 2002:a17:906:c9d0:: with SMTP id
 hk16mr3109471ejb.109.1636409336970; 
 Mon, 08 Nov 2021 14:08:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e13sm8495532eje.95.2021.11.08.14.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 14:08:56 -0800 (PST)
Message-ID: <276de7b8-12a8-055a-7c62-f33befd82f5f@mind.be>
Date: Mon, 8 Nov 2021 23:08:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211107015835.3055951-1-giulio.benetti@benettiengineering.com>
 <20211108150731.GD680793@scaer> <20211108162404.58ebbd3c@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211108162404.58ebbd3c@windsurf>
Subject: Re: [Buildroot] [PATCH 000/102] Standardize/beautify genimage .cfg
 files for all boards
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
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8xMS8yMDIxIDE2OjI0LCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+IEhlbGxvLAo+
IAo+IE9uIE1vbiwgOCBOb3YgMjAyMSAxNjowNzozMSArMDEwMAo+ICJZYW5uIEUuIE1PUklOIiA8
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+IAo+PiBJIGtub3cgdGhpcyBhcyBiZWVu
IGRpc2N1c3NlZCBvbiBhbm90aGVyIHRocmVhZCB3aXRoIFBldGVyLCBhYm91dCB1c2luZwo+PiBL
L00gaW5zdGVhZCBvZiBiYXJlIG51bWJlcnMsIGFuZCBpdCB3YXMgbXkgdW5kZXJzdGFuZGluZyB0
aGF0IGlmIGEKPj4gY2hhbmdlIHdlcmUgdG8gYmUgbWFkZSwgaXQgd291bGQgYmUgcmVzdHJpY3Rl
ZCB0byBqdXN0IHRoYXQuCj4+Cj4+IEhvd2V2ZXIsIEkgcXVlc3Rpb24gdGhlIHJlbGV2YW5jZSBv
ZiB0aGlzICpodWdlKiBwYXRjaHNldCBqdXN0IGZvciBhCj4+IG1ha2VvdmVyLgo+Pgo+PiBZZXMs
IHVzdWFsbHksIEkgbGlrZSBjb25zaXN0ZW5jeSwgYnV0IGhlcmUgd2UgaGF2ZSBhIHR3by1lZGdl
IGlzc3VlOgo+Pgo+PiAgICAtIHRoZSBzZXJpZXMgaXMgaHVnZSwgYW5kIGNhdXNlcyBhIGxvdCBv
ZiBjaHVybiBtYWtpbmcgcGVuZGluZyBwYXRjaGVzCj4+ICAgICAgbW9yZSBkaWZmaWN1bHQgdG8g
YXBwbHksCj4gCj4gSSB3b3VsZCBhZ3JlZSBpbiBnZW5lcmFsLCBidXQgaGVyZSBJIGRvdWJ0IGl0
IGlzIHJlYWxseSBnb2luZyB0byBjYXVzZQo+IG11Y2ggY29uZmxpY3Qgd2l0aCBvdGhlciBwZW5k
aW5nIHBhdGNoZXMuCj4gCj4+ICAgIC0gdGhlIGdlbmltYWdlIGZvcm1hdCBpcyBub3Qgd2VsbCBk
ZWZpbmVkLCBhbmQgdGhlcmUgaXMgbm8gbGludGVyLCBzbwo+PiAgICAgIHRoZSBleGlzdGluZyBm
aWxlcyAqd2lsbCogZGl2ZXJnZSBhZ2FpbiwgYW5kIHdlIHdvbid0IG5vdGljZSB0aGF0Cj4+ICAg
ICAgbmV3IGZpbGVzIHdvbid0IGJlIGNvbXBsaWFudC4KPiAKPiBSaWdodCwgYnV0IHRoYXQncyBu
b3QgcmVhbGx5IGEgcmVhc29uIHRvIG5vdCB0YWtlIHRoaXMgcGF0Y2ggc2VyaWVzLgo+IAo+IE9u
IG15IHNpZGUsIEkgd291bGQgc2ltcGx5IGFwcGx5IHRoZSB3aG9sZSB0aGluZy4gSXQgbWFrZXMg
dGhpbmdzCj4gb3ZlcmFsbCBiZXR0ZXIgKHBlcmhhcHMgbm90IHBlcmZlY3QsIGJ1dCBiZXR0ZXIg
YW5kIG1vcmUgY29uc2lzdGVudCkuCgogIFNpbmNlIEkgYWdyZWUgd2l0aCBUaG9tYXMsIGFuZCBz
aW5jZSBHaXVsaW8gcHJvbWlzZWQgaGUnZCBtYWtlIGEgY2hlY2stcGFja2FnZSAKY2hlY2sgZm9y
IGl0LCBJIGFwcGxpZWQgdGhlIHNlcmllcy4KCiAgVG8gYXZvaWQgcHJvYmxlbXMgd2l0aCBtZXJn
ZXMgZG93biB0aGUgbGluZSwgSSBhcHBsaWVkIHRvIGJvdGggbWFzdGVyIGFuZCBuZXh0LgoKICBS
ZWdhcmRzLAogIEFybm91dAoKPiAKPj4gSSB1c3VhbGx5IGzMtm/Mtsy2Ycy2dMy2aMy2IGTMtmXM
tnPMtnDMtmnMtnPMtmXMtiBozLZhzLZ0zLZlzLYgZG8gbm90IGxpa2UgVEFCcy4uLiBUaGUgd2lk
dGggb2YgYSBUQUIKPj4gdmFyaWVzIGRlcGVuZGluZyBvbiBvbmUncyBlbnZpcm9ubWVudCBhbmQg
Y29kaW5nIHByYWN0aWNlczsgdGhlIHVzdWFsCj4+IDgtc3BhY2Ugd2lkdGggbWFrZXMgZm9yIHZl
cnkgbG9uZywgdWdseSBsaW5lczsgVEFCIGJyZWFrIGNhcmVmdWxsCj4+IGluZGVudGF0aW9uLgo+
IAo+IEEgbWF0dGVyIG9mIHRhc3RlIGluZGVlZCwgYnV0IGluICJtYWtlIiAoeW91IGtub3cgdGhp
cyBsYW5ndWFnZSB3ZQo+IGhlYXZpbHkgYWJ1c2UgaW4gQnVpbGRyb290KSwgVEFCcyBhcmUga2lu
ZyEgU28gaXQgd291bGQgYmUga2luZCBvZgo+IGlyb25pY2FsIG5vdCB0byBhbGxvdyBUQUJzIGlu
IGEgbWFrZS1iYXNlZCBwcm9qZWN0IDotKQo+IAo+PiBBbmQgdGhlbiB0aGlzIGdhdmUgYSAxMDct
cGF0Y2ggc2VyaWVzLiBBbmQgdGhlIGNvbW1pdHMgYWxsIGhhdmUgdGhlIHNhbWUKPj4gdHlwbzog
J2JlYXRpZnknIGluc3RlYWQgb2YgJ2JlYXV0aWZ5Jy4gQWx0aG91Z2ggSSBjYW4gZm9yZ2l2ZSBh
IHR5cG8KPj4gKHdobyB3b3VsZCBJIGJlIG5vdCB0bz8pLCBhbmQgdGhpcyBvbmUgd2FzIGZ1bm55
IG9uZSwgZml4aW5nIGFsbCB0aG9zZQo+PiBtYW51YWxseSB3aGVuIGFwcGx5aW5nIHdpbGwgYmUg
YSB0ZWRpb3VzIHRhc2ssIHRob3VnaCwgc28geW91IHdvdWxkIGhhdmUKPj4gdG8gZG8gdGhhdCBv
biB5b3VyIHNpZGUgYW5kIHJlc3Bpbi4KPiAKPiBJIGRvbid0IGtub3cgaWYgdGhhdCB0eXBvIGlz
IHdvcnRoIGEgaHVnZSByZXNwaW4uCj4gCj4+IEJ1dCBiZWZvcmUgeW91IGRvIHNvLCBwbGVhc2Ug
d2FpdCBhIGJpdCBmb3Igb3RoZXJzIHRvIHNwZWFrIHVwLCBpZiB0aGlzCj4+IHNlcmllcyBpcyBy
ZWFsbHkgbWVhbmluZ2Z1bC4KPiAKPiBJIGhhdmVuJ3QgcmV2aWV3ZWQgaXQgaW4gaXRzIGVudGly
ZXR5LCBidXQgb3ZlcmFsbCwgSSB0aGluayB3ZSBzaG91bGQKPiBqdXN0IGFwcGx5LCBhbmQgbW92
ZSBvbi4gSS5lLCBiZSBwcmFnbWF0aWMuCj4gCj4gVGhvbWFzCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
