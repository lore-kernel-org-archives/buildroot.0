Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6C310ED65C
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 11:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0A2C416D2;
	Fri, 27 Mar 2026 11:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pirv5xF8sv9t; Fri, 27 Mar 2026 11:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D03B6416C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774611254;
	bh=633qNYm/LuNJt6URKLfknNzCSqmasltZCuyDEiGM4Mk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e/wkLUKB+qfLj7heNHSM0b29Rg7lH44svYDX0SElFRKiHLBGe2tnynl/8+RTaw6WW
	 ilu/b5HIsQXgUKKi0LfLC/hYlVLqWywyzISaOUAkAL7k6qH4DjXHBWQU6XbvX3t6Sv
	 ByzSrmiOA4dpRe3vLcenzo9Gir/28754QvC/Hwwb0cvJgbsPtH7tEOJEG94TfDM48t
	 FLdda84k0EIb7GzIse21O0xxhhuHajdYWmN5K/McmCbU5Hjy5mv0Ogwhrguq/wqtqZ
	 9SQVS+dotqTQhXCw/iYiKirRqdWV7uVQ4oz0ikkfE+B/F3IYk1Er7q/rnSaCy8DZKi
	 IpnMrY9XlCMjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D03B6416C3;
	Fri, 27 Mar 2026 11:34:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0EF01D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 11:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94A7383D93
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 11:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHjDCUqxlyQQ for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 11:34:12 +0000 (UTC)
X-Greylist: delayed 479 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 27 Mar 2026 11:34:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09CB283D7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09CB283D7F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.33.174;
 helo=11.mo534.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
Received: from 11.mo534.mail-out.ovh.net (11.mo534.mail-out.ovh.net
 [46.105.33.174])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09CB283D7F
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 11:34:11 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net [152.228.215.222])
 by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4fhyy94QX9z69M0;
 Fri, 27 Mar 2026 11:26:09 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net. [127.0.0.1])
 by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Fri, 27 Mar 2026 11:26:09 +0000 (UTC)
Received: from mta7.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.37.96])
 by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4fhyy93FYbz5vq0;
 Fri, 27 Mar 2026 11:26:09 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.8])
 (Authenticated sender: mooz@blockos.org)
 by mta7.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 1899DB81520; 
 Fri, 27 Mar 2026 11:26:09 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Cc: Vincent Cruz <mooz@blockos.org>
Date: Fri, 27 Mar 2026 12:25:16 +0100
Message-ID: <20260327112542.1173652-2-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 7588846851059534797
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFsFkp7RVthOpPQFXGJoAH7qpmyVFJaL4K5g0pUHR2RjJYxCA3SgJwy+bcQNILhh8phmbytvLgmzDpJ7IlBb0j7ecKh999mBHO2sjsq9AUPg/jYyDYWeP921vAymthFPNqDFr548E52gXTK0G2jltTYVoJVXN6ujsgwlOHGQy1XW02aAZnVPvckrFKMECFQlFVNObjnoOpELke2GBO+QZIBbl5BGpDoWKDFNCoYpACHn2Cpd1/nmOnW/g1SX9KG2O313sJbddrPMzb1i/H1mI+nSl2RUXKvodv8Fsxl9tsDTA/sWZAHK9TkqQ35VVlwDrTKcR1bcOBx6pyO6PVgDuYPMQAfH9D7h8YYhG2VdE0G21JJhl7rhPOyo5QW546bsGl0VpB5kqp7Hw9R27Jm8hJq0HdXsPcfGi5KKaNfRlOfqBnceNCEqFVhJIZ+VH7NaW0U2nrMpuzSN3KKDVyopJV33CJzhE6TceBcYkVhrGkDXDmRbNGn5qf225+yI3JIno9YFd0IBAVurqg02fqiyCrThh0jxGQ4f7kryyDOOORESfcrFO7/5eKi5kkoLPA3Ycu7mAW9aE68ijHAgSiw4nL4PlEPDJuJvgG5PMYBUCZLhWEFq9zBrg4wmyM/V5KukxaXuvgbz21Nk8G6WnYvYRKPogsydHLTj2bsDGkLQ4w3+A
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-114S008cf7ae9d1-7f31-474d-864d-dcaa0b87b3ba,
 B548C52B33E4A2712BFB385F62670DC0A4297526) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH v3] package/rwmem: bump to version 2.0
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

Rm9yIG1vcmUgZGV0YWlscywgc2VlOgpodHRwczovL2dpdGh1Yi5jb20vdG9tYmEvcndtZW0vY29t
cGFyZS9jODliYzlhZDkuLi4yLjAKClNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgQ3J1eiA8bW9vekBi
bG9ja29zLm9yZz4KLS0tCkNoYW5nZXMgdjIgLT4gdjM6CiAgLSBBZGQgZGV0YWlscyBhbmQgbWlz
c2luZyB1cHN0cmVhbSBpbmZvcm1hdGlvbnMgdG8gcGF0Y2guCgpDaGFuZ2VzIHYxIC0+IHYyOgog
IC0gQWRkIHBhdGNoIHRvIGZpeCBjb21waWxhdGlvbiBmYWlsdXJlIHdpdGggbXVzbCBsaWJjLgoK
IC4uLjAwMS1GaXgtYnVpbGQtZmFpbHVyZS13aXRoLW11c2wtbGliYy5wYXRjaCB8IDUwICsrKysr
KysrKysrKysrKysrKysKIHBhY2thZ2UvcndtZW0vcndtZW0uaGFzaCAgICAgICAgICAgICAgICAg
ICAgICB8ICAzICstCiBwYWNrYWdlL3J3bWVtL3J3bWVtLm1rICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMyArLQogMyBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcndtZW0vMDAwMS1GaXgtYnVpbGQtZmFp
bHVyZS13aXRoLW11c2wtbGliYy5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcndtZW0vMDAw
MS1GaXgtYnVpbGQtZmFpbHVyZS13aXRoLW11c2wtbGliYy5wYXRjaCBiL3BhY2thZ2UvcndtZW0v
MDAwMS1GaXgtYnVpbGQtZmFpbHVyZS13aXRoLW11c2wtbGliYy5wYXRjaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi45ZDdjOWFkYmY5Ci0tLSAvZGV2L251bGwKKysrIGIv
cGFja2FnZS9yd21lbS8wMDAxLUZpeC1idWlsZC1mYWlsdXJlLXdpdGgtbXVzbC1saWJjLnBhdGNo
CkBAIC0wLDAgKzEsNTAgQEAKK0Zyb20gMzczMGMzMDI4YTQ5NDUzNjU3MWMzMGQ0ZDQ0ZGYzNDdl
MDg4NjY1MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFZpbmNlbnQgQ3J1eiA8bW9v
ekBibG9ja29zLm9yZz4KK0RhdGU6IEZyaSwgMjcgTWFyIDIwMjYgMTE6MTY6MzYgKzAxMDAKK1N1
YmplY3Q6IFtQQVRDSF0gRml4IGJ1aWxkIGZhaWx1cmUgd2l0aCBtdXNsIGxpYmMuCitNSU1FLVZl
cnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250
ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK0ZpeGVzIHRoZSBmb2xsb3dpbmcgYnVpbGQg
ZmFpbHVyZSB3aGVuIHVzaW5nIG11c2wgbGliYzoKKworLi4vdGVzdHMvdGVzdF9kYXRhX2dlbmVy
YXRvci5jcHA6IEluIGxhbWJkYSBmdW5jdGlvbjoKKy4uL3Rlc3RzL3Rlc3RfZGF0YV9nZW5lcmF0
b3IuY3BwOjEwNDoyNzogZXJyb3I6IOKAmGh0b2JlMzLigJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0
aGlzIHNjb3BlOyBkaWQgeW91IG1lYW4g4oCYaHRvYmXigJk/CisgIDEwNCB8ICAgICAgICAgdWlu
dDMyX3QgYmVfdmFsID0gaHRvYmUzMih2YWwpOworICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn4KKyAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICBodG9iZQor
Li4vdGVzdHMvdGVzdF9kYXRhX2dlbmVyYXRvci5jcHA6IEluIGxhbWJkYSBmdW5jdGlvbjoKKy4u
L3Rlc3RzL3Rlc3RfZGF0YV9nZW5lcmF0b3IuY3BwOjEwOToyNzogZXJyb3I6IOKAmGh0b2JlNjTi
gJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlOyBkaWQgeW91IG1lYW4g4oCYaHRvYmXi
gJk/CisgIDEwOSB8ICAgICAgICAgdWludDY0X3QgYmVfdmFsID0gaHRvYmU2NCh2YWwpOworICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KKyAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICBodG9iZQorCitVcHN0cmVhbTogTi9BLiBUaGUgaW1wYWN0ZWQgZmls
ZSBkb2VzIG5vdCBleGlzdCB1cHN0cmVhbS4KKworU2lnbmVkLW9mZi1ieTogVmluY2VudCBDcnV6
IDxtb296QGJsb2Nrb3Mub3JnPgorLS0tCisgdGVzdHMvdGVzdF9kYXRhX2dlbmVyYXRvci5jcHAg
fCAzICsrLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
KworZGlmZiAtLWdpdCBhL3Rlc3RzL3Rlc3RfZGF0YV9nZW5lcmF0b3IuY3BwIGIvdGVzdHMvdGVz
dF9kYXRhX2dlbmVyYXRvci5jcHAKK2luZGV4IDM5ZTEzMjIuLjM2NzZmMTkgMTAwNjQ0CistLS0g
YS90ZXN0cy90ZXN0X2RhdGFfZ2VuZXJhdG9yLmNwcAorKysrIGIvdGVzdHMvdGVzdF9kYXRhX2dl
bmVyYXRvci5jcHAKK0BAIC0yLDYgKzIsNyBAQAorIAorICNpbmNsdWRlIDxhbGdvcml0aG0+Cisg
I2luY2x1ZGUgPGNzdHJpbmc+CisrI2luY2x1ZGUgPGVuZGlhbi5oPgorIAorIC8vIENvbnN0YW50
cyBmcm9tIHJlZ2ZpbGVkYXRhLmgKKyBzdGF0aWMgY29uc3QgdWludDMyX3QgUldNRU1fTUFHSUMg
PSAweDAwZTExNTU0OworQEAgLTE2OSw0ICsxNzAsNCBAQCBzdGQ6OnZlY3Rvcjx1aW50OF90PiBU
ZXN0UmVnaXN0ZXJGaWxlQnVpbGRlcjo6YnVpbGQoKSB7CisgICAgIH0KKyAKKyAgICAgcmV0dXJu
IGRhdGE7CistfQorXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCisrfQorLS0gCisyLjUxLjAK
KwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9yd21lbS9yd21lbS5oYXNoIGIvcGFja2FnZS9yd21lbS9y
d21lbS5oYXNoCmluZGV4IGRhNzQwMDJjYjQuLjhiNzNmNjYyZWEgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvcndtZW0vcndtZW0uaGFzaAorKysgYi9wYWNrYWdlL3J3bWVtL3J3bWVtLmhhc2gKQEAgLTEs
MiArMSwzIEBACi1zaGEyNTYgIGU2Y2I3NmI3Nzg2OWFlZjllYzRhMmMzMWQwZDgwYWYwMTgyYTVm
OWM5YzNhZTA2MjI1YzhmYjJmODI2NjM3OWYgIHJ3bWVtLWM4OWJjOWFkOWE4ZjIzNTlmMzU4YzUx
MGRiNTdiNzY3OGViMTU2ZDEudGFyLmd6CisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICBk
MTA2MzlmNTYzMTAwYzgxOTIwMjMzN2M0ZDRkZjU3ZGIxMWMyZmNkNTlhMTliMGM2OGUzNGI4ZWI5
YWExZDAxICByd21lbS0yLjAudGFyLmd6CiBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYx
ODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIExJQ0VOU0UKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcndtZW0vcndtZW0ubWsgYi9wYWNrYWdlL3J3bWVtL3J3bWVtLm1rCmlu
ZGV4IGQ2ZWYwNTE5M2IuLjEyNTliNTUwM2YgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcndtZW0vcndt
ZW0ubWsKKysrIGIvcGFja2FnZS9yd21lbS9yd21lbS5tawpAQCAtNCwxMSArNCwxMCBAQAogIwog
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUldNRU1fVkVSU0lPTiA9IGM4OWJjOWFkOWE4ZjIz
NTlmMzU4YzUxMGRiNTdiNzY3OGViMTU2ZDEKK1JXTUVNX1ZFUlNJT04gPSAyLjAKIFJXTUVNX1NJ
VEUgPSAkKGNhbGwgZ2l0aHViLHRvbWJhLHJ3bWVtLCQoUldNRU1fVkVSU0lPTikpCiBSV01FTV9M
SUNFTlNFID0gR1BMLTIuMAogUldNRU1fTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLVJXTUVNX0NP
TkZfT1BUUyA9IC1EcHlyd21lbT1kaXNhYmxlZAogUldNRU1fREVQRU5ERU5DSUVTID0gaG9zdC1w
a2djb25mIGZtdCBpbmloCiAKICQoZXZhbCAkKG1lc29uLXBhY2thZ2UpKQotLSAKMi41MS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
