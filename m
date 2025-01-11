Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AA8E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 11:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00A7383C3D;
	Sat, 11 Jan 2025 11:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67CnZHgqIrV0; Sat, 11 Jan 2025 11:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17C8683C3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17C8683C3F;
	Sat, 11 Jan 2025 11:56:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0256942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 11:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE7734130E
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 11:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65l1u_V1WvNH for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 11:56:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 439F841312
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 439F841312
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 439F841312
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 11:56:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id ED45013F88F;
 Sat, 11 Jan 2025 12:56:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51780])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 12:56:07 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 12:56:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109010721.25290-1-nemaakhilesh@gmail.com>
References: <20250109010721.25290-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <dddf3c2d1d0f157a7846dd00cb7c16a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736596569;
 bh=ZQzAD8PZKY3wsfA9dL2kAbDqu7TSWZ1PnfrawJ2g/9o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YT3iJaABXdLj8NHgHy8/OZUmLc8oldLVlbFPIBAN1B3L/wBzrFCYLKcx0pw1iwEJy
 P2xfQPh5Y8/tsNqyukOSwzuFkuP6/ME2VG0YQD1nLqErvaSvIuIl+GwNbSy/BObydV
 3ejXlQhB5PebvzPSi61HAN/S5fdcx7uzGlvue/qgZh8Ddcil8ynksDhiHSy0Kx1fBi
 fzUciEXb/pLhcEHdGzFVG5hq4FdpcK1rWER15wnqgI2YyX1r7NSHswkZnXmjhYySnz
 i95vxBQHUb0q+nzAUF4OAE64NIwT1i1GiChd5BVqbYI1EI++NKEilYy7fdyibQb6rZ
 m8XmK5aUr4Meg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YT3iJaAB
Subject: Re: [Buildroot] [PATCH 1/1] package/smartmontools: bump version to
 7.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/01/2025 02:07, Akhilesh Nema wrote:
> Release notes:
> https://www.smartmontools.org/browser/tags/RELEASE_7_4/smartmontools/NEWS
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
