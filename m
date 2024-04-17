Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84A2C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 21:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D91F40569;
	Wed, 17 Apr 2024 21:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fPZscg_XUwS; Wed, 17 Apr 2024 21:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D90F405AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D90F405AD;
	Wed, 17 Apr 2024 21:26:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93AA51BF267
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 21:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8028940A6C
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 21:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tk2O5P5N6NA4 for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 21:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.66;
 helo=mout02.posteo.de; envelope-from=gero.schwaericke@posteo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA94340104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA94340104
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA94340104
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 21:26:54 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id D180B240103
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 23:26:52 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4VKYrX1NCQz6tlh;
 Wed, 17 Apr 2024 23:26:52 +0200 (CEST)
From: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 21:23:43 +0000
Message-ID: <20240417212614.963345-2-gero.schwaericke@posteo.de>
In-Reply-To: <20240417212614.963345-1-gero.schwaericke@posteo.de>
References: <20240417212614.963345-1-gero.schwaericke@posteo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1713389212; bh=WJv6WaKVD078jKtCQEkOX1vjzcrrcW1Gwovte1/R0rk=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=cjGgXJADazVENwEy47MM2235FX8mVi+AdViT0fRhxknN4AIb8irHXFBM0Dj0w0ZA2
 ylep+EtygsCXWtk069uGj5eTbcEISJI7ntGmNCQ6MLpEb4WWnhthdN78pvFwZGLRA2
 0kpdSWoAFScNOwuKBPwNFZJFpdQBwaOJZCglUXgSx2lOlTNg2iGdcf+jZzqdRbxFG/
 WaQEHYfNNufWaIMHeVF9myxg99SwbKSvCNycvzK5iQ1Ddwgn+erlhm+IvS+LUm9Y4J
 6V6SEw12HyTt+W4qC/I6E/Vof2gId5cHAK4mvKHk6v0ZSV4LXhl8da2ZTnSgl4smEt
 sAZtJajyMmvuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de
 header.a=rsa-sha256 header.s=2017 header.b=cjGgXJAD
Subject: [Buildroot] [PATCH 2/2 v2] package/linux-firmware: RTL_88XX_BT:
 remove listing of specific module names
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVwbGFjZSBkZXNjcmlwdGlvbiBvZiBzcGVjaWZpYyBtb2R1bGUgbmFtZXMgd2l0aCBnZW5lcmlj
IGhlbHAgc3RyaW5nCmJlY2F1c2UgdGhlIGltcGxlbWVudGF0aW9uIHN3aXRjaGVkIHRvIGdsb2Ji
aW5nIHRvIGNvbGxlY3QgYWxsIHJ0bDg4KgpibG9icy4KClNpZ25lZC1vZmYtYnk6IEdlcm8gU2No
d8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAcG9zdGVvLmRlPgotLS0KQ2hhbmdlcyB2MSAtPiB2
MjoKICAtIGZvcmdvdCB0byBzaWduLW9mZiAoc29ycnkgZm9yIHRoZSBub2lzZSkKLS0tCiBwYWNr
YWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGludXgtZmly
bXdhcmUvQ29uZmlnLmluIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4KaW5kZXgg
OTIwYzBhMmVmMS4uNTljYWZjMTRjZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saW51eC1maXJtd2Fy
ZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4KQEAgLTEw
Nyw3ICsxMDcsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfUlRMXzg3WFhf
QlQKIGNvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9SVExfODhYWF9CVAogCWJvb2wg
IlJlYWx0ZWsgODh4eCBCbHVldG9vdGgiCiAJaGVscAotCSAgUmVhbHRlayA4ODIxYS84ODIxYy84
ODIyYi84ODIyY3MvODgyMmN1Lzg4NTJhdQorCSAgRmlybXdhcmUgZmlsZXMgZm9yIFJlYWx0ZWsg
Qmx1ZXRvb3RoIG1vZHVsZXMgODh4eC4KIAogY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1X
QVJFX1RJX0NDMjU2MAogCWJvb2wgIlRJIENDMjU2MCIKLS0gCjIuNDMuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
