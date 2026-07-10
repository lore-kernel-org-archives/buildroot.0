Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B6EC44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50FD981143;
	Fri, 10 Jul 2026 13:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fs1Vs82WwLl; Fri, 10 Jul 2026 13:51:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F3D78112C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691512;
	bh=Ge2pFhRFG6kTpgtLrl1YA3DX4SeBboqAzBvo663+Ar8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cHSKkT1AN5Gyt+ts1bU9rohkeDciK+WrIWB8+r7dQ4LCYX7INDx9thmpgBULp/Rj5
	 L8/jVlD8SJDyCE4zIdBXMnVREgvzuDH2nD0AUQ/pkHdRx2LO33IDaezej4U14IQ4nm
	 fp92zUVg/U3hhU57QCcrPtBbenQzq8vuBsX1qIP/Y6RwjMuxLtrqezmMl5ly962trP
	 OyBNWoYspowwaZU00w9kD34kuyz1KACzk6spiiR2BlQa0/0HezvYT2lMLhONlsCn6x
	 TSwT1uh0I+C4QrS7/J3wfAADLkg7VkMzK1+h/lr3xiU1BpET9qI7u6ZxAeFjo/h5TR
	 djEBLPhj3YZcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F3D78112C;
	Fri, 10 Jul 2026 13:51:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41F262FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33F5340C80
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxMph8U9XTU5 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F61340B2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F61340B2F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F61340B2F
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-493ece78b0cso7528175e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691507; x=1784296307;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xp5k6nkNOSwhN67ZsYUSXeXEFw/dUdBvvFdfNaXEDLc=;
 b=q/rS/lSAaaInD/BasYclx2njlE9X82rwN6/UFT1Y4Y1l9MhcTpnWaPFdOKMCzfc+oB
 73d3nMOFzA5nbSC/+GJTfbkSpmTV+AlVn/RWoSm5q0BUE+vzqHaZ+Pktcn3RUqkjmio2
 KnyvJlbERuyRqIMHoRYldpJ+hzvmAgukQVFZSdx4VrbgnMUWcEPB+M2tp970dhlPAm4U
 IAo8jajdUaAxIRR1Fg+hAQ2t1BxaKa6FxFoiZY04Pu9bWPb9vNdZ1pjxSajF97OCyvAk
 odWYAzPbCBrV85t+IFH+4Rk7WKHLlEk82sVxauui0MBNXTH2nquoHjlc/ZN2hiuLMM2V
 QnVA==
X-Gm-Message-State: AOJu0Yzz54vgPsd9t5CxdY4Yd8ChMvpekWVekdeufm3qUUpeRNmrlNT6
 L9tVTqO4WdDx6bUjH2N41XNmLho5wQE5IGZMUakUro3S6yLKtcp8rdQybNbT/UVYakk=
X-Gm-Gg: AfdE7ckZ2t9KR9u7lskTcdIKZhYJQmt+sLjR/V77Ynp8JX32sKWLpvaep7WAYhHRerT
 brWftfCfLogMbFVDfWcWc4+HXVfMj7NcYMihI4benQzNwp0N5MTkYLWOelQ9ECt6yopx7lHW7MM
 Q7retOPaK0XPT9jGbimumgOtJyG4co9H7lecQMJ87z387J7wZKZ9whslm70Y0OB40bjaPaaEWoE
 iXCU39oz2901TauSnSk72J26UG15RaokOI3aE/JVgfLBY1toKvMfc8TFj1eH/LmcOvMl1QsIHTq
 KqHcOKsCTfufk6/dARRlQdA+XpyydKazGIDvNFKG09bJGysDy9yuGZEewKyFoXWkQXVwdTPhHYS
 AvQt6I82uQOqI1HmnfBfIAxRX/06ByzfmA8GceCArRjQboUEkgyh44dGj1A9rzvHw0aO7sGkzGv
 EBE5MWEg==
X-Received: by 2002:a05:600c:6211:b0:493:dcad:84da with SMTP id
 5b1f17b1804b1-493e683c3b2mr108417025e9.1.1783691506882; 
 Fri, 10 Jul 2026 06:51:46 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2a38b19sm47285725e9.0.2026.07.10.06.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:46 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:44 +0200
Message-ID: <20260710135145.759338-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260626202959.282713-1-thomas.perale@mind.be>
References: <20260626202959.282713-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691507; x=1784296307; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xp5k6nkNOSwhN67ZsYUSXeXEFw/dUdBvvFdfNaXEDLc=;
 b=I0VGU8/DdrOUvCaB3tRSM44qXNuU9hKQPTbGHswb3vSpOwJRqhr4y/hw4T8z0CIUHC
 +z6I+EJdLd4w4qwyGMS0/yz9VAol6Usy9WgFWss+AHlC+WwoCmuyzw5+WOH5RKPaFAvZ
 UCtZyx2qVhSHPyQXie7H6H7knUUiYT3AF1kiuKuves0GO0e9R/MdgzhVTkETREb8BmIC
 8XGsoeAY+++VFCWq8Gx8gNun0busVvCkxGEw2iBCAfL/zzDfVW31lUOvGtOkwrpEu/CI
 F6TzjbEuNhjJuKgJFaGOpwsiea4agWsrcbwEyIZj9zsMak0IovNTndTW4/PGxGiRfjxU
 TQwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I0VGU8/D
Subject: Re: [Buildroot] [PATCH] package/cups-filters: upstream patch
 CVE-2025-64503
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIHZ1bG5lcmFiaWxpdHk6Cj4g
Cj4gLSBDVkUtMjAyNS02NDUwMzoKPiAgICAgY3Vwcy1maWx0ZXJzIGNvbnRhaW5zIGJhY2tlbmRz
LCBmaWx0ZXJzLCBhbmQgb3RoZXIgc29mdHdhcmUgcmVxdWlyZWQKPiAgICAgdG8gZ2V0IHRoZSBj
dXBzIHByaW50aW5nIHNlcnZpY2Ugd29ya2luZyBvbiBvcGVyYXRpbmcgc3lzdGVtcyBvdGhlcgo+
ICAgICB0aGFuIG1hY29zLiBJbiBjdXBzLWZpbHRlcnMgcHJpb3IgdG8gMS4yOC4xOCwgYnkgY3Jh
ZnRpbmcgYSBQREYgZmlsZQo+ICAgICB3aXRoIGEgbGFyZ2UgYE1lZGlhQm94YCB2YWx1ZSwgYW4g
YXR0YWNrZXIgY2FuIGNhdXNlIENVUFMtRmlsdGVyIDEueOKAmXMKPiAgICAgYHBkZnRvcmFzdGVy
YCB0b29sIHRvIHdyaXRlIGJleW9uZCB0aGUgYm91bmRzIG9mIGFuIGFycmF5LiBGaXJzdCwgYQo+
ICAgICBQREYgd2l0aCBhIGxhcmdlIGBNZWRpYUJveGAgd2lkdGggdmFsdWUgY2F1c2VzIGBoZWFk
ZXIuY3Vwc1dpZHRoYCB0bwo+ICAgICBiZWNvbWUgbGFyZ2UuICBOZXh0LCB0aGUgY2FsY3VsYXRp
b24gb2YgYGJ5dGVzUGVyTGluZSA9Cj4gICAgIChoZWFkZXIuY3Vwc0JpdHNQZXJQaXhlbCAqIGhl
YWRlci5jdXBzV2lkdGggKyA3KSAvIDhgIG92ZXJmbG93cywKPiAgICAgcmVzdWx0aW5nIGluIGEg
c21hbGwgdmFsdWUuIFRoZW4sIGBsaW5lQnVmYCBpcyBhbGxvY2F0ZWQgd2l0aCB0aGUKPiAgICAg
c21hbGwgYGJ5dGVzUGVyTGluZWAgc2l6ZS4gRmluYWxseSwgYGNvbnZlcnRMaW5lQ2h1bmtlZGAg
Y2FsbHMKPiAgICAgYHdyaXRlUGl4ZWw4YCwgd2hpY2ggYXR0ZW1wdHMgdG8gd3JpdGUgdG8gYGxp
bmVCdWZgIG91dHNpZGUgb2YgaXRzCj4gICAgIGJ1ZmZlciBzaXplIChvdXQgb2YgYm91bmRzIHdy
aXRlKS4gSW4gbGliY3Vwc2ZpbHRlcnMsIHRoZSBtYWludGFpbmVycwo+ICAgICBmb3VuZCB0aGUg
c2FtZSBgYnl0ZXNQZXJMaW5lYCBtdWx0aXBsaWNhdGlvbiB3aXRob3V0IG92ZXJmbG93IGNoZWNr
LAo+ICAgICBidXQgdGhlIHByb3ZpZGVkIHRlc3QgY2FzZSBkb2VzIG5vdCBjYXVzZSBhbiBvdmVy
ZmxvdyB0aGVyZSwgYmVjYXVzZQo+ICAgICB0aGUgdmFsdWVzIGFyZSBkaWZmZXJlbnQuIENvbW1p
dAo+ICAgICA1MGQ5NGNhMGYyZmE2MTc3NjEzYzk3YzU5NzkxYmRlNTY4NjMxODY1IGNvbnRhaW5z
IGEgcGF0Y2gsIHdoaWNoIGlzCj4gICAgIGluY29ycG9yYXRlZCBpbnRvIGN1cHMtZmlsdGVycyB2
ZXJzaW9uIDEuMjguMTguCj4gCj4gRm9yIG1vcmUgaW5mb3JtYXRpb24sIHNlZToKPiAgIC0gaHR0
cHM6Ly93d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIwMjUtNjQ1MDMKPiAgIC0gaHR0cHM6
Ly9naXRodWIuY29tL09wZW5QcmludGluZy9jdXBzLWZpbHRlcnMvY29tbWl0LzUwZDk0Y2EwZjJm
YTYxNzc2MTNjOTdjNTk3OTFiZGU1Njg2MzE4NjUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
UGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIDIwMjYuMDUueCAmIDIw
MjUuMDIueC4gVGhhbmtzCgo+IC0tLQo+ICAuLi54LW91dC1vZi1ib3VuZHMtd3JpdGUtaW4tcGRm
dG9yYXN0ZXIucGF0Y2ggfCA0MSArKysrKysrKysrKysrKysrKysrCj4gIHBhY2thZ2UvY3Vwcy1m
aWx0ZXJzL2N1cHMtZmlsdGVycy5tayAgICAgICAgICB8ICAzICsrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNDQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9jdXBzLWZp
bHRlcnMvMDAwNS1maXgtb3V0LW9mLWJvdW5kcy13cml0ZS1pbi1wZGZ0b3Jhc3Rlci5wYXRjaAo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2N1cHMtZmlsdGVycy8wMDA1LWZpeC1vdXQtb2YtYm91
bmRzLXdyaXRlLWluLXBkZnRvcmFzdGVyLnBhdGNoIGIvcGFja2FnZS9jdXBzLWZpbHRlcnMvMDAw
NS1maXgtb3V0LW9mLWJvdW5kcy13cml0ZS1pbi1wZGZ0b3Jhc3Rlci5wYXRjaAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMWRhMDRjYTk1OQo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9wYWNrYWdlL2N1cHMtZmlsdGVycy8wMDA1LWZpeC1vdXQtb2YtYm91bmRzLXdy
aXRlLWluLXBkZnRvcmFzdGVyLnBhdGNoCj4gQEAgLTAsMCArMSw0MSBAQAo+ICtGcm9tIDUwZDk0
Y2EwZjJmYTYxNzc2MTNjOTdjNTk3OTFiZGU1Njg2MzE4NjUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4gK0Zyb206IFRpbGwgS2FtcHBldGVyIDx0aWxsLmthbXBwZXRlckBnbWFpbC5jb20+Cj4g
K0RhdGU6IE1vbiwgMTAgTm92IDIwMjUgMTg6MzE6NDggKzAxMDAKPiArU3ViamVjdDogW1BBVENI
XSBGaXggb3V0LW9mLWJvdW5kcyB3cml0ZSBpbiBwZGZ0b3Jhc3Rlcgo+ICsKPiArUERGcyB3aXRo
IHRvbyBsYXJnZSBwYWdlIGRpbWVuc2lvbnMgY291bGQgY2F1c2UgYW4gaW50ZWdlciBvdmVyZmxv
dyBhbmQgdGhlbiBhIHRvbyBzbWFsbCBidWZmZXIgZm9yIHRoZSBwaXhlbCBsaW5lIHRvIGJlIGFs
bG9jYXRlZC4KPiArCj4gK0ZpeGVkIHRoaXMgYnkgY3JvcHBpbmcgdGhlIHBhZ2Ugc2l6ZSB0byB0
aGUgbWF4aW11bSBhbGxvd2VkIGJ5IHRoZSBzdGFuZGFyZCwgMTQ0MDB4MTQ0MDBwdCwgMjAweDIw
MGluLCA1eDVtCj4gKwo+ICtodHRwczovL2NvbW11bml0eS5hZG9iZS5jb20vdDUvaW5kZXNpZ24t
ZGlzY3Vzc2lvbnMvbWF4aW11bS13aWR0aC1vZi1hLXBkZi90ZC1wLzkyMTczNzIKPiArCj4gK0NW
RTogQ1ZFLTIwMjUtNjQ1MDMKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuUHJp
bnRpbmcvY3Vwcy1maWx0ZXJzL2NvbW1pdC81MGQ5NGNhMGYyZmE2MTc3NjEzYzk3YzU5NzkxYmRl
NTY4NjMxODY1Cj4gK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVA
bWluZC5iZT4KPiArLS0tCj4gKyBmaWx0ZXIvcGRmdG9yYXN0ZXIuY3h4IHwgMTIgKysrKysrKysr
KysrCj4gKyAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ICsKPiArZGlmZiAtLWdp
dCBhL2ZpbHRlci9wZGZ0b3Jhc3Rlci5jeHggYi9maWx0ZXIvcGRmdG9yYXN0ZXIuY3h4Cj4gK2lu
ZGV4IDdiM2FmOTI0Zi4uYjY0YjM0YzYyIDEwMDc1NQo+ICstLS0gYS9maWx0ZXIvcGRmdG9yYXN0
ZXIuY3h4Cj4gKysrKyBiL2ZpbHRlci9wZGZ0b3Jhc3Rlci5jeHgKPiArQEAgLTE2OTgsNiArMTY5
OCwxOCBAQCBzdGF0aWMgdm9pZCBvdXRQYWdlKHBvcHBsZXI6OmRvY3VtZW50ICpkb2MsIGludCBw
YWdlTm8sCj4gKyAgICAgaGVhZGVyLlBhZ2VTaXplWzBdID0gKHVuc2lnbmVkKWw7Cj4gKyAgIGVs
c2UKPiArICAgICBoZWFkZXIuUGFnZVNpemVbMV0gPSAodW5zaWduZWQpbDsKPiArKyAgLyoKPiAr
KyAgICBNYXhpbXVtIGFsbG93ZWQgcGFnZSBzaXplIGZvciBQREYgaXMgMjAweDIwMCBpbmNoZXMg
KH4gNXg1IG0pLCBvciAxNDQwMHgxNDQwMCBwdAo+ICsrICAgIGh0dHBzOi8vY29tbXVuaXR5LmFk
b2JlLmNvbS90NS9pbmRlc2lnbi1kaXNjdXNzaW9ucy9tYXhpbXVtLXdpZHRoLW9mLWEtcGRmL3Rk
LXAvOTIxNzM3Mgo+ICsrICAqLwo+ICsrICBpZiAoaGVhZGVyLlBhZ2VTaXplWzBdID4gMTQ0MDAp
IHsKPiArKyAgICBmcHJpbnRmKHN0ZGVyciwgIkVSUk9SOiBQYWdlIHdpZHRoIGlzICVkcHQsIHRv
byBsYXJnZSwgY3JvcHBpbmcgdG8gMTQ0MDBwdFxuIiwgaGVhZGVyLlBhZ2VTaXplWzBdKTsKPiAr
KyAgICBoZWFkZXIuUGFnZVNpemVbMF0gPSAxNDQwMDsKPiArKyAgfQo+ICsrICBpZiAoaGVhZGVy
LlBhZ2VTaXplWzFdID4gMTQ0MDApIHsKPiArKyAgICBmcHJpbnRmKHN0ZGVyciwgIkVSUk9SOiBQ
YWdlIGhlaWdodCBpcyAlZHB0LCB0b28gbGFyZ2UsIGNyb3BwaW5nIHRvIDE0NDAwcHRcbiIsIGhl
YWRlci5QYWdlU2l6ZVsxXSk7Cj4gKysgICAgaGVhZGVyLlBhZ2VTaXplWzFdID0gMTQ0MDA7Cj4g
KysgIH0KPiArIAo+ICsgICBtZW1zZXQocGFwZXJkaW1lbnNpb25zLCAwLCBzaXplb2YocGFwZXJk
aW1lbnNpb25zKSk7Cj4gKyAgIG1lbXNldChtYXJnaW5zLCAwLCBzaXplb2YobWFyZ2lucykpOwo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2N1cHMtZmlsdGVycy9jdXBzLWZpbHRlcnMubWsgYi9wYWNr
YWdlL2N1cHMtZmlsdGVycy9jdXBzLWZpbHRlcnMubWsKPiBpbmRleCAyMDdjNDMxYmVlLi4wOWU4
ZmEzNDMyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvY3Vwcy1maWx0ZXJzL2N1cHMtZmlsdGVycy5t
awo+ICsrKyBiL3BhY2thZ2UvY3Vwcy1maWx0ZXJzL2N1cHMtZmlsdGVycy5tawo+IEBAIC0yMSw2
ICsyMSw5IEBAIENVUFNfRklMVEVSU19JR05PUkVfQ1ZFUyArPSBDVkUtMjAyMy0yNDgwNQo+ICAj
IDAwMDItcmFzdGVydG9wY2x4LmMtRml4LWluZmluaXRlLWxvb3AtY2F1c2VkLWJ5LWNyYWZ0ZWQt
Zi5wYXRjaAo+ICBDVVBTX0ZJTFRFUlNfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjUtNjQ1MjQKPiAg
Cj4gKyMgMDAwNS1maXgtb3V0LW9mLWJvdW5kcy13cml0ZS1pbi1wZGZ0b3Jhc3Rlci5wYXRjaAo+
ICtDVVBTX0ZJTFRFUlNfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjUtNjQ1MDMKPiArCj4gIENVUFNf
RklMVEVSU19ERVBFTkRFTkNJRVMgPSBjdXBzIGxpYmdsaWIyIGxjbXMyIHFwZGYgZm9udGNvbmZp
ZyBmcmVldHlwZSBqcGVnCj4gIAo+ICBDVVBTX0ZJTFRFUlNfQ09ORl9PUFRTID0gXAo+IC0tIAo+
IDIuNTQuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
