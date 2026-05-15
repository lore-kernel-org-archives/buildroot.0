Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6748CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B37F36151C;
	Fri, 15 May 2026 09:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrdDtW7WyUGk; Fri, 15 May 2026 09:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BE7861503
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778839074;
	bh=3XtsofC+wzVz+XdIfjOBM2UkYcCYj2450rFVgJcdgWk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oBL6fGTGOc5hZyktozsQYBbbtlCJ+HGYotM0dR7AjNn8lv3T5zkEDG61YqLDAHJ9w
	 pi2ClL1ssg4/Wf0rvhuRnClBAAmtST1QOkYSX5eIJdF8R4XKyfaat+DiWRxgRxmah0
	 n2PLKp1+Z2hSUaOBkJJveyzWJqDSc9GdUXu2ARJyeMFYb1iGkNSLX3ID4d/Wox201F
	 ufQgB781MniEo4et7NpwXdPUWdvuZJTQxBnzfM1L6PYcpvHSzix84rGV3n1si9HYc+
	 hVJ47CpeLDQ6Lmsi3Ls3K77QzUK/LRLNcYZ7x+OnO9EE5ocY49VUbjgsCxuSwWJLjo
	 Fs7743fA9YMug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE7861503;
	Fri, 15 May 2026 09:57:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CCE936E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 529554174B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YftHXbJcpr3K for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E89441747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E89441747
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E89441747
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:57:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 83C12B0053D;
 Fri, 15 May 2026 11:57:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 May 2026 11:57:47 +0200
MIME-Version: 1.0
Date: Fri, 15 May 2026 11:57:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260512154103.3826797-1-bernd@kuhls.net>
References: <20260512154103.3826797-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <28901627101cc6241abb2c51f70667c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778839069;
 bh=Uj/MVC1Ryg52rLEYh7f6ZVpNRE6MdBYSPBX/M5w2Rug=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PABNGZOIlBvM/x+VFzd5kZikdvRbwIjrsN+1kKLXQasH196I0w4OxBt2aUUqKcqGN
 LQCYMexp64Qlh0d74qIYiVzSkI7lkvWdqZSx2nuw2+p43kukAfnDZVKiXFiMrEWttQ
 r27xVqXzSy1bWdKZv56n9MvfNmrGSV3isyN1WP+ybwCOt96L0Q/i4crL9iuzZhwDYl
 yltU0nm5xpHDYTR+0k605iyjvDF2Bz9qp1+UDZFhHmfLbBv4DCfrdMixjpa1h0gpFF
 ygw2nxt+sS2OPdeukrEzCExc0GXwH3HuV2OdM6uJG3+2C7wZw0gmm3OVaym98JXqDN
 rdVM7zWroSW2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PABNGZOI
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libv4l: bump version to
 1.32.0
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

On 12/05/2026 17:41, Bernd Kuhls wrote:
> https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=v4l-utils-1.32.0
> 
> Removed patches which are included in this release.
> 
> Updated license hashes due to upstream commit
> https://git.linuxtv.org/v4l-utils.git/diff/?h=v4l-utils-1.32.0&id=dc81a361e22ce71a454ad63a6ede725b97cc26ce
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
