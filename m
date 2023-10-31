Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F39C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 11:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7EBD8176F;
	Tue, 31 Oct 2023 11:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7EBD8176F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6o8bZsRpXrYP; Tue, 31 Oct 2023 11:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F08E81D7C;
	Tue, 31 Oct 2023 11:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F08E81D7C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12C681BF322
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 11:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC5F1400F9
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 11:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC5F1400F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWQFpHNFgwnS for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 11:40:30 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 973E4400C6
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 11:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 973E4400C6
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5079f9675c6so8440977e87.2
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 04:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698752428; x=1699357228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JFyQaEBzwobm0iJ6AgEbfYRDGYObXAUTJeyc/1idh5M=;
 b=uEjET5x/9tqmqfX12hZZLW+VFaDxHVP86/i9xB2b1SjsbGL4N9BWDx0hF4bMLSDzbL
 d5AC648MBewo/VRjMjDIA9UWLydK/lznx6TDWBy2gUQPh7l3E7bztyqBLtn8xmkBTJr+
 b1pGsehgRegBPzGQOWVhRtGku2oM5Gb+hao7lTVlhztj3Oi7qt2rE4uEx2+YDmjSg4IL
 Fp4/OQEowSs/wsMRg3CPBeNw1+RIvW9KfDWG8q4DXlMpOaoj83ECdFYtHAPXit0F1xTi
 oypsoXGWiC2AgiGoj08ke81wQSkCXb+CZmHEGgK+gszeV3dH7LI1l+qqqAvevjtNcvM9
 g+OQ==
X-Gm-Message-State: AOJu0YwVzBFfudxWAQXfz9RlLvz/ExqsSsSBi+Dh+/SkZepp+KNBRUEV
 YfcVpXw3rjWh46M5YSZ4gYHVvWSgDi127NYkMUQ=
X-Google-Smtp-Source: AGHT+IF1i/e08FIxxCMmVnvlLq2trnFRg0mBsy7sluE5uL8Ea9EgLkKyc/ZiLc8pSebkpjTP+0GMnduV/+HVIac7jyE=
X-Received: by 2002:a19:ac4a:0:b0:504:357b:d68 with SMTP id
 r10-20020a19ac4a000000b00504357b0d68mr8945146lfc.62.1698752428228; Tue, 31
 Oct 2023 04:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231029234003.2606006-1-james.hilliard1@gmail.com>
In-Reply-To: <20231029234003.2606006-1-james.hilliard1@gmail.com>
Date: Tue, 31 Oct 2023 12:40:17 +0100
Message-ID: <CAGm1_ksGvKimjo8F9GB=Mg_oXwDpaiO50U0aLX8VmwUy+4g5HQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1698752428; x=1699357228; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFyQaEBzwobm0iJ6AgEbfYRDGYObXAUTJeyc/1idh5M=;
 b=JqwuF2ybaQvpTCQghiOHTksTOZquh78uiNPjaQpvkJMhcaEv9hiV20IMEe02jK6wV9
 dPnvMITisYVxSKJqJmKB5/Tq2ep8jkYGC6KQ4wYL+qBiOl3yqjqu0mAES46pxOrlv04a
 ZiNoXmPG6E9OqrZYj9jVasdbGuko+Pf3nbripUhozDPwpfKAmkzJHk/JF822rJ70T+7A
 jAWwx7RDmDqPUvSLHNhzP44wbp/CJLLvOY5iFNIfqXMqqtu87eF0wE3N7emft8pnwq1H
 Iego4Nlb+j6TKGHfPE8TkveoB2khOHZ/NUhYp+EAHWad+ODxRCLq0zXzud5xNMuw2C5u
 sipA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JqwuF2yb
Subject: Re: [Buildroot] [PATCH v4 1/4] package/python-poetry-core: new host
 package
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBPY3QgMzAsIDIwMjMgYXQgMTI6NDDigK9BTSBKYW1lcyBIaWxsaWFyZAo8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxs
aWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBZZWdvciBZZWZy
ZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cgo+IC0tLQo+IENoYW5nZXMgdjEgLT4g
djI6Cj4gICAtIHVwZGF0ZSB0byAxLjcuMAo+ICAgLSBkcm9wIHBhdGNoIHdoaWNoIGlzIG5vdyB1
cHN0cmVhbQo+IC0tLQo+ICBwYWNrYWdlL3B5dGhvbi1wb2V0cnktY29yZS9weXRob24tcG9ldHJ5
LWNvcmUuaGFzaCB8ICA1ICsrKysrCj4gIHBhY2thZ2UvcHl0aG9uLXBvZXRyeS1jb3JlL3B5dGhv
bi1wb2V0cnktY29yZS5tayAgIHwgMTQgKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1w
b2V0cnktY29yZS9weXRob24tcG9ldHJ5LWNvcmUuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9weXRob24tcG9ldHJ5LWNvcmUvcHl0aG9uLXBvZXRyeS1jb3JlLm1rCj4KPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9weXRob24tcG9ldHJ5LWNvcmUvcHl0aG9uLXBvZXRyeS1jb3JlLmhh
c2ggYi9wYWNrYWdlL3B5dGhvbi1wb2V0cnktY29yZS9weXRob24tcG9ldHJ5LWNvcmUuaGFzaAo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYzZiMTgwYzg1Mgo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1wb2V0cnktY29yZS9weXRob24tcG9l
dHJ5LWNvcmUuaGFzaAo+IEBAIC0wLDAgKzEsNSBAQAo+ICsjIG1kNSwgc2hhMjU2IGZyb20gaHR0
cHM6Ly9weXBpLm9yZy9weXBpL3BvZXRyeS1jb3JlL2pzb24KPiArbWQ1ICA3NDYxNTQ3Y2FjMGUw
ZTljOGNkNzQ2M2FhODdlNzQ3MCAgcG9ldHJ5X2NvcmUtMS43LjAudGFyLmd6Cj4gK3NoYTI1NiAg
OGY2NzliODNiZDljODIwMDgyNjM3YmVjYTEyMDQxMjRkNWQyYTc4NmU0ODE4ZGE0N2VjOGFjZWZk
MDM1M2I3NCAgcG9ldHJ5X2NvcmUtMS43LjAudGFyLmd6Cj4gKyMgTG9jYWxseSBjb21wdXRlZCBz
aGEyNTYgY2hlY2tzdW1zCj4gK3NoYTI1NiAgZjE5NzgxMzM3ODJiOTBmNDczM2JjMzA4ZGRiMTky
NjdjM2ZlMDQ3OTdjODhkOWVkM2JjMjE5MDMyNDk1YTk4MiAgTElDRU5TRQo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3B5dGhvbi1wb2V0cnktY29yZS9weXRob24tcG9ldHJ5LWNvcmUubWsgYi9wYWNr
YWdlL3B5dGhvbi1wb2V0cnktY29yZS9weXRob24tcG9ldHJ5LWNvcmUubWsKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjRjYTU4N2IxMWQKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS9weXRob24tcG9ldHJ5LWNvcmUvcHl0aG9uLXBvZXRyeS1jb3JlLm1r
Cj4gQEAgLTAsMCArMSwxNCBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMg
cHl0aG9uLXBvZXRyeS1jb3JlCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4g
K1BZVEhPTl9QT0VUUllfQ09SRV9WRVJTSU9OID0gMS43LjAKPiArUFlUSE9OX1BPRVRSWV9DT1JF
X1NPVVJDRSA9IHBvZXRyeV9jb3JlLSQoUFlUSE9OX1BPRVRSWV9DT1JFX1ZFUlNJT04pLnRhci5n
ego+ICtQWVRIT05fUE9FVFJZX0NPUkVfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVk
Lm9yZy9wYWNrYWdlcy9jYi8xYy9hZjdmODg2ZTcyM2IyZGZiYWVhOWI4YTczOTE1M2YyMjdiMzg2
ZGQ4NTZjZjk1NmY5ZmQwZWQwYTUwMmIKPiArUFlUSE9OX1BPRVRSWV9DT1JFX1NFVFVQX1RZUEUg
PSBwZXA1MTcKPiArUFlUSE9OX1BPRVRSWV9DT1JFX0xJQ0VOU0UgPSBNSVQKPiArUFlUSE9OX1BP
RVRSWV9DT1JFX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gKwo+ICskKGV2YWwgJChob3N0LXB5
dGhvbi1wYWNrYWdlKSkKPiAtLQo+IDIuMzQuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
