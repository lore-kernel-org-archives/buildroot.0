Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2677FE937E4
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 13:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AED0A4232E;
	Sun, 12 Apr 2026 13:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwGtKb5CRKkn; Sun, 12 Apr 2026 13:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FBB442329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776001982;
	bh=XU5Hm9jee5W+BxoImihPguEDqXn5Sa+QH4pOabtqfHQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UWpD9SsPptNy2v0wlEEO70ygRrY0rIF3ufuuF409mtjw6UHwCK0TK/Q3gb3Zil5GR
	 4N4Erq1e+0xBwDr5mebRQSqEAuJwHMLrFqCLSiXP25waupyMLrYWembeedWgA9egwU
	 sM7Z3ujt3/UNYpns+xnBeQTnPoFVWNlbgTE5N6dzWYtr9xWcmiMia7TBC26MUIIVck
	 BAjRvai0Q++LwoAy4P+ERv5Rljhsq/w9J0cWm3MM3QGshtiVcy5BH77hlRvVUK4FLl
	 8wvpwAfsIubT8pEceFGzwLKThdE4YpvhKJp5MwzXvI1Mfi8wKOnRrn9QTkrdGp3FsR
	 AedJ+V/BoMasg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FBB442329;
	Sun, 12 Apr 2026 13:53:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABFAC194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 13:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9153442155
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 13:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-gt8ovsKQhL for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 13:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C546F40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C546F40025
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C546F40025
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 13:52:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 619365FFAA;
 Sun, 12 Apr 2026 15:52:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 15:52:56 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 15:52:56 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260406151029.251720-1-ju.o@free.fr>
References: <20260406151029.251720-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <cbf4ffd6b9b63dbb34a61f510bf5eef2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776001977;
 bh=RP15nWMZ/pNgA886O5xqVG0KVo9moM6/Pch6uaS2nBI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cRbLlGcQtysbfxIdaa9nhaSy+ZQWQmMvmtDpN9jyYwN+O/1cymoNmG7SVOVFEVRVA
 a5nZAXYpoRx4gPMYcxB+K0jTrKO2WY/GbhLLCwdzFxSMx4LMHgxP5bMMie7cjhtXFA
 XVNEsW/q7aGaGFC8S6P572WJPdyVoJGsUT8iw63HQnhi1SB3Ewkyp9LQtDbRW5zYSd
 c4tKQ/JUXePE3EQFELNphLh7KsTWD02WhcigTzAM0EhZ/7KyvfR/anF9EOzNyxYIy9
 KWX+/A0fIcfZ0YNmV4TKDfSwmOfimLM/pC5T29zQhg3t3V8Bm8jQSY5t01lVpLNgli
 hXFmP6/bdai9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cRbLlGcQ
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: bump to version 2.5.18
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

On 06/04/2026 17:10, Julien Olivain via buildroot wrote:
> For release notes, see:
> https://dev.gnupg.org/T7999
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
