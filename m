Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7BCC44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 374AF40ABA;
	Fri, 17 Jul 2026 15:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nL5yueejgL_o; Fri, 17 Jul 2026 15:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F4540AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303232;
	bh=n1gq/aNo0Z5tQMHfks2hmUqmn5P1lLnkzxE3ZqGFgGk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F0zu9U8NXd/9wGvctPIF7bjljF1iuwo3eI2luOPMrQhArhuyb9HxetASABsbOuV30
	 VIX4n05JUiZn0slxKCrVV8BnzViZwF35D8wuvttibgGBfgd6BMFYnwtkWimaJ6CFKe
	 NDUu1sqZpMBZ/0CImIo4v8tCxIxLhdnXCoAkAVz6AvcWtILSc6vsHInihAvJTnXFc8
	 C4BFIlTC+JCDXLVIailgv86BhuZ4yYdNTVfRNPfd+caU9Y85rpHFKAogeW3Hupl9c/
	 rd6Be5+pb3IPUzIhxfupiRGgV7Ql+2HT/hOo1+HtM0NUCakgyEaLNJuQ1IB4Efmtf/
	 pqFWUeRlUEW6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35F4540AD6;
	Fri, 17 Jul 2026 15:47:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F9036E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62A0C40291
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id js_lwwBoNYdV for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D04540056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D04540056
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D04540056
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:09 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-493ce08a75bso32943035e9.1
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303227; x=1784908027;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wf6g2kgArUyB81n3vdFs0iTehlsqURAhgFTaM4XaVg4=;
 b=ChHVWgv3z+e8UbrFtkoZ9NF8qtIbFeoq2eVakZgNuI9an8wLetitU5i+/cwvGiHF+V
 o5EZ90zvHgQOdE6kGc7r/QQqUdGRo5Q7RlAYDTmoIRCwl5G6G7U54wmKe+Xdsflk2cVI
 BhphjAWvRPbMslWJWmLXmbM9tWxvqcRchhcj+mWmuBbix7XY5L/rz7IYPFisIzynW39d
 xBZpLXSf3enEkscrAnb4pev1jDs2HdNUwylOM5+o9YTLDGbGiaYVB8s8qBsDAAQrpj98
 Nr+79XJAEhL1YW2hPoWqjcj5JjGPnZaayPXjWev7m8dPkep7ZOk7j5Dr7I2278kFRaVd
 Le+A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp20JyQPaG+JtyKMsQ0GU8bC1Upgx7j37st5E4GLDE5X2yOkDqoIXv2JM0Snbcae+Qie9c0xfVpGT8=@buildroot.org
X-Gm-Message-State: AOJu0YwC2jqJNV6XageRD2WmJlBuHG5MdAwhwpQ84G4IlOsoK+A9mNnF
 jRVOTX7Vhzc2aXMplalU6/733QFmuMV3OKsri9FDYj9RB9JcomrIoD14IeNX7+nl7yQ=
X-Gm-Gg: AfdE7ckDe5yIXRF6PAyiRc8s6eZEIDoaIpIXP5c0k/DfrxNQ3T3B949qlCZCvtqClZ3
 kge86XYWo3T+N6mZi4+BzQbbWJyu0oL7ECifMwAMcv0164vx9Ekt5Xd9V3dz6mZr1c5Lytyf0Ml
 TwgVuB5R9oetevKCg75BPufgqH9jN3BS9Fuwt01C5g4B6UH/kYu/2aFBmZnpF3M2l1wc6CsUbG7
 8zfN7Y9S3TYkDq7puoXimTjXaHL6iPXLAwZDr/1xN9v2q2kBNZ+A6uSujT0LyDxIO/54y+SKErV
 V3SjPV4PFs0aTnFjqmWNAtFeIIqMz3sksOGJggzMue6w+Y8gwtB2oUWsuO8VeWt7DI5pv1dYsAR
 GCGcQ0pZHBUdGSVOG1VbcV2zNZCbYvQ5tPLqFj/Gqb/Dmcaq/jCCcYPtg/vSrmqJ9Kdnu8Ao=
X-Received: by 2002:a05:600c:548b:b0:495:4c62:9d2f with SMTP id
 5b1f17b1804b1-4954c629de4mr26433525e9.10.1784303227259; 
 Fri, 17 Jul 2026 08:47:07 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954aa1a231sm26791105e9.1.2026.07.17.08.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:06 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:05 +0200
Message-ID: <20260717154706.191313-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260704100700.2336075-1-bernd@kuhls.net>
References: <20260704100700.2336075-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303227; x=1784908027; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wf6g2kgArUyB81n3vdFs0iTehlsqURAhgFTaM4XaVg4=;
 b=VtVj8+28zgkIBlO0Sr24qbX5EWPcNiQoe0oKThME8pvJ5/g+rbVa7M1jGvuo9V5B5g
 L3Iz4abj3mJ81XbMqAXnANiI6vTmNDs1hnYlKzBh9+wRGXeU5bozDSzh08QF7lu21DKT
 4BDD51RG8Y9n37foAC70S9A7jEnq6V22TOAP96+xFQMZatreEofTlFvw7i/qYZ40mdIW
 jkdVCeevcHE3bM2coiiVqu7OfI9p11ffZ8gLDRPcJyfO9WR9skpCGYZ+3qRv06ezDGzN
 voddjkFoWtafdCVE1KPkYnIiLf6PccfhDKgfW2WxQsEM/DqOLIG+evAkfSMlyPcjJLzc
 Q95A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VtVj8+28
Subject: Re: [Buildroot] [PATCH 1/2] package/libnpupnp: needs gcc >= 7
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

SW4gcmVwbHkgb2Y6Cj4gQnVpbGRyb290IGNvbW1pdCAyNzc0NTAyMzQ0ZjM1YjU4N2VhOGYxYTJm
NDNlYzIzOThjM2ViZGFkIGJ1bXBlZCB0aGUKPiBwYWNrYWdlIGZyb20gNC4yLjIgdG8gNi4yLjMu
IFVwc3RyZWFtIGFkZGVkIHRoZSB1c2FnZSBvZgo+IHN0ZDo6c2NvcGVkX2xvY2sgaW4gdmVyc2lv
biA2LjIuMDoKPiBodHRwczovL2ZyYW1hZ2l0Lm9yZy9tZWRvYzkyL25wdXBucC8tL2NvbW1pdC9h
NzYwYjMyNzhhZWUwNjQwOGQ5ZjUwZDBjNTQ5NDJmNWJhOWRmOTg5Cj4gCj4gY2F1c2luZyBhIGJ1
aWxkIGVycm9yIGRldGVjdGVkIGJ5IHRoZSBHaXRsYWIgcGlwZWxpbmVzIGZvciB0aGUKPiBib290
bGluLWFhcmNoNjQtZ2xpYmMtb2xkIGRlZmNvbmZpZzoKPiAKPiAuLi9zcmMvaW5jL3VwbnBhcGku
aDoxMzI6MjI6IGVycm9yOgo+ICDigJhzY29wZWRfbG9ja+KAmSBpcyBub3QgYSBtZW1iZXIgb2Yg
4oCYc3Rk4oCZCj4gCj4gc2NvcGVkX2xvY2sgd2FzIGludHJvZHVjZWQgaW4gZ2NjIDcuMToKPiBo
dHRwczovL2djYy5nbnUub3JnL29ubGluZWRvY3MvbGlic3RkYysrL21hbnVhbC9zdGF0dXMuaHRt
bCNzdGF0dXMuaXNvLjIwMTcKPiAKPiBzbyB3ZSByYWlzZSB0aGUgbWluaW11bSByZXF1aXJlZCBn
Y2MgdmVyc2lvbiBhY2NvcmRpbmdseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8
YmVybmRAa3VobHMubmV0PgoKQXBwbGllZCB0byAyMDI2LjA1LnguIFRoYW5rcwoKPiAtLS0KPiBT
ZXJpZXMgcGFzc2VkIEdpdGxhYiBwaXBlbGluZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2JrdWhs
cy9idWlsZHJvb3QvLS9jb21taXRzL2M4ZjUwMzJlMzQzYmMxM2JlYWYwOTgwMjdiNzQ4NTc1ZmVj
ZWM1NmMKPiAKPiAgcGFja2FnZS9saWJucHVwbnAvQ29uZmlnLmluIHwgNiArKystLS0KPiAgcGFj
a2FnZS9saWJ1cG5wcC9Db25maWcuaW4gIHwgNiArKystLS0KPiAgcGFja2FnZS91cG1wZGNsaS9D
b25maWcuaW4gIHwgNiArKystLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibnB1cG5wL0NvbmZp
Zy5pbiBiL3BhY2thZ2UvbGlibnB1cG5wL0NvbmZpZy5pbgo+IGluZGV4IGNlYTViZDVjMDYuLjg0
NmJmZTUyMTcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJucHVwbnAvQ29uZmlnLmluCj4gKysr
IGIvcGFja2FnZS9saWJucHVwbnAvQ29uZmlnLmluCj4gQEAgLTIsNyArMiw3IEBAIGNvbmZpZyBC
UjJfUEFDS0FHRV9MSUJOUFVQTlAKPiAgCWJvb2wgImxpYm5wdXBucCIKPiAgCWRlcGVuZHMgb24g
QlIyX0lOU1RBTExfTElCU1REQ1BQCj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RI
UkVBRFMKPiAtCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85ICMgQysr
MTEKPiArCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyAjIEMrKzE3Cj4g
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfRVhQQVQKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJDVVJM
Cj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCTUlDUk9IVFRQRAo+IEBAIC0xMyw2ICsxMyw2IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJOUFVQTlAKPiAgCj4gIAkgIGh0dHBzOi8vd3d3Lmxlc2Jv
bnNjb21wdGVzLmNvbS91cG1wZGNsaS9saWJucHVwbnAuaHRtbAo+ICAKPiAtY29tbWVudCAibGli
bnB1cG5wIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgdGhyZWFkcywgZ2NjID49IDQuOSIKPiAr
Y29tbWVudCAibGlibnB1cG5wIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgdGhyZWFkcywgZ2Nj
ID49IDciCj4gIAlkZXBlbmRzIG9uICFCUjJfSU5TVEFMTF9MSUJTVERDUFAgfHwgIUJSMl9UT09M
Q0hBSU5fSEFTX1RIUkVBRFMgfHwgXAo+IC0JCSFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80
XzkKPiArCQkhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNwo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2xpYnVwbnBwL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGlidXBucHAvQ29uZmlnLmluCj4gaW5k
ZXggNDFhZmE5MzAwZi4uNjM0NTI3NjIyZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnVwbnBw
L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbGlidXBucHAvQ29uZmlnLmluCj4gQEAgLTIsNyAr
Miw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJVUE5QUAo+ICAJYm9vbCAibGlidXBucHAiCj4g
IAlkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUAo+ICAJZGVwZW5kcyBvbiBCUjJfVE9P
TENIQUlOX0hBU19USFJFQURTICMgbGlibnB1cG5wCj4gLQlkZXBlbmRzIG9uIEJSMl9UT09MQ0hB
SU5fR0NDX0FUX0xFQVNUXzRfOQo+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9M
RUFTVF83ICMgbGlibnB1cG5wCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfRVhQQVQKPiAgCXNlbGVj
dCBCUjJfUEFDS0FHRV9MSUJDVVJMCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCTlBVUE5QCj4g
QEAgLTEyLDUgKzEyLDUgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJQlVQTlBQCj4gIAo+ICAJICBo
dHRwOi8vd3d3Lmxlc2JvbnNjb21wdGVzLmNvbS91cG1wZGNsaS8KPiAgCj4gLWNvbW1lbnQgImxp
YnVwbnBwIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgdGhyZWFkcywgZ2NjID49IDQuOSIKPiAt
CWRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCAhQlIyX1RPT0xDSEFJTl9IQVNf
VEhSRUFEUyB8fCAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85Cj4gK2NvbW1lbnQgImxp
YnVwbnBwIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgdGhyZWFkcywgZ2NjID49IDciCj4gKwlk
ZXBlbmRzIG9uICFCUjJfSU5TVEFMTF9MSUJTVERDUFAgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RI
UkVBRFMgfHwgIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS91cG1wZGNsaS9Db25maWcuaW4gYi9wYWNrYWdlL3VwbXBkY2xpL0NvbmZpZy5pbgo+IGlu
ZGV4IDc0ZWI3Njg4MzAuLjU2MmQyN2RiMzcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS91cG1wZGNs
aS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3VwbXBkY2xpL0NvbmZpZy5pbgo+IEBAIC0zLDcg
KzMsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfVVBNUERDTEkKPiAgCWRlcGVuZHMgb24gQlIyX1VT
RV9NTVUgIyBmb3JrKCkKPiAgCWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQCj4gIAlk
ZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFNfTlBUTAo+IC0JZGVwZW5kcyBvbiBC
UjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkgIyBDKysxMSwgbGlidXBucHAKPiArCWRlcGVu
ZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyAjIGxpYm5wdXBucCAtPiBsaWJ1cG5w
cAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0pTT05DUFAKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9M
SUJNSUNST0hUVFBECj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCTVBEQ0xJRU5UCj4gQEAgLTE1
LDggKzE1LDggQEAgY29uZmlnIEJSMl9QQUNLQUdFX1VQTVBEQ0xJCj4gIAo+ICAJICBodHRwOi8v
d3d3Lmxlc2JvbnNjb21wdGVzLmNvbS91cG1wZGNsaS8KPiAgCj4gLWNvbW1lbnQgInVwbXBkY2xp
IG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgTlBUTCwgZ2NjID49IDQuOSIKPiArY29tbWVudCAi
dXBtcGRjbGkgbmVlZHMgYSB0b29sY2hhaW4gdy8gQysrLCBOUFRMLCBnY2MgPj0gNyIKPiAgCWRl
cGVuZHMgb24gQlIyX1VTRV9NTVUKPiAgCWRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQ
UCB8fCBcCj4gIAkJIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFNfTlBUTCB8fCBcCj4gLQkJIUJS
Ml9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOQo+ICsJCSFCUjJfVE9PTENIQUlOX0dDQ19BVF9M
RUFTVF83Cj4gLS0gCj4gMi40Ny4zCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
