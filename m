Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F135C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C58C661107;
	Wed,  8 Feb 2023 14:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C58C661107
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTrVFAXvhEzw; Wed,  8 Feb 2023 14:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D6E760E77;
	Wed,  8 Feb 2023 14:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D6E760E77
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E97AB1BF2C7
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2F0281FDB
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2F0281FDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zc_Pidj-xL9G for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:46:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E9981FD8
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90E9981FD8
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:46:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j23so1809536wra.0
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 06:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K93KyAwo0VZsI0L+CIP8U28q0N8MeBxyCGHgOaq/ypU=;
 b=xY+lz4U2aIOAIbf+uIm9IyPfgwDPziAuOd52DFGeG1MsYleytL+jzUukVs5JkFayA5
 K+55V1AySxVIve1JQcrT3X3O/IOxDm5v0a6O1tqTgXiyj41fyClxd3ZOojSB9y6iPi1D
 F7CLlxVutuzGYUwx/3j/aLTXZPAHdg/FAJdGI1VYInUq0fFXjjm4uK78R7PDegoPZbTc
 LA8pKo2iVwgod6BhwnedUqJhWmL4hEiUI4faBAkPd4/cvkBvJ5/8LLMuHZQMv7EwmhCR
 nFSBqSfrQ6jaqjlqd5E2GVGcosPORDSRzH84siKRKoAwrVHDeJKFIrQwgHRrRyVtKlPh
 FpUw==
X-Gm-Message-State: AO0yUKW2gTf0Htnh4zAAkA7krzFGgj+vP1jNCbalu3hEr0CZIZvgw3hZ
 VRngGwrCwj1nZeCO8JVajmVK0w==
X-Google-Smtp-Source: AK7set9uImRPxQpwOO30VWMz42nlSdPWroRTkgBRKPuG7u+V3Is9Jvv+SGyn5a9q44krpVD5015lgg==
X-Received: by 2002:a5d:58c3:0:b0:2c4:1ea:4b94 with SMTP id
 o3-20020a5d58c3000000b002c401ea4b94mr2415181wrf.69.1675867581627; 
 Wed, 08 Feb 2023 06:46:21 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adffbcd000000b002c3f6cd1f0fsm3666338wrs.83.2023.02.08.06.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 06:46:21 -0800 (PST)
Message-ID: <0b07f7e5-f76c-bbdb-ec81-703dd7fbb273@smile.fr>
Date: Wed, 8 Feb 2023 15:46:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB0493D3E3ADB83361E32EBFD79F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <VI1P190MB0493D3E3ADB83361E32EBFD79F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K93KyAwo0VZsI0L+CIP8U28q0N8MeBxyCGHgOaq/ypU=;
 b=5HSwVJWt28hGvjVXxSD+2DFnDLSgZrW25C9lvujlpP0Jp1n0CNQbcXDtby9cpOWPTJ
 NbV8HIoOCQ1aj1uzpH9UWfupWw4jq+0BqKSBzU3+5qs6KnZ4uX8my8sYD5qi1foSStDe
 poCeZr0YB6H/vjZqZxUTpYAiK0dQ74LZBVDIm7DjRXfVcr7ScKEwwBDgjLbJuhg5/Ijj
 BRQpnJiyHS4/K5ptxiXaHtVo/1LPNGtNgXsTQgZ3rLHWx85FwL3qpF9/njYcYDJ7I+Lw
 8hV3/+vqkdiA9yNF1aVQh/q51flLTR66E3ZPAY1k81SLB6qQkQJf2meS81BJtxQcTFKR
 3DWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=5HSwVJWt
Subject: Re: [Buildroot] [PATCH v2 01/11] package/llvm-project: new group
 for llvm packages
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAyNS8xMC8yMDIyIMOgIDA4OjAyLCBMYW5nIERhbmllbCB2aWEgYnVpbGRyb290
IGEgw6ljcml0wqA6Cj4gVG8gbWFrZSB1cGRhdGluZyBlYXNpZXIgaW4gdGhlIGZ1dHVyZSwgZ3Jv
dXAgYWxsIGxsdm0gcHJvamVjdHMgaW4KPiBvbmUgc3ViZm9sZGVyIGFuZCBkZWZpbmUgc29tZSB2
YXJpYWJsZXMgZm9yIGFsbCBvZiB0aGVtLgoKQWdyZWUsIGVzcGVjaWFsbHkgc2luY2UgaXQncyBu
b3dhZGF5IHJlbGVhc2VkIGZyb20gdGhlIHNhbWUgZ2l0IHJlcG9zaXRvcnkKKGxsdm0tcHJvamVj
dCkuCgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpC
ZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIExhbmcgPGQu
bGFuZ0BhYmF0ZWMuYXQ+Cj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAtIE5vIGNoYW5nZXMK
PiAtLS0KPiAgcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS1wcm9qZWN0Lm1rIHwgMTAgKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS1wcm9qZWN0Lm1rCj4gCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0tcHJvamVjdC5tayBiL3BhY2thZ2UvbGx2bS1w
cm9qZWN0L2xsdm0tcHJvamVjdC5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMC4uN2JhODliYjYwNQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2xsdm0t
cHJvamVjdC9sbHZtLXByb2plY3QubWsKPiBAQCAtMCwwICsxLDEwIEBACj4gKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gKyMKPiArIyBsbHZtLXByb2plY3QKPiArIwo+ICsjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ICsKPiArTExWTV9QUk9KRUNUX1ZFUlNJT04gPSAxMS4xLjAKPiArTExWTV9Q
Uk9KRUNUX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvcmVsZWFz
ZXMvZG93bmxvYWQvbGx2bW9yZy0kKExMVk1fUFJPSkVDVF9WRVJTSU9OKQo+ICsKPiAraW5jbHVk
ZSAkKHNvcnQgJCh3aWxkY2FyZCBwYWNrYWdlL2xsdm0tcHJvamVjdC8qLyoubWspKQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
