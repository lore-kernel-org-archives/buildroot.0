Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7167C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 10:33:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 183FE60E73
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 10:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 183FE60E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embedded.rocks
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4313605D0;
	Sun,  7 Nov 2021 10:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uAtIvBERcF6W; Sun,  7 Nov 2021 10:33:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 188B660590;
	Sun,  7 Nov 2021 10:33:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B93A1BF3AA
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 10:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2CD6605D5
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 10:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LG4kIvSwIOnJ for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 10:33:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05C7B6002E
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 10:33:19 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id A50E1240027
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 11:33:16 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Hn9Z41yPrz9rxL
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 11:33:16 +0100 (CET)
Authentication-Results: mail.embedded.rocks (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=embedded.rocks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embedded.rocks;
 h=content-transfer-encoding:content-type:content-type
 :mime-version:x-mailer:message-id:date:date:subject:subject:from
 :from:received:received; s=default; t=1636281194; x=1636885995;
 bh=xWhvpvhlQTQbu6wFPRI/xG9Y96+nlESAI+5x7QRZjiU=; b=oQnjXjJXdOYO
 d/49i7eLlyokOW+iTbCeJQa7NgUloHaT/X0Pr/OQywVF32lzBqYkp1YfM9+5nJE/
 FmjrABsuVcTzVydN07+FC5EuY+8IGnyPNCDXp2dHW4wKka5HdLusT22rZmUTm+sE
 7y9+AmI5JYFecxG2Bz72ucSzGmUmkxpR7QuAl39Gv5ziPqInBodLtQIaQEJ3zDkj
 ryzKaXOWe2R9V7/cHe1MiOoB4tkIRsylR+t6b3Xm4gJa8Es2gr7NhNMOS5489F/b
 I79xW45H/oY6yy9NtjFyVYWFHhDBdgflWsUJM+ZCb21nygUgZkVyqQxU8sRiPyjG
 Xyb6VLVGXQ==
Received: from mail.embedded.rocks ([127.0.0.1])
 by localhost (mail.embedded.rocks [127.0.0.1]) (amavisd-new, port 10025)
 with ESMTP id SkQo2ff-8cJh; Sun,  7 Nov 2021 11:33:14 +0100 (CET)
Received: from nzxt.fritz.box (port-92-193-208-175.dynamic.as20676.net
 [92.193.208.175]) (Authenticated sender: joerg.krause@embedded.rocks)
 by mail.embedded.rocks (Postfix) with ESMTPSA;
 Sun,  7 Nov 2021 11:33:14 +0100 (CET)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 10:33:11 +0000
Message-Id: <20211107103311.128510-1-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luv: bump to version 1.42.0-1
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+
Ci0tLQogcGFja2FnZS9sdXYvbHV2Lmhhc2ggfCAyICstCiBwYWNrYWdlL2x1di9sdXYubWsgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHV2L2x1di5oYXNoIGIvcGFja2FnZS9sdXYvbHV2Lmhhc2gK
aW5kZXggNmRmZDhiOWYxOS4uMmZiMmI1YzRmYyAxMDA2NDQKLS0tIGEvcGFja2FnZS9sdXYvbHV2
Lmhhc2gKKysrIGIvcGFja2FnZS9sdXYvbHV2Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2Fs
bHkgY2FsY3VsYXRlZAotc2hhMjU2ICBiNTIyOGE5ZDBlYWFjZDlmODYyYjYyNzBjNzMyZDVjOTA3
NzNhMjhjZTUzYjZkOWUzMmExNDA1MGU3OTQ3ZjM2ICBsdXYtMS40Mi4wLTAudGFyLmd6CitzaGEy
NTYgIDRiNmZiYWE4OWQyNDIwZWRmNjA3MGFkOWU1MjI5OTNlMTMyYmQ3ZWIyNTQwZmY3NTRjMmI5
ZjE0OTc3NDRkYjIgIGx1di0xLjQyLjAtMS50YXIuZ3oKIHNoYTI1NiAgY2ZjNzc0OWI5NmY2M2Jk
MzFjM2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2MxMGYzZWIwMDM0MTdiYzUyM2QzMCAgTElDRU5T
RS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHV2L2x1di5tayBiL3BhY2thZ2UvbHV2L2x1di5t
awppbmRleCBmYWU5NGZhNmIyLi4yZGM5YWYzYjdhIDEwMDY0NAotLS0gYS9wYWNrYWdlL2x1di9s
dXYubWsKKysrIGIvcGFja2FnZS9sdXYvbHV2Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotTFVWX1ZFUlNJT04gPSAxLjQyLjAtMAorTFVWX1ZFUlNJT04g
PSAxLjQyLjAtMQogTFVWX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbHV2aXQvbHV2L3JlbGVh
c2VzL2Rvd25sb2FkLyQoTFVWX1ZFUlNJT04pCiBMVVZfTElDRU5TRSA9IEFwYWNoZS0yLjAKIExV
Vl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKLS0gCjIuMzMuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
