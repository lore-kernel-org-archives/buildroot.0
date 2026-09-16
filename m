Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E24C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9430E80E95;
	Wed, 16 Sep 2026 20:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DoQV5bUrKfr3; Wed, 16 Sep 2026 20:53:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A024E80E31
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789591998;
	b=k5hnTOAxJKpSYlnuC60+fjGsJaIsn++ZifbNMM2EefRjIxggGtjBIY7mfSeqOBu/5Qtv
	 lL8cdWGZcHzjIwpjCPtArEk8N2PniJzK0vCUHPMnd76ifVBjL7dmrZCkq8696VBlIsZgi
	 4xxwQq6iBYzgVEkdiu4s6B3wJ32tEPk2tFQaanekng5iNYUm0iezUM/4zr2KXEvm8AyX9
	 JDE76Zb+uM4mbrnq35Wqe1kYhWnO1/fYLmlzz7pozbVuA0Ag6CcCO7g5cWswRxTprSRKW
	 uQynL/wFEVINw9q1bPqpaDL+hQ+EmGte/WskY9QHrbCC9MyuITbQnN7gX2GlgM7xmxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789591998;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0UogLgL6BspjJt52UY3Lol+V9ooXITooUy7k+iuKEWA=;
	b=R8yLpI/hjMNH+4qgAqmQ+Ni/XaCRz4ge2h1NIIxikoYZL2NhcqHbKhv7wN0gQO4bVjZz
	 IEVuGKmhlP6764Kp+QhCU8MlN8BvZXgtmQ6f1Y9O6H578ArgBKR4V+LuBWp6NiYv+j5eS
	 zDaeHe6wckGTwsvSXyTyfZphPwBr+F2ZEeEF6dvQs5QhLAsBsg9N7ORQMJH44oT7sRJZI
	 eiO4r6ONoXTcgWKuZnGcayIYXyxRJQqoXY2Mb/3bzJoALoCmETyl3hbEUxanxgRqSImm/
	 tsPinKnIzQOGKjMkMYssuvrDRvblI8z3LEPPhumpGwlhmJhiMPC5x7nGBp0eNh7vjMA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789591998;
	bh=0UogLgL6BspjJt52UY3Lol+V9ooXITooUy7k+iuKEWA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dOi/LHVB+XxqbU1P/VJKaZz6AnUnmrstJA6PFHtSy9ncvX0eN14Xe+PMVTaNBflw3
	 W/DVB+OgjW354uK58t6TjPEEp2EUKFT+MDq/4uBvoJwXvZWBFflHful740458VhtfU
	 7UQG7QPOo+I993QNJYEVNcLKvckFFBJ4TmDnEdV9kLpNhX99BjIBV6EwVZyiWGY+iB
	 I438dEzjRbpK6epP3gDd31Gq0W6j1FUzlGmUb0+kW34yWzuhcDaHYthwpGUKcukHZ/
	 7OOJ38rgFjRY9tpNZ7NMSq7bxxlP+2jw6dbGxdO/DVr6+s3FcTrzXo0MfqtTDzFub+
	 vbXEYvG03vQvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A024E80E31;
	Wed, 16 Sep 2026 20:53:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B8BB2EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DDC96062C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LExS4Vw-h-Ql for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:53:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 45C236061D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789591982;
 b=Gid38ntbtFTxAVdOX5G2LWHCtUe3iKqLVHhnowFSxs6T3INNbdXqk9UsCY5yASv+tSk9
 owrM9XxrSr5Kw7QDPyFvABAfDetlZ8pnqc/EkiPWyu9aQ2Hg0UzjluQCPPdeJk87qMUsr
 QN3r9GG5FlkjQHP0MUwrUL78f89XRxKovgdFPgtonOGS2m/YxGqayAkyGzi/Mkuq13BAx
 f9ih6bHvSQKI30vD5licEv2xbRScpsBlzN2r2pMcoEqBLHGOVAxzNlo9Yn2azUC45LaKA
 QuERCF4rsXud3ajSkM8abecqbX5xG7dZGaZe67bixaIRYqUc4yo3eRbZbEQHcMoKSIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789591982;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=58xdyAgeGFJHDS/lbWCyYr8hSwvUrkb8HBpx2QmDex8=;
 b=kmJjd9Y2SKgrEvu4gg3FKUSQMIbNpEqUfZLnyo55JcHetGmbD4C7FChoel2QzKIYWTnZ
 CsjUPkuOqW6xeJroFsr/okvPgb6jq1POcfVSRqLuXhyKFi7JSkYTrfsP8hPK4Dk0/W0xj
 akdV1pH1Ivnnnzxczuh/5IPByPQ719vhRlsQcPc4emJP/+eqAg//qdmibQB6jtSVgo1x4
 ZZ+OKhqKN8DADRNGW+XMzEkVh16R5SA9ZOccY3kH7hlbdRcKMRdmFvian2iLvYypgJHRa
 DG+7aN/92u4QV65X9CVdLq8GEe9cey+rQsP8H/ddPyc9lBMn8R1z9UKCM1MAcMpo44w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WRad8s3O; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WRad8s3O
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45C236061D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789591966;
 bh=58xdyAgeGFJHDS/lbWCyYr8hSwvUrkb8HBpx2QmDex8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=WRad8s3OWimyyz/S1YOLiTVscJUZCdrAUr3ePiLGm/U2HsKJSQ0D6V/4sEfRWZBA5
 fcCb/OidjtNpyNupP11FuJQgCdQ/9mRe9igi3TohLzPfzAECL0E1c7Y3WqmbmumCRY
 i7NggxZUmqxUP/iSoIc707WdNyPgBvrbg/1cz1G6V5LS5mmbVuEu8VoLDy6b9tN8Fj
 PmLtwBclvCGJLpCHNHv/oqUbR3sMGveyyG3oZzU8E8dO0BNiFlZMfhvDKRcf1yjEDA
 eykRtNz3rFSRax5E4N8gG/0naq9OYce52nT3xhD028Dgb/oots/Ca9c2IYYq+vVUMG
 m4BDTGQoaSigQ==
X-KAS-Sym: v3:f51bdf72230551df:P5i7rol47wXqNiv8pONJjTVgRL/jPapltORO00Zs9PXQNKbI1vrKLd20xQv2zcbdNIVTgfmtUsZUTWj3dBcnuAodQ5M6l2kPuD/n3JsINhVg7i3tiOtHGXQI7pOHFib9Fq3k7FU4I2IKYuIn6WaJ4Xi/EBUc/KXqlexkvXJQuPhKRgfxTjZcVGZMX60hkREkTmGyz5+idZiMSUL2cg4ToOvCQ2qn4lUQK3kUk/sNy3TcCCzgheBwMEM5epq+JNwKVO4ZSx0z7CKrR5Ynb+b7qKPjufGRMN+VZVOwOFaDjGOt5WLeg+kP7pbeITaQyyLnFIu9WMgY4PsShD1rIkndlQ==:31zYuvwyF/7qk+gpbG+gWic6Ty9gcro7s4gqv50D1mn3JELMCryjsCHJgBuIEP9MyJ5qhjN0jqV4vy/8oGpLm+R+vB84dUx6rbuRyEnCWO2mpXiPZDg8NI6S80eMloCPkErdVHG/dIsmVkKppKauEKsB8Q7OAeHtNCM/356rFgFwHw4F5zx7N6WYOGZMuPbvd5OQT1gFxI0IilZn5z/FtsRWIjkXgXSPwUyzfi7TM4xflXV3qm06LNRtSrTOeD3z0BJ0ECRnpRCDVpPe4O0uQEYVKOgKbaZaUHPDOUs7S/GMGxYFAr8egdPDU/pstOjdU0w9Tl3p23BCQ5YLMSbXrqdH5QR44TYYxrRBXwLE7lOdwuiZmyu97M6TtRzXGq+d1FZOLwiHN6Nt25uq4hmcckBO69LnP/Hzki6IZvDP3YixR10gH3YwV5b2AyOsagKOtZRM7ci97AbgJCYipsokp6s2aJDyGczVnvCjgigOW3s/6gDzHVvSt+eUbfuTgVkH+vciKv7dWykf0gxVo9N70cZnEVsJdUdFVXTKLdnKcNhCqDZc/R4VPOTdv86uUs6ROyC8bzkesbTyShZdTy0YsVTjIB9Y6CS2sJMHHcgJauSqk3
 fSsIKue4XivpDm38iVoslIHA==
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13797A4C421F
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 22:52:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60458)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6wcX-000000002DC-1SJe
 for buildroot@buildroot.org; Wed, 16 Sep 2026 20:52:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 22:52:45 +0200
Message-ID: <20260916205245.2349520-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916205245.2349520-1-bernd@kuhls.net>
References: <20260916205245.2349520-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 2/2] package/ghostscript: security bump to
 version 10.08.0
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

https://ghostscript.readthedocs.io/en/gs10.08.0/News.html
"This release addresses a number of potential security issues."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ebe6eaa9932490d58aa2eded1e2ab76d399f13a1
with the exception of an unrelated build error with the
bootlin-arcle-hs38-uclibc toolchain.

 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 94017262df..00cb1378d5 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10071/SHA512SUMS
-sha512  7b38ca10fa7ab648924f7db3e2e4933c3d18e04c8db1346fca4d4f7b85dfbd7888d5fc46f413613b46429fb47b675a593994c25e50e9de4dcdbee3bdd8a5e449  ghostscript-10.07.1.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10080/SHA512SUMS
+sha512  8006e2a32d03759a905b9548bdd83d4563173041006750e17e428b9eea24ad519aa4452ceecd7c073d3c420a68bf1b07ccc9e0533b1a05935f6b39ea8d9ce875  ghostscript-10.08.0.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 08e2667981..288efe2674 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.07.1
+GHOSTSCRIPT_VERSION = 10.08.0
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
