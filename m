Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA4BC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 17:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 502AC81EAD;
	Sun, 28 Apr 2024 17:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ziBTwjD4HWq; Sun, 28 Apr 2024 17:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D8AD81EDA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D8AD81EDA;
	Sun, 28 Apr 2024 17:07:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 733C11BF5A3
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 17:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C2E24058A
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 17:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIWcb9vMFChi for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 17:07:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B0CE40592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B0CE40592
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B0CE40592
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 17:07:43 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41b5e74fa83so24227865e9.0
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 10:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714324061; x=1714928861;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vWafG7QOihHEpZ5TcIGM4A36eUuYBOej3HKbXStch/A=;
 b=gsVptLc2JeXoUvFD+d5LdSRw2Pp4aIrquuPoJe8hKGrqlCozsIATo+42S4gdEHPQUa
 zh2CWB16hbi7JUbsaYI5F32URfGkaK2qGXPmcKkYSkaD7x5n3QXcTRjH+EzpiW+/PYiR
 ueYMe38GrxO/95lruEsXsxa84Ow5Om0L8k1YyHjjr6EXqCgRztb6Tzd/SpYV6/UXAtdW
 tMFLF8TmuyGSPmwFZjc8x1IA7IMLJRSLOBYEYqrAOlTeReqNgyhtwgukp9rSJwGM1p5m
 TvTzj9G+fhhmGoBTBSt1jcbHE4qDLr80trg6T9ZiFcxkcuJ7m1qWi0E9DH2VK8JO4bK5
 kSrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2Ci6joWYGwITv4KqFB86rlwLAypXmR8lhZ5Fi6Bv6Fo+VcKX/OZQM8PW6HFdF1y/lp4I2TbigPi7pvI+lwXBceae+PxXhJw==
X-Gm-Message-State: AOJu0YyLaUIItkO/5S3RSF2k+tbwazko96mS0HN1B0LIk63NGOkJ0ext
 EbCAGuCdKorIuhbbzTcnqccj/vy0X8PnBhsLA6+8pfyBvWRbOY2c0O6eeawE7uQ=
X-Google-Smtp-Source: AGHT+IHaUVjsu02Q/VtNUicdBFM62V9B2/dbebiUGmSXU348jDSUvH8l+Cqs772lHByNts+DrlZDpA==
X-Received: by 2002:a05:600c:3c8a:b0:418:ed23:a9f0 with SMTP id
 bg10-20020a05600c3c8a00b00418ed23a9f0mr4674549wmb.18.1714324060738; 
 Sun, 28 Apr 2024 10:07:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fm9-20020a05600c0c0900b0041bf21a62bcsm4829227wmb.1.2024.04.28.10.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 10:07:40 -0700 (PDT)
Message-ID: <3f5bfc71-d26f-4171-b707-5987c90f9d37@mind.be>
Date: Sun, 28 Apr 2024 19:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240324162848.17338-1-flavio.tapajos@newtesc.com.br>
 <9da7a354-13d5-4294-af8e-b6155688bdcc@mind.be>
 <87jzkheoe1.fsf@dell.be.48ers.dk>
Content-Language: en-GB
In-Reply-To: <87jzkheoe1.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714324061; x=1714928861; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vWafG7QOihHEpZ5TcIGM4A36eUuYBOej3HKbXStch/A=;
 b=SJilMoFBg62Y48DJl2P19px23zBtivtESLMEBSaJDT/sNbi4ZggOulNf88hfg5sfqm
 bXy8GsVzDwo+B+mgPYNFI5x/+5r4hn4E2IG7C+/QTELAUcJoVl5We52GCtNnF4yT7EY/
 PTKSTvqbmwKC8PecRX6iHDM75GMS3WFD3tYhLXUZXP0j3XGmNGMoQR/BYjlV3Zoj3/dg
 vDvLrhMhzTAqON8QHZMbllODUBDiZ/VyKoER6BapTLaLh+WwZtLq7aJFKd3Y3I1M0Scw
 4YXGQAi7UmJaniIPLTx7ISjad+TBm2V4JyfGN3eWI9bwMe+5Dw4UgPBpHjwy+SG1PUwu
 TasA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SJilMoFB
Subject: Re: [Buildroot] [PATCH 1/2] package/python-sqlalchemy: add cython
 for python-sqlalchemy
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
Cc: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyOC8wNC8yMDI0IDEzOjA3LCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4+Pj4+PiAiQXJu
b3V0IiA9PSBBcm5vdXQgVmFuZGVjYXBwZWxsZSB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVp
bGRyb290Lm9yZz4gd3JpdGVzOgo+IAo+ICAgPiBPbiAyNC8wMy8yMDI0IDE3OjI4LCBGbMOhdmlv
IFRhcGFqw7NzIHdyb3RlOgo+ICAgPj4gRnJvbTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxp
YXJkMUBnbWFpbC5jb20+Cj4gICA+PiBXaGVuIG1pZ3JhdGluZyB0byBzZXR1cHRvb2xzIHdpdGgg
cGVwNTE3IHN1cHBvcnQgd2UgbmVlZCB0byBhZGQKPiAgID4+IGhvc3QtcHl0aG9uLWN5dGhvbiB3
aGljaCBpcyBhIHBlcDUxNyBidWlsZCBkZXBlbmRlbmN5IGZvcgo+ICAgPj4gcHl0aG9uLXNxbGFs
Y2hlbXkuCj4gICA+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlh
cmQxQGdtYWlsLmNvbT4KPiAgID4+IFRlc3RlZC1CeTogRmzDoXZpbyBUYXBhasOzcyA8Zmxhdmlv
LnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+Cj4gICA+PiBTaWduZWQtb2ZmLWJ5OiBGbMOhdmlvIFRh
cGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KPiAKPiAgID4gIEkgZG9uJ3Qg
dW5kZXJzdGFuZCB3aHkgeW91IGNoZXJyeS1waWNrZWQgdGhhdCBwYXRjaCBmcm9tIHRoZQo+ICAg
PiAgcGVwNTE3LXNldHVwdG9vbHMgc2VyaWVzIC0gQUZBSUNTIGl0IHNob3VsZG4ndCBiZSBuZWVk
ZWQgZm9yIHRoZQo+ICAgPiAgdmVyc2lvbiBidW1wLiBCdXQgc2luY2UgaXQgbmVlZHMgdG8gYmUg
YXBwbGllZCBhdCBzb21lIHBvaW50IGFueXdheSwKPiAgID4gSSBhcHBsaWVkIGJvdGggdG8gbWFz
dGVyLCB0aGFua3MuCj4gCj4gU28gaXQgaXMgcHJlc3VtYWJseSBub3QgbmVlZGVkIGZvciAyMDI0
LjAyLngsIHJpZ2h0PwoKICBObywgaXQncyBvbmx5IG5lZWRlZCBmb3IgdGhlIG1pZ3JhdGUtdG8t
c2V0dXB0b29scyBzZXJpZXMgd2hpY2ggaXMgbm90IGluIAoyMDI0LjAyLnguCgogIFJlZ2FyZHMs
CiAgQXJub3V0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
