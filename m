Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFF2C54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 21:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 683EF820C9;
	Wed, 27 Mar 2024 21:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9dkFrt3TiGG; Wed, 27 Mar 2024 21:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61303820CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61303820CA;
	Wed, 27 Mar 2024 21:51:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B41E41BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0D0341665
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y20o49CU1Zjq for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 21:51:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3958A415B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3958A415B1
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3958A415B1
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 21:51:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4148c6132b4so8320165e9.1
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 14:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711576272; x=1712181072;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9UwV6UXQ61OT+LfdPnrWnZEFZOpmomnHISSRgNfO9M=;
 b=HdI9ZS07CzpfsnUhc4/Qod7xCnWyvaTvHzyv72QAWXMVVZ9+bQtyEF1HUDWwQ+GTVF
 TutcvZEU7csTF0Ycd8ln98a1SZopnxzr1oX0dg46hSCV909O7/bydei+h1dR0MS/W2Ed
 7eW/qixblzcimTjk5t1J6Iog2bX9Y4Z8RsEpeIL4PF4GEyQliZQHXMH6nWCPr2lmTrQZ
 kTvZtoYQTdMwn6tOgASGplMjUK0Tu9iz6aZzvBGtW/2UJ7ttgzax14V0ylR9N22gBV49
 8aO4xIlZNqYn8jpjeRfpozEYAug23Qs/faSP5SsduirBwbzJH02e7EV79/dygVx6aqxv
 vFng==
X-Gm-Message-State: AOJu0YzmJGeCPTNB3tjCsivAgJnQBXFT8UBdyrDuHVbmeR+G6OX6CYVI
 NnSDMPDbIZzcIl34Z5sZcyalpQQkdfecqe9v+1GJVO44hlNwCLMHzVeumXdXmooGtNO7bBJ7y2v
 j
X-Google-Smtp-Source: AGHT+IEBs7+fU/6HvJ1FZ2j1LauG3UAbjh7J2w5D46rpYlOH6o3ZwWH3M4qvHqBsbHA3lSBrW/uyng==
X-Received: by 2002:a5d:66c5:0:b0:342:cd1b:eb5f with SMTP id
 k5-20020a5d66c5000000b00342cd1beb5fmr297612wrw.16.1711576271754; 
 Wed, 27 Mar 2024 14:51:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b0033e745b8bcfsm60885wrr.88.2024.03.27.14.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 14:51:11 -0700 (PDT)
Message-ID: <840d4fee-8266-4115-817c-89d6d7ff0d24@mind.be>
Date: Wed, 27 Mar 2024 22:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
 <20240213211512.3918044-4-james.hilliard1@gmail.com>
 <7384cb6e-1b5b-4fca-ba0c-2c4d0fcd05a3@bubu1.eu>
 <CADvTj4qvJzBr4jBwj4htyAa=hKm67yo06Gn+kmAizbyGnZ=b3Q@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CADvTj4qvJzBr4jBwj4htyAa=hKm67yo06Gn+kmAizbyGnZ=b3Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711576272; x=1712181072; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y9UwV6UXQ61OT+LfdPnrWnZEFZOpmomnHISSRgNfO9M=;
 b=GZXOPp6Ck9p7rs5RFXs+O+8Cwq57cRP/J45QlUpcZRvSCCzYceCHB7oPCwsVgf0zHj
 4ZOdbKS9/bbtOD7ejg+r/rMGPPcmB/Faif34nJKzn11INbFXa4ev88y1Uv1NwaU1uYLg
 G+IF21E0YEMq4DbY1UD3c70co+fiL7rILe+YzbiFV431pAGIAYMDzb6YiswslDfAIb1c
 h2moxQ5oeZZT+hS7foIEb5htpze4hdKWK1LyxK6IkotnnH2gRVPZ6v4jkbrM76oovXGL
 X4LCeXMoFcfoMAtQ6H5anwPrLcCf3YQxGHClkUKdGrAwcgMJHBXP60hktrgkB7jvpMKM
 RqTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GZXOPp6C
Subject: Re: [Buildroot] [PATCH v8 04/26] package/python-setuptools: revert
 to last version with functional --build-option
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC8wMi8yMDI0IDAwOjQzLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBPbiBUdWUsIEZl
YiAxMywgMjAyNCBhdCA0OjE04oCvUE0gTWFyY3VzIEhvZmZtYW5uIDxidWlsZHJvb3RAYnVidTEu
ZXU+IHdyb3RlOgo+Pgo+PiBIaSBKYW1lcywKPj4KPj4gT24gMTMuMDIuMjQgMjI6MTQsIEphbWVz
IEhpbGxpYXJkIHdyb3RlOgo+Pj4gQSByZWNlbnQgY2hhbmdlIGluIHNldHVwdG9vbHMgYWNjaWRl
bnRpYWxseSBicm9rZSB0aGUgYWJpbGl0eSB0bwo+Pj4gcGFzcyBidWlsZF9leHQgYXJncyB2aWEg
dGhlIC0tYnVpbGQtb3B0aW9uIGNvbmZpZyBzZXR0aW5nLgo+Pj4KPj4+IExldHMgZG93bmdyYWRl
IHRvIHRoZSBsYXN0IHdvcmtpbmcgdmVyc2lvbiBmb3Igbm93Lgo+Pgo+PiBEbyB5b3UgaGF2ZSBh
IGxpbmsgdG8gYSBpc3N1ZSBoZXJlPyBJcyB0aGluZyBhY2tub3dsZWRnZWQgYnkgdXBzdHJlYW0s
Cj4+IGlzIHRoaXMgcGxhbm5lZCB0byBiZSBmaXhlZD8KPiAKPiBZZWFoLCBJIGhhdmUgYSBwdWxs
IHJlcXVlc3QgcmV2ZXJ0aW5nIHRoZSBjaGFuZ2UgdGhhdCBjYXVzZWQgdGhpcyB0byBicmVhazoK
PiBodHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzL3B1bGwvNDIxOAo+IAo+IFRoZXJl
J3Mgc29tZSBsaW5rcy90aHJlYWRzIHRoZXJlIHdpdGggbW9yZSBpbmZvLgoKICBJSVVDIHRoZSBz
aXR1YXRpb24gZXZvbHZlZCBhbmQgd2Ugc2hvdWxkIGFwcGx5IApodHRwczovL2dpdGh1Yi5jb20v
cHlwYS9zZXR1cHRvb2xzL3B1bGwvNDIxNyBpbnN0ZWFkIG9mIGRvaW5nIHRoaXMgcmV2ZXJ0PwoK
ICBSZWdhcmRzLAogIEFybm91dAoKPiAKPj4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gICAgcGFja2Fn
ZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5oYXNoIHwgNCArKy0tCj4+PiAg
ICBwYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLm1rICAgfCA0ICsr
LS0KPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1z
ZXR1cHRvb2xzLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRv
b2xzLmhhc2gKPj4+IGluZGV4IDdmMTNhYzM4OTYuLjljOTcxZWVjMTEgMTAwNjQ0Cj4+PiAtLS0g
YS9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLmhhc2gKPj4+ICsr
KyBiL3BhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMuaGFzaAo+Pj4g
QEAgLTEsNSArMSw1IEBACj4+PiAgICAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9y
Zy9weXBpL3NldHVwdG9vbHMvanNvbgo+Pj4gLW1kNSAgYjgyZGU0NWFhYTZiOWJiOTExMjI2NjYw
MjEyZWJiODMgIHNldHVwdG9vbHMtNjkuMC4zLnRhci5nego+Pj4gLXNoYTI1NiAgYmUxYWY1N2Zj
NDA5ZjkzNjQ3ZjJlOGU0NTczYTE0MmVkMzg3MjRiOGNkZDM4OTcwNmE4NjdiYjRlZmNmMWU3OCAg
c2V0dXB0b29scy02OS4wLjMudGFyLmd6Cj4+PiArbWQ1ICBkOTY3Y2EyYmE3ZjQ2ZGI4ODdkYWVl
MmQ1YzliZDZhMiAgc2V0dXB0b29scy02OC4yLjIudGFyLmd6Cj4+PiArc2hhMjU2ICA0YWMxNDc1
Mjc2ZDJmMWM0ODY4NDg3NDA4OWZlZmNkODNiZDcxNjJkZGFhZmI4MWZhYzg2NmJhMGRiMjgyYTg3
ICBzZXR1cHRvb2xzLTY4LjIuMi50YXIuZ3oKPj4+ICAgICMgTG9jYWxseSBjb21wdXRlZCBzaGEy
NTYgY2hlY2tzdW1zCj4+PiAgICBzaGEyNTYgIDg2ZGEwZjAxYWVhZTQ2MzQ4YTNjM2Q0NjUxOTVk
YzFjZWNjZGU3OWY3OWU4Nzc2OWE2NGI4ZGEwNGIyYTQ3NDEgIExJQ0VOU0UKPj4+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLm1rIGIvcGFj
a2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5tawo+Pj4gaW5kZXggMGFl
YTNjNmNmYS4uZjI2ZjQyN2NjYyAxMDA2NDQKPj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXNldHVw
dG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsKPj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXNldHVw
dG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsKPj4+IEBAIC00LDkgKzQsOSBAQAo+Pj4gICAgIwo+
Pj4gICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4+Cj4+PiAtUFlUSE9OX1NFVFVQVE9PTFNf
VkVSU0lPTiA9IDY5LjAuMwo+Pj4gK1BZVEhPTl9TRVRVUFRPT0xTX1ZFUlNJT04gPSA2OC4yLjIK
Pj4+ICAgIFBZVEhPTl9TRVRVUFRPT0xTX1NPVVJDRSA9IHNldHVwdG9vbHMtJChQWVRIT05fU0VU
VVBUT09MU19WRVJTSU9OKS50YXIuZ3oKPj4+IC1QWVRIT05fU0VUVVBUT09MU19TSVRFID0gaHR0
cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2ZjL2M5L2IxNDZjYTE5NTQwM2Uw
MTgyYTM3NGUwZWE0ZGJjNjkxMzZiYWQzY2Q1NWJjMjkzZGY0OTZkNjI1ZDBmNwo+Pj4gK1BZVEhP
Tl9TRVRVUFRPT0xTX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2Fn
ZXMvZWYvY2MvOTNmNzIxM2IyYWI1ZWQzODNmOThjZTgwMjBlNjMyZWYyNTZiNDA2Yjg1Njk2MDZj
M2YxNjBlZDhlMWM5Cj4+PiAgICBQWVRIT05fU0VUVVBUT09MU19MSUNFTlNFID0gTUlUCj4+PiAg
ICBQWVRIT05fU0VUVVBUT09MU19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+Pj4gICAgUFlUSE9O
X1NFVFVQVE9PTFNfQ1BFX0lEX1ZFTkRPUiA9IHB5dGhvbgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
