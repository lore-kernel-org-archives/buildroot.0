Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E071AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 20:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F4A6813E1;
	Mon, 21 Feb 2022 20:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QHmuTlFHqiOA; Mon, 21 Feb 2022 20:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 884FF813D5;
	Mon, 21 Feb 2022 20:02:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 302001BF319
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28DAA408B8
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dB_dEs-W0IsB for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 20:02:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D162E408AF
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 20:02:33 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id lw4so35947596ejb.12
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 12:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=uyHoWDxC6XAn4BGPDZZVyHQB2b7hz+mnaZCEapDT/qc=;
 b=aKJ1hGFCUbHHuSgGeS0g97W6JsWjg0iTdfOyuJy+GISXxuLETKx2dJcGiIyzVm9q+z
 R97iy6HObqqivki0JZa2NX3iEixwigJdsCb9idWPkFs6iDu1cS7gMJcp78p82nIuArp8
 nSD7nlKvK7dwN3BCIOvrWqJm3srCQMJXoIJuAbND8C0A0+rsqfJAw6JgwUho3l9WGQfB
 kbwbFKOa1OyzK8VRE7htRZF8sOOwbtSpPtBldTMvkahwIy6eAkJPrm2LoLzwZE5/LWbE
 FVBApfctAw336/ctQ+tWIr5nW96ILwqN6qJMCoY9ZRMyEGBCGsV/S1olnSYO8DiX7oiT
 r6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uyHoWDxC6XAn4BGPDZZVyHQB2b7hz+mnaZCEapDT/qc=;
 b=Dd3jOsnKg3Yfjku86HOgLgYSL+H0hcPIdnzUIqTbBsB99Cv3Bv31AMRIwQDPsWq1mz
 8R8lS77SpF2eLBXChCBQyVHb40HxE9RWHbHxzcpT2tdOlJOmVAsb7kH8duQHQkCz6eMd
 K4BMZ7BPbZd+4sDy30/M7LIMaikA3kfTLXSzdiL7syWDFA+WgysbEDwhNbYHNB45F0lZ
 0wMR88HsUbp3S4IFoI4QNBn8iIMVehnzoE/DUqSRowXedEeNkW69+ReGhOvAXyU7lFgk
 UQ8raFf8TYltRhZTPQlB5kW8Xt98vs92gptWAJQcmSY6HIlaHr8sLvHWMHXC7Tl535ra
 o6nA==
X-Gm-Message-State: AOAM530VoWktg4r46nY+XGCqQaZW0uHHtv6QR3R1nuEG51xjHrShXoCY
 tuPhMN4ptFxQLhuQDoPNM7EC3w==
X-Google-Smtp-Source: ABdhPJySqdCGvk+C9+zQSjh1FKOgiLlMID4NLpdP1LqPknVwB03Mi+Ht0Y1liC2Glh/146v6+NcpwQ==
X-Received: by 2002:a17:906:af68:b0:6cd:7896:15e with SMTP id
 os8-20020a170906af6800b006cd7896015emr17098797ejb.420.1645473751770; 
 Mon, 21 Feb 2022 12:02:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s19sm6257887edx.60.2022.02.21.12.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:02:31 -0800 (PST)
Message-ID: <f037328b-c5e2-97e0-870f-d233866b0685@mind.be>
Date: Mon, 21 Feb 2022 21:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Rezaei Vahid <vahidrezaei1371@gmail.com>, buildroot@buildroot.org
References: <CADq6Q1H0vBj6uD83gZMRxhxzwJUJF5xL55abZzh43QgV2iy50w@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADq6Q1H0vBj6uD83gZMRxhxzwJUJF5xL55abZzh43QgV2iy50w@mail.gmail.com>
Subject: Re: [Buildroot] building uclibc based toolchain with buildroot
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMS8wMi8yMDIyIDExOjQ4LCBSZXphZWkgVmFoaWQgd3JvdGU6Cj4gaGkKPiBJIHdhbnQg
dG8gY29tcGlsZSBhIEMrKzE3IGxpYnJhcnkgZm9yIG15IGJvYXJkLgo+IHRoZSB0b29sY2hhaW4g
dGhhdCBjb21lcyB3aXRoIG15IGJvYXJkIFNESyBkb2VzIG5vdCBzdXBwb3J0IEMrKzE3Lgo+IEkg
d2FudCB0byBidWlsZCBhIHVjbGliYyBiYXNlZCB0b29sY2hhaW4gd2l0aCBidWlsZHJvb3QuCj4g
SSBhbSBmb2xsb3dpbmcgdGhpcyB0dXRvcmlhbAo+IGh0dHBzOi8vd3d3LnVjbGliYy5vcmcvdG9v
bGNoYWlucy5odG1sIDxodHRwczovL3d3dy51Y2xpYmMub3JnL3Rvb2xjaGFpbnMuaHRtbD4KPiB0
aGUgb2xkIHRvb2xjaGFpbiBjb25maWd1cmF0aW9uLgo+IGFyY2jCoCDCoCDCoCDCoCDCoCDCoGFy
bQo+IG1jcHXCoCDCoCDCoCDCoCDCoCBjb3J0ZXgtYTcKPiBtZmxvYXQtYWJpwqAgwqBzb2Z0ZnAK
PiBtZnB1wqAgwqAgwqAgwqAgwqAgwqBuZW9uX3ZmcHY0Cj4gbm9fYWdncmFzaXZlX2xvb3Bfb3B0
aW1pemF0aW9ucwo+IAo+IGtlcm5lbMKgIDMuMTguMjAKPiB1Y2xpYmPCoCAwLjkuMzMuMgo+IAo+
IGdjYyA0LjkuMiAtLS0tKHdoaWNoIEkgd2FudCB0byB1cGdyYWRlIHRvIGEgdmVyc2lvbiB0aGF0
IHN1cHBvcnRzIEMrKzE3ICkKPiAKPiB3aGljaMKgIEkgaGF2ZSBVY2xpYmMgcm9vdGZzICh1Y2xp
YmMgMC45LjMzLjIpLCBJIGhhdmUgdG8gYnVpbGQgdG9vbGNoYWluIHdpdGggCj4gdWNsaWJjIDAu
OS4zMyBob3cgY2FuIEkgc3BlY2lmeSB0aGUgdmVyc2lvbiBvZiB1Y2xpYmMgb2YgdGhlIHRvb2xj
aGFpbj8KCiAgSXQgaXMgbm90IHBvc3NpYmxlIHdpdGggQnVpbGRyb290IHRvIHNwZWNpZnkgYW4g
b2xkIHZlcnNpb24gb2YgdUNsaWJjLCB0aGUgCmxhdGVzdCB1Q2xpYmMtTkcgcmVsZWFzZSBpcyBh
bHdheXMgdXNlZC4KCiAgU2luY2UgdUNsaWJjIGhhcyBubyBBQkkgc3RhYmlsaXR5IGd1YXJhbnRl
ZSwgdGhlcmUncyBubyB3YXkgdG8gY29tcGlsZSBhIApwcm9ncmFtIGFnYWluc3Qgb25lIHZlcnNp
b24gb2YgdUNsaWJjIGFuZCBydW4gaXQgd2l0aCBhIGRpZmZlcmVudCB1Q2xpYmMuIEl0IG1heSAK
d29yaywgYnV0IGl0IG1heSBhbHNvIGZhaWwgdG8gd29yayBpbiB3ZWlyZCBhbmQgaGFyZC10by1k
ZWJ1ZyB3YXlzLgoKICBTbyB5b3VyIG9wdGlvbnMgYXJlOgoKLSBCdWlsZCBhIGNvbXBsZXRlIHJv
b3RmcyB3aXRoIEJ1aWxkcm9vdC4KLSBDcmVhdGUgYW4gU0RLIHRoYXQgaW5jbHVkZXMgeW91ciBs
aWJyYXJ5IGFuZCBidWlsZCBpdCBmb3Igc3RhdGljIGxpbmtpbmcgb25seS4KLSBQdXQgeW91ciBs
aWJyYXJ5IGluIGEgImNvbnRhaW5lciIgaW1hZ2UgdGhhdCBpbmNsdWRlcyB1Q2xpYmMgYW5kIG90
aGVyIApsaWJyYXJpZXMgeW91IHdhbnQgdG8gbGluayBhZ2FpbnMuIEl0IGRvZXNuJ3QgbmVlZCB0
byBiZSBhbiBhY3R1YWwgY29udGFpbmVyLCAKeW91IGp1c3QgbmVlZCB0byBiaW5kLW1vdW50IC9w
cm9jIGFuZCAvc3lzIGFuZCBjaHJvb3QgaW50byBpdC4KCgogIFJlZ2FyZHMsCiAgQXJub3V0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
