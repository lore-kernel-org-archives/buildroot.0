Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C09C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:38:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDC8E60F26
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDC8E60F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A62DA6153B;
	Fri, 12 Nov 2021 18:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kS1MNHOopyLa; Fri, 12 Nov 2021 18:38:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15B0C605E0;
	Fri, 12 Nov 2021 18:38:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 719451BF289
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 471926153B
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFLk84emMhf9 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 18:38:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A53861537
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 18:38:22 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n29so17060723wra.11
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 10:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iyGKMKMqXdXKn880zTvoiTBQqPNtxiSbjkzgWUXL3n8=;
 b=HIyqOSkBVMIAfSlUrEiAJh/VrS7/bEMseCF6KpF7nAaiQFzwXqh3lgnkavxfdHWxs2
 goSLjr+cwlH5LzybMzVuiW8ds024y7MzZFkLCeAz6jSinmHFPc3vfxsRB/rdnVi/Pi6v
 z3kiGD9RzEcJLA01uMzhztoZiCmz2ZQDSigBmePuCuipYZjf99iPuyN1/jFgA5mcLwLx
 3AVClVkhxYfZMmlnLFFw1GSt/yBJweBMRnFbsHD5iFvDNOofJ9HOyfDUTuD3mpNC/h8M
 jOFRSDChgVPGMMtyDMZyuI4eFZvgq6os3Vm+gRjRC2v5Sr+njjiqCSnwMWnzUdQIVzW4
 B6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iyGKMKMqXdXKn880zTvoiTBQqPNtxiSbjkzgWUXL3n8=;
 b=ENReuXBIuyE/Gy4ctLd8C0LxIHn6YNDFrNE45jFlfRqXhaWj8MmYScni/3f6AeReas
 A5zcWPaWeEIlrI4lgqbrKlqVp9ueZhOqvWYPrXgDv8iGtoWJjwUK1Q4LpaoV8Mu2j+49
 Ttfr+Yf1yeNU70XNv4KRjOH+BAMfTXYudPFgwoztaBSLm1kgCi/zjm80Xxct/FOhu11f
 UuEDDaltcV7hnUtcfu3QwXPkqNVGwvmfZ1jZoCiN+mO7bAVePRPwlioFoLS5DdO+t//s
 gF9ipQtsEBdb91zsDEYQ+4DJmRIGBuUho0t2EAR3dl7CdygxbCrafJGG1fE74gUJTM8P
 krnA==
X-Gm-Message-State: AOAM530ge4GQuPSBjtTOqd+Oxzewcaf+YHw+jaiedsmY4ybmneddCWDr
 ghs8BqfgB9fKYocDM+DBHrw=
X-Google-Smtp-Source: ABdhPJzoQdEIRK/rwFdR3JVuLLtQojZ7GDE0Eee8Qoh1EGXuu8Tuan4pznJsYe++FNOoRPyEBjfEuw==
X-Received: by 2002:a5d:4143:: with SMTP id c3mr21893139wrq.254.1636742300605; 
 Fri, 12 Nov 2021 10:38:20 -0800 (PST)
Received: from [192.168.1.39] (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id t189sm6305655wma.8.2021.11.12.10.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 10:38:20 -0800 (PST)
Message-ID: <2f210a12-aca1-90ad-6685-8b699e5f15fc@gmail.com>
Date: Fri, 12 Nov 2021 19:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211112110007.787836-1-romain.naour@gmail.com>
 <20211112110007.787836-5-romain.naour@gmail.com>
 <20211112125608.GJ2609@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211112125608.GJ2609@scaer>
Subject: Re: [Buildroot] [PATCH 4/6] package/luajit: building for 64-bit
 target requires a 64-bit host for all platform
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIDEyLzExLzIwMjEgw6AgMTM6NTYsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBSb21haW4sIEFsbCwKPiAKPiBPbiAyMDIxLTExLTEyIDEyOjAwICswMTAwLCBSb21h
aW4gTmFvdXIgc3Bha2UgdGh1c2x5Ogo+PiBDdXJyZW50bHkgb25seSB4ODZfNjQgdGFyZ2V0IHJl
cXVpcmVzIGEgNjQtYml0IGhvc3QgYnV0IGJ1aWxkaW5nCj4+IGFhcmNoNjQgdGFyZ2V0IHdpdGgg
YSAzMi1iaXQgaG9zdCBpcyBhbGxvd2VkLgo+Pgo+PiBUaGlzIGNvbnN0cmFpbnQgaXMgZm9yIGFs
bCBhcmNoaXRlY3R1cmVzIFsxXS4KPj4KPj4gWzFdIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9w
aXBlcm1haWwvYnVpbGRyb290LzIwMjEtTm92ZW1iZXIvNjI4MzAxLmh0bWwKPj4KPj4gU2lnbmVk
LW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+PiBDYzogRnJh
bmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+Cj4+IENjOiBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPj4gLS0tCj4+ICBwYWNrYWdlL2x1YWppdC9D
b25maWcuaW4gfCA0ICsrKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhaml0L0NvbmZpZy5pbiBi
L3BhY2thZ2UvbHVhaml0L0NvbmZpZy5pbgo+PiBpbmRleCBmNmQwMWVkMDlhLi5iZjk4MjYwYzMx
IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2x1YWppdC9Db25maWcuaW4KPj4gKysrIGIvcGFja2Fn
ZS9sdWFqaXQvQ29uZmlnLmluCj4+IEBAIC0xLDEzICsxLDE1IEBACj4+ICBjb25maWcgQlIyX1BB
Q0tBR0VfTFVBSklUX0FSQ0hfU1VQUE9SVFMKPj4gIAlib29sCj4+ICAJZGVmYXVsdCB5IGlmIEJS
Ml9hcm0gfHwgQlIyX2FybWViIHx8IEJSMl9hYXJjaDY0Cj4+IC0JZGVmYXVsdCB5IGlmIEJSMl9p
Mzg2IHx8IChCUjJfeDg2XzY0ICYmIEJSMl9IT1NUQVJDSD0neDg2XzY0JykKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLF5eXl5eXl5eXl5eXgo+IFlvdSByZW1v
dmVkIHRoYXQgX19fX19fX19fX19fX19fX19fX19fX19fXy8KPiAKPj4gKwlkZWZhdWx0IHkgaWYg
QlIyX2kzODYgfHwgQlIyX3g4Nl82NAo+PiAgCWRlZmF1bHQgeSBpZiBCUjJfcG93ZXJwYwo+PiAg
CWRlZmF1bHQgeSBpZiAoQlIyX21pcHMgfHwgQlIyX21pcHNlbCkgJiYgIUJSMl9NSVBTX1NPRlRf
RkxPQVQgXAo+PiAgCQkmJiAhQlIyX01JUFNfQ1BVX01JUFMzMlI2ICYmICFCUjJfTUlQU19DUFVf
TUlQUzY0UjYKPj4gIAkjIC1tMzIgZmxhZyBpcyB1c2VkIGZvciAzMmJpdCBidWlsZHMgYW5kIGhv
c3QtbHVhaml0IGhhcwo+PiAgCSMgbGltaXRlZCBhcmNoaXRlY3R1cmUgc3VwcG9ydAo+PiAgCWRl
cGVuZHMgb24gQlIyX0hPU1RBUkNIID0gIng4Nl82NCIgfHwgQlIyX0hPU1RBUkNIID0gIng4NiIK
Pj4gKwkjIEJ1aWxkaW5nIGZvciA2NC1iaXQgdGFyZ2V0IHJlcXVpcmVzIGEgNjQtYml0IGhvc3QK
Pj4gKwlkZXBlbmRzIG9uICFCUjJfQVJDSF9JU182NCB8fCBCUl9IT1NUX0FSQ0g9Ing4Nl82NCIK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eLl9fX19fCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAu
Li4gYnV0IHlvdSBib3JrZWQgaXQgd2hlbiBhZGRpbmcgaXQgYmFjayBoZXJlIF9fX19fLwo+IAo+
IFlvdSBzaG91bGQgbm90IGhhdmUgYmxpbmRseSBjb3B5LXBhc3RlZCBteSBwb29yIGNvZGUgc25p
cHBldCBmcm9tIHRoZQo+IHByZXZpb3VzIHJldmlldyEgOy1dCgpXZWxsLCB0eXBvIHBvd2VyZWQg
Y29kZSBzbmlwcGV0IDpwCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBSZWdhcmRzLAo+IFlh
bm4gRS4gTU9SSU4uCj4gCj4+ICBjb25maWcgQlIyX1BBQ0tBR0VfTFVBSklUCj4+ICAJYm9vbCAi
bHVhaml0Igo+PiAtLSAKPj4gMi4zMS4xCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
