Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AF5C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 15:02:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34916610CB
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 15:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34916610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C76F983896;
	Sat,  7 Aug 2021 15:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itHJ-IUx8D8H; Sat,  7 Aug 2021 15:02:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07D4983870;
	Sat,  7 Aug 2021 15:02:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 308E21BF5A5
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 15:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EB2A401CE
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 15:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Stu4PvxXxaO4 for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 15:02:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EFFA4000B
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 15:02:08 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g30so20039599lfv.4
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 08:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lZ+nGpIRYxw2Wd1+f3rot6bIiSuJv8WQIWvcOVBNNHQ=;
 b=q3GQ28RHyDpb2qPLL0IFKOY9aRzDbdWY2FQIQU/vGYmqNG9NRij/Dna8VAaaOFvUaR
 5oUC9ITtKmkTWlPQ8rEQ1M2XbyHY2egrKJK7Hm3IDQBvyozrMOjAYHJaNcV1QoO8By9r
 OPnkaBOYQGWvJZVMPedn0ERfasGjVwBDmGI9gQt8C6ZEMMoEkBoVG0I12rf2QYfn6QNT
 0OQkueXzgCm/vnG0vQSocG8ijZrKHB70c51AoS0Ph7BuxLfClMIr+zVXGNMVdsrD3Q9i
 ZRG7KVYU1ZjaFEbTTFLOD9bPQkC8Eon8GESL1fzfd1w1fOhfbeYWav+AUSO6NF0wrjoP
 G7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lZ+nGpIRYxw2Wd1+f3rot6bIiSuJv8WQIWvcOVBNNHQ=;
 b=Wvlho25Hq1T2rWaPeZ4ev4rkeKeOp3qFh1Vb+MgNBocoDnB82K1Noaj3KYSUjVbPbp
 7XyVMkC9rbvQVAuqT2MQ/yJSPCDdeEAHHX4IuPR+6s/g5WZGMnrQgZJHIUrXB47FMG5T
 ke07QRKo3A5T34pyyMCnXLDTj0qvcgBp3zWJQXj4ySGmE9IEeSyh2SeEHcXTdvTdUFo4
 wSraBAwnAL5RSmbDYBsisWeCdPiGY5ndkU7jX9ZNGG/oiHV0yLQ9mS1FflA8BJOuV37Z
 LRc+MRenNuyOq9Kbhx7tSmMmLeWAF5arnybXUPtguwBUgkQSaKPVFabxprJrQlm0DTiI
 qfLg==
X-Gm-Message-State: AOAM530kkjIGkXwS9vT+g+Pv7hmNJzoZDvHhyoGvslapZ2XgoVeAfg6b
 LvB+F/6OGQz1H/ipVSIvy//w8jgcJA0dItFPbWg=
X-Google-Smtp-Source: ABdhPJxePiiz7kztzeC21OyY5lqQXngVWgbFH7jxLUx7GO2kBF1ZS8Qh6l+Y26MNlYJoWoMoU0zkSNLOpBNRQ57LAJs=
X-Received: by 2002:a19:e002:: with SMTP id x2mr11245081lfg.84.1628348526202; 
 Sat, 07 Aug 2021 08:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210806143641.3449707-1-fontaine.fabrice@gmail.com>
 <20210807095002.GY27036@scaer>
In-Reply-To: <20210807095002.GY27036@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 7 Aug 2021 17:01:54 +0200
Message-ID: <CAPi7W82H4T-zqU4Q5u8L0LVESd_NC7i9egDYhA0F3aw=rd4hCA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: add -latomic to
 libavformat.pc
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

WWFubiwKCkxlIHNhbS4gNyBhb8O7dCAyMDIxIMOgIDExOjUwLCBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+Cj4gRmFicmljZSwgQWxsLAo+Cj4gT24g
MjAyMS0wOC0wNiAxNjozNiArMDIwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4g
PiAtbGF0b21pYyB3YXMgYWRkZWQgdG8gZXh0cmFsaWJzIHRvIGZpeCBzdGF0aWMgYnVpbGQgb2Yg
ZmZtcGVnIGluIGNvbW1pdAo+ID4gZmM4Nzk4MTk3YjU3NDg4YTg1MmUyYzE0YjQ2NzdiNWViMDEx
NGEwYi4gSG93ZXZlciwgZXh0cmFsaWJzIGlzIG5vdAo+ID4gYWRkZWQgdG8gbGliYXZmb3JtYXQu
cGMgcmVzdWx0aW5nIGluIHRoZSBmb2xsb3dpbmcgc3RhdGljIGJ1aWxkIGZhaWx1cmUKPiA+IG9m
IG1vdGlvbjoKPiA+Cj4gPiAvaG9tZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTEvb3V0
cHV0LTEvaG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9iaW4vLi4vbGliL2djYy9hcm0tYnVpbGRyb290
LWxpbnV4LXVjbGliY2dudWVhYmkvOS4zLjAvLi4vLi4vLi4vLi4vYXJtLWJ1aWxkcm9vdC1saW51
eC11Y2xpYmNnbnVlYWJpL2Jpbi9sZDogL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5j
ZS0xL291dHB1dC0xL2hvc3QvYmluLy4uL2FybS1idWlsZHJvb3QtbGludXgtdWNsaWJjZ251ZWFi
aS9zeXNyb290L3Vzci9saWIvbGliYXZmb3JtYXQuYShmaWZvLm8pOiBpbiBmdW5jdGlvbiBgZmlm
b19pbml0JzoKPiA+IC9ob21lL2J1aWxkcm9vdC9hdXRvYnVpbGQvaW5zdGFuY2UtMS9vdXRwdXQt
MS9idWlsZC9mZm1wZWctNC40L2xpYmF2Zm9ybWF0L2ZpZm8uYzo1MTk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYF9fYXRvbWljX3N0b3JlXzgnCj4gPgo+ID4gU28gYWRkIGEgcGF0Y2ggdG8gYWRk
IGV4dHJhbGlicyAoYW5kIHNvIC1sYXRvbWljKSB0byBsaWJhdmZvcm1hdC5wYwo+ID4KPiA+IEZp
eGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNjJlYzYx
OGU0MDA4MWEyNTBiODEyOWVjNmY1YTE3OGViMDZmYmExZAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0tCj4g
PiAgLi4uLWFkZC1leHRyYWxpYnMtdG8tZXh0cmFsaWJzX2F2Zm9ybWF0LnBhdGNoIHwgMzAgKysr
KysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZmZtcGVnLzAwMDQtY29uZmlndXJlLWFkZC1l
eHRyYWxpYnMtdG8tZXh0cmFsaWJzX2F2Zm9ybWF0LnBhdGNoCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvZmZtcGVnLzAwMDQtY29uZmlndXJlLWFkZC1leHRyYWxpYnMtdG8tZXh0cmFsaWJz
X2F2Zm9ybWF0LnBhdGNoIGIvcGFja2FnZS9mZm1wZWcvMDAwNC1jb25maWd1cmUtYWRkLWV4dHJh
bGlicy10by1leHRyYWxpYnNfYXZmb3JtYXQucGF0Y2gKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi5mNGEyZjc1ZTU5Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiAr
KysgYi9wYWNrYWdlL2ZmbXBlZy8wMDA0LWNvbmZpZ3VyZS1hZGQtZXh0cmFsaWJzLXRvLWV4dHJh
bGlic19hdmZvcm1hdC5wYXRjaAo+ID4gQEAgLTAsMCArMSwzMCBAQAo+ID4gK0Zyb20gMmFlZTg5
ODI0MTI0NmQyOTNiZWQ5YjYwOTkyNmI0YTgwMTRkZmNiOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKPiA+ICtGcm9tOiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4KPiA+ICtEYXRlOiBGcmksIDYgQXVnIDIwMjEgMDk6MTc6MjAgKzAyMDAKPiA+ICtTdWJqZWN0
OiBbUEFUQ0hdIGNvbmZpZ3VyZTogYWRkIGV4dHJhbGlicyB0byBleHRyYWxpYnNfYXZmb3JtYXQK
PiA+ICsKPiA+ICtBZGQgZXh0cmFsaWJzIHRvIGV4dHJhbGlic19hdmZvcm1hdCB0byBhbGxvdyBh
cHBsaWNhdGlvbnMgc3VjaCBhcyBtb3Rpb24KPiA+ICt0byByZXRyaWV2ZSBmZm1wZWcgZGVwZW5k
ZW5jaWVzIHN1Y2ggYXMgLWxhdG9taWMgdGhyb3VnaCBwa2ctY29uZmlnCj4gPiArCj4gPiArU2ln
bmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+
Cj4gPiArW1Vwc3RyZWFtIHN0YXR1czogbm90IHVwc3RyZWFtYWJsZV0KPiA+ICstLS0KPiA+ICsg
Y29uZmlndXJlIHwgMiArLQo+ID4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiA+ICsKPiA+ICtkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJl
Cj4gPiAraW5kZXggMGJiM2E3Y2YyYi4uY2IzNjZjM2JhNiAxMDA3NTUKPiA+ICstLS0gYS9jb25m
aWd1cmUKPiA+ICsrKysgYi9jb25maWd1cmUKPiA+ICtAQCAtNzYwNCw3ICs3NjA0LDcgQEAgTElC
UFJFRj0ke0xJQlBSRUZ9Cj4gPiArIExJQlNVRj0ke0xJQlNVRn0KPiA+ICsgZXh0cmFsaWJzX2F2
dXRpbD0iJGF2dXRpbF9leHRyYWxpYnMiCj4gPiArIGV4dHJhbGlic19hdmNvZGVjPSIkYXZjb2Rl
Y19leHRyYWxpYnMiCj4gPiArLWV4dHJhbGlic19hdmZvcm1hdD0iJGF2Zm9ybWF0X2V4dHJhbGli
cyIKPiA+ICsrZXh0cmFsaWJzX2F2Zm9ybWF0PSIkYXZmb3JtYXRfZXh0cmFsaWJzICRleHRyYWxp
YnMiCj4gPiArIGV4dHJhbGlic19hdmRldmljZT0iJGF2ZGV2aWNlX2V4dHJhbGlicyIKPiA+ICsg
ZXh0cmFsaWJzX2F2ZmlsdGVyPSIkYXZmaWx0ZXJfZXh0cmFsaWJzIgo+ID4gKyBleHRyYWxpYnNf
YXZyZXNhbXBsZT0iJGF2cmVzYW1wbGVfZXh0cmFsaWJzIgo+Cj4gU2hvdWxkbid0IHdlIGFsc28g
YWRkICRleHRyYWxpYnMgdG8gYWxsLCBpbnN0ZWFkIG9mIGp1c3QgYXZmb3JtYXQ/CkkgZG9uJ3Qg
a25vdyBpZiBhbGwgZmZtcGVnIGxpYnJhcmllcyBkZXBlbmQgb24gbGliYXRvbWljIHNvIEkgb25s
eQp1cGRhdGVkIGF2Zm9ybWF0IGFzIGl0IGlzIGVub3VnaCB0byBmaXggdGhlIGJ1aWxkIGZhaWx1
cmUgYnV0IEkgY2FuCnVwZGF0ZSBhbGwgb2YgdGhlbSBpZiB5b3UgdGhpbmsgaXQncyBiZXR0ZXIu
Cj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+ICstLQo+ID4gKzIuMzAuMgo+ID4g
Kwo+ID4gLS0KPiA+IDIuMzAuMgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJv
b3RAYnVzeWJveC5uZXQKPiA+IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIg
fCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5
IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVy
ZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBc
IEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5
Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
