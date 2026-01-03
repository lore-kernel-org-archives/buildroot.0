Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B57FA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C680840706;
	Sat,  3 Jan 2026 11:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3InHAG10QjI; Sat,  3 Jan 2026 11:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA4674050B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767439784;
	bh=PRAyTTydnSEunLNFX6sPUOu42dgPH4TuY3bBsfgCufU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pL+yDdTZ5KAPd50/PUtWP6L8ZdgvAwgeatXtdJ5N4JhSB5sO8n2eZNIysEq2TWGLU
	 h29eRxU/QPU0w0vDEWn7nHO4OwvJjFgzB4UoLiCzYZ5IM1i4cuGYWk4mJ2GEZs1mJU
	 lIQ9umzBN1PkjSOQ76AjkdMriYB+tg4RuvB32eL/aLCIZrQ56CR/9fxlVQ8n0fqyhn
	 6A6T5VtE7UYtBuXoKArvbmIHuAxG9az5vuO9zAkXMz8pzImlAAERsKd4v3KRq7r7pX
	 viysycCRbBTGFuF+DCcEXeDLjm7tdmp3ZVG8nMxn/txkkWW9m9Cp5QAdkhVIHOZeez
	 ft5V1VKpoYkHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA4674050B;
	Sat,  3 Jan 2026 11:29:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 022EF440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD3814050B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftVdfK0Be0ME for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:29:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38FC3404F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38FC3404F7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38FC3404F7
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:29:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E352119F5B2;
 Sat,  3 Jan 2026 12:29:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 12:29:39 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 12:29:39 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260103005342.702516-1-james.hilliard1@gmail.com>
References: <20260103005342.702516-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <7f17d16259b897ca54e3ad369e9abb4b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767439781;
 bh=xMtFrH/J71GSP2fSQGv+XqpN4cgLjodTjCZT3l1gFK4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D+C0AE00p4W+SK3wpEp7dcuCL3aHuf46V6vRB9S6562t2y2l9z9Zs9a96ytS9nEOC
 nGpt64i/ptEPY7dUBOKaKwBRp34lOMa3LDtV5TSbsv9QXB/KrqjgbDr0djla9Loxt6
 MEj4gG1+4o0uWYMBvXUoheV4jDI28T74p4UMz9neRpZpIPyhY94FaumHw5WatpFMgK
 oJfxSdKmdnaAvl1rtu38JueLXZm0U7G6ifL5MekG3l4oTdkfjTfQMy7vFe0MW99OJM
 mXoWi+8ldLyF39nuwUd6aIWSUBVPIP3QA6sdfiiiUF6YBCrRGeF9IzY6GinwZwUDPo
 FK/p+PtB0y7/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=D+C0AE00
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gnupg: bump to version
 0.5.6
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

On 03/01/2026 01:53, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
