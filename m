Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8496BCD98E4
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 19:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57F386E3BE;
	Tue, 16 Jun 2026 19:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbfVpX0uZcGp; Tue, 16 Jun 2026 19:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0562D60B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781638490;
	bh=9JdvGWYQbaDhYVbq3aSq/N/dMBHUEKIKevtGB5qigKk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q43Hdf9EiasDDZziBrMi7QAj/21+TBMfE/S0mrGt+RpxK+tlxvtc/AEx1x+JukuB6
	 RDugQj+Ii0rcE8r+p0sRj6LlExcYFtaenqECCkfZm++Yoo2vBzYJUJYozFNWQAU2Y8
	 mZBHSz2x69nG6YXyIILsJ1krqG42FfE7crw1RbEkZeDSk5LZIZMYYkPMC/ID2Ri/od
	 +gOLN5n1ufv0k44sUtTqkP7+pN0Shu79D5eFFex0VTl9yTkKxTILp5C08j/o1Uop3/
	 ntX9wrGvw4t7RRwXB+pbbIwa62PONaIeH+HySGfPhPslb0eXvNrNl/dGiKyEN2e8Kn
	 n7c3Xv0b5IoJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0562D60B25;
	Tue, 16 Jun 2026 19:34:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E886B793
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 19:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAB03606CC
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 19:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzjVZ5xZqnHT for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 19:34:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8C3161CE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8C3161CE9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8C3161CE9
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 19:34:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DE24E2003C6;
 Tue, 16 Jun 2026 21:34:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Jun 2026 21:34:42 +0200
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 21:34:42 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260616183613.1602518-1-bernd@kuhls.net>
References: <20260616183613.1602518-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <2fc19420ed31d5defb3f33b5573823bf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781638486;
 bh=sTAo7UnlBBJmV8POIHi9bkXhea7KaT20NCyb+tbB2Yo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GEVfgsU2jMPQS0Z7f2OhWNwMfponVf2wBvz+6Lb5+4YuYM4lub1XmiGt25LkFlLWV
 tfUkZzvd6KwGnVsoBPtPkkijQajBI130UcWQSsueZ6UXzDJqB0eux9H6PWz7FYQS5v
 7BHh6bnjtCxcR2EbjIz9w762I85XxHSZVHWgjPlVYehbEx7stiIVQu2PXbE6vwT8ep
 A3EfNNWs30wSB9xD9mI0jHj8MgOLwjgjGZ95YJexU2HgyfJu0BNjVYB+NyZOqgJ15C
 iT9lC3+WAzsITJn7frGBbmv4dxs377Vaxq47QZc4n8VY5M6y4Z643KTa2u3rJMxjq+
 kox5tv8CdgbNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GEVfgsU2
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.6
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/06/2026 20:36, Bernd Kuhls wrote:
> https://www.python.org/downloads/release/python-3146/
> https://docs.python.org/release/3.14.6/whatsnew/changelog.html
> 
> Removed patches which are included in this release.
> 
> Fixes CVE-2026-9669:
> https://github.com/python/cpython/commit/157a5df8cb5d82b33f918a7489e72ce95ceb12b6
> https://seclists.org/oss-sec/2026/q2/846
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
