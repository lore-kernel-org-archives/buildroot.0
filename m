Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED64CD129D
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 16:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6020407E5;
	Mon,  8 Apr 2024 16:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41f1cXRkjhaC; Mon,  8 Apr 2024 16:11:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3192E4080F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3192E4080F;
	Mon,  8 Apr 2024 16:11:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA29B1BF34D
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 16:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1F8B81EDE
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 16:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1Gn7M61wJjN for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 16:11:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 762D281EDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 762D281EDD
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 762D281EDD
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 16:11:55 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-434a6024d0aso2811211cf.0
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 09:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712592714; x=1713197514;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42dY8lgXUi/R71t97zC0kXTHSyMmjVmnZTLZdaxfzrI=;
 b=rEu5egjsI4aHI/Ls/Ej/SFg/9kclfMZl+2n3TZ9qIa+Povf2Lccp/eq2PRNN7eCto8
 Vfr4mb6OGmGNf16oT/b5zK4s4HyHuK3bci5siCtN3Axk8o/E1TxVzlGaYISlMIPApxqz
 rkPlKgo046Mu87k/QhmlIg4qpgYV/Z29ALmITuwL8RI996a7IaDCc4bub+23UH7NqG/t
 BcIlvZ77qP3v/x7bG/9mNsuDB2TxnmBB8g2rOCrpEL+9PQYUL+04X9W7eXroBxysoU36
 f9hesW1FBh1LA3iSkIQt1D4aYfbxEwhWPf2/gQu/SkyF5mRkekVd+ZLXpZ9083ns9VuX
 AknQ==
X-Gm-Message-State: AOJu0YwUCbak5QTB6yzIKd9AaT6pSGScji9i8bfKQFpS32CPSKdM+JoY
 sq1uIcRtfuZS4pIktsHpjStZz84PvzG5WpxcwHJR0MYKWrlxiKnzXJHM6t1DMqFAf/+eB/ccxBj
 Bd7nGF1MpEBH4Rtg33kM0IZhivQ2f5HHfD1to4w==
X-Google-Smtp-Source: AGHT+IE3GNV2FkG5O8iNtjA5OQr3+M1qFoCf8cZq4NdV0MWrnhhFvkdFlgPdiSPb2AkayiHBmMV7uHih+MOITs6boHs=
X-Received: by 2002:a05:622a:4d1:b0:430:c387:e838 with SMTP id
 q17-20020a05622a04d100b00430c387e838mr10178362qtx.43.1712592714161; Mon, 08
 Apr 2024 09:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-6-romain.naour@smile.fr>
In-Reply-To: <20240407103512.1112712-6-romain.naour@smile.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 8 Apr 2024 10:11:40 -0600
Message-ID: <CADvTj4qrYwRrNRfD6sap-nO94eKC4h4t-DuDrceZJrJZNA3pLw@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712592714; x=1713197514; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42dY8lgXUi/R71t97zC0kXTHSyMmjVmnZTLZdaxfzrI=;
 b=kK5kVTTaPAF4m4WFucamAPA8NtwzBWuAjk+V0yQ6IuMijqqDHciNmuEoHYqMttZnpR
 w5exCqKlCuV6fwkQXPBKO3Qwj2STOLnPE7qvWO+HKkJFZF/WjV3GuqEkQKU7SiwN5ua7
 OnekQe8Rz15CalEuBJs6UZNpA528Stgh2HQA5zd8nSyjAg/OqcQlOC+F4GFPfEXm38mQ
 gSQiawxZr9b55dCux4Fq6NudxVVGfvqu1VxC3MBPKF2vqTISn7O7k7UwK4P8eQsyQD2I
 UoGDyXermp8ZkRqk+g+gX2nsZWbVMn0A1zgUvKs7aNkN9ORjdyhLEzENmWfQQ+zNva8M
 V87g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kK5kVTTa
Subject: Re: [Buildroot] [PATCH v12 05/16] boot/uboot: add
 BR2_TARGET_UBOOT_USE_BINMAN option
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBcHIgNywgMjAyNCBhdCA0OjM14oCvQU0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFv
dXJAc21pbGUuZnI+IHdyb3RlOgo+Cj4gRnJvbTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFj
Y2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Cj4gUmVjZW50IHZlcnNpb24gb2YgVS1Cb290IHVz
ZSBiaW5tYW4gdG8gcHJvdmlkZSBhIG1lY2hhbmlzbSBmb3IgYnVpbGRpbmcKPiBpbWFnZXMsIGZy
b20gc2ltcGxlIFNQTCArIFUtQm9vdCBjb21iaW5hdGlvbnMsIHRvIG1vcmUgY29tcGxleAo+IGFy
cmFuZ2VtZW50cyB3aXRoIG1hbnkgcGFydHMuCj4KPiBUaGlzIHRvb2wgdXNlcyBhZGRpdGlvbmFs
IGhvc3QgcHl0aG9uIG1vZHVsZXMgdGhhdCBtdXN0IGJlIHByb3ZpZGVkIGJ5Cj4gQnVpbGRyb290
LiBTbyBpbnRyb2R1Y2UgYSBuZXcgb3B0aW9uIEJSMl9UQVJHRVRfVUJPT1RfVVNFX0JJTk1BTiB0
bwo+IGFkZCBhZGRpdGlvbmFsIGhvc3QgcGFja2FnZXMgaW4gVS1Cb290IGJ1aWxkIGRlcGVuZGVu
Y3kgdG8gdXNlIGJpbm1hbi4KPgo+IFRoZSBiaW5tYW4gcmVxdWlyZW1lbnQgaXMgZGlyZWN0bHkg
aW5jbHVkZWQgaW4gYnVpbGRtYW4gZGVwZW5kZW5jeQo+ICh0b29scy9idWlsZG1hbi9yZXF1aXJl
bWVudHMudHh0KSBzaW5jZSB3aXRoaW4gVS1Cb290LCBiaW5tYW4gaXMKPiBpbnZva2VkIGJ5IHRo
ZSBidWlsZCBzeXN0ZW0sIGhlcmUgYnVpbGRtYW4gWzFdLgo+Cj4gWzFdIGh0dHBzOi8vZG9jcy51
LWJvb3Qub3JnL2VuL3YyMDI0LjAxL2RldmVsb3AvcGFja2FnZS9iaW5tYW4uaHRtbCNpbnZva2lu
Zy1iaW5tYW4td2l0aGluLXUtYm9vdAo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBSb21haW4gTmFvdXIg
PHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8
ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MTI6
Cj4gLSByZW1vdmUgQlIyX1BBQ0tBR0VfVElfSzMgcGFydCBzaW5jZSB0aGlzIG9wdGlvbiBoYXMg
YmVlbiByZW1vdmVkIGZyb20gdGhpcyBzZXJpZXMKPiAtIHJlbW92ZSBUSSBLMyBzcGVjaWZpYyBw
YXJ0IGZyb20gdGhlIGNvbW1pdCBsb2cKPgo+IENoYW5nZXMgaW4gdjExOgo+IC0gQWRkIHRpLWsz
LWJvb3QtZmlybXdhcmUgZGVwZWRlbmRlbmN5IHdoZW4gYm90aCBCUjJfVEFSR0VUX1VCT09UX1VT
RV9CSU5NQU4KPiAgIGFuZCBCUjJfUEFDS0FHRV9USV9LMyBhcmUgc2V0Cj4gLSBkcm9wIEJSMl9U
QVJHRVRfVUJPT1RfTkVFRFNfVElfSzNfRE0gcmVsYXRlZCBjaGFuZ2VzCj4KPiBDaGFuZ2VzIGlu
IHY3Ogo+IC0gUmVwbGFjZSBpZm5lcSAoJChCUjJfVEFSR0VUX1VCT09UX1VTRV9CSU5NQU4pLHkp
IHdpdGgKPiAgIGlmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9VU0VfQklOTUFOKSwpLgo+IC0gVXBk
YXRlIHRoZSBjb21taXQgbWVzc2FnZQo+Cj4gQ2hhbmdlcyBpbiB2NjoKPiAtIEJSMl9UQVJHRVRf
VUJPT1RfVVNFX0JJTk1BTgo+IC0gQmlubWFuIHRvb2wgaXMgbm90IHNwZWNpZmljIHRvIFRJIEsz
IHBsYXRmb3JtLCBzbyBhZGQgYW4gb3B0aW9uIHRvIHNwZWNpZnkKPiAgIHRoZSB1c2Ugb2YgQmlu
bWFuIGluIFUtQm9vdC4KPiAtIEFkZCBydW50aW1lIGRlcGVuZGVuY2llcwo+IC0gVXBkYXRlIGNv
bW1pdCBtZXNzYWdlCj4gLSBBZGQgU09CIGFuZCBDT0IgdGFncyBvZiBSb21haW4gTmFvdXIKPgo+
IENoYW5nZXMgaW4gdjU6Cj4gLSBEcm9wICJETT0kKEJJTkFSSUVTX0RJUikvdGktZG0vJChVQk9P
VF9USV9LM19ETV9TT0NOQU1FKS9pcGNfZWNob190ZXN0Yl9tY3UxXzBfcmVsZWFzZV9zdHJpcC54
ZXI1ZiIKPiAgIGZyb20gVUJPT1RfTUFLRV9PUFRTLgo+Cj4gbm8gY2hhbmdlcyBzaW5jZSB2MToK
PiAtLS0KPiAgYm9vdC91Ym9vdC9Db25maWcuaW4gfCAxMSArKysrKysrKysrKwo+ICBib290L3Vi
b290L3Vib290Lm1rICB8ICA4ICsrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3QvQ29uZmlnLmluIGIvYm9vdC91Ym9v
dC9Db25maWcuaW4KPiBpbmRleCBlMzEwYzA5MjE3Li4zOWU0OWQ2ODFiIDEwMDY0NAo+IC0tLSBh
L2Jvb3QvdWJvb3QvQ29uZmlnLmluCj4gKysrIGIvYm9vdC91Ym9vdC9Db25maWcuaW4KPiBAQCAt
Mjk1LDYgKzI5NSwxNyBAQCBjb25maWcgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19ST0NLQ0hJUF9S
S0JJTgo+ICAgICAgICAgICBUaGlzIG9wdGlvbiBtYWtlcyBzdXJlIHRoYXQgdGhlIG5lZWRlZCBi
aW5hcnkgYmxvYnMgYXJlIGNvcGllZAo+ICAgICAgICAgICBpbnRvIHRoZSBVLUJvb3Qgc291cmNl
IGRpcmVjdG9yeS4KPgo+ICtjb25maWcgQlIyX1RBUkdFVF9VQk9PVF9VU0VfQklOTUFOCj4gKyAg
ICAgICBib29sICJVLUJvb3QgdXNlIGJpbm1hbiIKPiArICAgICAgIGRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUyAjIHB5dGhvbi1ycGRzLXB5IC0+
IHB5dGhvbi1qc29uc2NoZW1hCgpUaGlzIGNvbW1lbnQgZG9lc24ndCBsb29rIHJpZ2h0LCB3aGF0
IGlzIHNlbGVjdGluZyBweXRob24tcnBkcy1weSBhbmQKcHl0aG9uLWpzb25zY2hlbWE/Cgo+ICsg
ICAgICAgc2VsZWN0IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfUFlUSE9OMwo+ICsgICAgICAgc2Vs
ZWN0IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfUFlFTEZUT09MUwo+ICsgICAgICAgc2VsZWN0IEJS
Ml9UQVJHRVRfVUJPT1RfTkVFRFNfUFlMSUJGRFQKPiArICAgICAgIGhlbHAKPiArICAgICAgICAg
VXNlIGJpbm1hbiB0b29sIGZvciBnZW5lcmF0aW9uIGFuZCBzaWduaW5nIG9mIGJvb3QgaW1hZ2Vz
Lgo+ICsKPiArICAgICAgICAgaHR0cHM6Ly9kb2NzLnUtYm9vdC5vcmcvZW4vdjIwMjQuMDEvZGV2
ZWxvcC9wYWNrYWdlL2Jpbm1hbi5odG1sCj4gKwo+ICBtZW51ICJVLUJvb3QgYmluYXJ5IGZvcm1h
dCIKPgo+ICBjb25maWcgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQUlTCj4gZGlmZiAtLWdpdCBh
L2Jvb3QvdWJvb3QvdWJvb3QubWsgYi9ib290L3Vib290L3Vib290Lm1rCj4gaW5kZXggNDdmYjQx
OWU5Mi4uMzk4NDg1MTk1ZSAxMDA2NDQKPiAtLS0gYS9ib290L3Vib290L3Vib290Lm1rCj4gKysr
IGIvYm9vdC91Ym9vdC91Ym9vdC5tawo+IEBAIC0yNzksNiArMjc5LDE0IEBAIGlmZXEgKCQoQlIy
X1RBUkdFVF9VQk9PVF9ORUVEU19YWEQpLHkpCj4gIFVCT09UX0RFUEVOREVOQ0lFUyArPSBob3N0
LXZpbQo+ICBlbmRpZgo+Cj4gK2lmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9VU0VfQklOTUFOKSx5
KQo+ICsjIGh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2Jsb2IvdjIwMjQu
MDEvdG9vbHMvYnVpbGRtYW4vcmVxdWlyZW1lbnRzLnR4dAo+ICtVQk9PVF9ERVBFTkRFTkNJRVMg
Kz0gXAo+ICsgICAgICAgaG9zdC1weXRob24tanNvbnNjaGVtYSBcCj4gKyAgICAgICBob3N0LXB5
dGhvbi1weXlhbWwKPiArVUJPT1RfTUFLRV9PUFRTICs9IEJJTk1BTl9JTkRJUlM9JChCSU5BUklF
U19ESVIpCj4gK2VuZGlmCj4gKwo+ICAjIHByaW9yIHRvIHUtYm9vdCAyMDEzLjEwIHRoZSBsaWNl
bnNlIGluZm8gd2FzIGluIENPUFlJTkcuIENvcHkgaXQgc28KPiAgIyBsZWdhbC1pbmZvIGZpbmRz
IGl0Cj4gIGRlZmluZSBVQk9PVF9DT1BZX09MRF9MSUNFTlNFX0ZJTEUKPiAtLQo+IDIuNDQuMAo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
