Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A82C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 22:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C1B941755;
	Mon,  6 Feb 2023 22:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1B941755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axL8qsuxZsAc; Mon,  6 Feb 2023 22:06:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AB8641750;
	Mon,  6 Feb 2023 22:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AB8641750
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF31F1BF422
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 22:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6F7D40383
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 22:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6F7D40383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WXISqmgJNTKi for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 22:06:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 266684016B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 266684016B
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 22:06:10 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so10080593wms.1
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 14:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V62wgPnnCqIawnLEMx31V1zTLoo/BZBY6B1CXNsnKFU=;
 b=qJZKVidl6pCWke56ULGeyiYl1Z117YUNlu/38k3+b4Q8P0CUgJwY2Uol6GObB4TR9C
 ywFHePRdVOt5HF6TefeFjqfC+K4hKtjbsFQAJQWv45l89b5AjdKpAHqFMZ4L3vqrhcUY
 A9UCvI5qqE64NsEs8ENpL13IS5bLh12MW8rvuOa0jFS89Zu1cro5R4/KMDfg+mQE4Hc4
 YXTz5F018ZVvc5K+EneWW9l560T/jTAVwr14/2lqFp9BEpltoWYh4xos2pa9NG5zY2Lu
 E8IeVv9KdQQsviHH//vgGdouosQl8frTIWifcmvwHNr6nZqb9KlsrtRCSZvMgh4FrXAV
 5rVQ==
X-Gm-Message-State: AO0yUKU8Hy33wZGpm2Mh+VdYMS87PJ6Qu44ucbZxS5pgoNG6g2BGXQg4
 VVbeE/z/KBETYE4yzRf1ce3NGQ==
X-Google-Smtp-Source: AK7set9sw9AnS27BIVao8PK87ZCRuEHuhJExIN2CUUmlPCflEK3XQHGj8a1f8j/y7djSxaCOjv92dQ==
X-Received: by 2002:a05:600c:13c8:b0:3da:28a9:a900 with SMTP id
 e8-20020a05600c13c800b003da28a9a900mr1012905wmg.41.1675721168119; 
 Mon, 06 Feb 2023 14:06:08 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c190e00b003daf681d05dsm13172443wmq.26.2023.02.06.14.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 14:06:07 -0800 (PST)
Message-ID: <dafa3a0f-e1d8-bc5f-ff82-ccb802f7c364@smile.fr>
Date: Mon, 6 Feb 2023 23:06:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Robert Hancock <robert.hancock@calian.com>
References: <20221012215008.2918444-1-thomas.petazzoni@bootlin.com>
 <5eebf7dee2a585f50a4e986c214677a157bfd22c.camel@calian.com>
 <20221013163910.3c6d9c8f@windsurf>
 <5d683c3c-1229-70e6-1736-ca01dd1a7159@smile.fr>
In-Reply-To: <5d683c3c-1229-70e6-1736-ca01dd1a7159@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V62wgPnnCqIawnLEMx31V1zTLoo/BZBY6B1CXNsnKFU=;
 b=cxk0QJvTXhaxEfepyPeCP0Y7tMvf9x9HzYzDiw3bC+/GoJmuKOE3Ggbe7fk3L64fUA
 zdD5LE2+R1GBmFfIiytAiLLLp1YSTy3xshPOtMZr4/NF8RLUysxwDI4d58JSYYRS9Xbv
 Cv5qkiffL5Jn8TGynVEO35o+9D75YXI/i1vFgicQ24+6Ndqj8p+IplGMad2MsoZpNvJR
 CwBG/8uYO+4qDaWgqlrmtvUtygjygZRMvm8DH4d/b06jdU4Sq+zFCwgHj8Y93sYwexFq
 ETSyevtq6Hw1OxEgclkeSMcEcagF3qUsAoQhpkCRnWZgkRFs5wuenHYVM3ZKiKoXGhcn
 Vdvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=cxk0QJvT
Subject: Re: [Buildroot] [PATCH] Config.in: introduce BR2_TIME_BITS_64
 option for Y2038 compatibility
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
Cc: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDYvMDIvMjAyMyDDoCAyMToyNSwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
VGhvbWFzLAo+IAo+IExlIDEzLzEwLzIwMjIgw6AgMTY6MzksIFRob21hcyBQZXRhenpvbmkgdmlh
IGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+PiBPbiBXZWQsIDEyIE9jdCAyMDIyIDIzOjQ5OjM3ICsw
MDAwCj4+IFJvYmVydCBIYW5jb2NrIDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29tPiB3cm90ZToK
Pj4KPj4+IFRoZXJlJ3Mgc29tZSBjaGFuY2Ugb2Ygc29mdHdhcmUgYmVpbmcgYnJva2VuIGJ5IGVu
YWJsaW5nIHRoaXMsIHdpdGgKPj4+IGVpdGhlciBhIGNvbXBpbGUgb3IgcnVudGltZSBmYWlsdXJl
LiBGb3IgZXhhbXBsZSwgYXBwbGljYXRpb25zIHRoYXQKPj4+IGFzc3VtZSBzaXplb2YodGltZV90
KSA9PSBzaXplb2YobG9uZykgd291bGQgd29yayBvbiAzMi1iaXQgcGxhdGZvcm1zCj4+PiB3aXRo
IGEgMzItYml0IHRpbWUgYW5kIDY0LWJpdCBwbGF0Zm9ybXMgd2l0aCBhIDY0LWJpdCB0aW1lLCBi
dXQgZmFpbAo+Pj4gd2l0aCBhIDY0LWJpdCB0aW1lIG9uIDMyLWJpdC4gSSBiZWxpZXZlIEkndmUg
c2VlbiB0aGlzIHdoZW4gdHJ5aW5nIHRvCj4+PiBidWlsZCBzb2Z0d2FyZSB3aXRoIHRoYXQgb3B0
aW9uLCBzbyB0dXJuaW5nIHRoaXMgb24gdW5jb25kaXRpb25hbGx5Cj4+PiBtaWdodCBiZSB1bndp
c2UsIHVubGVzcyAgc29tZSBidWlsZCB0ZXN0cyBvZiB0aGUgc3VwcG9ydGVkIHBhY2thZ2VzCj4+
PiBoYXZlIGJlZW4gZG9uZS4uCj4+Cj4+IFRoZXJlIHdpbGwgZGVmaW5pdGVseSBiZSBidWlsZCB0
ZXN0aW5nOiBvdXIgYXV0b2J1aWxkZXJzIGFyZSB0ZXN0aW5nCj4+IDI0LzcgcmFuZG9tIGNvbmZp
Z3VyYXRpb25zIG9mIEJ1aWxkcm9vdC4gU28gYXMgc29vbiBhcyB3ZSBpbnRyb2R1Y2UKPj4gdGhp
cyBvcHRpb24sIHRoZXJlIHdvdWxkIGJlIGJ1aWxkcyB3aXRoIEJSMl9USU1FX0JJVFNfNjQ9eSBl
bmFibGVkLAo+PiB3aGljaCB3b3VsZCByYWlzZSBidWlsZCBpc3N1ZXMgaWYgdGhlcmUncyBhbnku
Cj4+Cj4+IE9mIGNvdXJzZSwgdGhlIG1vcmUgdHJpY2t5IHBhcnQgYXJlIHJ1bnRpbWUgaXNzdWVz
LCB3aGljaCBhcmUKPj4gZXNzZW50aWFsbHkgaW1wb3NzaWJsZSB0byBkZXRlY3QgdW50aWwgc29t
ZW9uZSBydW5zIGludG8gdGhlIHByb2JsZW0uCj4gCj4gV2UgYWxyZWFkeSB0cmllZCB0byBlbmFi
bGUgQlIyX1RJTUVfQklUU182NCBiYWNrIGluIE1hcmNoIDIwMjIgYnV0IHdlIGhhZCB0bwo+IHJl
dmVydCBpdCBkdWUgdG8gYnVpbGQgaXNzdWVzIHdpdGggcGFja2FnZXMgbGlrZSBnbGliYzoKPiAK
PiBTZWU6Cj4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAy
Mi1NYXJjaC82MzgxMDUuaHRtbAo+IAo+IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRy
b290L2NvbW1pdC8/aWQ9ZGQxNzBmMGNiYWQ3MjlkYmE0MTkzYjJiMjBlM2RlMGE3MDEwZDQ4NQo+
IAo+IEknbGwgdHJ5IHRvIGxvb2sgYWdhaW4uCgpUaGUgaXNzdWUgaGFzIGJlZW4gcmVwb3J0ZWQg
dG8gemxpYiB1cHN0cmVhbSBwcm9qZWN0IGJhY2sgaW4gMjAxOSBbMV0gYW5kIGEgcHVsbApyZXF1
ZXN0IGhhcyBiZWVuIHNlbnQgYnkgS2hlbSBSYWogb24gMiBKYW4gMjAyMyBbMl0uCgpSZWFkaW5n
IG9uZSBvZiB0aGUgY29tbWVudCBhYm91dCBsaWJyZUVMRUMgcHJvamVjdCAiMjAzOCBwcm9vZiIg
WzNdIHdlIGNhbgpub3RpY2UgaXQgcmVxdWlyZXMgYSBsb3Qgb2YgcGF0Y2hlcyBpbiBzZXZlcmFs
IHBhY2thZ2VzOgoKZ2xpYmM6IGRvbnQgYnVpbGQgdGFyZ2V0IHdpdGggX1RJTUVfQklUUyBvciBf
RklMRV9PRkZTRVRfQklUUyBmb3IgYXJt4oCmCmV2ZW50bGlyY2Q6IHN1cHBvcnQgLURfVElNRV9C
SVRTPTY0IGZvciA2NC1iaXQgdGltZQpsaXJjOiBzdXBwb3J0IC1EX1RJTUVfQklUUz02NCBmb3Ig
NjQtYml0IHRpbWUKemxpYjogc3VwcG9ydCAtRF9USU1FX0JJVFM9NjQgZm9yIDY0LWJpdCB0aW1l
CmR2Yi1hcHBzOiBzdXBwb3J0LXRpbWUtYml0cy02NC5wYXRjaAp0c2xpYjogc3VwcG9ydCAtRF9U
SU1FX0JJVFM9NjQgZm9yIDY0LWJpdCB0aW1lCmxpYnJldHJvLWZibmVvOiBkb250IGJ1aWxkIHRh
cmdldCB3aXRoIF9USU1FX0JJVFMgb3IgX0ZJTEVfT0ZGU0VUX0JJVOKApgptYXJpYWRiOiBkb250
IGJ1aWxkIHRhcmdldCB3aXRoIF9USU1FX0JJVFMgb3IgX0ZJTEVfT0ZGU0VUX0JJVFMgZm9yIGHi
gKYKCkluIHRoZSBlbmQsIGVuYWJsaW5nIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgYW5kIC1EX1RJ
TUVfQklUUz02NCIgb250byBhbGwKcGFja2FnZXMgaGFzIGJlZW4gcmV2ZXJ0ZWQgWzRdIHNpbmNl
IGl0IGludHJvZHVjZWQgc2V2ZXJhbCByZWdyZXNzaW9uLgoKQWZ0ZXIgbWFraW5nIGEgbG90IG9m
IGVmZm9ydCBhbmQgc3BlbmRpbmcgYSBsb3Qgb2YgdGltZSwgdGhlIGxpYnJlRUxFQwptYWludGFp
bmVyIGp1c3QgZ2l2ZSB1cDoKCiJUQkggSSB0aW5rIHdlIHNob3VsZCBub3QgcHVyc3VlIHRoZSAz
MmJpdCB1c2VybGFuZCBZMjAzOCBpc3N1ZSBmdXJ0aGVyIHVudGlsCmdsaWJjIGNvbWVzIHVwIHdp
dGggYSBiZXR0ZXIgc29sdXRpb24gdGhhdCBkb2Vzbid0IGJyZWFrIEFCSXMuCgpNb3ZpbmcgdG8g
NjRiaXQgKHJhdGhlciByZWFsaXN0aWMgd2l0aGluIHRoZSBuZXh0IDEwIHllYXJzKSBvciB0byBh
bm90aGVyIGxpYmMKKG5vdCBzbyBtdWNoIHJlYWxpc3RpYykgYXJlIGFsbCBiZXR0ZXIgb3B0aW9u
cyB0aGFuIHRoZSBtZXNzIGdsaWJjIGNyZWF0ZWQgLSBpdApwdXJlbHkgd29ya2VkIGZvciB0aGVt
IGJ1dCBwcmV0dHkgbXVjaCBubyBvbmUgZWxzZSBhbmQgYWxtb3N0IGV2ZXJ5IGRpc3RyaWJ1dGlv
bgphYmFuZG9uZWQgdGhlIGdsaWJjIGFwcHJvYWNoIHNvIEkgdGhpbmsgd2Ugc2hvdWxkIGRvIHRo
ZSBzYW1lLiIKClRob3VnaHRzPwoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9tYWRsZXIvemxpYi9p
c3N1ZXMvNDQ3ClsyXSBodHRwczovL2dpdGh1Yi5jb20vbWFkbGVyL3psaWIvcHVsbC83NjQKWzNd
IGh0dHBzOi8vZ2l0aHViLmNvbS9MaWJyZUVMRUMvTGlicmVFTEVDLnR2L3B1bGwvNjcyNwpbNF0g
aHR0cHM6Ly9naXRodWIuY29tL0xpYnJlRUxFQy9MaWJyZUVMRUMudHYvcHVsbC83MTczCgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+Pgo+
PiBCZXN0IHJlZ2FyZHMsCj4+Cj4+IFRob21hcwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
