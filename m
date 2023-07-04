Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C860EB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 20:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9404940969;
	Tue,  4 Jul 2023 20:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9404940969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyDWlQFqmPoa; Tue,  4 Jul 2023 20:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B744096C;
	Tue,  4 Jul 2023 20:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66B744096C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41D221BF42E
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 192404096C
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 192404096C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id am7OdlUbitPq for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 20:36:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 134F440969
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 134F440969
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 20:36:08 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51d9865b8a2so6753372a12.3
 for <buildroot@buildroot.org>; Tue, 04 Jul 2023 13:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688502967; x=1691094967;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OAoLdQoMhyZU5fDw400FizMz8tCa9O4UEKDEMb0AXfc=;
 b=bGh1naCNGM+iOibJKuphIfP6FUyDs8Ty/apnSigLr5RBEgkdICOMCkmGlAnjTMEmVs
 75+08eT10WdECu4IIXuDvZvQTGKOGPFaF6IR0KsHIJKl0axM8Fl4ttK/XCI8e5c8pMXP
 B/9oBQ5Cc2dTqZVZkd0VdbxGlk3LTyN7x172gDgKiFDuvJzPONLRZUqJAY79nozaRhPn
 udshN1m9Pkic5khgOfI3ML1xuur4Kkc/XtU/Hvwut7NzoXnNXZPNecAWa4fyZHHjxDTE
 bxNlpWSvRw0iJXsTn4i+Inok25UnbE+hf3Cf+JBPBOjkiaSANnwdmd421SSFgnz5MKp6
 QbrQ==
X-Gm-Message-State: ABy/qLZ15c5kA1xy1AliV0ySpS8VZ15AegJKOiXJcZKfmm8UnUMteVX2
 1MbbRFkOdqpHOT79AbVoV3Babw==
X-Google-Smtp-Source: APBJJlErPFviAGrC2TLf4wSPngpRCQRwNot/ybiFrtmf16jQL1nDk8PF5adMI3ZL7PY9F5BTqc7VoQ==
X-Received: by 2002:a17:906:393:b0:98e:26ae:9b01 with SMTP id
 b19-20020a170906039300b0098e26ae9b01mr9625897eja.65.1688502967053; 
 Tue, 04 Jul 2023 13:36:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 lf29-20020a170907175d00b0099329b3ab67sm4974302ejc.71.2023.07.04.13.36.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 13:36:06 -0700 (PDT)
Message-ID: <ee18c683-0968-e9a8-e46a-f08d591d798d@mind.be>
Date: Tue, 4 Jul 2023 22:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Sebastian WEYER <sebastian.weyer@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230608085015.1075425-1-sebastian.weyer@smile.fr>
 <20230703224149.51f6ac85@windsurf>
 <CADSVbUsPFy5-CZ22BUU_dYAGc-=ycpJYAKSmdj7nYm96Nn5PBQ@mail.gmail.com>
 <20230704153345.153f73ac@windsurf>
 <CADSVbUvonajc2AXV8pZq9_8zxADf0zcW95p-ygSvwqMJSWu-yA@mail.gmail.com>
In-Reply-To: <CADSVbUvonajc2AXV8pZq9_8zxADf0zcW95p-ygSvwqMJSWu-yA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688502967; x=1691094967;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OAoLdQoMhyZU5fDw400FizMz8tCa9O4UEKDEMb0AXfc=;
 b=Vi8fVDKQOYGneXq77MaED49RXZkUZn/MYRHXcAD5UptHanL6NQOAUB3GAHp1PN4+Gf
 vPL4TK3axhQKzN4VrRTCs5Yn+GhgjbS20tXUF9SDZgIEEYguVYmfKkd+AzhR2nOZ5GQw
 N9p3/ZjJlTvtGeiSpWjtuMee/SaBOjNaXpQ8AZtfgYAFJUZhdKxUtwVF7HmKJFL/L84J
 +LishwzZxxuDjOG8i3L8/Tb9C5EUjffop6BzDMMNoDfgE6RR/TKczj0IjNQxmwOZSAYd
 MGrVb/0z3oH5JqunW+PF1J+YaUIBEFUA/BJh1rKnUhSpyQGig7PLMovNkptK3LgI/doZ
 yzBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Vi8fVDKQ
Subject: Re: [Buildroot] [PATCH 1/1] package/rust-bindgen: new host package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBbU2ViYXN0aWVuLCBwbGVhc2UgZG9uJ3QgdG9wLXBvc3QsIGJ1dCByZXBseSBpbmxpbmUgbGlr
ZSBJIGRvIGJlbG93LiBOb3RlIHRoYXQgCnRoaXMgcmVxdWlyZXMgY29uZmlndXJpbmcgeW91ciBt
YWlsZXIgdG8gcXVvdGUgcmVwbGllcyBwcm9wZXJseS5dCgoKT24gMDQvMDcvMjAyMyAxNjoyNCwg
U2ViYXN0aWFuIFdFWUVSIHdyb3RlOgo+IEhlbGxvIFRob21hcywKPiAKPiBZZXMsIHRoZSBrZXJu
ZWwgb25seSBzdXBwb3J0cyBiaW5kZ2VuIGluIHZlcnNpb24gMC41Ni4wIChyZWxlYXNlZCBpbiBO
b3ZlbWJlciAKPiAyMDIwISkuCj4gU2luY2UgdGhlIHN1cHBvcnQgZm9yIFJ1c3QgaW4gdGhlIGtl
cm5lbCBmb3Igbm93IGlzIG9ubHkgdmVyeSBydWRpbWVudGFyeSBhbmQgCj4gdGhpcyBpcyBub3Qg
dGhlIG9ubHkgZGlmZmljdWx0eSAobGFjayBvZiBtaW5pbXVtIHZlcnNpb24gb2YgcnVzdGMgZm9y
IGV4YW1wbGUgCj4gYW5kIGxhY2sgb2YgYXJjaGl0ZWN0dXJlIHN1cHBvcnQpIEkgdGhpbmsgZm9y
IG5vdyBpdCBpcyBub3QgdGhhdCBiaWcgb2YgYSBkZWFsLgoKICBJIGJlbGlldmUgYXQgdGhpcyBw
b2ludCB0aGUga2VybmVsIHJ1c3Qgc3VwcG9ydCByZXF1aXJlcyBhIHZlcnkgc3BlY2lmaWMgcnVz
dCAKaW5zdGFsbGF0aW9uIChub3QganVzdCBmb3IgYmluZGdlbiksIHNvIGluZGVlZCBJIGRvbid0
IHRoaW5rIHdlIHNob3VsZCB0YWtlIHRoYXQgCmludG8gYWNjb3VudC4gSWYgd2Ugd2FudCB0byBi
ZSBhYmxlIHRvIGJ1aWxkIHRoZSBrZXJuZWwgcnVzdCBzdXBwb3J0IEkgdGhpbmsgCndlJ2xsIG5l
ZWQgdmVyc2lvbi1waW5uZWQgZHVwbGljYXRlcyBvZiBhIGJ1bmNoIG9mIHBhY2thZ2VzLiBBbmQg
Zm9yIHRoZSB0aW1lIApiZWluZyBpdCdzIHZlcnkgaGFyZCB0byBkbyB0aGF0IGJlY2F1c2UgdGhl
IHJlcXVpcmVkIHJ1c3QgdmVyc2lvbiB3aWxsIHByb2JhYmx5IApkZXBlbmQgb24gdGhlIGtlcm5l
bCB2ZXJzaW9uLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gU2Vi
YXN0aWFuCj4gCj4gCj4gT24gVHVlLCBKdWwgNCwgMjAyMyBhdCAzOjMz4oCvUE0gVGhvbWFzIFBl
dGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbSAKPiA8bWFpbHRvOnRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+PiB3cm90ZToKPiAKPiAgICAgSGVsbG8gU2ViYXN0aWFuLAo+
IAo+ICAgICBPbiBUdWUsIDQgSnVsIDIwMjMgMTI6NTA6MTYgKzAyMDAKPiAgICAgU2ViYXN0aWFu
IFdFWUVSIDxzZWJhc3RpYW4ud2V5ZXJAc21pbGUuZnIgPG1haWx0bzpzZWJhc3RpYW4ud2V5ZXJA
c21pbGUuZnI+Pgo+ICAgICB3cm90ZToKPiAKPiAgICAgID4gVGhhbmsgeW91IGZvciB5b3VyIGZl
ZWRiYWNrLgo+ICAgICAgPiBJdCB3YXMgYW4gb3ZlcnNpZ2h0IHRvIGxlYXZlIHRoZSBjb21tZW50
IGFzIGlzLCBhcyBpbml0aWFsbHkgdGhlIHBhY2thZ2UKPiAgICAgID4gd2FzIGFkZGVkIHdpdGgg
YSB2ZXJzaW9uIDwwLjYzLjAuCj4gICAgICA+IERvIHlvdSB0aGluayBhIGNvbW1lbnQgZXhwbGFp
bmluZyB0aGUgY29tbWFuZCBsaW5lIG9wdGlvbnMgYmVpbmcgZGVwcmVjYXRlZAo+ICAgICAgPiBz
aG91bGQgc3RheT8gQWxzbyBjb25zaWRlcmluZyB0aGF0IHRoZSBLZXJuZWwgc3RpbGwgdXNlcyB0
aGVzZSBvcHRpb25zIGZvcgo+ICAgICAgPiBpdHMgUnVzdCBtb2R1bGVzLgo+IAo+ICAgICBBaCwg
c28gdGhlIHByb3Bvc2VkIHZlcnNpb24gb2YgcnVzdC1iaW5kZ2VuIHdvdWxkIG5vdCB3b3JrIHRv
IHN1cHBvcnQKPiAgICAgdGhlIGluLWtlcm5lbCBSdXN0IHN1cHBvcnQ/IFRoaXMgaXMgYSBiaXQg
dW5mb3J0dW5hdGUuCj4gCj4gICAgIFJlZ2FyZGluZyB0aGUgY29tbWVudCwgSSdtIG5vdCBzdXJl
IHRoZXkgbWFrZSBzZW5zZS4gSWYgd2Ugc3RhcnQKPiAgICAgZG9jdW1lbnRpbmcgYWxsIHdoYXQn
cyBubyBsb25nZXIgc3VwcG9ydGVkIGJ5IGEgZ2l2ZW4gcGFja2FnZSwKPiAgICAgQnVpbGRyb290
IHdvdWxkIGJlIGZ1bGwgb2YgY29tbWVudHMgcmVsYXRlZCB0byBvYnNvbGV0ZSBmZWF0dXJlcyA6
LSkKPiAKPiAgICAgVGhvbWFzCj4gICAgIC0tIAo+ICAgICBUaG9tYXMgUGV0YXp6b25pLCBjby1v
d25lciBhbmQgQ0VPLCBCb290bGluCj4gICAgIEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gICAgIGh0dHBzOi8vYm9vdGxpbi5jb20gPGh0dHBzOi8v
Ym9vdGxpbi5jb20+Cj4gCj4gCj4gCj4gLS0gCj4gZWNvIFBvdXIgbGEgcGxhbsOodGUsIG4naW1w
cmltZXogY2UgbWFpbCBxdWUgc2kgYydlc3QgbsOpY2Vzc2FpcmUKPiBTTUlMRSA8aHR0cDovL3d3
dy5zbWlsZS5ldS8+Cj4gCj4gMTAtMTIgUnVlIE5pY29sYXMgQXBwZXJ0Cj4gNDQxMDAgTkFOVEVT
Cj4gCj4gCQo+ICpTZWJhc3RpYW4gV0VZRVIqCj4gU3RhZ2lhaXJlIHByb2R1Y3Rpb24KPiAKPiBl
bWFpbCBzZWJhc3RpYW4ud2V5ZXJAc21pbGUuZnIgPG1haWx0bzpzZWJhc3RpYW4ud2V5ZXJAc21p
bGUuZnI+Cj4gdXJsIGh0dHA6Ly93d3cuc21pbGUuZXUgPGh0dHA6Ly93d3cuc21pbGUuZXU+Cj4g
Cj4gVHdpdHRlciA8aHR0cHM6Ly90d2l0dGVyLmNvbS9Hcm91cGVTbWlsZT4gTGlua2VkSW4gCj4g
PGh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9jb21wYW55L3NtaWxlPiBHaXRodWIgPGh0dHBzOi8v
Z2l0aHViLmNvbS9TbWlsZS1TQT4KPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
