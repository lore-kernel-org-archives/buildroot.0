Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DB9C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:21:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D88460462
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D88460462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F19BC8106A;
	Thu, 19 Aug 2021 21:21:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfirHIYs1skw; Thu, 19 Aug 2021 21:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8137B814B8;
	Thu, 19 Aug 2021 21:21:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CEB51BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B8A2402BA
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-EcJ4ty1YCo for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:21:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E19140202
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:21:29 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i9so15780387lfg.10
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 14:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p1OQSWUnPGqg42zS8Qk64Cga3I9ecfxMiB2XGJKk9qo=;
 b=JWo+IbOj9Age/krv5v3iVQJG51eiXTZWl2sE/om1QdZToOuUaFzhtV/EgfVqOYTdBi
 OwD1OvIEgHlXajahSDago8w+bsfE+GkVMg3h2U6k7W78iUXH3lJCJlY4JuOt0g8eV7Qq
 VmHo7IuTwh39All85kSuHLtVNOP/2nhqaPCzLDLdsUXTJaRrLYYpS7Z8giIS5wZLDUD/
 wIDme8eYwxoUN0+Pz3Um9sS5U3WFF9hvGkzywPadLd/Zco1w25SSX/cts7KeoEgLvrin
 tL9/kAbz1AoqmZVy7a9hV2OI3BPAdmuW+xlUQyaZzDgeR37DdXfVW3Cm8kg6m99r0eJh
 EjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p1OQSWUnPGqg42zS8Qk64Cga3I9ecfxMiB2XGJKk9qo=;
 b=HwiLQG67mkfw7tF1ktroNjzBEJDMnegKsc+tzSoCNFbCtUdPvdpo9uucKTORHtLJH1
 q9BqpLDMIXXrADfuM/npkE8xU9RRnqHaDKVLWoQrKuCxv9dtct7bZbd5RkLi7KMkmQwy
 uoRP2BdnBnDZOIPYf71Pl5vO4BTuz19+/iI4rNgpBgh8SLFyG8QB8+es/aQ2o99nZC3Z
 7bZC+Wekk7dNo/yoQRdZ+W3roHyCgW/81h7DI6budbDUvxR5qaIeZrmonE8E7bFgvK5f
 yXnZsXDWfOs4xXt1hcKmqfYD/WpwRMhReW0aC8am8njvx/sbewnRgh4fZqomVsOPk5dB
 WZEQ==
X-Gm-Message-State: AOAM532n25o2eh+sYDdQr/G5xjxQtadmwI1h+IxKmdGiC+ZYSoCm3V1x
 iILfLIGDvitUgA93cPNIh86jxUU8ijxaxmFRs48=
X-Google-Smtp-Source: ABdhPJw5W3fp3YovMqClboim9ozbQr+lbTl5aI2P6MlQkjlP9+/azHd6p+i3M3bteGf0+zXBRhL/ULjjCtqC9ieL56w=
X-Received: by 2002:a19:f719:: with SMTP id z25mr11891912lfe.339.1629408087364; 
 Thu, 19 Aug 2021 14:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210805174252.2661314-1-fontaine.fabrice@gmail.com>
 <20210819230539.16ac5e4f@windsurf>
In-Reply-To: <20210819230539.16ac5e4f@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 19 Aug 2021 23:21:16 +0200
Message-ID: <CAPi7W820rnjxXh4uRrnkiN+OuULThhcLoBiq3j-vDKBTJ3Zy_Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/mcrypt: drop package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gVGhvbWFzLAoKTGUgamV1LiAxOSBhb8O7dCAyMDIxIMOgIDIzOjA1LCBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxs
byBGYWJyaWNlLAo+Cj4gT24gVGh1LCAgNSBBdWcgMjAyMSAxOTo0Mjo1MSArMDIwMAo+IEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gRHJv
cCBtY3J5cHQgd2hpY2ggaXMgbm90IG1haW50YWluZWQgYW55bW9yZSAobm8gcmVsZWFzZSBzaW5j
ZSAyMDA4KS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWlu
ZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIENvbmZpZy5pbi5sZWdhY3kgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA3ICsrCj4gPiAgcGFja2FnZS9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgLQo+ID4gIHBhY2thZ2UvbWNyeXB0LzAwMDEtQ1ZFLTIwMTItNDQw
OS5wYXRjaCB8IDI1IC0tLS0tLS0KPiA+ICBwYWNrYWdlL21jcnlwdC8wMDAyLUNWRS0yMDEyLTQ0
MjYucGF0Y2ggfCAzNSAtLS0tLS0tLS0KPiA+ICBwYWNrYWdlL21jcnlwdC8wMDAzLUNWRS0yMDEy
LTQ1MjcucGF0Y2ggfCA5OSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgcGFja2FnZS9t
Y3J5cHQvMDAwNC1uby1ycGF0aC5wYXRjaCAgICAgIHwgMTcgLS0tLS0KPiA+ICBwYWNrYWdlL21j
cnlwdC9Db25maWcuaW4gICAgICAgICAgICAgICAgfCAxMiAtLS0KPiA+ICBwYWNrYWdlL21jcnlw
dC9tY3J5cHQuaGFzaCAgICAgICAgICAgICAgfCAgMyAtCj4gPiAgcGFja2FnZS9tY3J5cHQvbWNy
eXB0Lm1rICAgICAgICAgICAgICAgIHwgMjQgLS0tLS0tCj4gPiAgOSBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDIxNiBkZWxldGlvbnMoLSkKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9tY3J5cHQvMDAwMS1DVkUtMjAxMi00NDA5LnBhdGNoCj4gPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvbWNyeXB0LzAwMDItQ1ZFLTIwMTItNDQyNi5wYXRjaAo+ID4gIGRlbGV0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21jcnlwdC8wMDAzLUNWRS0yMDEyLTQ1MjcucGF0Y2gKPiA+
ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tY3J5cHQvMDAwNC1uby1ycGF0aC5wYXRjaAo+
ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21jcnlwdC9Db25maWcuaW4KPiA+ICBkZWxl
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tY3J5cHQvbWNyeXB0Lmhhc2gKPiA+ICBkZWxldGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9tY3J5cHQvbWNyeXB0Lm1rCj4KPiBEbyB3ZSBoYXZlIGEgZ29vZCBy
ZWFzb24gdG8gZHJvcCB0aGVzZSBwYWNrYWdlcz8gV2UgaGF2ZSBsb3RzIG9mCj4gcGFja2FnZXMg
d2l0aCBubyB1cHN0cmVhbSBhY3Rpdml0eSwgYW5kIHdlIGRyb3AgdGhlbSBvbmx5IHdoZW4gdGhl
cmUgaXMKPiBzb21lIHBhcnRpY3VsYXIgaXNzdWUuIFdoYXQgcHJvbXB0ZWQgeW91IHRvIHByb3Bv
c2UgdGhlc2UgcGFja2FnZXMgZm9yCj4gcmVtb3ZhbCA/CkJlY2F1c2UgaXQgaXMgYSBjcnlwdG9n
cmFwaGljIHBhY2thZ2UsIGhlcmUgaXMgYW4gZXh0cmFjdCBvZgpodHRwczovL2VuLndpa2lwZWRp
YS5vcmcvd2lraS9NY3J5cHQ6CiJUaGUgbGFzdCB1cGRhdGUgdG8gbGlibWNyeXB0IHdhcyBpbiAy
MDA3LCBkZXNwaXRlIHllYXJzIG9mIHVubWVyZ2VkCnBhdGNoZXMuIFRoZXNlIGZhY3RzIGhhdmUg
bGVkIHNlY3VyaXR5IGV4cGVydHMgdG8gZGVjbGFyZSBtY3J5cHQKYWJhbmRvbndhcmUgYW5kIGRp
c2NvdXJhZ2UgaXRzIHVzZSBpbiBuZXcgZGV2ZWxvcG1lbnQuIgo+Cj4gVGhhbmtzLAo+Cj4gVGhv
bWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpCZXN0IFJlZ2Fy
ZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9s
aXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
