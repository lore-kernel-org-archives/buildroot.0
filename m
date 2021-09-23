Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB41AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 19:31:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0BAB60E9B
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 19:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0BAB60E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E5CD41585;
	Thu, 23 Sep 2021 19:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJs9Ia5ZVQFg; Thu, 23 Sep 2021 19:31:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E868E41589;
	Thu, 23 Sep 2021 19:31:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77B331BF2B8
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 19:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67C848413E
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 19:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVXpR-E74RV3 for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 19:31:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A00FD83FA9
 for <buildroot@busybox.net>; Thu, 23 Sep 2021 19:31:09 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id dj4so26996078edb.5
 for <buildroot@busybox.net>; Thu, 23 Sep 2021 12:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=IlLThYHFo3TGZjNKt1o6VkfS1y4vI6YUVTqCBgAgbTg=;
 b=CXjqicXUxJaRV7Rl1eNnMPgJKu7vWAfd241vkEZ6msKEmcwqkPkwpFiekkGcRjVNPI
 ixSyD/LLaAt26K1Wrz0uhSvn2jX3JlD4MvQFcf1nxukG89eFFJjDSrN1ngW7/kvf5XQR
 Dl/I26Dwkolg8KpX4R7QSKNiW4DNcjQuMXozBEDvQNl6gtz0JfGPJWGNgaV2KYrmrJ8O
 nwZZrpsXrmyl7dQYQoAucF+zQb380BpzeAYuLNKYJ6OXr4na1c40GLnJJCkZYixGueRg
 O+s6dfJkGMXBdLgjjIzMN4XgzRkFcgEGx/6xGNZo+64xCOW//0ttqVo7lXdGq4HQy9gG
 uhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IlLThYHFo3TGZjNKt1o6VkfS1y4vI6YUVTqCBgAgbTg=;
 b=euCTgEeW0X51Eyrgih1hVsdUdzjTO17wD9U2GYca7BGu7AowxFLKuovHpTzhGemZmi
 qyjtmNdoQxZW6WuFZi4oVXAIZk6KJAe9hFzrqTmPfh8OdzPJGEbv+vrOc8GlJB5bKQop
 LC/YeeLPUbnnPxg57lC1PRGX80XWw5Eg08nl/d2udq0ZmVSsA50e1sj6QROgPXqyuLl+
 RmFzAqiyYBKrYAayxcZm7DvYi1lgHYHhs/epb0g22+cRsNyU6Mk9H0hRw8fm+uRLhV62
 Jvw+gvPAy6rNKX24tQjBAABX9ehGgpr/fYRLJBKPiA6XEBHlpo0Li6hbtyulk+uUzgoa
 m9+A==
X-Gm-Message-State: AOAM530UnObsZd7QVDRy3pYed/Bgi+hUtDsX2Oqg0pQd1bSlBSAOC3kO
 yz6voiT/X5Ld7eyiArRpJ8BuPw==
X-Google-Smtp-Source: ABdhPJwgJR9RUwHo7vMYeS7CA0bfmFGfWjJM95RNAqRWIYPe86ybPG46HkPxG72NsNJGmRaHpNPzTQ==
X-Received: by 2002:a50:f1d9:: with SMTP id y25mr591424edl.116.1632425467045; 
 Thu, 23 Sep 2021 12:31:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id mm23sm3674525ejb.78.2021.09.23.12.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 12:31:06 -0700 (PDT)
Message-ID: <b7942247-9f9e-8517-257d-538e96cc6e32@mind.be>
Date: Thu, 23 Sep 2021 21:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Ivan Riabtsov <ivriabtsov@gmail.com>, buildroot@busybox.net
References: <CAKAnv4E=JmqtbHR_EM8hL9QTjrSbjNKsBjvA5Ogiv1BYqGDVEQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAKAnv4E=JmqtbHR_EM8hL9QTjrSbjNKsBjvA5Ogiv1BYqGDVEQ@mail.gmail.com>
Subject: Re: [Buildroot] buildroot u-boot.nand oob size
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

ICBIaSBJdmFuLAoKT24gMjMvMDkvMjAyMSAxMzo1NSwgSXZhbiBSaWFidHNvdiB3cm90ZToKPiBJ
IGhhdmUgYSBzeXN0ZW0gb24gYW4gbXgyOGV2ayBjaGlwLCBJIGhhdmUgdHdvIHR5cGVzIG9mIG5h
bmQgbWVtb3J5LAo+IG9uZSB3aXRoIDY0IGJ5dGVzLCB0aGUgb3RoZXIgMTI4IGJ5dGVzLCBJIGFt
IGJ1aWxkaW5nIGEgYnVpbGRyb290LCBJCj4gbmVlZCBhIHVuaXZlcnNhbCBmaXJtd2FyZSBmb3Ig
Ym90aCB0eXBlcyBvZiBtZW1vcnksIEkgZm91bmQgaG93IHRvCj4gcGF0Y2ggdWJvb3Qgc28gdGhh
dCBpdCB3b3JrcyB3aXRoIGJvdGggbWVtb3J5IHR5cGVzLCBidXQgYnVpbGRyb290IGhhcwo+IGFu
IG9wdGlvbiBmb3IgdS1ib290Lm5hbmQgTkFORCBPT0Igc2l6ZSwgd2hpY2ggaXMgbm90IHJlY29n
bml6ZWQgYnkKPiB0aGUgYm9vdGxvYWRlciBkdXJpbmcgYm9vdCwgYnV0IGlzIGhhcmRjb2RlZCBp
biB1LWJvb3QubmFuZCwKPiAKPiBhY2NvcmRpbmdseSwgaWYgSSBzZXQgdS1ib290Lm5hbmQgb29i
IHNpemUgdG8gMTI4IGJ5dGVzLCB0aGVuIHRoZQo+IHN5c3RlbSB3aXRoIDY0IG1lbW9yeSB3aWxs
IG5vdCBib290IGFuZCB2aWNlIHZlcnNhLCB0ZWxsIG1lLCBpcyBpdAo+IHBvc3NpYmxlIHRvIHNv
bWVob3cgY3JlYXRlIGEgdW5pdmVyc2FsIGZpcm13YXJlIGZvciBib3RoIHR5cGVzIG9mIG5hbmQK
PiBtZW1vcnk/CgogIElmIHlvdSB1c2UgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfTkFORCwgdGhl
biBCdWlsZHJvb3Qgd2lsbCBydW4gdGhlIG14c2Jvb3QgCnRvb2wgdG8gY3JlYXRlIHUtYm9vdC5u
YW5kIGZyb20gdS1ib290LnNiLgoKICBJIHRoaW5rIHRoZXJlIGFyZSB0d28gb3B0aW9ucyBmb3Ig
eW91LgoKMS4gU2VsZWN0IEJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX1NCIGluc3RlYWQgb2YgX05B
TkQgYW5kIHVzZSBhIHBvc3QtYnVpbGQgCnNjcmlwdCB0byBnZW5lcmF0ZSB0aGUgdS1ib290Lm5h
bmQuCgoyLiBVc2UgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQ1VTVE9NIGFuZCBmaWxsIGluIHRo
ZSBuYW1lIG9mIHRoZSBpbWFnZSB0aGF0IGlzIApnZW5lcmF0ZWQgYnkgVS1Cb290IGl0c2VsZiAo
d2hpY2ggY291bGQgYmUgdS1ib290Lm5hbmQpLiBJbiB0aGlzIGNhc2UsIHlvdSBtdXN0IAptYWtl
IHN1cmUgeW91cnNlbGYgdGhhdCBVLUJvb3QncyAibWFrZSBhbGwiIHRhcmdldCBidWlsZHMgdGhp
cyBpbWFnZS4KCgo+IAo+IHBzIGkgY2FudCB3cml0ZSBtZXNzYWdlIHRvIGJ1aWxkcm9vdEBsaXN0
cy5idWlsZHJvb3Qub3Jn0LEgaSBnZXQgYQo+IG1lc3NhZ2UgIlVuZGVsaXZlcmVkIE1haWwgUmV0
dXJuZWQgdG8gU2VuZGVyIgoKICBsaXN0cy5idWlsZHJvb3Qub3JnIGlzIG9ubHkgdGhlIHdlYnNp
dGUuIFRoZSBtYWlsIGFkZHJlc3MgaXMgCmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnIChvciAubmV0
LCBvciBidWlsZHJvb3RAYnVzeWJveC5uZXQsIHRoZXkgYWxsIGVuZCB1cCBhdCAKdGhlIHNhbWUg
cGxhY2UpLgoKICBSZWdhcmRzLAogIEFybm91dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlz
dHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
