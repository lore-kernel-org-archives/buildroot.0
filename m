Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959C8CCD184
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 07:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7959060BE1;
	Fri, 17 Oct 2025 07:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeqbHSpEC1dm; Fri, 17 Oct 2025 07:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92EAE60B2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92EAE60B2E;
	Fri, 17 Oct 2025 07:43:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DC97D8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FF2840806
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsAttaMK3TI3 for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 07:42:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E1BB407E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E1BB407E9
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E1BB407E9
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:42:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1E2F3C041DC
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:42:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 64CF0606DB;
 Fri, 17 Oct 2025 07:42:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 88AD6102F231D; 
 Fri, 17 Oct 2025 09:42:54 +0200 (CEST)
Date: Fri, 17 Oct 2025 09:42:46 +0200
MIME-Version: 1.0
Message-Id: <20251017-python-scp-v1-1-b45644fa9afb@bootlin.com>
References: <20251017-python-scp-v1-0-b45644fa9afb@bootlin.com>
In-Reply-To: <20251017-python-scp-v1-0-b45644fa9afb@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760686974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ByUzlhtDz3JjOIQQKRiykfCM1jabNJJVJ/su+3gGyDM=;
 b=BibD9jOHKAjj8L2K/j9J571PNimoUsmfvzNQ5EtiFmJLrgmulu+xQiXOtglsofs+sT8BjZ
 hhNzGKAHhDHjKfLPsWjxN3+e661nqEKdZVPKQaIoWJj/eyx2pL5AjnNvvSgpH0VRuvimrl
 QWyeOqRK9pEJWrGZeLD+zOnnXAnXLUKUaP56Gx2ZK9pwD+C3hf93IfizLtZlujYc3VbXhg
 HxkaG+dQvy3wfZGq/mKM0TDmGdgV2Q+8pTMqzkCN9fnMVg6T+BwAK2IwyIbZikJzDqhkWP
 5/hSbCvWRQi3UNlkFgeJoDCbXYHRgtFlHII2uaHYj0/dFAT2OjNP7J15iSpmBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=BibD9jOH
Subject: [Buildroot] [PATCH 1/2] package/python-scp: new package
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIHB5dGhvbi1zY3AgYXMgYSBuZXcgcGFja2FnZS4gcHl0aG9uLXNjcCBhbGxvd3MgdG8gc2Vu
ZCBhbmQgcmVjZWl2ZXMKZmlsZXMgaW4gcHl0aG9uIHRocm91Z2ggdGhlIHNjcDEgcHJvdG9jb2ws
IG9uIHRvcCBvZiBwYXJhbWlrby4KClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxl
eGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAzICsrKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICB8ICAx
ICsKIHBhY2thZ2UvcHl0aG9uLXNjcC9Db25maWcuaW4gICAgICAgfCAgNyArKysrKysrCiBwYWNr
YWdlL3B5dGhvbi1zY3AvcHl0aG9uLXNjcC5oYXNoIHwgIDUgKysrKysKIHBhY2thZ2UvcHl0aG9u
LXNjcC9weXRob24tc2NwLm1rICAgfCAxNCArKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2Vk
LCAzMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMK
aW5kZXggODRjYThjNzZkYzUyZDIzYTY0ZWRjNDNkYWI5MTkyNGU4NTA5ZDhkNS4uZDA2NjRlODcy
M2NkMjIyM2Y1MTgwY2E1ZWUzMTFkYzc4YjAzNzZiZCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUwor
KysgYi9ERVZFTE9QRVJTCkBAIC0xNDgsNiArMTQ4LDkgQEAgRjoJY29uZmlncy9jdWJpZWJvYXJk
Ml9kZWZjb25maWcKIE46CUFsZXhleSBMdWt5YW5jaHVrIDxza2lmQHNraWYtd2ViLnJ1PgogRjoJ
cGFja2FnZS96YWJiaXgvCiAKK046IAlBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJv
b3RsaW4uY29tPgorRjogCXBhY2thZ2UvcHl0aG9uLXNjcAorCiBOOglBbGlzdGFpciBGcmFuY2lz
IDxhbGlzdGFpckBhbGlzdGFpcjIzLm1lPgogRjoJYm9hcmQvc2lmaXZlLwogRjoJYm9vdC9vcGVu
c2JpLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgpp
bmRleCAxYWU5MjQwOWM0YmQxMWJiYmJhZmQwZjlmODI4N2U1NjAxNjAzNTY4Li4zNTYxZWM4MTQ3
NmEzMGU5MjRiYWYwMjc2ZWM4NmRhNTExOWVhNDU3IDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZp
Zy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMTM4Myw2ICsxMzgzLDcgQEAgbWVudSAi
RXh0ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1zY2FweS9D
b25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1zY2hlZHVsZS9Db25maWcuaW4iCiAJ
c291cmNlICJwYWNrYWdlL3B5dGhvbi1zY2lweS9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdl
L3B5dGhvbi1zY3AvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tc2RidXMvQ29u
ZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tc2RidXMtbW9kZW1tYW5hZ2VyL0NvbmZp
Zy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyL0NvbmZp
Zy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNjcC9Db25maWcuaW4gYi9wYWNrYWdl
L3B5dGhvbi1zY3AvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjFkYjBlOTEwZjRiMjA0MWFjNjM4NzFh
NjZiMDczODJiNmMxYzRjODcKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1zY3Av
Q29uZmlnLmluCkBAIC0wLDAgKzEsNyBAQAorY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9TQ1AK
Kwlib29sICJweXRob24tc2NwIgorCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fUEFSQU1JS08g
IyBydW50aW1lCisJaGVscAorCSAgc2NwIG1vZHVsZSBmb3IgcGFyYW1pa28uCisKKwkgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9qYmFyZGluL3NjcC5weQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24t
c2NwL3B5dGhvbi1zY3AuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXNjcC9weXRob24tc2NwLmhhc2gK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMC4uNGVjNGU2YTQxYTRkNDQzMzExODk0MTdlMzM2MDIzYWRlNjM3YzA5ZQotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNjcC9weXRob24tc2NwLmhhc2gKQEAgLTAs
MCArMSw1IEBACisjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3NjcC9q
c29uCittZDUgIDU0YzBlM2I2Y2M1MjYyMGNlM2E4MTM2MmZhOGJiMjlkICBzY3AtMC4xNS4wLnRh
ci5negorc2hhMjU2ICBmMWIyMmU5OTMyMTIzY2NmMTdlZWJmMTllMDk1M2M2ZTkxNDhmNTg5Zjkz
ZDkxYjg3Mjk0MWE2OTYzMDVjODNmICBzY3AtMC4xNS4wLnRhci5negorIyBMb2NhbGx5IGNvbXB1
dGVkIHNoYTI1NiBjaGVja3N1bXMKK3NoYTI1NiAgMjQ1NWNmMGZjNzhlMTM3NzJiZjEwZWY1ZjIw
OWU3ZWI4NjI1NzA2ZDY3MWIyZjQyMGNjOGFkZDM3ZDU0OGMxYyAgTElDRU5TRS50eHQKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNjcC9weXRob24tc2NwLm1rIGIvcGFja2FnZS9weXRob24t
c2NwL3B5dGhvbi1zY3AubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uZDIyM2IxNjI5MDc2MGE5Yzc4YjViYjU4ZGQ0
ZDRhZjIxYjQ5YTQzYQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNjcC9weXRo
b24tc2NwLm1rCkBAIC0wLDAgKzEsMTQgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisj
IHB5dGhvbi1zY3AKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1BZVEhPTl9TQ1BfVkVS
U0lPTiA9IDAuMTUuMAorUFlUSE9OX1NDUF9TT1VSQ0UgPSBzY3AtJChQWVRIT05fU0NQX1ZFUlNJ
T04pLnRhci5negorUFlUSE9OX1NDUF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQu
b3JnL3BhY2thZ2VzL2Q2LzFjL2QyMTNlMWM2NjUxZDBiZDM3NjM2YjIxYjFiYTliODk1ZjI3NmU4
MDU3Zjg4MmM5Zjk0NDkzMWU0ZjAwMgorUFlUSE9OX1NDUF9TRVRVUF9UWVBFID0gc2V0dXB0b29s
cworUFlUSE9OX1NDUF9MSUNFTlNFID0gTEdQTC0yLjErCitQWVRIT05fU0NQX0xJQ0VOU0VfRklM
RVMgPSBMSUNFTlNFLnR4dAorCiskKGV2YWwgJChweXRob24tcGFja2FnZSkpCgotLSAKMi41MS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
