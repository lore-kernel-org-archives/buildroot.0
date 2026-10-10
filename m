Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BBDCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C44C0605DB;
	Sat, 10 Oct 2026 15:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RycMbOLkLje2; Sat, 10 Oct 2026 15:18:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ECE3D6064D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645488;
	b=htsJ81RVdv5BH0q2Z74zz1sTrN+Xb0fNwjIg6f4QWiIGgZJy35+ZnQruli3kRZ8dnCML
	 lbib3wOWyZIjmDgtMPiJxwdNq4oC3CyLuQYgucFhXlIaS52F6I5AWqwJc1bHKBSgwtfij
	 UxvUFdvMjQYk1lmVGeGTJn/V6QbnfW/xe7fH04Gj+6ihIu5UPwbYqWTHC5khhlNUim+hu
	 byv/HpvwLgUOajJyTvnXPtkuEPK4pcDBRUoYOV4zFmI2gVhZh+4ym0vN93EipBS9djMgs
	 7ovsSd7S4O626F+ViY7q2oiTKcvK3qyvUjIgqTJTbvONrjcIZP7BFBu0wysRo3j3B/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645488;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=a2j0FjbzppYQmS3cVZNEnGqC/CE8VD3AbQ79svu/wRM=;
	b=f6Tyo6mOpFDMx6kSstTdTYsPNmpFnhofpmWfacIj6JsRuO2iLzPG7r+lgRZLD5xRu1zr
	 5U4bWoO0bQvVvvQlLUK8iMzmgv4qdm4Y2tLpqWJSbVeoXig5lx0r0YoZGdiQ/HzyHPq/g
	 yPXdjqIIfJnFknTxcVz5wi6zNY1l/vQb17IUfkRQ2PZaAyvq0aSkSLKb25dzhYgFHOMkO
	 EFhuFHcEVY7VFwYkpxQeNNG2pj0vzaSIRYDptC8+0QbPoDoe3zsaVcgxcD1Kq2ZerOLBE
	 j5nDr2LsuSOJL9PbcmXWmIfWXhtaGTf/D9T76YHHmQsNiFKaChpuoUUF6TlAHFzYDiw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645488;
	bh=a2j0FjbzppYQmS3cVZNEnGqC/CE8VD3AbQ79svu/wRM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sm+GfvqhzPHNm/HnJcnnEj3qtndVkRy1qsgEVakWa43P4fxbSqd0ouJw5/xavsx29
	 d+xB7MjOT+3cNwJsyHviOCu7lGUcksagM7MaBnowM+OoNf1Ut/MozFFWs/F5pArzdy
	 F2fThHqqdqfwXzB9iE2D1e9rSmnKlfzY+sCCmgfKxRDJJ/uJ+h1q7hTC0K2QVnfkUe
	 L0y9s6FLWfT84r9qvdOS+5v+43DDxpWbRR98xfQSk1v/dKjlvlUhtFsArskciSdM1l
	 T73BM/d39ukxuVKuFQ7QlSBChCE1EIMd40LcjzR2gXxOiw2EXeLg5/ez/F37Piopm9
	 P/XcYOR+vYR7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECE3D6064D;
	Sat, 10 Oct 2026 15:18:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0267317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED6606064D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JufdTjDcbnZ3 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 993D7605DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645484;
 b=J9cSR4rcSyxcwpZh2ohpPJJVku+xsqu5DgLzVtfy9JMxdv0i3jzxmq3GhuxylUO0NBIz
 uG4WR5mSYu6azGKJIopUdfRlLCkbMbESw7EPndyla5cTVLGxJqT29BZc0l06rcJsrmVsG
 CGWfpvN6qSo7B38V274I7xyFZq9La+NG3JubSXrllQluAfScgojhMdEqxmn2TyxEXCLrI
 dwhXvBdJZpTMOH8yPH3PyA+ZFVL8qW3vOKSwJKa5fdirmkjHooqWcKE4KtxfvPLK2FAqE
 O0eEr/b6ZUN1+gUV+U7Xpt/29IbXv3cXHXY3lA+qqXDL2/mpCDDRONIKxDZoR9shflg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645484;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=tMJfpvB9eYRrczGIK5LpqfiZ4tCzXfEUqVnECiai6+c=;
 b=bTOUPWdOaZJLxqv73C0lZUDmFaGHLmUgk4hevIi1/xkX0AEMUohrZTpxPRehB51Mz78x
 xNSwL4cPfAtPNDcstapMKfLw+9Kh10bkUTguDZPRgpp6sKwFi2txC0zDb052SO0W9mLrE
 mhRfdXwPJj1dVaNQirYUoQcBxg6wnkslgDkUAqTeEpdS/OtlEeJ5ysMpUfYJLlU51CN88
 upQ8PMgTshuOd/4YDhwaXGSoTDLUbKqTQ2LVLRE+uvgMvlDKaI5FPFG1vOGS29Y06xO4D
 NpkKIXxQ4OGRBeWoP3nz4XshV9H26j9FtZ8u8GmfqO94m/YGJ9V9H1RuwbJBoVNOaqw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2IlgBwe4; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 993D7605DB
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 256AA1A11BF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D5B216075C;
 Sat, 10 Oct 2026 15:18:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 72FED11D708CF; 
 Sat, 10 Oct 2026 17:17:59 +0200 (CEST)
Date: Sat, 10 Oct 2026 17:17:57 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <aspXAp1ro_z_JWNK@windsurf>
References: <20260924134109.2415498-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924134109.2415498-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/pkg-autotools.mk:
 LIBTOOL_PATCH_HOOK: also handle libtool 2.6.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 24, 2026 at 03:41:09PM +0200, Yegor Yefremov via buildroot wrote:
> Fixes:
> https://autobuild.buildroot.org/results/e6159cee14f84569c85a61f77824b2b58d68a4bc/
> 
> Libtool 2.6.x is starting to be used by upstreams when generating
> release tarballs (e.g. cryptsetup-2.8.8). As LIBTOOL_PATCH_HOOK does
> not know about it, ltmain.sh is left unpatched, so libtool relinks
> libraries at install time and adds -L/usr/lib, which is rejected by
> the toolchain wrapper:
> 
> i686-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'
> 
> The v2.4.4 patch no longer applies cleanly, so add a v2.6 variant,
> rebased on libtool 2.6.2, and use it for 2.6.x versions.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

I've adjusted .checkpackageignore to silence some warnings, and
applied to master. Thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
