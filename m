Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40FCCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 17:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D4A04148F;
	Sun, 15 Oct 2023 17:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D4A04148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id weFzZCXgI55E; Sun, 15 Oct 2023 17:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342D741528;
	Sun, 15 Oct 2023 17:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 342D741528
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EADDB1BF5DD
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 17:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D13044148F
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 17:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D13044148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FmuT7bmN7b73 for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 17:12:50 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C62C3413D3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 17:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C62C3413D3
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53d82bea507so6457768a12.2
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 10:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697389968; x=1697994768;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JreZZOS2uKHr9D3QXAkLgSTAimcf0CVZiGJVeGCWXEk=;
 b=gXJmlC3HoQTBJgYUPB4pPHyT8+H4WsldfqZbg04d6HJQs1uJQKBsG/3JJMrXm+0ATl
 W5RlbYFrg2LUuaWBohRspV9xKsu9an9gGOB2vlwoYOaYhhWxRkeDQTx2T+TpkH3D0g5J
 DYvNiHM3wx8IB36+8zkHo/oUrWHdEkUKMyqK4th1AvKmKZCPHNrakqRHmIcnLTO8ThMI
 zBEZXoo4KIfBkxhTkBeC/MUqnHNf3ReEKHsxKsIkR08J3988MJc2gjlb+xQSKxpd3Mjg
 huKxxfY6xMfOjbf7rd8EG5Vrq73sq6MeN9GQiT4ukcwYjW9BnWQDrUCI2cYPkw8DTrmF
 k0Aw==
X-Gm-Message-State: AOJu0YzuTg0tfzfaUH6usk5X6KWVI++7yF7sFDG7pGwJ/UPXRrwhoika
 j2382nylxNvmEbsjV3HtdqI+xTR2Ma2x3kE1EjQ=
X-Google-Smtp-Source: AGHT+IEn0/Svhlg5+YECcHIYEFPZz4/UjkDYjSkhd/r+yhAPkKfjXZkFKEA2gvueoqOBaOUV/rQat4bFlYdlSVx1UnE=
X-Received: by 2002:a17:906:9c9:b0:9b2:ccd8:2d42 with SMTP id
 r9-20020a17090609c900b009b2ccd82d42mr25356302eje.32.1697389967481; Sun, 15
 Oct 2023 10:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221227154300.10556-1-brandon.maier@collins.com>
In-Reply-To: <20221227154300.10556-1-brandon.maier@collins.com>
From: Charles Hardin <ckhardin@gmail.com>
Date: Sun, 15 Oct 2023 10:12:36 -0700
Message-ID: <CAN=fXj3A9VF+7B_i4emt-p=1vUo2Dq2bsRb_QuGp-j0oQ1JmWQ@mail.gmail.com>
To: Brandon Maier <brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697389968; x=1697994768; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JreZZOS2uKHr9D3QXAkLgSTAimcf0CVZiGJVeGCWXEk=;
 b=mpqRdU4S7tQNPfsw+GQ4mnY9JZqUwFC1iNCpHfJBInsY03ZNFydeE2mdC0WzRuVtau
 RgU46igOJVYBkDdoaUmAJUIiyZCrh4XB2NYjQjjyq18w+XJ2Sl698fkGoVdMNdcM2+s5
 tHlzlbj8q2R6VExpti8QKSWGovUSuTxEMGA9iSshWmNHHOzJc2X+epGzgWQ5zwbt8UHB
 jWXoTKSC4he90hW6UEOqFm38sx4j+i4SA5yt+XkVZEBgIC5XCLVd12EUGa20nz8etxzq
 XKBx9C+Ui2yQruGxiaIPNypDTV2u4x2CreevO3tEkDr8ki+dI1+9UPKkOzFboJKgBkap
 LN2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mpqRdU4S
Subject: Re: [Buildroot] [PATCH v2 1/1] Makefile: fix SDK relocation for
 per-package-dirs
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

T24gVHVlLCBEZWMgMjcsIDIwMjIgYXQgNzo0M+KAr0FNIEJyYW5kb24gTWFpZXIgdmlhIGJ1aWxk
cm9vdAo8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4gVGhlIHJlbG9jYXRlLXNk
ay5zaCBzY3JpcHQgZG9lcyBub3Qgd29yayBjb3JyZWN0bHkgd2hlbgo+IEJSMl9QRVJfUEFDS0FH
RV9ESVJFQ1RPUklFUyBpcyBlbmFibGVkLiByZWxvY2F0ZS1zZGsuc2ggZXhwZWN0cwo+IGV2ZXJ5
dGhpbmcgdG8gcG9pbnQgYXQgJEhPU1RfRElSLCBidXQgZWFjaCBwYWNrYWdlIHdpbGwgYmUgcG9p
bnRpbmcgYXQKPiBpdHMgJChPKS9wZXItcGFja2FnZS8qL2hvc3QuCj4KPiBVc2UgdGhlIHNhbWUg
Y29tbWFuZCBmb3Igc2NydWJpbmcgaG9zdCBwYXRocyBkdXJpbmcgdGhlIGJ1aWxkLCB0byBzY3J1
Ygo+IHRvIHRoZSBmaW5hbCBob3N0IGRpcmVjdG9yeSBsb2NhdGlvbi4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEJyYW5kb24gTWFpZXIgPGJyYW5kb24ubWFpZXJAY29sbGlucy5jb20+CkFja2VkLWJ5OiBD
aGFybGVzIEhhcmRpbiA8Y2toYXJkaW5AZ21haWwuY29tPgoKVGVzdGVkIGFuZCB2ZXJpZmllZCB0
aGUgaG9zdCBwYXRocyBpbiB0aGUgc2hhc3VtIGFzIGFuIGV4YW1wbGUKCj4gLS0tCj4gdjI6Cj4g
LSBkcm9wIG9yaWdpbmFsIGltcGxlbWVudGF0aW9uIGluIGZhdm9yIG9mIHJldXNpbmcgdGhlIGV4
aXN0aW5nCj4gICBQUERfRklYVVBfUEFUSFMgY29kZS4KPiAtLS0KPiAgTWFrZWZpbGUgICAgICAg
ICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9wa2ctZ2VuZXJpYy5tayB8IDEyICstLS0tLS0tLS0t
LQo+ICBwYWNrYWdlL3BrZy11dGlscy5tayAgIHwgMTUgKysrKysrKysrKysrKysrCj4gIDMgZmls
ZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+IGluZGV4IDg4ZjkwY2QyZmEuLmFjMzU0MGIzNmMg
MTAwNjQ0Cj4gLS0tIGEvTWFrZWZpbGUKPiArKysgYi9NYWtlZmlsZQo+IEBAIC01OTgsNiArNTk4
LDcgQEAgcHJlcGFyZS1zZGs6IHdvcmxkCj4gICAgICAgICBAJChjYWxsIE1FU1NBR0UsIlJlbmRl
cmluZyB0aGUgU0RLIHJlbG9jYXRhYmxlIikKPiAgICAgICAgIFBFUl9QQUNLQUdFX0RJUj0kKFBF
Ul9QQUNLQUdFX0RJUikgJChUT1BESVIpL3N1cHBvcnQvc2NyaXB0cy9maXgtcnBhdGggaG9zdAo+
ICAgICAgICAgUEVSX1BBQ0tBR0VfRElSPSQoUEVSX1BBQ0tBR0VfRElSKSAkKFRPUERJUikvc3Vw
cG9ydC9zY3JpcHRzL2ZpeC1ycGF0aCBzdGFnaW5nCj4gKyAgICAgICAkKGNhbGwgcHBkLWZpeHVw
LXBhdGhzLCQoQkFTRV9ESVIpKQo+ICAgICAgICAgJChJTlNUQUxMKSAtbSA3NTUgJChUT1BESVIp
L3N1cHBvcnQvbWlzYy9yZWxvY2F0ZS1zZGsuc2ggJChIT1NUX0RJUikvcmVsb2NhdGUtc2RrLnNo
Cj4gICAgICAgICBta2RpciAtcCAkKEhPU1RfRElSKS9zaGFyZS9idWlsZHJvb3QKPiAgICAgICAg
IGVjaG8gJChIT1NUX0RJUikgPiAkKEhPU1RfRElSKS9zaGFyZS9idWlsZHJvb3Qvc2RrLWxvY2F0
aW9uCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsgYi9wYWNrYWdlL3BrZy1n
ZW5lcmljLm1rCj4gaW5kZXggZjI0ZTAzYTMyNS4uMjEwYWYxYmJlZiAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL3BrZy1nZW5lcmljLm1rCj4gKysrIGIvcGFja2FnZS9wa2ctZ2VuZXJpYy5tawo+IEBA
IC05MiwxOCArOTIsOCBAQCBlbmRpZgo+Cj4gIGlmZXEgKCQoQlIyX1BFUl9QQUNLQUdFX0RJUkVD
VE9SSUVTKSx5KQo+Cj4gLSMgRW5zdXJlIGZpbGVzIGxpa2UgLmxhLCAucGMsIC5wcmksIC5jbWFr
ZSwgYW5kIHNvIG9uLCBwb2ludCB0byB0aGUKPiAtIyBwcm9wZXIgc3RhZ2luZyBhbmQgaG9zdCBk
aXJlY3RvcmllcyBmb3IgdGhlIGN1cnJlbnQgcGFja2FnZTogZmluZAo+IC0jIGFsbCB0ZXh0IGZp
bGVzIHRoYXQgY29udGFpbiB0aGUgUFBEIHJvb3QsIGFuZCByZXBsYWNlIGl0IHdpdGggdGhlCj4g
LSMgY3VycmVudCBwYWNrYWdlJ3MgUFBELgo+ICBkZWZpbmUgUFBEX0ZJWFVQX1BBVEhTCj4gLSAg
ICAgICAkKFEpZ3JlcCAtLWJpbmFyeS1maWxlcz13aXRob3V0LW1hdGNoIC1sclogJyQoUEVSX1BB
Q0tBR0VfRElSKS9bXi9dXCsvJyAkKEhPU1RfRElSKSBcCj4gLSAgICAgICB8d2hpbGUgcmVhZCAt
ZCAnJyBmOyBkbyBcCj4gLSAgICAgICAgICAgICAgIGZpbGUgLWIgLS1taW1lLXR5cGUgIiQke2Z9
IiB8IGdyZXAgLXEgJ150ZXh0LycgfHwgY29udGludWU7IFwKPiAtICAgICAgICAgICAgICAgcHJp
bnRmICclc1wwJyAiJCR7Zn0iOyBcCj4gLSAgICAgICBkb25lIFwKPiAtICAgICAgIHx4YXJncyAt
MCAtLW5vLXJ1bi1pZi1lbXB0eSBcCj4gLSAgICAgICAgICAgICAgICQoU0VEKSAnczokKFBFUl9Q
QUNLQUdFX0RJUikvW14vXVwrLzokKFBFUl9QQUNLQUdFX0RJUikvJCgkKFBLRylfTkFNRSkvOmcn
Cj4gKyAgICAgICAkKGNhbGwgcHBkLWZpeHVwLXBhdGhzLCQoUEVSX1BBQ0tBR0VfRElSKS8kKCQo
UEtHKV9OQU1FKSkKPiAgZW5kZWYKPgo+ICAjIFJlbW92ZSBweXRob24ncyBwcmUtY29tcGlsZWQg
InN5c2NvbmZpZ2RhdGEiLCBhcyBpdCBtYXkgY29udGFpbiBwYXRocyB0bwo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3BrZy11dGlscy5tayBiL3BhY2thZ2UvcGtnLXV0aWxzLm1rCj4gaW5kZXggMDk0
NWU2ZWQzMS4uZjIyNTYyZmJlZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BrZy11dGlscy5tawo+
ICsrKyBiL3BhY2thZ2UvcGtnLXV0aWxzLm1rCj4gQEAgLTIzMyw2ICsyMzMsMjEgQEAgZGVmaW5l
IHByZXBhcmUtcGVyLXBhY2thZ2UtZGlyZWN0b3J5Cj4gICAgICAgICAkKGNhbGwgcGVyLXBhY2th
Z2UtcnN5bmMsJCgxKSxob3N0LCQoSE9TVF9ESVIpKQo+ICAgICAgICAgJChjYWxsIHBlci1wYWNr
YWdlLXJzeW5jLCQoMSksdGFyZ2V0LCQoVEFSR0VUX0RJUikpCj4gIGVuZGVmCj4gKwo+ICsjIEVu
c3VyZSBmaWxlcyBsaWtlIC5sYSwgLnBjLCAucHJpLCAuY21ha2UsIGFuZCBzbyBvbiwgcG9pbnQg
dG8gdGhlCj4gKyMgcHJvcGVyIHN0YWdpbmcgYW5kIGhvc3QgZGlyZWN0b3JpZXMgZm9yIHRoZSBj
dXJyZW50IHBhY2thZ2U6IGZpbmQKPiArIyBhbGwgdGV4dCBmaWxlcyB0aGF0IGNvbnRhaW4gdGhl
IFBQRCByb290LCBhbmQgcmVwbGFjZSBpdCB3aXRoIHRoZQo+ICsjIGN1cnJlbnQgcGFja2FnZSdz
IFBQRC4KPiArIyAkMTogZGVzdGluYXRpb24gcm9vdCBkaXJlY3RvcnkgY29udGFpbmluZyBob3N0
IGFuZCBzdGFnaW5nCj4gK2RlZmluZSBwcGQtZml4dXAtcGF0aHMKPiArICAgICAgICQoUSlncmVw
IC0tYmluYXJ5LWZpbGVzPXdpdGhvdXQtbWF0Y2ggLWxyWiAnJChQRVJfUEFDS0FHRV9ESVIpL1te
L11cKy8nICQoSE9TVF9ESVIpIFwKPiArICAgICAgIHx3aGlsZSByZWFkIC1kICcnIGY7IGRvIFwK
PiArICAgICAgICAgICAgICAgZmlsZSAtYiAtLW1pbWUtdHlwZSAiJCR7Zn0iIHwgZ3JlcCAtcSAn
XnRleHQvJyB8fCBjb250aW51ZTsgXAo+ICsgICAgICAgICAgICAgICBwcmludGYgJyVzXDAnICIk
JHtmfSI7IFwKPiArICAgICAgIGRvbmUgXAo+ICsgICAgICAgfHhhcmdzIC0wIC0tbm8tcnVuLWlm
LWVtcHR5IFwKPiArICAgICAgICAgICAgICAgJChTRUQpICdzOiQoUEVSX1BBQ0tBR0VfRElSKS9b
Xi9dXCsvOiQoMSkvOmcnCj4gK2VuZGVmCj4gIGVuZGlmCj4KPiAgIwo+IC0tCj4gMi4zOS4wCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
