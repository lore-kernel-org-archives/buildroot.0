Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EB6C9830B
	for <buildroot@archiver.kernel.org>; Wed, 23 Sep 2026 17:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9269041224;
	Wed, 23 Sep 2026 17:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09rF2yt1UoSS; Wed, 23 Sep 2026 17:54:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A8AC94EBB5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790186050;
	b=N14t1eZELtMrJx3+8lTgbPa7wOpdPe0KTerx3TvOsdjzkhA5DqlDsaw6HGbf1+Md7pcQ
	 aBjbYN6M+VtDA1OBxynRBlXFKazmuhJvYSXuV3qvakReAPpwwSnKIAhxgtOs4X2uFtxzz
	 +hLgDwPEoYePL4JhtUm8z7Xz+USld4LsSEQqTDfksL1e+uGo6JLrEjbzvycfR9SbEtFoq
	 me1+Ptq43/mce34ch5BI6siHNtIEIgA5F6Y+JlykciMcf3YqrSUI2lO0E69hqlHCkFwe2
	 swiQwNg4nmsE8o3vASoYBGaL23MYGX0OhkpaB+IlpLf7aI5kb1qtK8uBnFzKPZ5Pe/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790186050;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yBwvb725j2zBFGlSm+kPB4sfnHKXAJIus7t6u4Enkvw=;
	b=jCi6xTHAOLwG9DLWOE93BN3VBYUh1aGZqVbkivls7vaBzBG3+wwRDl8N1isJXwJEGKBA
	 PYv7hBa2qfEaqeXLuRPRLqkH/2NtQKfrnaiJ4vgyLngIksUvf3tGAhgf9I62vY0W+CQEf
	 4kS+rM6YcCgZjWZ6Nh5q8R4dZJPW83dEi1iqzZojvQl/jWVSTSB6fq6Ye6X2YM31BssSg
	 Mw4PQ4kQB9CcimW9/GPvftv0Iw2FHDvjfNtVA5OAFkWXNBtNzBh0Wu9FCorOBSOX/rG2C
	 x+8taHc9lYvQSBItHDwAcAGeMosDL8KwC9B8qFpW1XPP5alOnJlc8kJ+P74uD/jJlOw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=G1MUiuaI;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790186050;
	bh=yBwvb725j2zBFGlSm+kPB4sfnHKXAJIus7t6u4Enkvw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WkBm/ZaCwNZmNitQnznupq1Xgw3l4EiEabSulNY+onhsaroTnydGDTDoLCNKVfPZ6
	 JhcDo0g7QxFgH9AIjQUtFIzoj/CnI8xQ0bD4Y3/f88B5Lbuo7o7G3+LZxsjCMj9GIN
	 9FTiLU/udh661CIH1mT2A0AfMwklltH+KrWFKuu5lkTBuVUI2JulxoKPJkXV3eCmBf
	 8lcnmCtrCFjXK/8ThlFgJA3Q9Gm5dnFyTAuMWks6QMg7XYdqdzduolUuuYl3hYtPO/
	 Wv0MhbfUjgzvJEKLO4ZiiV3//Ls0hpv2cojAyhu6rz+EGlPXOd+zlNAfJGLF+DaPkI
	 OoYi2AJQjJSLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8AC94EBB5;
	Wed, 23 Sep 2026 17:54:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 731113FD
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 17:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 585D349999
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 17:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AC3q25Oc6x5p for <buildroot@buildroot.org>;
 Wed, 23 Sep 2026 17:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 823F04179E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790186030;
 b=ST1opKK1QQn58IDGZFlkg3+oLnQcPPdgtfy0arRt1kWITBuOv2rGyt5Ip3xqpX6Dtq+4
 Dxvo/CcHlfZNJeTLVfIX26uSpdyavGcf9OPtV9/O7Ya6jEwrORsoVOoQ7AcjOObtEkkZO
 w1leTsKr6MAvE65Ny3jzdPQQhjLOJkD/hFqHku2W9yfh04+C/69mV9mmvq1pdtG2NRdC1
 R7iogQk5GpSGINXdvOq7kKH9yZMQZLr/Wn2i/3ZaF5fKCGzspcibwq9kDg2cVIPbZqdvM
 qDYBXgBOOF9iXNZ0OzKRREnkPSTQHRp3pWwSVo1xxB+YbE0n3l9qUJ7StaIk9cwYtdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790186030;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=fVXm+jgBW6GW79Xo+QnoRF8NgbxfIqPlw5Uw0dgkL5w=;
 b=lvPafrxIEWs6oaL10G1lq3OPKkAPbgNlZFN5buQRlWa9uwR+Ls2uPaC40YDRebSGAwlg
 DKJ4jIBwPCeLLSYyki4bRp4Erou7qeOtjQNZdDQksUHzvtr1tDc/H+f1ET/kdRB5CwwGl
 4rh+5g2zrQFrWx/nuqpkkP9PqcEjzvqOvScTRmbT6kgMTFYqXsEQZ3+NeCueoP/SM2Trc
 +5XzL676nY8yJJ7v6Ty/1K9T5R2Vb+IZQBVsghCp/CF2QnmQN4TVkEBE1lUPOj9y+/DrZ
 ILsHGAT+m6sZu6ORTuZU6QkZUYC+9lOCFtS/HmIzRRmx7iQJV40jQ24GlSxkKMzmSdQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=G1MUiuaI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=G1MUiuaI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 823F04179E
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 17:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790186026;
 bh=fVXm+jgBW6GW79Xo+QnoRF8NgbxfIqPlw5Uw0dgkL5w=;
 h=From:To:Subject:Date:From;
 b=G1MUiuaIVGIkApW+H7Cxq2OovvorjOduHtIitOu36uXfHXM2NHy1sEEpqy/J3VUbs
 29bkTTQqkehTJ+t8GWMcB3QuIAQBOZrUoW3lyN/o+4rysyW17uxxlk0DpAFl1HHX9O
 dKlsIsRUHPjkd1j6jUVSaI8jS1I/cijOklNIbecg76zegPpDrBtf23DhRNsf9hjjy1
 dTvkQV0/ajWMhiV0W/ErWLyzXnzYrmpl12CeA8jRhBorx9tQ761JGdB981bDoO3ail
 d1MOLj655hFcTbEHjKMq05ODV0RV1guNKiLETrp+qp44M0EvIoJOUHt+BqYvDGBF4u
 x0ofQ61wd2bNA==
X-KAS-Sym: v3:f51bdf72230551df:rEY1wRlR19tLcJsTuA1QsdN49xSi7qBRnTJUGgrQ863Fj
 rjterHQ2MoA1GrwT5Boog0d2yDCbPOZ5RaXT7i0wrAjfOmSS3ofz0lHq9Kt3cdbB3hWXHT1cKu1
 lYoRwmsJry45ettdLGAEAcNFVtwIq7M3H7EOTo0k72vgYEM/lRqd6WSq3NHgGEp5UxdeElWi+nv
 WS8A+EYMfjzUTRWrzxlyA6Jb+NZhL+EhpYt5xge/dr46gxf158L7rctw/cLbOpPJgeWLyXMlpjM
 8INkmqcyG3kXV1nHTSZW/95WgJORYPSFxnS5UL0bVapIoG8WGgItoZYuzr1R9ne940HaSNLA==:
 tA5ej8215kB7gVt1n4ZV1t/bKoW/9QT/RBfMdv0/KDYyKqgBh3ouqoCIfHEjY5UL4mKcyzUsp7e
 mDGjV/+l63RbgwCx5wq6VbPIBC1iDf0Ci65g/qyUPzIq7R57sJ39ui5RfSYqpsGvSr6Wa5Nowic
 qWtjduTtbGBiYBRNsRHMSAbFihqAOtEcQgXItB1Vj93tp5iCG1an5LjIQJfEbeGgTqEweBRpKKO
 abmbgBm7LqaP8XI7VWCJyZeqG2/M2zJiRMulA2Ur9UuBwkASxGs5wUxoIj0LAwsvAVRPfRnGh+4
 QZVf0PeXcozV8ior4jRfCaogM8dWJHUkVuShsi00+3JcpslihSsH1ETxLlEXb0i87K3BY1Epi47
 nrzMhnKtG3G3cF9YdCWggO7CArk57EMi5+jaJvqulz92yUGxdQzhdcS6MLeDRgP71IZYpNziwcj
 MY+NCDYTcfWKKdXeUavU1WiHd7MP0sPzEGY6OqG/lSQmZTFA+flqwMrYqWTt5HPg60ZJe75OzVD
 dnWFqAwdVk8ojvMzp8ovr+IwlnCfLxzg0BCwRnIOLw4GF378mmfAcT992XKBT+191XnGJs3Lrhc
 oMuaCyI/6h+s+idhM9mJstPRcXtv4A4L/00N8ba6KEzSug==
Received: from fli4l.lan.fli4l (p54a1b329.dip0.t-ipconnect.de [84.161.179.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1EB7A4C12E2
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:53:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59822)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x9RAA-000000007IR-1fgK
 for buildroot@buildroot.org; Wed, 23 Sep 2026 17:53:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 19:53:46 +0200
Message-ID: <20260923175346.2187135-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://sourceforge.net/p/fetchmail/mailman/message/59396310/
"It also includes fetchmail 6.6.7's security bugfix for NTLM, which
has now been assigned CVE-2026-94184."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/15bbdb0dad25b25950f48694bbbd79122f0f6c8c

 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 023667e207..0fc6eb55dc 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59381086/
-sha256  bece8aaaa68e029eed9fd55fffd2adc7dd6cd5e9574d5bf92e2d9208bd97a881  fetchmail-6.6.7.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59396310/
+sha256  fff279d7ffbf4d9449110f715c0deb5ff5a2b13b317914b6f2c810ea12a0b7e1  fetchmail-6.6.8.tar.xz
 # Locally computed:
 sha256  48aea24325e55932dbd79b30f558b9c87a416d675fe5f94445e8be5cb6606fde  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 9d00d876d2..92cf3fa090 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).7
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).8
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
