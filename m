Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C909CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 23:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49BEF411D1;
	Tue,  2 Sep 2025 23:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pNZq3Z0JeFB; Tue,  2 Sep 2025 23:01:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 443E74104A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 443E74104A;
	Tue,  2 Sep 2025 23:01:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E034510E
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 23:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB84A6125C
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 23:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyoAFBYyK0i9 for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 23:01:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FD1461232
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FD1461232
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FD1461232
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 23:01:47 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-71d605a70bdso38769517b3.3
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 16:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756854106; x=1757458906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mxlNIsHHJtZ98I1OvnasTC6rRg1LviXRZbTnvo6TJIc=;
 b=l9oICR/ez4JL0e7JnJ8VjpvcERb+WqevoUd78zxS+P5ZWmrqQwlqjCOBfWihAvl2pc
 8XpZ6z4fW0Bq1a9qvqXtpcmxCTHobLWnm5g0ieO6lSbTY3BjUTyJ3IfcSs9VIaokXZHu
 5XyYdfJ4Y8CtKCagi2wvcTMuwo9k53jHj/Ev4tudLR4oJpbA0LeTKRHwHHkdRKGWhbVm
 tXE12C0ywcMCYWfCk/uKHsviVhNB/3xHHplBJOUczRIs0X1VWxT5zptRysqGnybbd+Hx
 AKBUOJVaTku+TmC0U5yNLQeAohjW68ZHSndn+MlaZorJ9N1NX0glVUHwQoTJkyWwRcXb
 yTXA==
X-Gm-Message-State: AOJu0Yw1ijI2P6lyVzHISNymXKV/XApo6QQaczPf9ghzGjTh+NsAixv0
 ZBYCztxaA8EXQB7WQPo6peABX/W2Hip1fQ+dQw3+IaAu3cGfZYw/bF8NjLZSUq1iiAoJ1zI4rXh
 PVAKo1k7MEy0nhx1YIv7L6e4EEDNbgJXCkg==
X-Gm-Gg: ASbGncsMoDOL7mPJdnSDYRasvbcm0wrIQ3dYKmEp4BUb446TsZAm/blqicCvGaatu7C
 OYzJZmgk4qid03Y+g30Dv4YBmYMcrkXNGtEV4WfIce4Vztwql9b6WAhwtwjK5yUvl0XZtBf1F36
 /vO6C4l/JGLrbgy0vuFDfH37mpiVPsSYYgiO0Zz6yXkt/Tt2snsP6FPQJ3OxyGKxnWhtEWxMtFf
 TllVKW6kgrN6moldw==
X-Google-Smtp-Source: AGHT+IG6zGl9aLiIyu02fARiCNMfTYp+L0RIL9uq/sTqkG6HH4+0X1DvhlMAk+dyyhjmBVbHK+gGjnxMw/6Q0YpLrK0=
X-Received: by 2002:a05:690c:6703:b0:71f:ff0c:c970 with SMTP id
 00721157ae682-722764174d8mr150103037b3.24.1756854106017; Tue, 02 Sep 2025
 16:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250831123953.391803-1-clg@kaod.org>
 <20250831123953.391803-2-clg@kaod.org>
In-Reply-To: <20250831123953.391803-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Sep 2025 08:31:34 +0930
X-Gm-Features: Ac12FXwkdgCwk6fNJwTHJzTLJHpI1ToubOtj4TNzG-ZgFNzkswg0n9JjyTn-YXg
Message-ID: <CACPK8XdQnx822DzoWLGrE6PyfcL=e=ZP4kAaAgOE40+Zazpctg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1756854106; x=1757458906; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxlNIsHHJtZ98I1OvnasTC6rRg1LviXRZbTnvo6TJIc=;
 b=ES7cnGiijNuqrfxDsx3Yf9m6/70WnLV3XSNHLehO8ge1CVBA7lLLIgfb6+JP77w1Id
 p9ZuIhTJSkifYtpBNzknXSE186phdULWhKhCvJMjDJKYH+V7UIyyOJqX59orqYJk3Dgw
 KsdlRK+Ofs6kfY6PHrlLgfuxZDv0wRV+3S0qc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jms.id.au
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ES7cnGii
Subject: Re: [Buildroot] [PATCH 1/4] configs/aspeed-*: bump Linux to 6.16.4
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

T24gU3VuLCAzMSBBdWcgMjAyNSBhdCAyMjoxMSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4gd3JvdGU6Cj4KPiBTaW5jZSBMaW51eCA2LjUgbW92ZWQgLmR0cyBmaWxlcyB0byB2ZW5k
b3Igc3ViLWRpcmVjdG9yaWVzLCBhZGp1c3QgdGhlCj4gcG9zdC1pbWFnZS5zaCBzY3JpcHQgdG8g
dGFrZSBpbnRvIGFjY291bnQgdGhlICdhc3BlZWQvJyBwcmVmaXggaW4gLmR0cwo+IGZpbGUgbmFt
ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgoK
SXMgaXQgY3VzdG9tYXJ5IHRvIHVzZSBhIHNwZWNpZmljIHZlcnNpb24/IElmIG5vdCwgbGVhdmlu
ZyB0aGVzZQpib2FyZHMgdG8gdXNlIHRoZSBkZWZhdWx0cyB3b3VsZCBtYWtlIHNlbnNlIGFuZCBz
YXZlIGhhdmluZyB0byB1cGRhdGUKdGhlbSBpbiB0aGUgZnV0dXJlLgoKUmV2aWV3ZWQtYnk6IEpv
ZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Cgo+IC0tLQo+ICBib2FyZC9hc3BlZWQvY29tbW9u
L3Bvc3QtaW1hZ2Uuc2ggICB8IDQgKystLQo+ICBjb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2Rl
ZmNvbmZpZyB8IDYgKysrLS0tCj4gIGNvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmln
IHwgNiArKystLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYm9hcmQvYXNwZWVkL2NvbW1vbi9wb3N0LWltYWdlLnNo
IGIvYm9hcmQvYXNwZWVkL2NvbW1vbi9wb3N0LWltYWdlLnNoCj4gaW5kZXggZWE2NWE0OWFmZmYw
Li44Yzk1M2UwMzhjOWYgMTAwNzU1Cj4gLS0tIGEvYm9hcmQvYXNwZWVkL2NvbW1vbi9wb3N0LWlt
YWdlLnNoCj4gKysrIGIvYm9hcmQvYXNwZWVkL2NvbW1vbi9wb3N0LWltYWdlLnNoCj4gQEAgLTMs
OCArMyw4IEBACj4gIEJPQVJEX0RJUj0iJChkaXJuYW1lICQwKSIKPiAgbWtpbWFnZT0kSE9TVF9E
SVIvYmluL21raW1hZ2UKPgo+IC1CT0FSRF9EVD0kKHNlZCAtbiBcCj4gLSAgICAgICAgICAgJ3Mv
XkJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJcKFthLXowLTlcLV0qXCkuKiIkL1wx
L3AnIFwKPiArQk9BUkRfRFQ9JChzZWQgLW5yIFwKPiArICAgICAgICAgICAtZSAnc3xeQlIyX0xJ
TlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9Iihhc3BlZWQvKT8oW2EtejAtOVwtXSopLioiJHxc
MnxwJyBcCj4gICAgICAgICAgICAgJHtCUjJfQ09ORklHfSkKPgo+ICBzZWQgLWUgInMvJUJPQVJE
X0RUQiUvJHtCT0FSRF9EVH0uZHRiLyIgXAo+IGRpZmYgLS1naXQgYS9jb25maWdzL2FzcGVlZF9h
c3QyNTAwZXZiX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmln
Cj4gaW5kZXggMjMxMjI0MmU2NDA2Li5mZmMwZWM4ZDUyYjUgMTAwNjQ0Cj4gLS0tIGEvY29uZmln
cy9hc3BlZWRfYXN0MjUwMGV2Yl9kZWZjb25maWcKPiArKysgYi9jb25maWdzL2FzcGVlZF9hc3Qy
NTAwZXZiX2RlZmNvbmZpZwo+IEBAIC0xLDE3ICsxLDE3IEBACj4gIEJSMl9hcm09eQo+IC1CUjJf
UEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTc9eQo+ICtCUjJfUEFDS0FHRV9I
T1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMTY9eQo+ICBCUjJfVEFSR0VUX0dFTkVSSUNfSE9T
VE5BTUU9ImFzcGVlZC1ldmIiCj4gIEJSMl9UQVJHRVRfR0VORVJJQ19JU1NVRT0iQXNwZWVkIEVW
QiIKPiAgQlIyX1NZU1RFTV9ESENQPSJldGgwIgo+ICBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NS
SVBUPSJib2FyZC9hc3BlZWQvY29tbW9uL3Bvc3QtaW1hZ2Uuc2giCj4gIEJSMl9MSU5VWF9LRVJO
RUw9eQo+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAtQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xNy43Igo+ICtCUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjE2LjQiCj4gIEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklH
PSJhc3BlZWRfZzUiCj4gIEJSMl9MSU5VWF9LRVJORUxfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJi
b2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvbGludXguZnJhZ21lbnQiCj4gIEJSMl9MSU5VWF9LRVJO
RUxfWFo9eQo+ICBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPiAtQlIyX0xJTlVYX0tF
Uk5FTF9JTlRSRUVfRFRTX05BTUU9ImFzcGVlZC1hc3QyNTAwLWV2YiIKPiArQlIyX0xJTlVYX0tF
Uk5FTF9JTlRSRUVfRFRTX05BTUU9ImFzcGVlZC9hc3BlZWQtYXN0MjUwMC1ldmIiCj4gIEJSMl9Q
QUNLQUdFX01URD15Cj4gIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQo+ICBCUjJfVEFSR0VUX1JP
T1RGU19DUElPX1haPXkKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9hc3BlZWRfYXN0MjYwMGV2Yl9k
ZWZjb25maWcgYi9jb25maWdzL2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNvbmZpZwo+IGluZGV4IDEw
NGY2ODUyMDBlZi4uNGU0OWM0YWNiZWFiIDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3MvYXNwZWVkX2Fz
dDI2MDBldmJfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy9hc3BlZWRfYXN0MjYwMGV2Yl9kZWZj
b25maWcKPiBAQCAtMSwxNiArMSwxNiBAQAo+ICBCUjJfYXJtPXkKPiAgQlIyX2NvcnRleF9hNz15
Cj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xNz15Cj4gK0JSMl9Q
QUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xNj15Cj4gIEJSMl9UQVJHRVRfR0VO
RVJJQ19IT1NUTkFNRT0iYXNwZWVkLWV2YiIKPiAgQlIyX1RBUkdFVF9HRU5FUklDX0lTU1VFPSJB
c3BlZWQgRVZCIgo+ICBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCj4gIEJSMl9ST09URlNfUE9TVF9J
TUFHRV9TQ1JJUFQ9ImJvYXJkL2FzcGVlZC9jb21tb24vcG9zdC1pbWFnZS5zaCIKPiAgQlIyX0xJ
TlVYX0tFUk5FTD15Cj4gIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+IC1CUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE3LjciCj4gK0JSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMTYuNCIKPiAgQlIyX0xJTlVYX0tFUk5FTF9E
RUZDT05GSUc9ImFzcGVlZF9nNSIKPiAgQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4g
LUJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJhc3BlZWQtYXN0MjYwMC1ldmIiCj4g
K0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJhc3BlZWQvYXNwZWVkLWFzdDI2MDAt
ZXZiIgo+ICBCUjJfUEFDS0FHRV9NVEQ9eQo+ICBCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkKPiAg
QlIyX1RBUkdFVF9ST09URlNfQ1BJT19YWj15Cj4gLS0KPiAyLjUxLjAKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
