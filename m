Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE3ACCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7685D40781;
	Sun, 18 Oct 2026 14:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYq3_Ukaiy7r; Sun, 18 Oct 2026 14:26:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AE62340758
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333606;
	b=ToQ+4HwaRYBoy951XDYKv5f/9WtXYYWq3U+XNnaq9uh8rjoj+csSb93r1PN9vJTjx5WG
	 Mdf544s6r2bfKUKzrw+lvyNt074NZlaVlzsBLE7rKjWVYoBGA7zoXkMFk39DtaQrkVv2X
	 ++fxodzwsWfJZysxRBi/f22nxoMsjn060iKSAbQ3JmY94Pg2pFCVH4B1p+d5YA7jYs4Zh
	 fa8qRfYyDDyUIaogyVxjXG00uXquJPuUhm2KF9n4bzy+X/x83zMFd8i3kjJrM3R5MGReo
	 zQxuwTotwYRQxMS4zQtQ/ChddqJ9rj5H80RsNAueVK7PApXxY24qjLBT1tpZo6Dsefw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=VsILCrNNcJ95qnNwBqlL4wH+hB8pvXZji9djgJUeYGPh3kW/VJlMyapIKEhZW0d1Ol+o
	 5zJbaRa5tTmmuHgbl91H7ApIDcwMjjyAFH87nJYFFAAwaC7oTafwP+Ble+ULo7IXUf38o
	 k/S9SE0ViC+OKziO9Uz3aVLH7a25P5lBTFZCzOTC92DGjkdzCi30SCBYi+ZdR6z2s74qU
	 vnAVilLoUD/PvAAw3tM+Q/SXDZq6o9ffZufj+r8e1kWVvBIr2FF67CuZDcRAQC2BdCACD
	 /1c9RdYToQYe/jBvmuQoOH02KWHNCCkr6be/mXYN0nEO6yXHrw9X5oGXysjZVOQMHpw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333606;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T81vy+0j8BidznCr25cUrXTHGNYbXaEFSwmqgycHd14s8hqoTUHs/s/lIIF4czJIJ
	 8wZzIxdWOU1dJ6z8GMLhTByd5mwGOCkwbXk1hJVj8gYbblYy4ZKzygazRkTGUNv+pm
	 rOfqyQRdo63W34ByYWXssaOqxE0c0hTSTkAlYEJgSYatBKfWh0M5BuQbxMKIjEz84h
	 o80aiwv9RO/f3b0E637Z8AYs+vCIVVbrEvSOa7QCp4xswkZZTNmbawBga9eGYLmGpP
	 fXCWklyqdDyLWJCePEiJncDJifOXS3DEwiwTYuoRq4OyNFlS1feuwcXCI4bFzPdd0o
	 VtTYJ3nInyvSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE62340758;
	Sun, 18 Oct 2026 14:26:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DA9D61
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F5E280E1D
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqFMULD0zJ7G for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:26:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EFE0A80AED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333605;
 b=eVriTgFZf7+G+M0BHb9by0e9Dk/2ndEKO72FwdYKXnThSlfDwWZLb6Pupf/x1MGCM/XI
 QIORqP7iKKbeCV7s09KmZvYQwD1KrVB9xAbmoJmED4n+D6vxMBcIkhDqRkaLzV0zdcE/N
 nhb3NBYyCdM1r0bXhOuJfLL0NMuQF4NMIAO/zt4b8qdNL97BPbYSZN7RbTKuvlC34FmBD
 SLbZJwmlaMxWaUbK7xmh66Tv1C2+IQKPCY1uTQsKyQdjHtXztupGFMrWsyCdoS8/Z15W2
 5iXUI1Jh9dreZKvaTEbdLACpSmlz+oEiTADdXtMGtRVo0x95Zm1HicgHds0TP58YJ5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333605;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=pjjHIy+18cHqSFSXBen/II2b8XsePRrNWP4BtqkJ0cB9YZ8xTkvsNeTQJ/j7i2C8lCWp
 PXL0Tb4fLGAjDRwk3zRxbeh08a++Trx+iiZKsGZHQD+HLpDeruWHHedid4IvJAnQ/B38L
 HWQx7ovgMrWMR4mNDwDZZh6kp+2JJscxqdGnqLghcJpoJjN1k7/JaoIpYYXDHlaDCs0tv
 YMMPfww5Kf6R4gzV8IZ9NrHaxwGg08s7r5ry52Z8n9txSuqUwAyq+WZowwHKQ+vLKK60c
 DZHunGINiE7N9/XTEV2ZIP9YyDINxpw3LUFR2InRmfYtKsOIaA8FHbKujpeN1NHiehw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="Pia/+4U0"; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFE0A80AED
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:26:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8CF6713F846;
 Sun, 18 Oct 2026 16:26:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:26:41 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:26:41 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015215210.3426895-3-james.hilliard1@gmail.com>
References: <20261015215210.3426895-3-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <5f7431aa8866c69df360c521b8749868@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-entrypoints: bump to version
 0.4.2
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

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
