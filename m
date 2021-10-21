Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D582AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 17:07:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 476FF61A04
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 17:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 476FF61A04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E19D283B35;
	Thu, 21 Oct 2021 17:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UliH8ieEyv4d; Thu, 21 Oct 2021 17:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC5283592;
	Thu, 21 Oct 2021 17:07:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B28B51BF429
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 17:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF27B40771
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 17:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id woBiIoAWwGPo for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 17:07:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FFA740703
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 17:07:10 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j21so3711411lfe.0
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 10:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NAsiv9wSUWYZHire+LlnSf/IGJdHEaqldzbu3YKnPpo=;
 b=C21iWAI3eefo89se+FA+QnR5Dhlwob23VCsJ8Fl27vQn5cl5YEu+yj9uytwPcDpuZ9
 DN9eTRDUqRZI80ohcAh4Ghdwsrn8eId/OQ6wlHQxRXxM2pgPrAVs/V2ObNegGYEFpAPP
 /hJ6E/BVTKrKFvgVcrHvwO1B4sOVYezYZZD3MUSgzJQir4ohXq+dKx+XI3jWrXmTkZmK
 8pzDATnSvwjZdp+iIiiYgbxtfLfB37aV1ixIGy0tMpKPjhEMnhRW7QATvuAAhBlU2TJH
 mgVV4m05ZgWpag5cXZuzFwHNLLOMsNnpFPUw8aJ+5nIA0Rd5OBgjc/3koAIpOIvEaOGY
 UItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NAsiv9wSUWYZHire+LlnSf/IGJdHEaqldzbu3YKnPpo=;
 b=zSS8UopNANAWAP4u4gU5gpre9EhNEWCF8JtUnj15lpHiHky/cHDbyUCGdiU6XMKvWP
 FlynQHKtBUydn/H6pNqVRNNpTtDhasXiX3qQ2iZM8eTGkSlxTpXoCAdgS9j7Z+Ay86sb
 AN9TBl5JhHWwOZnAVWDQq9vgTzKiaO/+HeIct2Yw1sHYwZIvBdbFzM46LtFR40Oeto6+
 02ndUiE8FTIfszyCDHCHB3u5h89VX2pP08jEV8cSevCYNGbgsb7TsqcBbgP0SVeuyIV+
 e2/W9jXitLR3pbJ+zW3oW1aQ+VQ4MM6i2Jt1CmKEUGtjrVdKjk9H62a6Yi6qz8vn/6AH
 JSnw==
X-Gm-Message-State: AOAM533aR5OUcZkqjfTs9OOQs6xoQxOuRXIY7/CQHBfpjXb3xCtKmTHy
 O3IzbZ2R3psGDDVKaXwK7RmNG0S2iGwfYdag5p+japai/1g=
X-Google-Smtp-Source: ABdhPJwgn+d/17+41Pl8IXrqwFsvQgLZJmN8sk7JD+oecKXyFg2W3tGFiL3rlZECkfPJsxUiZ0w+j9d754fVQAWcV3w=
X-Received: by 2002:ac2:4f8a:: with SMTP id z10mr6620048lfs.686.1634836028602; 
 Thu, 21 Oct 2021 10:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211020190423.3547893-1-fontaine.fabrice@gmail.com>
 <163480816021.2663858.13418966210945898355@Monstersaurus>
 <CAPi7W83vxd8_KX=UCxVNZoKYxODXnKkTxUmu3saKJYStK9JLdw@mail.gmail.com>
 <163483383168.4018488.6875581227372699361@Monstersaurus>
In-Reply-To: <163483383168.4018488.6875581227372699361@Monstersaurus>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 21 Oct 2021 19:05:38 +0200
Message-ID: <CAPi7W81Hg1EoxXJ7-LqqSJXGXmuD9kiRX-sNk_6xV3Km4q0NAw@mail.gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: disable compliance
 tool
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgamV1LiAyMSBvY3QuIDIwMjEgw6AgMTg6MzAsIEtpZXJhbiBCaW5naGFtCjxraWVyYW4uYmlu
Z2hhbUBpZGVhc29uYm9hcmQuY29tPiBhIMOpY3JpdCA6Cj4KPiBRdW90aW5nIEZhYnJpY2UgRm9u
dGFpbmUgKDIwMjEtMTAtMjEgMTc6MDU6NTEpCj4gPiBIaSBLaWVyYW4sCj4gPgo+ID4gTGUgamV1
LiAyMSBvY3QuIDIwMjEgw6AgMTE6MjIsIEtpZXJhbiBCaW5naGFtCj4gPiA8a2llcmFuLmJpbmdo
YW1AaWRlYXNvbmJvYXJkLmNvbT4gYSDDqWNyaXQgOgo+ID4gPgo+ID4gPiBIaSBGYWJyaWNlLAo+
ID4gPgo+ID4gPiBRdW90aW5nIEZhYnJpY2UgRm9udGFpbmUgKDIwMjEtMTAtMjAgMjA6MDQ6MjMp
Cj4gPiA+ID4gRGlzYWJsZSBjb21wbGlhbmNlIHRvb2wgdG8gZml4IHRoZSBmb2xsb3dpbmcgYnVp
bGQgZmFpbHVyZQo+ID4gPiA+IHJhaXNlZCBzaW5jZSBjb21taXQgZTFkMzdhYjBhN2IyYjg3MzVl
NjljMDcwNTE5OTc4ZDI4OThkMmU3OSBhbmQKPiA+ID4gPiBodHRwczovL2dpdC5saW51eHR2Lm9y
Zy9saWJjYW1lcmEuZ2l0L2NvbW1pdC8/aWQ9MDJiYzExMDg1NzhlOGI4ZWI2OGZhN2Q5YWUzZWVl
YTU1ODcyMzkzMToKPiA+ID4gPgo+ID4gPiA+IC91c3IvbGZzL2hkZF92MS9yYy1idWlsZHJvb3Qt
dGVzdC9zY3JpcHRzL2luc3RhbmNlLTEvb3V0cHV0LTEvaG9zdC9saWIvZ2NjL2FybS1idWlsZHJv
b3QtbGludXgtdWNsaWJjZ251ZWFiaS8xMC4zLjAvLi4vLi4vLi4vLi4vYXJtLWJ1aWxkcm9vdC1s
aW51eC11Y2xpYmNnbnVlYWJpL2Jpbi9sZDogY2Fubm90IGZpbmQgLWxndGVzdAo+ID4gPiA+Cj4g
PiA+ID4gRml4ZXM6Cj4gPiA+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jl
c3VsdHMvZTFiYjhhYTFkZTMxMGYzZDI3Yjc0ZWM3ZDg3NDhkMTcwYWQ0NDRlMgo+ID4gPiA+Cj4g
PiA+Cj4gPiA+IEFueSBpZGVhIHdoeSB3ZSdyZSBmYWlsaW5nIHRvIGZpbmQgZ3Rlc3Q/Cj4gPiBO
b3BlLCBJIGRpZG4ndCB0YWtlIHRpbWUgdG8gZmluZCBvdXQgd2h5IHRoaXMgaXMgZmFpbGluZyBh
cyBJIHRoaW5rCj4gPiB0aGF0IGxjLWNvbXBsaWFuY2UgaXMganVzdCBub3QgbmVlZGVkIGluIHRo
ZSBjb250ZXh0IG9mIGJ1aWxkcm9vdCAoYXMKPiA+IGd0ZXN0IGlzIG5vdCBpbnN0YWxsZWQgb24g
dGFyZ2V0KS4KPiA+ID4KPiA+ID4gT3VyIG1lc29uLmJ1aWxkIGZvciBzcmMvbGMtY29tcGxpYW5j
ZSBjb250YWlucyB0aGUgZm9sbG93aW5nOgo+ID4gPgo+ID4gPiAiIiIKPiA+ID4gIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogQ0MwLTEuMAo+ID4gPgo+ID4gPiBsaWJldmVudCA9IGRlcGVuZGVu
Y3koJ2xpYmV2ZW50X3B0aHJlYWRzJywgcmVxdWlyZWQgOiBnZXRfb3B0aW9uKCdsYy1jb21wbGlh
bmNlJykpCj4gPiA+IGxpYmd0ZXN0ID0gZGVwZW5kZW5jeSgnZ3Rlc3QnLCByZXF1aXJlZCA6IGdl
dF9vcHRpb24oJ2xjLWNvbXBsaWFuY2UnKSkKPiA+ID4KPiA+ID4gaWYgbm90IChsaWJldmVudC5m
b3VuZCgpIGFuZCBsaWJndGVzdC5mb3VuZCgpKQo+ID4gPiAgICAgbGNfY29tcGxpYW5jZV9lbmFi
bGVkID0gZmFsc2UKPiA+ID4gICAgIHN1YmRpcl9kb25lKCkKPiA+ID4gZW5kaWYKPiA+ID4KPiA+
ID4gbGNfY29tcGxpYW5jZV9lbmFibGVkID0gdHJ1ZQo+ID4gPiAiIiIKPiA+ID4KPiA+ID4gV2hp
Y2ggaW1wbGllcyB0aGF0IGxpYmd0ZXN0IHdhcyBmb3VuZCBkdXJpbmcgdGhlIGNvbmZpZ3VyYXRp
b24gcGhhc2UsCj4gPiA+IGJ1dCBub3QgZHVyaW5nIHRoZSBsaW5raW5nIHBoYXNlLi4uLgo+ID4g
Pgo+ID4gPiBJcyBsaWJndGVzdCBidWlsdCBhcyBwYXJ0IG9mIHRoaXMgYnVpbGQgY29uZmlndXJh
dGlvbj8gSWYgaXQgaXMgLSBJJ2QKPiA+ID4gZXhwZWN0IGxjLWNvbXBsaWFuY2UgdG8gZ2V0IGJ1
aWx0IGFnYWluc3QgaXQuIElmIG5vdCAtIHRoZW4gaXQgd291bGQKPiA+ID4gYXV0b21hdGljYWxs
eSBiZSBkaXNhYmxlZCBieSBvdXIgYnVpbGQuLi4KPiA+IFllcywgaXQgaXMgYnVpbHQgYW5kIGZv
dW5kIGJ5IG1lc29uIG90aGVyd2lzZSBsYy1jb21wbGlhbmNlIHdvbid0IGJlCj4gPiBidWlsdCBi
dXQgZm9yIGFuIHVua25vd24gcmVhc29uLCB0aGUgbGluayBzdGVwIGZhaWxzLgo+Cj4gWW91J3Zl
IG1lbnRpb25lZCBhYm92ZSB0aGF0IGd0ZXN0IHdvbid0IGJlIGluc3RhbGxlZCBvbiB0aGUgdGFy
Z2V0Li4uIFNvCj4gLi4gSSB3b3VsZCBleHBlY3QgdGhhdCBtZWFucyBpdCBpc24ndCBpbiB0aGUg
dGFyZ2V0IHN5c3Jvb3QsIGFuZCBjYW4ndAo+IGJlIGxpbmtlZCBhZ2FpbnN0Lgo+Cj4gU28gaXQg
c2VlbXMgdGhhdCBmb3Igc29tZSByZWFzb24gbWVzb24gZmluZHMgYSBob3N0IHBhY2thZ2UgaW5z
dGVhZCBvZiBhCj4gdGFyZ2V0IHBhY2thZ2U/Cmd0ZXN0IGlzIGluc3RhbGxlZCBvbiBzdGFnaW5n
IChidXQgbm90IG9uIHRhcmdldCk6CkdURVNUX0lOU1RBTExfU1RBR0lORyA9IFlFUwpHVEVTVF9J
TlNUQUxMX1RBUkdFVCA9IE5PCgpJdCBzaG91bGQgYmUgbm90ZWQgdGhhdCBubyBwYWNrYWdlcyBh
cmUgdXNpbmcgZ3Rlc3QgaW4gYnVsZHJvb3QuCklNSE8sIHdlIHNob3VsZCByZW1vdmUgaXQgdG8g
YXZvaWQgdW5leHBlY3RlZCBidWlsZCBmYWlsdXJlcyBhbmQKaW1wcm92ZSBidWlsZCByZXByb2R1
Y2liaWxpdHkgYXMgSSBhc3N1bWUgdGhhdCBsaWJjYW1lcmEgaXMgbm90IHRoZQpvbmx5IHBhY2th
Z2UgdGhhdCBoYXMgYSAiaGlkZGVuIiBndGVzdCBkZXBlbmRlbmN5Lgo+PiBEbyB3ZSBoYXZlIGEg
d2F5IHRvIGRpZmZlcmVudGlhdGUgdGhlc2UgaW4gYnVpbGRyb290Pwo+Cj4gSSdtIG5vdCBzdXJl
IGlmIHRoZXJlJ3Mgc29tZSBidWlsZHJvb3Qgd2l6YXJkcnkgdGhhdCB3b3VsZCBtYWtlCj4gbGli
Y2FtZXJhJ3MgY29uZmlndXJlIHBoYXNlIHNlZSBvbmx5IHRoZSBwYWNrYWdlcyB0aGF0IGFyZSBp
bnN0YWxsZWQgb24KPiB0aGUgdGFyZ2V0IHdoZW4gYmVpbmcgYnVpbHQsIGJ1dCBpZiBidWlsZHJv
b3QgZG9lc24ndCBzdXBwb3J0IGluc3RhbGxpbmcKPiBndGVzdCBhdCBhbGwgLSB0aGVuIGluZGVl
ZCB0aGVyZSBpc24ndCBhbnkgcG9pbnQgc3VwcG9ydGluZwo+IGxjLWNvbXBsaWFuY2Ugd2hpY2gg
cmVxdWlyZXMgaXQuCj4KPgo+ID4gPgo+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gPiA+IC0tLQo+ID4g
PiA+ICBwYWNrYWdlL2xpYmNhbWVyYS9saWJjYW1lcmEubWsgfCAxICsKPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJjYW1lcmEvbGliY2FtZXJhLm1rIGIvcGFja2FnZS9saWJjYW1lcmEvbGliY2FtZXJh
Lm1rCj4gPiA+ID4gaW5kZXggOGFiOTVmYjQyYS4uNjM4YzlhYzU1MyAxMDA2NDQKPiA+ID4gPiAt
LS0gYS9wYWNrYWdlL2xpYmNhbWVyYS9saWJjYW1lcmEubWsKPiA+ID4gPiArKysgYi9wYWNrYWdl
L2xpYmNhbWVyYS9saWJjYW1lcmEubWsKPiA+ID4gPiBAQCAtMTcsNiArMTcsNyBAQCBMSUJDQU1F
UkFfREVQRU5ERU5DSUVTID0gXAo+ID4gPiA+ICBMSUJDQU1FUkFfQ09ORl9PUFRTID0gXAo+ID4g
PiA+ICAgICAgICAgLURhbmRyb2lkPWRpc2FibGVkIFwKPiA+ID4gPiAgICAgICAgIC1EZG9jdW1l
bnRhdGlvbj1kaXNhYmxlZCBcCj4gPiA+ID4gKyAgICAgICAtRGxjLWNvbXBsaWFuY2U9ZGlzYWJs
ZWQgXAo+ID4gPiA+ICAgICAgICAgLUR0ZXN0PWZhbHNlIFwKPiA+ID4gPiAgICAgICAgIC1Ed2Vy
cm9yPWZhbHNlCj4gPiA+ID4gIExJQkNBTUVSQV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiA+ID4g
PiAtLQo+ID4gPiA+IDIuMzMuMAo+ID4gPiA+Cj4gPiBCZXN0IFJlZ2FyZHMsCj4gPgo+ID4gRmFi
cmljZQpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
