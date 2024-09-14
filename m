Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61285C02186
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D68C84534;
	Sat, 14 Sep 2024 09:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U67U0_ZWR0FN; Sat, 14 Sep 2024 09:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 369B58455C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 369B58455C;
	Sat, 14 Sep 2024 09:04:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A266C1BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D24F40524
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeRPhQsrizDW for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:04:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A12D404F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A12D404F8
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A12D404F8
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:04:37 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e1a819488e3so2640905276.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 02:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726304676; x=1726909476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zoa7IrgIkbGEjWkPfLahr5kE9P3CS7hQC+0uSIj3l/U=;
 b=b3sOdcG+oE5PZiBg2vw2IYCq2N3tLCd8LCgAf22jHwPgLFDbB+mIx8VLMHHdamy9pR
 A6DEvvsFmOzlUs71yyOrljlzp3/6VwwZN2adeQzrvVWK2xRfumKMywh4I2rsDhSr1yWu
 /CTDo3b9NtOrJRwh5a7EFKOqTCQFY6mWpZvwwQAvE++PKUG1A5sJpOAwTJHAw9NMijBJ
 Mz/gPlWRtYvU6wFW26+7/uFhd1fBajO6iVgCGUooe3o5/Z/zoHNa8/WjF1ZFGVkVuDVG
 2GVQboWR/2ixSGkmxJ/ZJGIhuyxwnxYKTot9SNny+Igbua2FoIXLWtB/iBqW+PjcH0yF
 AlnA==
X-Gm-Message-State: AOJu0YwXpayoQYFNrA+oa5vdq9e05db5eYVBCRInGtuIy9MMIX1Aik+U
 JxY/iv64SHpafvM5iuhZGBzNLee2th1US7dYpBE5AjJqvP86XDxdl6kuJ1hG3ndtTY4FFXMmrYT
 lcUvT3QmehoVj63QrS+8L/xbWkVtaR1itlgFUiR/q12NuBgJCmQCyQnXp
X-Google-Smtp-Source: AGHT+IHJW72sdnq+MQWS1x3YpywiTfVgw+iUvE/S1QNr3cLYXylvSyyIbwAs2pTZu8K68HeJrzrFlYO6o9mWxhLFgtk=
X-Received: by 2002:a05:6902:2805:b0:e1a:82d3:b5b8 with SMTP id
 3f1490d57ef6-e1d9dc4845emr8357328276.52.1726304676493; Sat, 14 Sep 2024
 02:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725049576.git.yann.morin.1998@free.fr>
 <23841300f5a85914d9c0fc19b24df485ba861efa.1725049576.git.yann.morin.1998@free.fr>
In-Reply-To: <23841300f5a85914d9c0fc19b24df485ba861efa.1725049576.git.yann.morin.1998@free.fr>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 14 Sep 2024 11:04:26 +0200
Message-ID: <CABGWkvq=ca3xYu6+_91-8KtoQqCBOBGexBbJe8wDZGMR3YQUcA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726304676; x=1726909476;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zoa7IrgIkbGEjWkPfLahr5kE9P3CS7hQC+0uSIj3l/U=;
 b=eTmr3iBJG2480JfjEYlePTLNEGlVnJy06C3zvXzyMR+6zqBx+qfKAmJ92R9TiHukyr
 okwEClY/PId/A//Fev5R8f/AApwFhd2BwW1hsQq6qDaiv9aEQUOynb5MCg5rhsq40e7r
 hoBWb3u05oxqSNgVrf1vJ89NfAYpO1OkDRs/Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=eTmr3iBJ
Subject: Re: [Buildroot] [PATCH 3/3] system: add tini as init system
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIEZyaSwgQXVnIDMwLCAyMDI0IGF0IDEwOjI24oCvUE0gWWFubiBFLiBNT1JJ
TiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gVGluaSBpcyBhIHNwZWNpYWwt
cHVycG9zZSBpbml0IHN5c3RlbSwgYWltZWQgYXQgY29udGFpbmVycy4KPgo+IEFkZCBpdCB0byB0
aGUgY2hvaWNlIG9mIGluaXQgc3lzdGVtcy4KPgo+IHRpbmkgZG9lcyBub3QgcmVxdWlyZSBtdWNo
LCBzbyB3ZSByZS11c2UgdGhlIGRlZmF1bHQgIm5vbmUiIHNrZWxldG9uLgo+Cj4gTm90ZSB0aGF0
IHRpbmkgaXMgbm8gbG9uZ2VyIHNlbGVjdGFibGUgb24gaXRzIG93biwgd2hpY2ggaXQgdXNlZCB0
byBiZS4KPiBUaGlzIGNoYW5nZSB3aWxsIHJlcXVpcmUgdGhhdCBwZW9wbGUgdXNpbmcgdGluaSBi
ZSBjYXJlZnVsIHdoZW4KPiB1cGdyYWRpbmcsIHRob3VnaCwgYnV0IHRoYXQgd2lsbCBiZSB2ZXJ5
IGVhc2lseSBjYXVnaHQsIGFzIHRoZQo+IGNvbnRhaW5lcnMgd291bGQgbm8gbG9uZ2VyIHN0YXJ0
IGF0IGFsbC4KPgo+IFdlIGNvdWxkIGFkIGEgY29tbWVudCBzdGF0aW5nIHdoeSwgYnV0IG5vIG90
aGVyIGluaXQgc3lzdGVtIGhhcyBzdWNoIGEKPiBjb21tZW50LCBzbyBhZGRpbmcgb25lIGZvciB0
aW5pIGFsb25lIHdvdWxkIGJlIHdlaXJkLCBzbyB3ZSBkb24ndCBhZGQKPiBvbmUuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiBDYzog
RGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IENj
OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IC0tLQo+
ICBwYWNrYWdlL3RpbmkvQ29uZmlnLmluIHwgIDEgKwo+ICBzeXN0ZW0vQ29uZmlnLmluICAgICAg
IHwgMTYgKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3RpbmkvQ29uZmlnLmluIGIvcGFja2FnZS90aW5p
L0NvbmZpZy5pbgo+IGluZGV4IDcxOWUxZTFmMjIuLmJjYThhZDhlOTYgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS90aW5pL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvdGluaS9Db25maWcuaW4KPiBA
QCAtMSw2ICsxLDcgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX1RJTkkKPiAgICAgICAgIGJvb2wg
InRpbmkiCj4gICAgICAgICBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZm9yaygpCj4gKyAgICAg
ICBkZXBlbmRzIG9uIEJSMl9JTklUX1RJTkkKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgdGlu
aSBpcyBhIHNpbXBsZSBidXQgdmFsaWQgaW5pdCBiaW5hcnkgdG8KPiAgICAgICAgICAgYWN0IGFz
IFBJRCAxIGZvciBjb250YWluZXJzLgo+IGRpZmYgLS1naXQgYS9zeXN0ZW0vQ29uZmlnLmluIGIv
c3lzdGVtL0NvbmZpZy5pbgo+IGluZGV4IDE4Y2MzOWFkOTQuLmQ3ZDU5ZGI0N2QgMTAwNjQ0Cj4g
LS0tIGEvc3lzdGVtL0NvbmZpZy5pbgo+ICsrKyBiL3N5c3RlbS9Db25maWcuaW4KPiBAQCAtMTQ5
LDYgKzE0OSwyMiBAQCBjb21tZW50ICJzeXN0ZW1kIGhpZ2hseSByZWNvbW1lbmRzIExpbnV4ID49
IDQuMTUiCj4KPiAgY29tbWVudCAiU3BlY2lhbCBwdXJwb3NlIChyZWFkIGhlbHApIgo+Cj4gK2Nv
bmZpZyBCUjJfSU5JVF9USU5JCj4gKyAgICAgICBib29sICJ0aW5pIgo+ICsgICAgICAgZGVwZW5k
cyBvbiBCUjJfVVNFX01NVSAgIyB0aW5pCj4gKyAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfVElO
SQo+ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1NLRUxFVE9OX0lOSVRfTk9ORSBpZiBCUjJf
Uk9PVEZTX1NLRUxFVE9OX0RFRkFVTFQKPiArICAgICAgIGhlbHAKPiArICAgICAgICAgVGluaSAt
IEEgdGlueSBidXQgdmFsaWQgaW5pdCBmb3IgY29udGFpbmVycwo+ICsKPiArICAgICAgICAgVGlu
aSBpcyB0aGUgc2ltcGxlc3QgaW5pdCB5b3UgY291bGQgdGhpbmsgb2YuCj4gKwo+ICsgICAgICAg
ICBBbGwgVGluaSBkb2VzIGlzIHNwYXduIGEgc2luZ2xlIGNoaWxkIChUaW5pIGlzIG1lYW50IHRv
IGJlIHJ1bgo+ICsgICAgICAgICBpbiBhIGNvbnRhaW5lciksIGFuZCB3YWl0IGZvciBpdCB0byBl
eGl0IGFsbCB0aGUgd2hpbGUgcmVhcGluZwo+ICsgICAgICAgICB6b21iaWVzIGFuZCBwZXJmb3Jt
aW5nIHNpZ25hbCBmb3J3YXJkaW5nLgo+ICsKPiArICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29t
L2tyYWxsaW4vdGluaQo+ICsKPiAgY29uZmlnIEJSMl9JTklUX05PTkUKPiAgICAgICAgIGJvb2wg
IkN1c3RvbSAobm9uZSkiCj4gICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfU0tFTEVUT05fSU5J
VF9OT05FIGlmIEJSMl9ST09URlNfU0tFTEVUT05fREVGQVVMVAo+IC0tCj4gMi40Ni4wCj4KClJl
dmlld2VkLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9u
cy5jb20+CgpSZWdhcmRzLApEYXJpbwoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVk
ZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBT
UkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5
IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0
aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
