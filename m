Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13256D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 23:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCAD0404A3;
	Sun,  7 Dec 2025 23:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 148xd54Vd__k; Sun,  7 Dec 2025 23:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A32404EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765150022;
	bh=Xr+2etFeXh4G6n76XgCgQMejODZg6fCticCZa9g55XY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J3jpiE4hC/OuIk38BMoxn6NxDP3GrXtQMHgskoK/hyxHsnBcbTzEpILoRVqGRhBTy
	 bogbT5PYyS/YjPszISqBnergEkvliEZbHuwQXXoA8dUmQmaqLuRL9edotIzsM81Wfy
	 wNn2T0bjnv6FXvJhhQGus4xXVsWWG99yx+IzwNekVbnUSuPFfQV1crsBJ91oLj1C8R
	 rJQc8yFWUbBysf5Gfv5ov/mOOG+/Kokc1VbYKB3altn12ptViNHz2NHZPVYhxJnpcX
	 zdGjOmE1K/6HdQ4s5LiWpn8bUsZhF94Ydag02Fr/rCKy8EN8LB+ZvLPtby2E8GTvOE
	 3vazLzQbJUmTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04A32404EC;
	Sun,  7 Dec 2025 23:27:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 356BA2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 23:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B8144023A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 23:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCG0YacVNRpM for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 23:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C89240054
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C89240054
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C89240054
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 23:26:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4BA8D13F879;
 Mon,  8 Dec 2025 00:26:53 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 08 Dec 2025 00:26:53 +0100
MIME-Version: 1.0
Date: Mon, 08 Dec 2025 00:26:53 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251207213735.3332670-1-bernd@kuhls.net>
References: <20251207213735.3332670-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d6a3bb14f5f014f47c42cc7384d98d21@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765150016;
 bh=TJzlaqDmuUYXHBzbYGA0sjNyQEHugw/q7YmYM3NT+0M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rGZKTIy5MrqkHJKGNc+hUz2xaD8y+9rNwaLyXxKgw7FrDukwsFrQhrvj5kwL0ak8H
 7bADMli0pOrFPzsoQEGMDTxJzdoz4vyQks7ElKxN+lQh93oYQBUmWrxp4R7yCIHzZx
 ruxQ3xvYavhmdoDlWU9nXHZPlMU0iiF2chLyaa10c3eHW5WeR/yvNySCUeJ6Cw39hW
 1NVK3MoUTjI4L0e538n4QHVccrcvyd8kLNDmyxJSRkYwmm77k5q9C1480zbExxiGNn
 hQRRJw8+xBX7sEtxF8BhMsOda5bpO5I4dqu35KKCxcdaUNsIqIO8OHx9zykJtAACV8
 uGx7a5FIlW+0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rGZKTIy5
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.13.11
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

On 07/12/2025 22:37, Bernd Kuhls wrote:
> Release notes: https://www.python.org/downloads/release/python-31311/
> 
> Fixes CVE-2025-12084.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

For info, I added extra info in the commit log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/8745e0d5ca39abbbb664619e1512420c40bcd732

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
