Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF3BF54AC7
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 15:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D07E740B92;
	Tue, 24 Mar 2026 15:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xN3zHCFtjJbt; Tue, 24 Mar 2026 15:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7773E40CFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774364565;
	bh=EGZO4q96Rq9hZ64sE/bhlhMdqrUEvTVNta+cMzTDpT8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B737WjfAyqj3oRHV+Gy406aW/xHQjkRoPRwNYWyX5mGRcuIVJZwu2ygC1m2PYeRHB
	 EfWk1tciekgcVE46ceabWA9r/DQm8jw3cFBTjcF6tqqMkJeNy2TPdWTMHSnfIUFysG
	 HJBoRimXQw673wfpWS3xXw8k0KZbEFAsglRFgjNKUVs37iPSQnNmEj1BoJZ0MueY1p
	 teyOvyXwEtM3zYCHVyzP3ITcpE/zzkrPsXXrbnFBQnNeb2I8pK8XbOrPbtCm00mL/B
	 OwsRRjBtvGENl88Kn5k2WLtUvnYNpOg5yF+fEUsInjhrePqmDNMntbg7FE9pMzEYRa
	 UYbHJQ2ZECBOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7773E40CFA;
	Tue, 24 Mar 2026 15:02:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99DB0353
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 15:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FFD881E51
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 15:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6nXnWVOuDHS for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 15:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8474281E48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8474281E48
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8474281E48
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 15:02:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 359CA14BF;
 Tue, 24 Mar 2026 08:02:36 -0700 (PDT)
Received: from debian (X72Y076X74-2.nice.arm.com [10.34.125.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 91BAE3F915;
 Tue, 24 Mar 2026 08:02:41 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Dick Olsson <hi@senzilla.io>
Date: Tue, 24 Mar 2026 16:02:39 +0100
Message-ID: <20260324150239.21226-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=arm.com; s=foss; 
 t=1774364562; bh=11PHBJSpEaUyK/CQAlCH1WItYzL+clLkZqUKJscU5og=;
 h=From:To:Cc:Subject:Date:From;
 b=SxNYjAcl7H2LtIo04GYFXs0cdwaODhbMfGCPZU6ewvYi2cXC25kLQgUg6pwC+rq4t
 41CtAxBplf07nV5hRX6cBJgk2wh8mgSxsXrpvaGFquLgHFxzAgfnp+g/DMobny6ZM1
 iB84tZc2hZ84RuMTbevij5Y8vZKNKehIaFDSDozk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256
 header.s=foss header.b=SxNYjAcl
Subject: [Buildroot] [PATCH] boot/edk2: fix build with gcc 15
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

VGhlIGVkazIgcGFja2FnZSBmYWlscyB0byBidWlsZCB3aXRoIGdjYyAxNSwgd2l0aCB0aGUgZm9s
bG93aW5nIGVycm9yOgoKICBFZmlSb20uYzo3ODoxNzogZXJyb3I6IGFzc2lnbm1lbnQgZGlzY2Fy
ZHMgJ2NvbnN0JyBxdWFsaWZpZXIgZnJvbSBwb2ludGVyIHRhcmdldCB0eXBlIFstV2Vycm9yPWRp
c2NhcmRlZC1xdWFsaWZpZXJzXQoKQ2hlcnJ5LXBpY2sgb25lIHBhdGNoIGZyb20gZWRrMi1zdGFi
bGUyMDI2MDIgdG8gZml4IHRoaXMuCgpUaGlzIGNhbiBiZSB2ZXJpZmllZCB3aXRoIHRoZSB0ZXN0
cy5ib290LnRlc3RfZWRrMiBweXRob24gdGVzdHMuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0
ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBEaWNrIE9sc3NvbiA8aGlAc2Vuemls
bGEuaW8+Ci0tLQogLi4uYXNlVG9vbHMtRWZpUm9tLWZpeC1jb21waWxlci13YXJuaW5nLnBhdGNo
IHwgNDYgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L2VkazIvMDAwMS1CYXNlVG9vbHMtRWZpUm9tLWZp
eC1jb21waWxlci13YXJuaW5nLnBhdGNoCgpkaWZmIC0tZ2l0IGEvYm9vdC9lZGsyLzAwMDEtQmFz
ZVRvb2xzLUVmaVJvbS1maXgtY29tcGlsZXItd2FybmluZy5wYXRjaCBiL2Jvb3QvZWRrMi8wMDAx
LUJhc2VUb29scy1FZmlSb20tZml4LWNvbXBpbGVyLXdhcm5pbmcucGF0Y2gKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYzFlNjg4Y2ZlMAotLS0gL2Rldi9udWxsCisrKyBi
L2Jvb3QvZWRrMi8wMDAxLUJhc2VUb29scy1FZmlSb20tZml4LWNvbXBpbGVyLXdhcm5pbmcucGF0
Y2gKQEAgLTAsMCArMSw0NiBAQAorRnJvbSA5YWYwNmVmM2NiYjA1MmIxNDJmOTY2MGMyYzAxZTdh
ZWI0MDEzMDBjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+CitEYXRlOiBNb24sIDggRGVjIDIwMjUgMTA6Mjg6NTAgKzAxMDAK
K1N1YmplY3Q6IFtQQVRDSF0gQmFzZVRvb2xzL0VmaVJvbTogZml4IGNvbXBpbGVyIHdhcm5pbmcK
K01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRG
LTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworTmV3IHdhcm5pbmcgYWZ0ZXIg
dXBkYXRpbmcgZ2NjOgorCitFZmlSb20uYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKK0VmaVJv
bS5jOjc4OjE3OiBlcnJvcjogYXNzaWdubWVudCBkaXNjYXJkcyDigJhjb25zdOKAmSBxdWFsaWZp
ZXIgZnJvbSBwb2ludGVyIHRhcmdldCB0eXBlIFstV2Vycm9yPWRpc2NhcmRlZC1xdWFsaWZpZXJz
XQorCitUaGUgYXNzaWduZWQgdmFsdWUgaXMgbm90IHVzZWQsIHNvIGZpeCB0aGUgd2FybmluZyBi
eSBqdXN0IHJlbW92aW5nIGl0LgorCitTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2Vk
azIvY29tbWl0LzlhZjA2ZWYzY2JiMDUyYjE0MmY5NjYwYzJjMDFlN2FlYjQwMTMwMGMKK1NpZ25l
ZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KKy0tLQor
IEJhc2VUb29scy9Tb3VyY2UvQy9FZmlSb20vRWZpUm9tLmMgfCAzICstLQorIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL0Jhc2VU
b29scy9Tb3VyY2UvQy9FZmlSb20vRWZpUm9tLmMgYi9CYXNlVG9vbHMvU291cmNlL0MvRWZpUm9t
L0VmaVJvbS5jCitpbmRleCBmYTdiZjBlNjJlLi42ZTkwM2IzNTA0IDEwMDY0NAorLS0tIGEvQmFz
ZVRvb2xzL1NvdXJjZS9DL0VmaVJvbS9FZmlSb20uYworKysrIGIvQmFzZVRvb2xzL1NvdXJjZS9D
L0VmaVJvbS9FZmlSb20uYworQEAgLTQ0LDcgKzQ0LDYgQEAgUmV0dXJuczoKKyAgIEZJTEVfTElT
VCAqRkxpc3Q7DQorICAgVUlOVDMyICAgIFRvdGFsU2l6ZTsNCisgICBVSU5UMzIgICAgU2l6ZTsN
CistICBDSEFSOCAgICAgKlB0cjA7DQorIA0KKyAgIFNldFV0aWxpdHlOYW1lKFVUSUxJVFlfTkFN
RSk7DQorIA0KK0BAIC03NSw3ICs3NCw3IEBAIFJldHVybnM6CisgICAvLw0KKyAgIGlmIChtT3B0
aW9ucy5EdW1wT3B0aW9uID09IDEpIHsNCisgICAgIGlmIChtT3B0aW9ucy5GaWxlTGlzdCAhPSBO
VUxMKSB7DQorLSAgICAgIGlmICgoUHRyMCA9IHN0cnN0ciAoKENPTlNUIENIQVI4ICopIG1PcHRp
b25zLkZpbGVMaXN0LT5GaWxlTmFtZSwgREVGQVVMVF9PVVRQVVRfRVhURU5TSU9OKSkgIT0gTlVM
TCkgew0KKysgICAgICBpZiAoc3Ryc3RyICgoQ09OU1QgQ0hBUjggKikgbU9wdGlvbnMuRmlsZUxp
c3QtPkZpbGVOYW1lLCBERUZBVUxUX09VVFBVVF9FWFRFTlNJT04pICE9IE5VTEwpIHsNCisgICAg
ICAgICBEdW1wSW1hZ2UgKG1PcHRpb25zLkZpbGVMaXN0KTsNCisgICAgICAgICBnb3RvIEJhaWxP
dXQ7DQorICAgICAgIH0gZWxzZSB7DQorLS0gCisyLjUzLjAKKwotLSAKMi41My4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
