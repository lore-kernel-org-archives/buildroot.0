Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA05AC6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 21:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A90560A40;
	Tue,  2 Apr 2024 21:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQ51lUDF4mys; Tue,  2 Apr 2024 21:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3934260652
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3934260652;
	Tue,  2 Apr 2024 21:09:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AC001BF295
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E337A41577
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhbsxIMRoaB4 for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 21:09:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.65;
 helo=mout01.posteo.de; envelope-from=gero.schwaericke@posteo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24C11408C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24C11408C7
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24C11408C7
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 21:09:10 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 0B82F24002A
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 23:09:06 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4V8L8y2xl2z6tm4;
 Tue,  2 Apr 2024 23:09:06 +0200 (CEST)
From: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
To: buildroot@buildroot.org
Date: Tue,  2 Apr 2024 21:08:52 +0000
Message-ID: <20240402210856.67418-1-gero.schwaericke@posteo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1712092147; bh=txEcvme2cieemU9eRJeSGIg3AFlZlIMIcoVqEhp41bE=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=A6TrBWlllsZXHEfueom9x9Ct4lpijRY2O/vmAFKwWAR/hFAMkbgdLKu+SjtadzGqz
 11wvL7Bch0l2lk+BcdcNReAMwAjpLG9WKOLNqfdeloFj4ZCHpxC8fADn4+t+Mypqk9
 7tv//8XgRGJ9X4tuwk9gcuPZHnK7vBoquOg09hArvvyB8dxDIT8Zy2Ezcb8SCyWMJU
 v1oESQYXebmKKgy+gwzLgPCWqfDKK03otwSZWJYCwgB5Q5Oplx00DhV3C9qTFj89Cg
 bN5qk5DTtKT+fZ6AWFtmtcpfi9f+4NQ+WT+JlWeOZ/0mwL0tUhZJkZDPtdZns73BDA
 sdLx4cX+6WGaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256
 header.s=2017 header.b=A6TrBWll
Subject: [Buildroot] [PATCH] configs/sipeed_licheepi_nano_defconfig: fix
 missing linux headers
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGJ1aWxkIGZhaWxlZCB3aXRoOgoKICBJbmNvcnJlY3Qgc2VsZWN0aW9uIG9mIGtlcm5lbCBo
ZWFkZXJzOiBleHBlY3RlZCA2LjgueCwgZ290IDYuNS54CgpGaXhlczogaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82NDk4Mjc4MDc4CgpTaWduZWQtb2Zm
LWJ5OiBHZXJvIFNjaHfDpHJpY2tlIDxnZXJvLnNjaHdhZXJpY2tlQHBvc3Rlby5kZT4KLS0tCiBj
b25maWdzL3NpcGVlZF9saWNoZWVwaV9uYW5vX2RlZmNvbmZpZyB8IDMgKysrCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvY29uZmlncy9zaXBlZWRfbGljaGVl
cGlfbmFub19kZWZjb25maWcgYi9jb25maWdzL3NpcGVlZF9saWNoZWVwaV9uYW5vX2RlZmNvbmZp
ZwppbmRleCA4YmUyNjE2NWQ5Li42ZWI0YTMwNjlkIDEwMDY0NAotLS0gYS9jb25maWdzL3NpcGVl
ZF9saWNoZWVwaV9uYW5vX2RlZmNvbmZpZworKysgYi9jb25maWdzL3NpcGVlZF9saWNoZWVwaV9u
YW5vX2RlZmNvbmZpZwpAQCAtOSw2ICs5LDkgQEAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX0JB
VURSQVRFXzExNTIwMD15CiBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJzdXBwb3J0L3Nj
cmlwdHMvZ2VuaW1hZ2Uuc2giCiBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJk
L3NpcGVlZC9saWNoZWVwaV9uYW5vL2dlbmltYWdlLmNmZyIKIAorIyBMaW51eCBoZWFkZXJzIHNh
bWUgYXMga2VybmVsCitCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfNT15
CisKICMgS2VybmVsCiBCUjJfTElOVVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X1ZFUlNJT049eQotLSAKMi40My4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
