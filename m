Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B77BCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57936811FA;
	Sat, 10 Oct 2026 15:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id na9Sdbk7hd-P; Sat, 10 Oct 2026 15:19:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 91B018115F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645549;
	b=lfCpvg+YLAF61UpC13q25rjymIg2z3qR3sLAwCi7WlNfI+82zgNqXjOCgSErZRSLVIP+
	 r2LMyFXGAW8ZI/JO3cWuZfu5e/V857mylpXvYfEMJL5vzE+n/hiOe9ypRjiJeuISEYhGu
	 sczzrjS0NwqjD8V5HnUReXL9GU/lljEF09HiGlqdbuK8D7nKOI0n7sl1xJxHO3vFAAB/7
	 mAf/duMl1l53fQQKTi5cFw55Y+NSi891jFED0cXrXmzkllBdQY3O5Mr46yyGdr6AuGltD
	 DE7yGduVubfxQobtrqcPGkGeCEV60Csc93Ik/YKy9bWOsXjHDA9VGbzLAXZq/ulodaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645549;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=T69QCK7soCEOraiA/PmJXLZdiarbDx1mN9Qf919Fw1o=;
	b=NT44nTsI0anDDNOGp3RHfEfGxbkHSKet6DA3tsJLrtIqf3HEn48eTxZ1u6IBoNhK+gGi
	 RUruMxzwgojY48aUx7O28hFTjpRGQgg2iofkg/hSpmHz9gxjlrkZCmAAi2G41uT4QbWj8
	 JadwLMcu7YCzZ/QsbqXq5fhSPEUiG9dExjPXgRneavnBIfwestVjzXwA6BEjz4R8IqOOK
	 PvOd1QIEXucajtReGiyxT5/CA4fAoXYd3QEjBQ2tTZ3/KWHldYPwlGl6+QmyX+QIrN6rs
	 5zj6DxpXBJejz+h2MLRo+Efev24Wn3ioYRf7AHTpTGzOCNqdZq4Faj1WiVUGvZmfO/Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645549;
	bh=T69QCK7soCEOraiA/PmJXLZdiarbDx1mN9Qf919Fw1o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eHIpCPC9GytOp+blODrGfh5NSPneWAOIlAw9XAQANJzBOi/blqseqrD1J1Glmtoz2
	 LyWD1+XXh1fJHMbcuy3820MIUjkRXKps2hcHvxQP2yUoqJDBJ9jl4Dnh4YRnK05k/N
	 Rc1RF5hPl9m8mY2k3OGp8P6wQgEL8jgaC1qb0L7gTdf5vsSequsQaEAnu55LITY610
	 MKCdUxY9DOVYEDMIvjQbHsr0OUmskcxT5z9Bvf7jK1LnOBH/2mQy6XA30FUbkQLi/f
	 daJleoSZU69Ors6oH8Xhs7xkoRQCLLktN7+vXiBTTXmhBeuaOX96kzJxoy5sdWZdW0
	 7kEGNDsq3d8/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91B018115F;
	Sat, 10 Oct 2026 15:19:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 248C8DE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 156EC81109
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k29Qu_1U8uRi for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 10A6581155
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645533;
 b=UUmSVcThIhFNMwvt9Rb3q7YaKn8a2a5kbzqh1VThkHDoABonajQ6WKy7EJlMi2bHfPhk
 A6nP0ch8W/KcGUOjmnQs2QleQwKNatS+p4/mhm5QjLWwCZNK9+JWTuqyHKsU8Z86enEO9
 TwIZzK+UP3vMAsMUhZZERQIXF4HmdsjDUzOuId+YEXgFAQn3uwks3EqYEoKLrwaamJjZN
 ZEg29Tq4N9Vzq0kGKgg9Fsyz/YWdU+lwfOo4dIvTJCD3BeAQtgd40Oo8vPX6mP6pj4ZHn
 VMJocV0Qx8pHuIVjSPXgjCRj88tm7hlrvSSbnZvc6K6VeKzU+xh1EV00lPwmy7yoeIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yJQgKxR/KtXHZR3Kcg2X3bh1YPJbic6J9SF0YvI+BtA=;
 b=mNBT0jrePkkltcxFlj5/Tia/JWamMp1bsdUKEz3M1mY2kArAVOjnbWxkRT7WOSh7TKHn
 +4rPRx6y0fjGAn5+ujBnvfQBkUmHGXRufh5aXHRE3/pkna293+WWwiYAv2aTpGOF9a6V0
 +KhMAQBmErEK1pyjXLKIKCh0oVbdP7Q90vYaOA9Am5zOlRwMod/JcNLbNnYxEQdl5wiPN
 yO0mD/hnVa2tJ4keRlV9HEU4ltlyXHLx2NV/H56MEF+R2syC44QXMs6ZhAb9jQiCvchcG
 nKm7fVfC8b4PyR4lYNZHf9Ocgr3FjoL6Nx++d9Zm4zju5GoNUF+npeGSZ87l4QZV39A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10A6581155
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D25A79222A; Sat, 10 Oct 2026 15:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:17:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee8a99137dfda8f7ab88ffb6586e3feaf152de4d
X-Git-Newrev: ef0f032677d8013db9782029026b63938a6eb275
X-Patchwork-Hint: ignore
Message-Id: <20261010151734.D25A79222A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6declarative: add CPE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef0f032677d8013db9782029026b63938a6eb275
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The resulting CPE ID is:

cpe:2.3:a:qt:qtdeclarative:6.11.2:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2025-14576

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt6/qt6declarative/qt6declarative.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
index edec67649f..02a17a580a 100644
--- a/package/qt6/qt6declarative/qt6declarative.mk
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -8,6 +8,8 @@ QT6DECLARATIVE_VERSION = $(QT6_VERSION)
 QT6DECLARATIVE_SITE = $(QT6_SITE)
 QT6DECLARATIVE_SOURCE = qtdeclarative-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6DECLARATIVE_VERSION).tar.xz
 QT6DECLARATIVE_INSTALL_STAGING = YES
+QT6DECLARATIVE_CPE_ID_VENDOR = qt
+QT6DECLARATIVE_CPE_ID_PRODUCT = qtdeclarative
 
 QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
