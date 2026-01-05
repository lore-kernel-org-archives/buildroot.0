Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B97AC79FBD
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 19:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA2D060B11;
	Mon,  5 Jan 2026 19:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xL1SRFL9angX; Mon,  5 Jan 2026 19:48:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D5F160824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767642511;
	bh=AIiLMxBgRA0LZ5HWW0HyLrlWhAXhs9+UwhCmgjm68PM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mJ1Ev7F5VEWqCL0fpOPUPEa3yBZ/l/pe9MitAJEffucPUhUbpwRRdUpnnzot0658u
	 kULr09VpyGqx/fcW8iAkhOBqi1269UxKRyu8/4c1sZi6gOnG76dS7dVYt2UzhvjONV
	 2OCzj1covqbXTkWq3jP5eokXHu2aHTN6yzz+JVqU3QA3ST+0LiYpKa+nY5dtyXOxU/
	 mWByoN6QFAB4gFsQnvxeabCGnJOTXOxWz4nbgeZbQLiznfbLRgQbLFg8ervJia6Wm8
	 GfzlBhEVgc5q/3D4N0GE7xPjV97z4Rh0vUqQqVIqajveMomUXpxFtxgtceEOswIBuw
	 hsUVB55fnJVIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D5F160824;
	Mon,  5 Jan 2026 19:48:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4686D96F
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C481813A3
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kijKI5a-rzTu for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 19:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C06EA81398
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C06EA81398
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C06EA81398
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:48:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4DFAA4C3250;
 Mon,  5 Jan 2026 20:48:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40420)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vcqYp-000000006SQ-1Q9i;
 Mon, 05 Jan 2026 19:48:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Carsten Schoenert <c.schoenert@gmail.com>
Date: Mon,  5 Jan 2026 20:48:07 +0100
Message-ID: <20260105194813.2157401-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105194813.2157401-1-bernd@kuhls.net>
References: <20260105194813.2157401-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767642495;
 bh=J3wnFZbnuydpRl3lS2GGoqDVTsbOWdMxxxgJ0WOyQ6M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=c/++ItRLMyZMo8P+uAyLRduTnHBlexSoliq6HGTpgO647CILjpgg+73y2JoHbHjrf
 ng32VfRH6Tuv533z4fxoBTgL5I6QtJbyVtlZ9jXAdav4d0HhSYWBI4C2ZEB6zYyqkO
 bJungN3kuEiWzp9IhzrniVOylxTCQOJxC4vfjS46SRvYEL5DLUMlR8YfFMD4AQ0KcG
 4eI9+/wC5w1fSEBkETX4vjqNxrBEMoOE8Pcp/hoOrhviAp9zH73rsEsFwolos9sbpw
 +toa8SaUrlBpO768OhEvW1bfanpBN9+PdUq2W8MAFsRU9/HH1RlTm++qxnlNU6mgV5
 N9Y6jjE71h/VA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=c/++ItRL
Subject: [Buildroot] [PATCH 1/6] package/libsvg-cairo: remove package
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

RnJvbTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KClRo
aXMgcGFja2FnZSBpcyBubyBsb25nZXIgbWFpbnRhaW5lZCwgbm8gcmVsZWFzZSBzaW5jZSAyMDA1
LCBhbmQgaXRzCmRlcGVuZGVuY3kgbGlic3ZnIGhhcyBidWlsZCBpc3N1ZXMgYXMgaXQgdXNlcyB0
b28gb2xkIFhNTCBBUElzOgoKL2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1dC9o
b3N0L2Jpbi8uLi9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVk
ZS9saWJ4bWwyL2xpYnhtbC9TQVguaDoxODo0OiB3YXJuaW5nOiAjd2FybmluZyAibGlieG1sL1NB
WC5oIGlzIGRlcHJlY2F0ZWQiIFstV2NwcF0KICAgMTggfCAgICN3YXJuaW5nICJsaWJ4bWwvU0FY
LmggaXMgZGVwcmVjYXRlZCIKICAgICAgfCAgICBefn5+fn5+CgpzdmdpbnQuaDo0Mjo5OiBlcnJv
cjogdW5rbm93biB0eXBlIG5hbWUgJ3htbFBhcnNlckN0eHRQdHInCiAgIDQyIHwgdHlwZWRlZiB4
bWxQYXJzZXJDdHh0UHRyIHN2Z194bWxfcGFyc2VyX2NvbnRleHRfdDsKICAgICAgfCAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJu
ZEBrdWhscy5uZXQ+CkNjOiBDYXJzdGVuIFNjaG9lbmVydCA8Yy5zY2hvZW5lcnRAZ21haWwuY29t
PgotLS0KIENvbmZpZy5pbi5sZWdhY3kgICAgICAgICAgICAgICAgICAgICAgIHwgIDggKysrKysr
KysKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQogcGFja2Fn
ZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCiBwYWNrYWdlL2xpYnN2Zy1j
YWlyby9Db25maWcuaW4gICAgICAgICB8IDExIC0tLS0tLS0tLS0tCiBwYWNrYWdlL2xpYnN2Zy1j
YWlyby9saWJzdmctY2Fpcm8uaGFzaCB8ICA2IC0tLS0tLQogcGFja2FnZS9saWJzdmctY2Fpcm8v
bGlic3ZnLWNhaXJvLm1rICAgfCAxNiAtLS0tLS0tLS0tLS0tLS0tCiA2IGZpbGVzIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9saWJzdmctY2Fpcm8vQ29uZmlnLmluCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9s
aWJzdmctY2Fpcm8vbGlic3ZnLWNhaXJvLmhhc2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2xpYnN2Zy1jYWlyby9saWJzdmctY2Fpcm8ubWsKCmRpZmYgLS1naXQgYS9Db25maWcuaW4ubGVn
YWN5IGIvQ29uZmlnLmluLmxlZ2FjeQppbmRleCBjZTdhNDc1ODM4Li4wMTAyMDNjNjlkIDEwMDY0
NAotLS0gYS9Db25maWcuaW4ubGVnYWN5CisrKyBiL0NvbmZpZy5pbi5sZWdhY3kKQEAgLTE0Niw2
ICsxNDYsMTQgQEAgZW5kaWYKIAogY29tbWVudCAiTGVnYWN5IG9wdGlvbnMgcmVtb3ZlZCBpbiAy
MDI2LjAyIgogCitjb25maWcgQlIyX1BBQ0tBR0VfTElCU1ZHX0NBSVJPCisJYm9vbCAibGlic3Zn
LWNhaXJvIHBhY2thZ2UgcmVtb3ZlZCIKKwlzZWxlY3QgQlIyX0xFR0FDWQorCWhlbHAKKwkgIFRo
ZSBsaWJzdmctY2Fpcm8gcGFja2FnZSBoYXMgYmVlbiByZW1vdmVkLiBJdHMgbGF0ZXN0CisJICB1
cHN0cmVhbSByZWxlYXNlIHdhcyBmcm9tIDIwMDUsIGFuZCBpdCB3YXNuJ3QgdXNlZCBieSBhbnkK
KwkgIG90aGVyIEJ1aWxkcm9vdCBwYWNrYWdlLgorCiBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9K
U01JTgogCWJvb2wgImhvc3QtanNtaW4gaGFzIGJlZW4gcmVtb3ZlZCIKIAlzZWxlY3QgQlIyX0xF
R0FDWQpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggZjk4MmUzMTIz
YS4uZGRhZDM3YzJjNiAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBA
IC01OTIsNyArNTkyLDYgQEAgRjoJcGFja2FnZS9zdW54aS1ib2FyZHMvCiBOOglDYXJzdGVuIFNj
aG9lbmVydCA8Yy5zY2hvZW5lcnRAZ21haWwuY29tPgogRjoJcGFja2FnZS9saWJkdmJzaS8KIEY6
CXBhY2thZ2UvbGlic3ZnLwotRjoJcGFja2FnZS9saWJzdmctY2Fpcm8vCiAKIE46CUPDqWRyaWMg
Q2jDqXBpZWQgPGNlZHJpYy5jaGVwaWVkQGdtYWlsLmNvbT4KIEY6CXBhY2thZ2Uvem5jLwpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCBkZWYz
ZGIwZTUwLi4yZjhhYjI3MTVjIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9w
YWNrYWdlL0NvbmZpZy5pbgpAQCAtMTc3MSw3ICsxNzcxLDYgQEAgbWVudSAiR3JhcGhpY3MiCiAJ
c291cmNlICJwYWNrYWdlL2xpYnJhdy9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2xpYnJz
dmcvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9saWJzdmcvQ29uZmlnLmluIgotCXNvdXJj
ZSAicGFja2FnZS9saWJzdmctY2Fpcm8vQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9saWJ2
YS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2xpYnZhLWludGVsLWRyaXZlci9Db25maWcu
aW4iCiAJc291cmNlICJwYWNrYWdlL2xpYnZkcGF1L0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbGlic3ZnLWNhaXJvL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGlic3ZnLWNhaXJvL0NvbmZp
Zy5pbgpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNDYwMmU5M2MyYS4uMDAwMDAwMDAw
MAotLS0gYS9wYWNrYWdlL2xpYnN2Zy1jYWlyby9Db25maWcuaW4KKysrIC9kZXYvbnVsbApAQCAt
MSwxMSArMCwwIEBACi1jb25maWcgQlIyX1BBQ0tBR0VfTElCU1ZHX0NBSVJPCi0JYm9vbCAibGli
c3ZnLWNhaXJvIgotCXNlbGVjdCBCUjJfUEFDS0FHRV9DQUlSTwotCXNlbGVjdCBCUjJfUEFDS0FH
RV9DQUlST19QTkcKLQlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCU1ZHCi0JaGVscAotCSAgTGlic3Zn
LWNhaXJvIHByb3ZpZGVzIHRoZSBhYmlsaXR5IHRvIHJlbmRlciBTVkcgY29udGVudCBmcm9tCi0J
ICBmaWxlcyBvciBidWZmZXJzLiBBbGwgcmVuZGVyaW5nIGlzIHBlcmZvcm1lZCB1c2luZyB0aGUg
Y2Fpcm8KLQkgIHJlbmRlcmluZyBsaWJyYXJ5LgotCi0JICBodHRwOi8vY2Fpcm9ncmFwaGljcy5v
cmcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlic3ZnLWNhaXJvL2xpYnN2Zy1jYWlyby5oYXNoIGIv
cGFja2FnZS9saWJzdmctY2Fpcm8vbGlic3ZnLWNhaXJvLmhhc2gKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IGQ5Y2ZiZmZhN2EuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9saWJzdmct
Y2Fpcm8vbGlic3ZnLWNhaXJvLmhhc2gKKysrIC9kZXYvbnVsbApAQCAtMSw2ICswLDAgQEAKLSMg
RnJvbSBodHRwOi8vY2Fpcm9ncmFwaGljcy5vcmcvc25hcHNob3RzL2xpYnN2Zy1jYWlyby0wLjEu
Ni50YXIuZ3oubWQ1Ci1tZDUgIGQ3OWRhN2IzYTYwYWQ4YzhlNGI5MDJjOWIzNTYzMDQ3ICBsaWJz
dmctY2Fpcm8tMC4xLjYudGFyLmd6Ci0KLSMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIGEz
ODBiZTZhNzhlYzI5MzgxMDBjZTkwNDM2MzgxNWE5NDA2OGZjYTM3MmM2NjZiOGNjODJhYTg3MTFh
MDIxNWMgIGxpYnN2Zy1jYWlyby0wLjEuNi50YXIuZ3oKLXNoYTI1NiAgZDgwYzlkMDg0ZWJmYjUw
ZWExZWQ5MWJmYmMyNDEwZDZjZTU0MjA5N2EzMmM0M2IwMDc4MWI4M2FkY2I4Yzc3ZiAgQ09QWUlO
RwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzdmctY2Fpcm8vbGlic3ZnLWNhaXJvLm1rIGIvcGFj
a2FnZS9saWJzdmctY2Fpcm8vbGlic3ZnLWNhaXJvLm1rCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCBmN2ExMDVlMDNlLi4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvbGlic3ZnLWNhaXJv
L2xpYnN2Zy1jYWlyby5taworKysgL2Rldi9udWxsCkBAIC0xLDE2ICswLDAgQEAKLSMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCi0jCi0jIGxpYnN2Zy1jYWlybwotIwotIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKLQotTElCU1ZHX0NBSVJPX1ZFUlNJT04gPSAwLjEuNgotTElCU1ZHX0NBSVJPX1NJVEUg
PSBodHRwOi8vY2Fpcm9ncmFwaGljcy5vcmcvc25hcHNob3RzCi1MSUJTVkdfQ0FJUk9fREVQRU5E
RU5DSUVTID0gY2Fpcm8gbGlic3ZnCi1MSUJTVkdfQ0FJUk9fSU5TVEFMTF9TVEFHSU5HID0gWUVT
Ci1MSUJTVkdfQ0FJUk9fTElDRU5TRSA9IExHUEwtMi4xKwotTElCU1ZHX0NBSVJPX0xJQ0VOU0Vf
RklMRVMgPSBDT1BZSU5HCi0KLUxJQlNWR19DQUlST19DT05GX09QVFMgPSAtLXdpdGhvdXQteAot
Ci0kKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCi0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
