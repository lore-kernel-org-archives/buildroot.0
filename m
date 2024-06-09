Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFE5C27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 11:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A300F60743;
	Sun,  9 Jun 2024 11:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8MakHtsL86R; Sun,  9 Jun 2024 11:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F4276067C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F4276067C;
	Sun,  9 Jun 2024 11:53:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C87141BF40B
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 11:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B50568222C
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 11:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1MCTk78Q15I for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 11:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9247182238
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9247182238
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9247182238
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 11:53:06 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe6392eso4843240a12.0
 for <buildroot@buildroot.org>; Sun, 09 Jun 2024 04:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717933984; x=1718538784;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=foADZpV11eS8mQcLVpECUvGnsZLPn1MablR8jvLqSX4=;
 b=EQjMJR82MHEzBNJmWWy9IiXie75K/8ULGJf/EHnYrpZ0AcpjnmhhTIvFBH+Ylxcjec
 h1osIdjjhD+QTGpAs5hEuCUU2SIU3MnD1+oAK8/jbxKM1tHqOuFn1O0KmG2p2OGkfRhc
 Wc6ajKst6/Ea3j9B4mZhp6WfqMBzB5hz8tMZNgXYYYAIgJCrmqj/wS+mlCS1QHu9OzW7
 ORc/Gg08CAhDvr2MJOdKTQ4O5NYioYuYq14aJ/8CFLi4qBu9g80w7pI++lTXiCJgbYxg
 88FeQ3o41UnY4K44tyY2RtDXOwUyZ8OErr4fOaoQWggCswoteuH8M0acGIDmSpMQvBPn
 O1nA==
X-Gm-Message-State: AOJu0Yw2X0fciuTiBQbJ9Bcv1rqMkQoZctyEdQg/fki6aP7aIJR8O8yk
 bUSsn/3TgNKj7g49h3T4zHyXVrUap0lhW7l3YWHpB+o6ikiY+xPcUkRNNUsq8dXVThqW6IRRtTC
 +cCtuJIF8SdyRWqT+Qvbf7Dw8OD4=
X-Google-Smtp-Source: AGHT+IHnUQDjZuFVIGXwkyByAGFZcd5vbR5q4uDEMWJK9s6jtBivpwM6YmteQdpdVrLxNDekpkxwiuvo1GRb9MY5+Ns=
X-Received: by 2002:a50:d5db:0:b0:57c:6bd6:d8db with SMTP id
 4fb4d7f45d1cf-57c6bd6de29mr2018567a12.42.1717933984377; Sun, 09 Jun 2024
 04:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240609032509.8939-1-vfazio@gmail.com> <ZmVB4bzpE22opuyS@landeda>
In-Reply-To: <ZmVB4bzpE22opuyS@landeda>
From: Vincent Fazio <vfazio@gmail.com>
Date: Sun, 9 Jun 2024 06:52:53 -0500
Message-ID: <CAOrEah6wQHbimijZnYG=vKx-nf0t21q3TJWyRJtz=Z7U_ROWCQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717933984; x=1718538784; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=foADZpV11eS8mQcLVpECUvGnsZLPn1MablR8jvLqSX4=;
 b=Rx0yxWNT/8eUdmvv3raeCwCzbPwPUTg1XZYu4Cuzq/IxCaxQ2tPY3+8J9/3aFCuYsl
 WDlM31QHxDSM6lwJfaPupC+6twfTg4Dz8GiMv1TIpC/Em6qB0iPj5MLqScNz2PBc9gzw
 9hxduOcux2WT6oXcSld9TAKWRLhDt6+jZnS0K0nCJoEklFejkCaSIUPgA1vnnT/D04kp
 j/QFS2LKcZMJVYvwwwFZN7WpdAW7aYuXJIaly/+HsVeAq6JXG7X4scUvoAhfzlh3qNRy
 F/S41/pn42XA/JDZs1PwMylvb0FO/tsfykq3EgvPRVbZAWeTUWz4XvfGEzpkqne5TZsG
 WIQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Rx0yxWNT
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: fix config directory
 pattern
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKT24gU3VuLCBKdW4gOSwgMjAyNCBhdCAxMjo0N+KAr0FNIFlhbm4gRS4gTU9SSU4gPHlh
bm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IFZpbmNlbnQsIEFsbCwKPgo+IE9uIDIw
MjQtMDYtMDggMjI6MjUgLTA1MDAsIFZpbmNlbnQgRmF6aW8gc3Bha2UgdGh1c2x5Ogo+ID4gSWYg
YSBwbGF0Zm9ybSB0cmlwbGV0IGlzIG5vdCBkZXRlY3RlZCBkdXJpbmcgdGhlIGNvbmZpZ3VyZSBz
dGFnZSwKPgo+IENvdWxkIHlvdSBzaGFyZSBhIGRlZmNvbmZpZyB0aGF0IGV4aGliaXRzIHRoZSBp
c3N1ZSwgcGxlYXNlPwo+CgoKSGVyZSBpcyBvbmUgSSByYW4gbGFzdCBuaWdodCB3aGVuIHRlc3Rp
bmcgcHl0aG9uIDMuMTIuNCBidXQgYWxzbyBmYWlscyBvbiAzLjExLgoKYGBgCkJSMl94dGVuc2E9
eQpCUjJfWFRFTlNBX0NVU1RPTT15CkJSMl9YVEVOU0FfT1ZFUkxBWV9GSUxFPSJodHRwczovL2dp
dGh1Yi5jb20vamNtdmJrYmMveHRlbnNhLXRvb2xjaGFpbi1idWlsZC9yYXcvOTUyOTFiN2MzOWU2
Zjc5MGQwYjJmMDYyYzk0NWE2MzAyOTBmMmM4MS9vdmVybGF5cy94dGVuc2FfZGMyMzNjLnRhci5n
eiIKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJ
Tl9YVEVOU0FfTFg2MF9VQ0xJQkNfU1RBQkxFPXkKQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BP
UlQ9InR0eVMwIgpCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCkJSMl9ST09URlNfUE9TVF9JTUFHRV9T
Q1JJUFQ9ImJvYXJkL3FlbXUvcG9zdC1pbWFnZS5zaCIKQlIyX1JPT1RGU19QT1NUX1NDUklQVF9B
UkdTPSIkKEJSMl9ERUZDT05GSUcpIgpCUjJfTElOVVhfS0VSTkVMPXkKQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fVkVSU0lPTj15CkJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9
IjYuNi4xOCIKQlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15CkJSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11L3h0ZW5zYS1seDYwL2xpbnV4LmNv
bmZpZyIKQlIyX0xJTlVYX0tFUk5FTF9JTUFHRV9UQVJHRVRfQ1VTVE9NPXkKQlIyX0xJTlVYX0tF
Uk5FTF9JTUFHRV9UQVJHRVRfTkFNRT0iSW1hZ2UiCkJSMl9MSU5VWF9LRVJORUxfSU1BR0VfTkFN
RT0iSW1hZ2UuZWxmIgpCUjJfUEFDS0FHRV9QWVRIT04zPXkKQlIyX1RBUkdFVF9ST09URlNfSU5J
VFJBTUZTPXkKIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldApCUjJfUEFDS0FHRV9I
T1NUX1FFTVU9eQpCUjJfUEFDS0FHRV9IT1NUX1FFTVVfU1lTVEVNX01PREU9eQpCUjJfUEFDS0FH
RV9IT1NUX1VCT09UX1RPT0xTPXkKYGBgCgpJIHRoaW5rIHRoaXMgaXMgZml4YWJsZSBpbiBvdGhl
ciB3YXlzLCBidXQgd291bGQgcHJvYmFibHkgcmVxdWlyZSBleHRlbmRpbmcKUHl0aG9uJ3MgcGxh
dGZvcm0gZGV0ZWN0aW9uLCB3aGljaCBnb3QgcmV3cml0dGVuIGluIDMuMTMgYW5kIGNvdWxkIGJl
IGEgaGFzc2xlCnRvIG1haW50YWluLCBlc3BlY2lhbGx5IHNpbmNlIHVDbGliYyBpc24ndCB0ZWNo
bmljYWxseSBzdXBwb3J0ZWQgdXBzdHJlYW0uCgpjb25maWd1cmUuYWMgY29kZToKCmh0dHBzOi8v
Z2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9ibG9iLzM1Yzc5OWQ3OTE3N2I5NjJkZGFjZTJmYTA2
ODEwMTQ2NTU3MGEyOWEvY29uZmlndXJlLmFjI0w1NzU1CgpQTEFURk9STV9UUklQTEVUIGFuZCBN
VUxUSUFSQ0ggdmFsdWVzIGRyaXZlIHRoaXMsIGhvd2V2ZXIKCmh0dHBzOi8vZ2l0aHViLmNvbS9w
eXRob24vY3B5dGhvbi9ibG9iLzM1Yzc5OWQ3OTE3N2I5NjJkZGFjZTJmYTA2ODEwMTQ2NTU3MGEy
OWEvY29uZmlndXJlLmFjI0wxMDkwCgpgYGAKY2hlY2tpbmcgZm9yIHRoZSBwbGF0Zm9ybSB0cmlw
bGV0IGJhc2VkIG9uIGNvbXBpbGVyIGNoYXJhY3RlcmlzdGljcy4uLiBub25lCmNoZWNraW5nIGZv
ciBtdWx0aWFyY2guLi4KCmBgYAoKCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gPiB0
aGUKPiA+IGNvbmZpZyBkaXJlY3RvcnkgKExJQlBMKSBkZWZhdWx0cyB0byBgY29uZmlnLSRMRFZF
UlNJT05gLgo+ID4KPiA+IEluIHRoaXMgc2NlbmFyaW8sIHRoZSBgUFlUSE9OM19SRU1PVkVfVVNF
TEVTU19GSUxFU2AgaG9vayB3b3VsZCBmYWlsIGR1ZQo+ID4gdG8gYGZpbmRgIGluY29ycmVjdGx5
IGV4cGVjdGluZyBhIHNlY29uZCBkYXNoIGFuZCB0aGVuIHRoZSB0cmlwbGV0Lgo+ID4KPiA+IE5v
dywgd2UgZ2xvYiBhbnl0aGluZyBhZnRlciB0aGUgdmVyc2lvbiB3aGljaCB3aWxsIG1hdGNoIGlu
IGJvdGggY2FzZXMuCj4gPgo+ID4gRml4ZXM6IDU0ZDQ4YzhjYWQgKCJwYWNrYWdlL3B5dGhvbjM6
IG1pc2NlbGxhbmVvdXMgZml4dXBzIikKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IEZh
emlvIDx2ZmF6aW9AZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9weXRob24zL3B5dGhv
bjMubWsgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uMy9weXRob24zLm1rIGIv
cGFja2FnZS9weXRob24zL3B5dGhvbjMubWsKPiA+IGluZGV4IGEwYjllZDQ0MzcuLmE4MmJjNDdh
NTcgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5tawo+ID4gKysrIGIv
cGFja2FnZS9weXRob24zL3B5dGhvbjMubWsKPiA+IEBAIC0yMDQsNyArMjA0LDcgQEAgUFlUSE9O
M19DT05GX09QVFMgKz0gXAo+ID4gIGRlZmluZSBQWVRIT04zX1JFTU9WRV9VU0VMRVNTX0ZJTEVT
Cj4gPiAgICAgICBybSAtZiAkKFRBUkdFVF9ESVIpL3Vzci9iaW4vcHl0aG9uJChQWVRIT04zX1ZF
UlNJT05fTUFKT1IpLWNvbmZpZwo+ID4gICAgICAgcm0gLWYgJChUQVJHRVRfRElSKS91c3IvYmlu
L3B5dGhvbjMtY29uZmlnCj4gPiAtICAgICBmaW5kICQoVEFSR0VUX0RJUikvdXNyL2xpYi9weXRo
b24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikvY29uZmlnLSQoUFlUSE9OM19WRVJTSU9OX01BSk9S
KS0qLyBcCj4gPiArICAgICBmaW5kICQoVEFSR0VUX0RJUikvdXNyL2xpYi9weXRob24kKFBZVEhP
TjNfVkVSU0lPTl9NQUpPUikvY29uZmlnLSQoUFlUSE9OM19WRVJTSU9OX01BSk9SKSovIFwKPiA+
ICAgICAgICAgICAgICAgLXR5cGUgZiAtbm90IC1uYW1lIE1ha2VmaWxlIC1leGVjIHJtIC1yZiB7
fSBcOwo+ID4gICAgICAgZmluZCAkKFRBUkdFVF9ESVIpL3Vzci9saWIvcHl0aG9uJChQWVRIT04z
X1ZFUlNJT05fTUFKT1IpLyAtdHlwZSBkIFwKPiA+ICAgICAgICAgICAgICAgLW5hbWUgX19weWNh
Y2hlX18gLWV4ZWMgcm0gLXJmIHt9IFw7Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPgo+IC0tCj4gLi0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAz
NzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAg
ICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCgoKLVZpbmNlbnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
