Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6950CC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1976184651;
	Fri, 12 Jul 2024 22:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFDaMHFAczHK; Fri, 12 Jul 2024 22:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DA4884658
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DA4884658;
	Fri, 12 Jul 2024 22:15:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B37B1BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8764F84651
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yR-zGklhSVrh for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:15:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87B7B84638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87B7B84638
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87B7B84638
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:15:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-367e50f71bbso1658257f8f.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720822548; x=1721427348;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xunUEkxLg2xJ/1dW+U7PRyPFheu4QwRFSmR3SmvDFT8=;
 b=AoRg4NKB9QsVp5n2FSPJ0XgkiRvv9EZ8mCIDfs+9iG/RhUPMH6vk0GHXrRVn4spWk7
 kTEuZuRQQIH4tpuXtmCt+HPx+QwycsE2fvwEhJHquqm1JJyPSuajz9g5b4Rxcprmspu0
 +Gp/VVdp/QwaL5z164o9dryuO9V7FGegaLXg3epcAKNwMGQPdvmFrueCX7DUcPyap/i7
 MNpQ/ogcL3BJhtY5l+LpqNu2byd7061eGbYm8hMHpPZ2DF3zyNwo1gIOOduIuIBgGVtw
 XEgs1GoXfhaUkMKKp3wpsHhQZHX0IA1qEaKMycjWJnHLliA+uLA6J//2HXSS9/7dQu+g
 TS8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAAKwHOtUkjXxKaB7E3x1G/Mb4JX3VNZ+WRB+5CNKWqs4oRdJVO2x/iGQFqK3rRlcVNErLZP4epSGl2/pEd5XgX6GKy6yNgA==
X-Gm-Message-State: AOJu0YyezmBvoEshyAdqAO/8+hLPcbOTbMpRUXNzkFaD2wJjum8DVB2V
 md8kUL5GsMdHGOUms1GepeQbqtlAoKQ+iBRZJv/snxaRMT8qsgdoijwG/T/tdUuXgQnJ01OhKri
 z
X-Google-Smtp-Source: AGHT+IFKuKegSwUskURR97GSXaEjHA/F39wyuW9k1OG/UOhhoxnlaCdRvtb5IB31yB07RXD2WkLIOA==
X-Received: by 2002:adf:ab19:0:b0:367:9ce9:f05a with SMTP id
 ffacd0b85a97d-367cea738e6mr7929419f8f.21.1720822548345; 
 Fri, 12 Jul 2024 15:15:48 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680daccacdsm179f8f.62.2024.07.12.15.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 15:15:48 -0700 (PDT)
Message-ID: <c8db4a2c-bee2-4ecc-9bf3-f0e1444964aa@smile.fr>
Date: Sat, 13 Jul 2024 00:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Romain Naour via buildroot <buildroot@buildroot.org>
References: <20240527100424.397567-1-romain.naour@smile.fr>
 <871q5jqesv.fsf@dell.be.48ers.dk>
Content-Language: fr
In-Reply-To: <871q5jqesv.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720822548; x=1721427348; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xunUEkxLg2xJ/1dW+U7PRyPFheu4QwRFSmR3SmvDFT8=;
 b=EGc1uGX02K697ubhu+duhTLDhDPFt97bmqxzv0zdzBQX9eoA0HhbTzahuT0dKDT504
 fBGw+D9fSHHKxgmA3UV+BN4lVOl9mDSxkvyrJG+eluuubvURid6+hBw+8ST8AnSL1SMa
 pXQzSp1s0IA9JLe6Gm/WsaUjAGcmpIWEmLeOE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=EGc1uGX0
Subject: Re: [Buildroot] [PATCHv2] configs/lepotato_defconfig: new defconfig
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAzMC8wNS8yMDI0IMOgIDIxOjI5LCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPj4+Pj4+ICJSb21haW4iID09IFJvbWFpbiBOYW91ciB2aWEgYnVpbGRyb290IDxi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgo+IAo+ICA+IEFkZCBiYXNpYyBzdXBwb3J0
IGZvciB0aGUgTGlicmUgQ29tcHV0ZXIgIkxlIFBvdGF0byIgU0JDLgo+ICA+IGh0dHBzOi8vbGli
cmUuY29tcHV0ZXIvcHJvZHVjdHMvYW1sLXM5MDV4LWNjCj4gCj4gID4gU2lnbmVkLW9mZi1ieTog
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4gID4gVGVzdGVkLWJ5OiBLaWxp
YW4gWmlubmVja2VyIDxraWxpYW4uemlubmVja2VyQG1haWwuZGU+Cj4gID4gU2lnbmVkLW9mZi1i
eTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4gID4gLS0tCj4gID4gdjI6
IGFkZCBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkgYW5kIGhhc2hlcwo+ICA+ICAg
ICB1cGRhdGUga2VybmVsIHRvIDYuNi4zMiBhbmQgdS1ib290IDIwMjQuMDQuCj4gID4gLS0tCj4g
ID4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsK
PiAgPiAgYm9hcmQvbGlicmVjb21wdXRlci9sZXBvdGF0by9leHRsaW51eC5jb25mICAgIHwgIDQg
Kwo+ICA+ICBib2FyZC9saWJyZWNvbXB1dGVyL2xlcG90YXRvL2dlbmltYWdlLmNmZyAgICAgfCAz
MyArKysrKysrKwo+ICA+ICAuLi4vcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMu
aGFzaCAgfCAgMiArCj4gID4gIC4uLi9sZXBvdGF0by9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gg
ICAgICAgICB8ICAyICsKPiAgPiAgLi4uL2xlcG90YXRvL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFz
aCAgICAgICAgIHwgIDIgKwo+ICA+ICBib2FyZC9saWJyZWNvbXB1dGVyL2xlcG90YXRvL3Bvc3Qt
YnVpbGQuc2ggICAgfCAgNSArKwo+ICA+ICBib2FyZC9saWJyZWNvbXB1dGVyL2xlcG90YXRvL3Bv
c3QtaW1hZ2Uuc2ggICAgfCAyMyArKysrKysKPiAgPiAgYm9hcmQvbGlicmVjb21wdXRlci9sZXBv
dGF0by9yZWFkbWUudHh0ICAgICAgIHwgODIgKysrKysrKysrKysrKysrKysrKwo+ICA+ICBjb25m
aWdzL2xlcG90YXRvX2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgICAgfCA1MiArKysrKysrKysr
KysKPiAgPiAgMTAgZmlsZXMgY2hhbmdlZCwgMjA3IGluc2VydGlvbnMoKykKPiAgPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGJvYXJkL2xpYnJlY29tcHV0ZXIvbGVwb3RhdG8vZXh0bGludXguY29uZgo+
ICA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvbGlicmVjb21wdXRlci9sZXBvdGF0by9nZW5p
bWFnZS5jZmcKPiAgPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2xpYnJlY29tcHV0ZXIvbGVw
b3RhdG8vcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMuaGFzaAo+ICA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYm9hcmQvbGlicmVjb21wdXRlci9sZXBvdGF0by9wYXRjaGVzL2xpbnV4
L2xpbnV4Lmhhc2gKPiAgPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2xpYnJlY29tcHV0ZXIv
bGVwb3RhdG8vcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoCj4gID4gIGNyZWF0ZSBtb2RlIDEwMDc1
NSBib2FyZC9saWJyZWNvbXB1dGVyL2xlcG90YXRvL3Bvc3QtYnVpbGQuc2gKPiAgPiAgY3JlYXRl
IG1vZGUgMTAwNzU1IGJvYXJkL2xpYnJlY29tcHV0ZXIvbGVwb3RhdG8vcG9zdC1pbWFnZS5zaAo+
ICA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvbGlicmVjb21wdXRlci9sZXBvdGF0by9yZWFk
bWUudHh0Cj4gID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2xlcG90YXRvX2RlZmNvbmZp
Zwo+IAo+ICA+ICsrKyBiL2JvYXJkL2xpYnJlY29tcHV0ZXIvbGVwb3RhdG8vZXh0bGludXguY29u
Zgo+ICA+IEBAIC0wLDAgKzEsNCBAQAo+ICA+ICtsYWJlbCBsaW51eAo+ICA+ICsgIGtlcm5lbCAv
SW1hZ2UKPiAgPiArICBkZXZpY2V0cmVlIC9tZXNvbi1neGwtczkwNXgtbGlicmV0ZWNoLWNjLmR0
Ygo+ICA+ICsgIGFwcGVuZCBjb25zb2xlPXR0eUFNTDAsMTE1MjAwIGVhcmx5cHJpbnRrIHJvb3Q9
L2Rldi9tbWNibGswcDIgcm9vdHdhaXQKPiAgPiBkaWZmIC0tZ2l0IGEvYm9hcmQvbGlicmVjb21w
dXRlci9sZXBvdGF0by9nZW5pbWFnZS5jZmcgYi9ib2FyZC9saWJyZWNvbXB1dGVyL2xlcG90YXRv
L2dlbmltYWdlLmNmZwo+ICA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gID4gaW5kZXggMDAwMDAw
MDAwMC4uYjEwZTVkOTQ0MAo+ICA+IC0tLSAvZGV2L251bGwKPiAgPiArKysgYi9ib2FyZC9saWJy
ZWNvbXB1dGVyL2xlcG90YXRvL2dlbmltYWdlLmNmZwo+ICA+IEBAIC0wLDAgKzEsMzMgQEAKPiAg
PiAraW1hZ2UgYm9vdC52ZmF0IHsKPiAgPiArCXZmYXQgewo+ICA+ICsJCWZpbGVzID0gewo+ICA+
ICsJCQkiSW1hZ2UiLAo+ICA+ICsJCQkibWVzb24tZ3hsLXM5MDV4LWxpYnJldGVjaC1jYy5kdGIi
LAo+ICA+ICsJCQkiZXh0bGludXgiCj4gCj4gSXMgdGhlIHZmYXQgcGFydGl0aW9uIHN0cmljdGx5
IG5lZWRlZCBvciBjb3VsZCB5b3UgZGlyZWN0bHkgaGF2ZSB0aGUKPiByb290ZnMgYXMgdGhlIGZp
cnN0L3NpbmdsZSBwYXJ0aXRpb24gbGlrZSB3ZSBkbyBmb3IgbGFmcml0ZT8KCkkgbmV2ZXIgdHJp
ZWQgd2l0aG91dCB0aGUgdmZhdCBwYXJ0aXRpb24uIEJ1dCBMYWZyaXRlIGJvYXJkIGlzIHRoZSBv
bmx5IG9uZQp3aXRob3V0IGFuIFNEY2FyZCBjb25uZWN0b3IgYW5kIG9ubHkgdXNlIGVtbWMgZmxh
c2hlZCB1c2luZyBhIFVTQiBmbGFzaCBkcml2ZS4KCmxpYnJlLWNvbXB1dGVyLXByb2plY3Qgc2Vl
bXMgdG8gdXNlIGdlbmltYWdlIGNvbmZpZ3VyYXRpb24gd2l0aCB2ZmF0IHBhcnRpdGlvbgpmb3Ig
bGVwb3RhdG86CgpodHRwczovL2dpdGh1Yi5jb20vbGlicmUtY29tcHV0ZXItcHJvamVjdC9saWJy
ZXRlY2gtYnVpbGRyb290L2Jsb2IvcmViYXNlL2JvYXJkL2xpYnJlY29tcHV0ZXIvZ2VuaW1hZ2Uv
aW5pdHJhbWZzL2dlbmltYWdlLmNmZyNMMQoKPiAKPiBJZiBzbywgdGhhdCB3b3VsZCBtYWtlIHRo
aW5ncyBhIGJpdCBzaW1wbGVyIChFLkcuIG5vIHBvc3QtYnVpbGQgc2NyaXB0LAo+IGhvc3QtbXRv
b2xzIC8gaG9zdC1kb3Nmc3Rvb2xzKS4KPiAKCkJlc3QgcmVnYXJkcywKUm9tYWluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
