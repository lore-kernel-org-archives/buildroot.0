Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4816DEE6B69
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 22:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14CC641B31;
	Fri,  6 Feb 2026 22:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVpdVeipzoKo; Fri,  6 Feb 2026 22:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF58E40664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770416219;
	bh=zDOP7ocTWikCKhKwD2wPBth37167YRSqGL69WCKgdNE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UYaDAtqqWn79tthosct7uocA7f7eJubaLRPwGRwNmIB8CTpsc9nEQIGv6VX208qxc
	 tqkmN/GbUhJQvWdVYuwzJZSdWHkniZrWXFbCMrm/X3Ndh2q5jC1ZNUl9d9vExgfHyX
	 tKVgdBjyUKiE+sjK7T6Imbp8BU+zRQl2X+fr4S7dI0P5tsXuv3Fh6ote5Y6S063SJ6
	 n87LUuKl2s8ECbvLk8JWsQESBQLD+OHrUsePmZc0GCdtqyU0iZmKsJPDqSEuTM4pAp
	 CgM3STh2temU0a+XXFlgMbPanjdygezy07aKLlqmncimd7MHje13JFBJXeJbIwmYPt
	 StXcy8OCB8e9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF58E40664;
	Fri,  6 Feb 2026 22:16:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 593712C5
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 22:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AC9440726
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 22:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blPl7qu__jb1 for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 22:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 903B540648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 903B540648
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 903B540648
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 22:16:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 792D513F86E;
 Fri,  6 Feb 2026 23:16:54 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:60234])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Feb 2026 23:16:54 +0100
MIME-Version: 1.0
Date: Fri, 06 Feb 2026 23:16:54 +0100
To: Jakob Kastelic <jkastelic@thinksrs.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260204231527.1654719-1-jkastelic@thinksrs.com>
References: <20260204231527.1654719-1-jkastelic@thinksrs.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <0765c9e491a72870c5413e33c6e99aec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770416215;
 bh=XCM5vAJ2bkZY0gpdiYpv0B4/bYOMUjxygV1sY7N+cAQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OpjMKxV5rDhXH4sogU7sj/54AotdMX5zAKq0TuIoyohMXhx4UwNtTMaWa7xpFdRDW
 OqOOVP87whaYq9RJRkaDMtyXpBsYOSxx9B/wpthjIUT4mc6179y3rPFOwZnMRtNmOL
 2T0O8KHi1sHeTJWC1h7oIcMIec+mVjRUCl0fqpwkucmd/W4oKK4k3FdW4k2lVe+vyc
 vprq9J+7vbB7+3rsniiDuG7NT4Wuz8KmZPQOFdlqo4jvdTJ1QHYDiEUyPAONJjY1ly
 MyWHNqhBS4HaUaL431a41yZUtnk/eYflosDdOMK/ERAvpp1+nxRUC+2mztxwTXSyCd
 SP4cfRjWZFjwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OpjMKxV5
Subject: Re: [Buildroot] [PATCH 1/1] optee: bump to 4.9.0
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

On 05/02/2026 00:15, Jakob Kastelic via buildroot wrote:
> Unfortunately, if all optee-related packages are not updated at the 
> same
> time, optee-test will not build.
> 
> The version bump is needed since optee-examples and optee-test can no
> longer compile (compatibility with CMake < 3.5 has been removed from
> CMake).
> 
> Signed-off-by: Jakob Kastelic <jkastelic@thinksrs.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
