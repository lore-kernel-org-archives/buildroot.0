Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF89C3ABC5
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 09:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D69B040C49;
	Sun, 11 May 2025 09:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAuPenfYHOY7; Sun, 11 May 2025 09:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22CEC40719
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22CEC40719;
	Sun, 11 May 2025 09:36:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1B28154
 for <buildroot@buildroot.org>; Sun, 11 May 2025 09:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1A4540719
 for <buildroot@buildroot.org>; Sun, 11 May 2025 09:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKZNhkNACjxU for <buildroot@buildroot.org>;
 Sun, 11 May 2025 09:36:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FFE7406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FFE7406F3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FFE7406F3
 for <buildroot@buildroot.org>; Sun, 11 May 2025 09:36:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8BAC119F72F;
 Sun, 11 May 2025 11:36:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 11 May 2025 11:36:33 +0200
MIME-Version: 1.0
Date: Sun, 11 May 2025 11:36:33 +0200
From: Julien Olivain <ju.o@free.fr>
To: Ismael Luceno <ismael@iodev.co.uk>
Cc: buildroot@buildroot.org
In-Reply-To: <20250511025920.8527-2-ismael@iodev.co.uk>
References: <20250511025920.8527-2-ismael@iodev.co.uk>
User-Agent: Webmail Free/1.6.10
Message-ID: <2e6346ae588cbef0b2d8c67b000fe010@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746956195;
 bh=Yrt8aDzhIpO3djeX7uM4XrOpgJQ7YqvYWuCrLGPCwzU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FieZ4FoXoFL/ftnR1VCOwdAh11Otr76Mwa2BnOoL7uRiZeUAMjF88A5cTUWvgzl1Q
 1DZdAksRl/w/rzfcCfjUgfPvJBm1xPnYILITJon6HblAC9ru+/8NH7wBqIgDXAW9hJ
 ohNl9cnOMr7qc5VbjZMkcU7jT43d4R7dfjwbw0k993PBPXwhavOc8yBdC61F1+YEFF
 YbiW5R6oBHlA7tjKCVi6EBdPV5YljL16+DobcnJdnr640LkdpRmHD/Bb4FtLMWaV35
 Q9hGfjNycnmI7qZbcqICdX9o6cAFyPSW8NrWk+R+y0IPti04voZVy9BSSZNOcp4g4x
 pv7df7vManvfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FieZ4FoX
Subject: Re: [Buildroot] [PATCH] package/mawk: bump version to 1.3.4-20250131
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

On 11/05/2025 04:59, Ismael Luceno wrote:
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

Applied to master, thanks.

For info, I added a link to the change log, in the commit log.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
