Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60759EFCE4B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDBF440940;
	Wed,  4 Mar 2026 21:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnYcvr_824wx; Wed,  4 Mar 2026 21:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 908AC40CB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772659511;
	bh=vp4QJn4h07wYfF3kJjIacu36eaLqU7wPLSVrsazsEb4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jYGf6oLYEm7D4lpV5kI0/5g0q7kw7Vfe0ahwqw4g6uKck3cz+C7TTysT1SzvRnvSo
	 SFOuYj7uJGDtFYFuCZQsB8v6k/S1l8Z1LYkiPvd091f0i9MVSyxl4lV/Aq9916wP3X
	 DS3mQId1Lfr5zZY4/I/M++I6181+++JFoy9taZRo3iBbX6FOoE3/xi5GIYlQp1Y06k
	 guRzRcZjXzUrlNliBQFLWSsb1qYUecsN8T1HMWjPMO1psrj9I7OCy4vYcQmSCC4Ef+
	 kvYPJVABdrT+gLhM3vo12JnpyiN0hCV1Pm9IRJZnTs/z8GZCN6K7M/qnTFJ1+bsZNA
	 J6oy6DslqgSug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 908AC40CB5;
	Wed,  4 Mar 2026 21:25:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31253223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22AF082254
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y79auqdK3JEH for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:25:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1FD68218C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1FD68218C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1FD68218C
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:25:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id DAD6813F861;
 Wed,  4 Mar 2026 22:25:05 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 04 Mar 2026 22:25:05 +0100
MIME-Version: 1.0
Date: Wed, 04 Mar 2026 22:25:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304190143.3481181-1-bernd@kuhls.net>
References: <20260304190143.3481181-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <fc7398114d7645c85f13c86368e81faa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772659507;
 bh=bLp3qITFSKFNI8R/Tji8swAqFjYp5GmWtdiuBkWCVug=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=migTNSE3R0u5ZUA4069+SvxkMEstz3EjLKS4vHyI6f4z1VTUWafPjewyox0zpoflR
 XpQGBpBn8A1CozSMLq2+ptJBcWpCbMRUPGkHr4Hd2q2cqT0blLSVJEuGdXWzsRKb8L
 bGg3bjSDOeVcrHyyYkeXuOcOPW/bE/t3X1fQUc8sGwi0Zu5h3HlTjcLzMbz0LSWC2M
 c64RRNFipKAQrdcXp2RHKOAu4VAztPE2bTDMoMLs26c/ZNdv92MlbfL8cX0OsY9pDB
 LVOh7vsOYwjqK6fzR9stc328i/0/LL6kV7K3gM6H0KAJFzAZqEwwxZTLddQPqlM3Nn
 Bba/Iyp1ttA9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=migTNSE3
Subject: Re: [Buildroot] [PATCH 1/1] package/freetype: security bump version
 to 2.14.2
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

On 04/03/2026 20:01, Bernd Kuhls wrote:
> Release notes:
> https://sourceforge.net/projects/freetype/files/freetype2/2.14.2/
> 
> Fixes CVE-2026-23865: https://seclists.org/oss-sec/2026/q1/253
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
