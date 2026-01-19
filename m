Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBFECCF2DE
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 19:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 332CC615A9;
	Mon, 19 Jan 2026 19:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlHop-1AMJBB; Mon, 19 Jan 2026 19:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4245615A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768851959;
	bh=uSK4WGSct3U4Nh4PgU8KU8R5PKATW33UFfHBCLH9K2E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KvtFOev6NoVgvbxI2NRSzvS2PqwYshdxP0Dsf2Uk5uAjLl8qYhkefX/ee+MO/j3wv
	 8PkQQ0tPN9gsCgKW8YRodO1hvexfWE78jczoBlCqf2QxXjDUxJRimzru2bDaZcMArB
	 oKJWWZB38fIx1vEVZbQUFHbGEw3USKmIpETATDb0g5/KbP9LSUC9129GB2WxENZNtm
	 f2anJ4hXMJoygAiU9zSvhGNTQk1m08KhONYryjeXlAEq/y0aKsb8DJ0oVeqMPFHQgE
	 RR2v5r4v4W/NrqfMj2McwM1tL0E+gz7CA5zZC5I4wAnZDCKNTiqTqXYSjTeWnjm2mD
	 VIlhjRguEW/cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4245615A8;
	Mon, 19 Jan 2026 19:45:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 320B6122
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 19:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16F6F4177F
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 19:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-aBJ8x2CudT for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 19:45:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF29C415B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF29C415B8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF29C415B8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 19:45:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B1C572003CE;
 Mon, 19 Jan 2026 20:45:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 Jan 2026 20:45:50 +0100
MIME-Version: 1.0
Date: Mon, 19 Jan 2026 20:45:50 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260119170606.2856291-1-dario.binacchi@amarulasolutions.com>
References: <20260119170606.2856291-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <3623c20fc1cee3ad5f5ce49a14bb4102@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768851952;
 bh=hb2tnsRNkXD+Ec1ANu0VfxaR5CjBHVhB+F9bBcv44W8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=txXh/Ov1oDKPZ6GrQ4F8KdgCK+iUjyZoVr3BPlNg6H6B+4SsClWUKUYyvK+LtIRKi
 zxwaT+mAlqXYPWmLyYm6qQxxtaY0YPdNKXXUscJSLm/n8ErYYZpFW4PbZWpnnyILVD
 QZWptLWh1uVwj3O9kLAGCvI/jH6vdHY37k6lhrNj5jklXOGyK9OEOj3zI8ViVQJ3Y1
 D/5lNCLBO1DGkN9wWaxN4Le2ulO7lMb7qOn1aS2tBscNnOcvPSOv1lUqRPKEBsbsjZ
 VgOuuQEDDUueQ6Vx3V9pbL4+w/GOcGIkgUihcnEk7wCNmRF0r9LPCtvejA2rgaq/b9
 R57EOlrmvX8wQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=txXh/Ov1
Subject: Re: [Buildroot] [PATCH 1/1] package/cmocka: bump to version 2.0.2
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

On 19/01/2026 18:06, Dario Binacchi wrote:
> Changelog:
> https://gitlab.com/cmocka/cmocka/-/blob/cmocka-2.0.2/CHANGELOG.md
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
