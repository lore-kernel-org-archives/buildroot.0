Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F60D3749B
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 20:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 297946F48A;
	Fri,  5 Dec 2025 20:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uiOcS9whKBqz; Fri,  5 Dec 2025 20:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97E3E6F47D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764967667;
	bh=HnWxkqYN3AAjV4iE3HuYywoNr5LjgXgQPeXIKy+gsLE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ou4afVYm2gdvn7EDmLmRPqfTH3D02QdJVZa17OsM268Xa55qUNBfr0glwOIVbMlum
	 MeJwlBOwZMLJtFnOjz9Pjk0fHxNvvsk1Ah40s67C9/cI5xQLlr0mvQojU9lBw/auT+
	 Sq5BTrY3EAZyRcsCZ+8NQ4d/qSwJaJ1WFs7jJqVUsIoMiBjt4H6sIceRi2TpTkiMr7
	 wdF2Oi73gTrTv86p8qUMbaMcaNDkT4F6h6I/Sd9RmX41WdJnHzOs9d0DcA0gwCRThU
	 puRmKdo9Cne4jzZrpvy+h+8hoRzYYdO1NHDV2K7mNH30MFWha2mRsieVY12HK3S9c+
	 URgCwr0GrIwMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97E3E6F47D;
	Fri,  5 Dec 2025 20:47:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACA341A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 924056F47D
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yR6zRlLPK9lz for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 20:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0FCC61B7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0FCC61B7F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0FCC61B7F
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:47:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E62FFB0054E;
 Fri,  5 Dec 2025 21:47:42 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Dec 2025 21:47:42 +0100
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 21:47:42 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251205180454.555029-1-raphael.pavlidis@gmail.com>
References: <20251205180454.555029-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1b1c142b975af593da9914b2e12b0c36@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764967664;
 bh=2eqC8cQErD9YDM4927nib8zsFsfbaiirAGj5nR9MNb8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nQvFyO9pW9iiswl7zc7no7v0f7OP6ZKY1RwBLGzfjyLO8OfZEqeuNGFZjZfC7zOZe
 z2dBgOWZ9K0tuThl220ahcIy3MHFxpyHIE/l/0G22X39tqZ2MG5z5cWESkMgS9xyiW
 s44+bfYfrKYn5GE6JYUBcutJCR3n95nv4dBcoQ8ANFEuEib9ieARqJRb9b1Y4Dvn2O
 pS2NbNqaeTRjXYfHFa9M4DdFrwF6NT0ZjTguIqureAjd7VjJpfHzWROqWDeLS8Jh6L
 VYuO6WkhvCvG0TrCHAAfV34Cc1He2bZKgC57otlBwP754iNuj6hvb5PkwrgG/WOhNq
 WOFPaet1zosGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nQvFyO9p
Subject: Re: [Buildroot] [PATCH v1 1/1] package/podman: security bump to
 version 5.7.0
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

On 05/12/2025 19:04, Raphael Pavlidis wrote:
> Changelog:
> https://github.com/containers/podman/releases/tag/v5.7.0
> 
> This commit fixes the CVE-2025-52881 security vulnerability. See:
> https://github.com/advisories/GHSA-cgrx-mc8f-2prm
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
