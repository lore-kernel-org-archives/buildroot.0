Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEC1E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 541C940B67;
	Sat, 11 Jan 2025 17:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcm_pYF72_tV; Sat, 11 Jan 2025 17:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D13640DB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D13640DB3;
	Sat, 11 Jan 2025 17:30:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7678942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B78E9838CC
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3U-JVoAun_WX for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:30:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA0508380B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA0508380B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA0508380B
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:30:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0C61313F88F;
 Sat, 11 Jan 2025 18:30:24 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59932])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:30:24 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:30:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Graeme Smecher <gsmecher@threespeedlogic.com>
In-Reply-To: <20250111144224.2755176-1-james.hilliard1@gmail.com>
References: <20250111144224.2755176-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ddea1d0a48342d66b2a1937ad4a2082e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736616627;
 bh=vl7YgjtXXxuJIMg7ZoglK29h1EOk9r0DlbFRgWa96Rk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YrSE69RltvkQjzCjFOxLPvNqKUj+tsBrNrwmjZtspar0vFPJtVzBYgMG0Tzz69O7M
 YiOePx9MnSIWfeUNqwOUc20IIqKyfx2KucIg5VM4APvWRarU60FcdECy9MoUWSqvUT
 ZoHBqLjTjOhNL9+FYNSgPDLzXjZaBbu/qKHFRJZXzo6X/U0RScJarrpNdWn8t1ARZL
 8cgV45EtOpU0S1xSg3mmWdMKd31zX6XJNVdrjcoqG7ECRCVSJxUtZW0ViZtZYEo1w1
 yQctFUxsCuC5AV+Y0r4yLQ9mlvBdRiDhq0D3okY3L2SoDWTAXAN/Yq9FCnxJEbSR9k
 7gchpUHolIt+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YrSE69Rl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-orjson: bump to version
 3.10.14
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

On 11/01/2025 15:42, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
