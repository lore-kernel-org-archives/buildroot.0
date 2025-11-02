Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3415CCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 11:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4E4784807;
	Sun,  2 Nov 2025 11:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hu6Vk5ykkBa8; Sun,  2 Nov 2025 11:10:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C737884862
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C737884862;
	Sun,  2 Nov 2025 11:10:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7900436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE664423C4
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryoo6HEhMov0 for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 11:10:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 743EE40FD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 743EE40FD2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 743EE40FD2
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:10:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9DADEA4C5F0B
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:10:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39428)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFVyN-000000001XO-2kZe
 for buildroot@buildroot.org; Sun, 02 Nov 2025 11:10:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Nov 2025 12:10:09 +0100
Message-ID: <20251102111011.1390948-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251102111011.1390948-1-bernd@kuhls.net>
References: <20251102111011.1390948-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762081811;
 bh=p8X28I42fD3+vNH9EbF7vFfyYKJXeDzm7KljnZ+cVDE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=e1ILy/pApoD2mD9Kdj7L/8GKJSBAgJxsqZMSxzrK6QId2dK9+7HMbMJuAL0uuuv0S
 V2mg2yyq/wQnWTjsZKYWBdY+YM+ZMsv0+xrh3LeB7MNH/epMo2mrC/g6tctFDWEXJb
 rT9rIefLQ1BeRVcx1bdKiY4j7BogWZbDG8pcg1mYL8TSqrbmjwbvdUlNK2uG/Yc9EH
 Ctx8sB/xAwe1XjuegfZo9TKcjK22grePuVYRHbXuFHoNnwvuAserpfjM4LQ1eynOEh
 YCxIFgsWXHC0V5S23ODlREYIi4zxEmXjkRYlOqxLariwbco5CW0VU638H4bR727g5n
 nN7Va7/kXpwmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=e1ILy/pA
Subject: [Buildroot] [PATCH 2/2] package/live555: bump version to 2025.10.13
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

QWRkZWQgLXN0ZD1jKysyMCB0byBlbmFibGUgc3RkOjphdG9taWNfZmxhZzo6dGVzdCB3aGljaCB3
YXMgaW50cm9kdWNlZAppbiBnY2MgMTEuMToKaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2Nz
L2xpYnN0ZGMrKy9tYW51YWwvc3RhdHVzLmh0bWwjc3RhdHVzLmlzby4yMDIwCihzZWUgUDExMzVS
NikKCkZvciBvbGRlciBjb21waWxlcnMgLUROT19TVERfTElCPTEgY2FuIGJlIHVzZWQgdG8gZW5h
YmxlIGEgY29kZSBwYXRoCndpdGhvdXQgc3RkOjphdG9taWNfZmxhZzo6dGVzdCwgY29waWVkIGZy
b206Cmh0dHBzOi8vZ2l0aHViLmNvbS9EcmFnb25GbHlCU0QvRGVsdGFQb3J0cy9jb21taXQvY2Zj
Mzg4ZTZhNmJmMDExZTI4ZjBjYmViYWVhZTc0ZDJiYjUxNmEwMgoKU2lnbmVkLW9mZi1ieTogQmVy
bmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiBwYWNrYWdlL2xpdmU1NTUvbGl2ZTU1NS5o
YXNoIHwgNiArKystLS0KIHBhY2thZ2UvbGl2ZTU1NS9saXZlNTU1Lm1rICAgfCA5ICsrKysrKysr
LQogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGl2ZTU1NS9saXZlNTU1Lmhhc2ggYi9wYWNrYWdlL2xpdmU1NTUv
bGl2ZTU1NS5oYXNoCmluZGV4IGQ0ZmE5M2QwMjkuLmYwYTU2YmRhMzIgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvbGl2ZTU1NS9saXZlNTU1Lmhhc2gKKysrIGIvcGFja2FnZS9saXZlNTU1L2xpdmU1NTUu
aGFzaApAQCAtMSw1ICsxLDUgQEAKLSMgRnJvbSBodHRwOi8vd3d3LmxpdmU1NTUuY29tL2xpdmVN
ZWRpYS9wdWJsaWMvbGl2ZTU1NS1sYXRlc3QtbWQ1LnR4dAotbWQ1ICAzYzE5OTJiMGU5Yjg3MWJj
YWQ3NDkxYTNkYTU0MTc4MSAgbGl2ZS4yMDIxLjA1LjAzLnRhci5negorIyBGcm9tIGh0dHA6Ly93
d3cubGl2ZTU1NS5jb20vbGl2ZU1lZGlhL3B1YmxpYy9saXZlNTU1LWxhdGVzdC1zaGExLnR4dAor
c2hhMSAgNDgzMTQ2YjE1YzVmZGI5NzNiODhmYzMxOGYyNzcyZjAyMjI1MzU2MyAgbGl2ZS4yMDI1
LjEwLjEzLnRhci5negogIyBMb2NhbGx5IGdlbmVyYXRlZAotc2hhMjU2ICBhZTczMjQxZjljYzRh
Yjc0MGQ2MDczN2MwNDM4ZDYyYTc2MzVhZjM4MjJkZTVkODRhY2YyNzU3OTNkZTQyMDI5ICBsaXZl
LjIwMjEuMDUuMDMudGFyLmd6CitzaGEyNTYgIDQ0ZWI2YWU0YWUwMmVmNjhhNTAyOGQ5ZmM4Yjcw
YzQ1YjliYTQ1YzA1OGY4NDZiNjhiYzRkMzJjNzQzNTVmNDkgIGxpdmUuMjAyNS4xMC4xMy50YXIu
Z3oKIHNoYTI1NiAgZGE3ZWFiYjdiYWZkZjdkM2FlNWU5ZjIyM2FhNWJkYzFlZWNlNDVhYzU2OWRj
MjFiM2IwMzc1MjBiNDQ2NDc2OCAgQ09QWUlORy5MRVNTRVIKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGl2ZTU1NS9saXZlNTU1Lm1rIGIvcGFja2FnZS9saXZlNTU1L2xpdmU1NTUubWsKaW5kZXggMWUx
NTMxZWU1My4uOThlMTE1YWIyMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saXZlNTU1L2xpdmU1NTUu
bWsKKysrIGIvcGFja2FnZS9saXZlNTU1L2xpdmU1NTUubWsKQEAgLTQsNyArNCw3IEBACiAjCiAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MSVZFNTU1X1ZFUlNJT04gPSAyMDIxLjA1LjAzCitM
SVZFNTU1X1ZFUlNJT04gPSAyMDI1LjEwLjEzCiBMSVZFNTU1X1NPVVJDRSA9IGxpdmUuJChMSVZF
NTU1X1ZFUlNJT04pLnRhci5negogIyB1cHN0cmVhbSBzaXRlIHJlbW92ZXMgb2xkZXIgdmVyc2lv
bnMsIHVzZSB2aWRlb2xhbi5vcmcgaW5zdGVhZAogTElWRTU1NV9TSVRFID0gaHR0cHM6Ly9kb3du
bG9hZC52aWRlb2xhbi5vcmcvY29udHJpYi9saXZlNTU1CkBAIC0yOSw2ICsyOSwxMyBAQCBMSVZF
NTU1X0xJQlJBUllfTElOSyA9ICQoVEFSR0VUX0NDKSAtbwogTElWRTU1NV9DRkxBR1MgKz0gLWZQ
SUMKIGVuZGlmCiAKKyMg4oCYc3RydWN0IHN0ZDo6YXRvbWljX2ZsYWfigJkgaGFzIG5vIG1lbWJl
ciBuYW1lZCDigJh0ZXN04oCZCitpZmVxICgkKEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEx
KSx5KQorTElWRTU1NV9DRkxBR1MgKz0gLXN0ZD1jKysyMAorZWxzZQorTElWRTU1NV9DRkxBR1Mg
Kz0gLUROT19TVERfTElCPTEKK2VuZGlmCisKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfT1BFTlNTTCks
eSkKIExJVkU1NTVfREVQRU5ERU5DSUVTICs9IGhvc3QtcGtnY29uZiBvcGVuc3NsCiBMSVZFNTU1
X0NPTlNPTEVfTElCUyA9IGAkKFBLR19DT05GSUdfSE9TVF9CSU5BUlkpIC0tbGlicyBvcGVuc3Ns
YAotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
