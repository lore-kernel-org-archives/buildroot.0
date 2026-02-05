Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9FCEC1E86
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 10:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B931140C73;
	Thu,  5 Feb 2026 10:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8DdtKWEHGCA; Thu,  5 Feb 2026 10:08:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7B6F40C78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770286115;
	bh=t5B/iXLx7BF7WmObTypB6/OCYA+DqB+JWBBmwNBdP5g=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G5JKahZSX37VuMnCdmwaru6bAuC6ZaFdGf0SJcrVdmNDEeM/tbWN2du1L+N6VuAfJ
	 rKF/TTQg0DczuGQlW4EW0qoENdeP3wKBAWjrW/mPCRurQebmp0sPnDItTu3dKtng4c
	 VPLQMPBcuR0G/dl+Vb2Jf4Mum7nqibKZwD/6L57b1t36vFAiQHKHXj9wlBOGT2WKUD
	 LqBSAIfbuknM68GwWTMFKk3ZhDOEkuT0g73zWFE8GWduD/q07GzlvibCG1aM1OS7yo
	 CwAhWGqmi5oCyceW2VUGqeZmBZXYivPojEkiD/ItLvrx3yA3Ft6L7GFqrAjVGXGXLd
	 mlSTcKwfyuP6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7B6F40C78;
	Thu,  5 Feb 2026 10:08:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E35C317A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 10:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEC8A83F56
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 10:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqJql7-h_Zo5 for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 10:08:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.222.179;
 helo=mail-qk1-f179.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FA8183F2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA8183F2F
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FA8183F2F
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 10:08:33 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-8c70b5594f4so91734585a.1
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 02:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770286112; x=1770890912;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M5L0KnuVhIhT4DRqquSsuaKjXw5GlRFWqVu5wbnWR0g=;
 b=oFBkSmwzEGWuzPpQ4ElGAJaQsXZv9efyw0JJzhpZcnEVkwQzO9OUuHwXOKQaNv62/C
 kp4vNh0wUvlOCnrhH27sKdzAUxSiZDDzMhT6e0cjENJsthTEgFrCtTYnWdgBs9vrABNT
 Vllg3HeOpm1fDV4YaUCQtyTmkVshgledd7yBBtAWnPahsQYi7S7zFPa7xAPngoygOuVr
 GwsHLfZKRfjkWij+bpi17xryVVT1fzZscj1Tdl26iBmSwXh2p7ChpeQMeeD9kcJkpJha
 SMtHXfy5nxEdk3t4pxx2imxb24L9HnJpwFx1B1fBNfDPawDvB6rvcM9Si1GQ8PYzPE7w
 rTfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVxIZJRbOifVsf9VT0XJEx3dwgYJ2fBcEW3hs3RQ7vA2eQizk6clTBO2yITf/Md9bjeyE3wcOGhWg=@buildroot.org
X-Gm-Message-State: AOJu0Yy9nQIBWKdP/iSGMjuKOEKsOXaXWKlfgXGtnpQDZxEAevD8YZ0o
 tRkm761cL445yE4Yg1ixHFCgmZ1zqak+gX2Nl6EoKd5iWt0npWn4gdsIgUS83wDq
X-Gm-Gg: AZuq6aIOIf7UZ90E+GVX/8HHwdyABw7EHRwenPXHI4FnyqIxyWSpiEt5WTKClKJA2V1
 FeHwd7FLRZGhprb5X+4bxbCdeZvrOovm81hclzUzr9wOEp2LDsA64GWELt0uBgWKA/7ivalaohQ
 3TzFxgzLEIngxXR3ISNITqAsmHUEYBZTnfFMXNiabOL+O+WxI+Sz6FT/wrwNf4rVZVtYCI9s9RY
 LjRF5kA17NmuBoH71WFfbViiJHCi2fdRzs/tILlJ4MT75m84QGbhWWL9uhOaxFxCqRzBkBUJDgo
 iufayYdMW5sHuhMra+8xPthxDt5uEuwvn2tXAMeszP7nAdX6I/ME+PFx7j+paiaHKXS9iDsnmCl
 kaobKUWWivZDqSj4lFmOuIajr27C/qWMvDYE/QzdRsrKdjaKw+4XH6lFXI+lO0O9JVu7ovVjbTP
 4oGRHGbO1UoX8y6b5CrLHo/Mnpyo1Z5voDoTT40dswx6+LhHLAh6r3ZMx33FyKM41nhdUEYoZEp
 XwFH52k080FoLdX8g==
X-Received: by 2002:a05:620a:288d:b0:8b2:e1b5:a4d5 with SMTP id
 af79cd13be357-8ca40d72a78mr213395085a.16.1770286111854; 
 Thu, 05 Feb 2026 02:08:31 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com.
 [209.85.219.45]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ca2fd41335sm379322385a.38.2026.02.05.02.08.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 02:08:31 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-88a2e3bd3cdso11187086d6.0
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 02:08:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV/PNkuJjdYGFGn3Hmt+6CC9poO5Aonn3DNAyZZ3tpvpI3oHEpKSWXMiGGRNR5iCAYqmFBtH+YHbbs=@buildroot.org
X-Received: by 2002:a05:6214:2389:b0:894:7005:ed8f with SMTP id
 6a1803df08f44-8953013d921mr29675506d6.35.1770286111005; Thu, 05 Feb 2026
 02:08:31 -0800 (PST)
MIME-Version: 1.0
References: <CACXRmJgF31hdsS_wY2tt6ok=CqMXbWwmy227s42jPw_tOZcPyw@mail.gmail.com>
 <20260204123609.3607193-1-thomas@devoogdt.com>
 <CACXRmJh1-5Cy92kF9TM5nDs_uB90WAe5iOGmNNL2E-cMhJE7GA@mail.gmail.com>
 <a8b5d9b0-9142-4aaf-a3f8-38b1d8abfd69@smile.fr>
In-Reply-To: <a8b5d9b0-9142-4aaf-a3f8-38b1d8abfd69@smile.fr>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 5 Feb 2026 11:08:20 +0100
X-Gmail-Original-Message-ID: <CACXRmJgpFK8DkT+rZ=k_JUFZTZA5x4Saj7hP_Vx5XO6+QZotuA@mail.gmail.com>
X-Gm-Features: AZwV_Qi07rKLFlU4h98agRc_Uom7qh-QG42pJIkVxmFsTGeWnGPabewViZfQw4c
Message-ID: <CACXRmJgpFK8DkT+rZ=k_JUFZTZA5x4Saj7hP_Vx5XO6+QZotuA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, bernd@kuhls.net,
 buildroot@buildroot.org, 
 romain.naour@gmail.com, thomas.devoogdt@barco.com, 
 thomas.petazzoni@bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v3] package/mesa3d: fix compilation with
 host-llvm enabled
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLCBBbGwsCgpPcCB3byA0IGZlYiAyMDI2IG9tIDE5OjMzIHNjaHJlZWYgUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Ogo+Cj4gSGkgVGhvbWFzLCBBbGwsCj4KPiBM
ZSAwNC8wMi8yMDI2IMOgIDE0OjQxLCBUaG9tYXMgRGV2b29nZHQgYSDDqWNyaXQgOgo+ID4gSGkg
Um9tYWluLCBBbGwsCj4gPgo+ID4KPiA+IFVwZGF0ZToKPiA+Cj4gPiBXaGVuIGNvbXBpbGluZyBv
biBtYXN0ZXIsIHRoZW4gbWVzb24gaXMgc29tZWhvdyBhYmxlIHRvIGZpbmQgdGhlIHJpZ2h0Cj4g
PiBsbHZtLWNvbmZpZywgc28gcmVwcm9kdWN0aW9uIG9ubHkgc2VlbXMgdG8gYmUgcG9zc2libGUg
aWYgdGhlIGhvc3QKPiA+IG1hY2hpbmUgc2hpcHMgd2l0aCBhIG5ld2VyIHZlcnNpb24gYXMgdGhl
IG9uZSBidWlsZHJvb3QgaXMgdXNpbmcuCj4gPgo+ID4gbGx2bS1jb25maWcgZm91bmQ6IFlFUwo+
ID4gKC9ob21lL3Rob21hcy9Eb2N1bWVudHMvZXh0ZXJuYWwvYnVpbGRyb290L291dHB1dC9ob3N0
L2Jpbi9sbHZtLWNvbmZpZykKPiA+IDIxLjEuOAo+ID4gUnVuLXRpbWUgZGVwZW5kZW5jeSBMTFZN
IChtb2R1bGVzOiBiaXR3cml0ZXIsIGNvcmUsIGNvdmVyYWdlLCBlbmdpbmUsCj4gPiBleGVjdXRp
b25lbmdpbmUsIGluc3Rjb21iaW5lLCBpcnJlYWRlciwgbGliZHJpdmVyLCBsaW5rZXIsIGx0bywK
PiA+IG1jZGlzYXNzZW1ibGVyLCBtY2ppdCwgbmF0aXZlLCBvcHRpb24sIHNjYWxhcm9wdHMsIHRh
cmdldCwKPiA+IHRyYW5zZm9ybXV0aWxzLCBhbGwtdGFyZ2V0cywgY29yb3V0aW5lcywgZnJvbnRl
bmRkcml2ZXIsIGZyb250ZW5kaGxzbCwKPiA+IGx0bywgd2luZG93c2RyaXZlcikgZm91bmQ6IFlF
UyAyMS4xLjgKPgo+IFRoYW5rcyBmb3IgdGhpcyB1cGRhdGUuCj4KPiBJJ20gd29uZGVyaW5nIGlm
IHRoZSBpc3N1ZSBjb3VsZCBhbHNvIGJlIHJlbGF0ZWQgdG8gdGhlIHRhcmdldCBhcmNoaXRlY3R1
cmUuLi4KPgo+IFlvdSBjYW4gcmVwcm9kdWNlIHRoZSBpc3N1ZSB0YXJnZXR0aW5nIGFuIEJSMl94
ODZfNjQgKHdoaWxlIGJ1aWxkaW5nIG9uIHg4Nl82NCkKPiBvbiAyMDI1LjA1LnggYnJhbmNoLiBC
dXQgY2FuIHlvdSBzdGlsbCByZXByb2R1Y2UgaXQgaWYgeW91IHVzZSBhbiBhYXJjaDY0IGFzIGEK
PiB0YXJnZXQpPwoKSSB0cmllZCBpdCB3aXRoIG90aGVyIGNvbWJpbmF0aW9ucywgYnV0IHRoZXkg
YWxsIGZhaWwgaW4gdGhlIHNhbWUgd2F5LgpUaGlzIG1ha2VzIGFjdHVhbGx5IHBlcmZlY3Qgc2Vu
c2UgYXMgd2UgYXJlIHRhbGtpbmcgYWJvdXQgaG9zdC1tZXNhM2QuCgpUaGlzIHdhcyBteSBjb25m
aWc6CgpCUjJfYWFyY2g2ND15CkJSMl9jb3J0ZXhfYTcyX2E1Mz15CkJSMl9UT09MQ0hBSU5fRVhU
RVJOQUw9eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU49eQpCUjJfVE9PTENIQUlOX0VY
VEVSTkFMX0JPT1RMSU5fQUFSQ0g2NF9HTElCQ19TVEFCTEU9eQpCUjJfTElOVVhfS0VSTkVMPXkK
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15CkJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X1ZFUlNJT05fVkFMVUU9IjYuMTIuMjgiCkJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVM
VF9DT05GSUc9eQpCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKQlIyX0xJTlVYX0tFUk5F
TF9JTlRSRUVfRFRTX05BTUU9InJvY2tjaGlwL3JrMzM5OS1yb2NrLTRzZSIKQlIyX0xJTlVYX0tF
Uk5FTF9JTlNUQUxMX1RBUkdFVD15CkJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NM
PXkKQlIyX1BBQ0tBR0VfTUVTQTNEPXkKQlIyX1BBQ0tBR0VfTUVTQTNEX0xMVk09eQpCUjJfUEFD
S0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfSTkxNT15CkJSMl9QQUNLQUdFX01FU0EzRF9HQUxM
SVVNX0RSSVZFUl9JUklTPXkKQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FR0w9eQpCUjJfUEFD
S0FHRV9NRVNBM0RfT1BFTkdMX0VTPXkKClllYWgsIEkga25vdywgdGhlIEk5MTUgZHJpdmVyIGRv
ZXNuJ3QgbWFrZSBtdWNoIHNlbnNlIG9uIGEgcm9ja2NoaXAsCmJ1dCB0aGF0J3Mgb2J2aW91c2x5
IG5vdCB0aGUgcG9pbnQgaGVyZS4gQXQgdGhlIG1vbWVudCB0aGF0Cmhvc3QtbWVzYTNkIHJlcXVp
cmVzIExMVk0sIHRoZW4geW91IGNhbiByZXByb2R1Y2UgaXQgb24gdGhlIDIwMjUuMDUuMwpyZWxl
YXNlIHRhZy4KCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+Cj4KPiA+Cj4gPgo+ID4gS3IsCj4g
Pgo+ID4gVGhvbWFzIERldm9vZ2R0Cj4gPgo+ID4KPiA+IE9wIHdvIDQgZmViIDIwMjYgb20gMTM6
MzYgc2NocmVlZiBUaG9tYXMgRGV2b29nZHQgPHRob21hc0BkZXZvb2dkdC5jb20+Ogo+ID4+Cj4g
Pj4gRnJvbTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXMuZGV2b29nZHRAYmFyY28uY29tPgo+ID4+
Cj4gPj4gTWVzb24ncyBjdXN0b20gTExWTSBwYXJzZXIgdXNlcyBsbHZtLWNvbmZpZyB3aXRoIGEg
ZGVmYXVsdCBzZWFyY2ggcGF0aCBvZgo+ID4+IC91c3IvYmluLCBjYXVzaW5nIGl0IHRvIGRldGVj
dCB0aGUgaG9zdCBzeXN0ZW0ncyBsbHZtLWNvbmZpZyAodmVyc2lvbiAxOC4xLjMpCj4gPj4gaW5z
dGVhZCBvZiB0aGUgYnVpbGRyb290LWNvbXBpbGVkIG9uZS4gVGhpcyBmb3JjZXMgYWxsIExMVk0t
cmVsYXRlZCBwYWNrYWdlcyB0bwo+ID4+IG1hdGNoIHZlcnNpb24gMTguMS4zLCBidXQgc2luY2Ug
dGhlIGhvc3Qgc3lzdGVtIGxhY2tzIGxsdm1zcGlydmxpYiwgdGhlIGJ1aWxkCj4gPj4gZmFpbHMu
IFRoaXMgcGF0Y2ggZm9yY2VzIE1lc29uIHRvIHVzZSB0aGUgYnVpbGRyb290LWNvbXBpbGVkIGxs
dm0tY29uZmlnLgo+ID4+Cj4gPj4gTm90ZSB0aGF0IExMVk1fQ09ORklHIGlzIGEgQ01ha2Ugb3B0
aW9uLCBub3QgYSBNZXNvbiBvbmUuIFRoaXMgaXMgYmVjYXVzZQo+ID4+IE1lc29uIGhhcyBjdXN0
b20gZGVwZW5kZW5jeSByZXNvbHV0aW9uIGxvZ2ljIGZvciBMTFZNIChzZWUKPiA+PiBodHRwczov
L21lc29uYnVpbGQuY29tL0RlcGVuZGVuY2llcy5odG1sI2xsdm0pLiBUaGUgRVhUUkFfQklOQVJJ
RVMgbWVjaGFuaXNtCj4gPj4gY2Fubm90IGJlIHVzZWQgaGVyZSwgYXMgaXQgb25seSBhcHBsaWVz
IHRvIGNyb3NzLWNvbXBpbGF0aW9uIHNjZW5hcmlvcywgd2hpY2gKPiA+PiBkb2VzIG5vdCBhcHBs
eSB0byBob3N0LW1lc2EzZCBidWlsZHMuCj4gPj4KPiA+PiBSZXByb2R1Y3Rpb24gKE9uIEJSMiB0
YWc6IDIwMjUuMDUuMyk6Cj4gPj4KPiA+PiBCUjJfeDg2XzY0PXkKPiA+PiBCUjJfeDg2X2F0b209
eQo+ID4+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+ID4+IEJSMl9UT09MQ0hBSU5fRVhURVJO
QUxfQk9PVExJTl9YODZfNjRfR0xJQkNfU1RBQkxFPXkKPiA+PiBCUjJfTElOVVhfS0VSTkVMPXkK
PiA+PiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiA+PiBCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEuMjQiCj4gPj4gQlIyX0xJTlVYX0tFUk5FTF9V
U0VfQ1VTVE9NX0NPTkZJRz15Cj4gPj4gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fQ09ORklHX0ZJ
TEU9ImJvYXJkL3BjL2xpbnV4LmNvbmZpZyIKPiA+PiBCUjJfTElOVVhfS0VSTkVMX0lOU1RBTExf
VEFSR0VUPXkKPiA+PiBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15Cj4gPj4g
QlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX0xJQkVMRj15Cj4gPj4gQlIyX1BBQ0tBR0VfTUVT
QTNEPXkKPiA+PiBCUjJfUEFDS0FHRV9NRVNBM0RfTExWTT15Cj4gPj4gQlIyX1BBQ0tBR0VfTUVT
QTNEX0dBTExJVU1fRFJJVkVSX0k5MTU9eQo+ID4+IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVN
X0RSSVZFUl9JUklTPXkKPiA+PiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VHTD15Cj4gPj4g
QlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FUz15Cj4gPj4KPiA+PiBGaXhlczoKPiA+Pgo+ID4+
IGxsdm0tY29uZmlnIGZvdW5kOiBZRVMgKC91c3IvYmluL2xsdm0tY29uZmlnLTE4KSAxOC4xLjMK
PiA+PiBSdW4tdGltZSBkZXBlbmRlbmN5IExMVk0gKG1vZHVsZXM6IGJpdHdyaXRlciwgY29yZSwg
Y292ZXJhZ2UsIGVuZ2luZSwgZXhlY3V0aW9uZW5naW5lLCBpbnN0Y29tYmluZSwgaXJyZWFkZXIs
IGxpYmRyaXZlciwgbGlua2VyLCBsdG8sIG1jZGlzYXNzZW1ibGVyLCBtY2ppdCwgbmF0aXZlLCBv
cHRpb24sIHNjYWxhcm9wdHMsIHRhcmdldCwgdHJhbnNmb3JtdXRpbHMsIGFsbC10YXJnZXRzLCBj
b3JvdXRpbmVzLCBmcm9udGVuZGRyaXZlciwgZnJvbnRlbmRobHNsLCBsdG8sIHdpbmRvd3Nkcml2
ZXIpIGZvdW5kOiBZRVMgMTguMS4zCj4gPj4gRGVwZW5kZW5jeSBMTFZNU1BJUlZMaWIgZm91bmQ6
IE5PLiBGb3VuZCAxNS4wLjAuMCBidXQgbmVlZDogJz49IDE4LjEnIDsgbWF0Y2hlZDogJz49IDE1
LjAuMC4wJywgJzwgMTguMicKPiA+PiBSdW4tdGltZSBkZXBlbmRlbmN5IGxsdm1zcGlydmxpYiBm
b3VuZDogTk8gKHRyaWVkIGNtYWtlKQo+ID4+Cj4gPj4gb3V0cHV0L2J1aWxkL2hvc3QtbWVzYTNk
LTI1LjAuNi9tZXNvbi5idWlsZDoxODgyOjIxOiBFUlJPUjogRGVwZW5kZW5jeSBsb29rdXAgZm9y
IExMVk1TUElSVkxpYiB3aXRoIG1ldGhvZCAncGtnY29uZmlnJyBmYWlsZWQ6IEludmFsaWQgdmVy
c2lvbiwgbmVlZCAnTExWTVNQSVJWTGliJyBbJz49IDE4LjEnXSBmb3VuZCAnMTUuMC4wLjAnLgo+
ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXMuZGV2b29nZHRA
YmFyY28uY29tPgo+ID4+IC0tLQo+ID4+IHYzOiBBZGRlZCByZXByb2R1Y3Rpb24gaW5mby4KPiA+
PiAgICAgQWN0dWFsbHksIEkgc2F3IHRoZSBpc3N1ZSBmaXJzdCBvbiAyMDI1LjAyLnggd2l0aCB0
aGVzZSBjb21taXRzIGNoZXJyeS1waWNrZWQ6Cj4gPj4gICAgIC0gMzE3MjYwZjMzNmI2NWZmMGI0
MWE5NTM4ODJjYjhjY2NiNzg5ZTAxMAo+ID4+ICAgICAtIDhiNWRkNDljNWIyZWI1MmU3MWJhOWRm
ZjY3YjFiYTU0ZDBlMDBhYzMKPiA+PiAgICAgLSA0ODkwNDE1YWE5ZTkxOGJkYmI1MjQxNGUwZTUz
ZjI5ZTkzMzE1MjkxCj4gPj4gICAgIC0gYjA4YmM1YjllOTQyNjlhZGI0YTFjNTc3MWM4YzI2Yzhj
ODdlNWI1YQo+ID4+IC0tLQo+ID4+ICBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgfCAzICsrKwo+
ID4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4g
Pj4gaW5kZXggZGI0NmQ3YmM3YzIuLmI1MzAwZGYyYmEzIDEwMDY0NAo+ID4+IC0tLSBhL3BhY2th
Z2UvbWVzYTNkL21lc2EzZC5tawo+ID4+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+
ID4+IEBAIC0yOTIsNiArMjkyLDkgQEAgaWZlcSAoJChCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FO
X0RSSVZFUl9JTUFHSU5BVElPTikseSkKPiA+PiAgSE9TVF9NRVNBM0RfVE9PTFMgKz0gaW1hZ2lu
YXRpb24KPiA+PiAgZW5kaWYKPiA+Pgo+ID4+ICtIT1NUX01FU0EzRF9DT05GX0VOViA9IFwKPiA+
PiArICAgICAgIExMVk1fQ09ORklHPSIkKEhPU1RfRElSKS9iaW4vbGx2bS1jb25maWciCj4gPj4g
Kwo+ID4+ICBIT1NUX01FU0EzRF9DT05GX09QVFMgPSBcCj4gPj4gICAgICAgICAtRGdsdm5kPWRp
c2FibGVkIFwKPiA+PiAgICAgICAgIC1EZ2FsbGl1bS1kcml2ZXJzPSQoc3Vic3QgJChzcGFjZSks
JChjb21tYSksJChIT1NUX01FU0EzRF9HQUxMSVVNX0RSSVZFUlMteSkpIFwKPiA+PiAtLQo+ID4+
IDIuNDMuMAo+ID4+CgpLaW5kIHJlZ2FyZHMsCgpUaG9tYXMgRGV2b29nZHQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
