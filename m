Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BC5EA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4797840FF5;
	Sun, 19 Apr 2026 19:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z69HZtRxdG9g; Sun, 19 Apr 2026 19:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2798340D11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776625416;
	bh=rek6OH9gsrSPpxX2vZPayNoNykcVkgKXcEXNX9Qslk4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lSoEpKCsvjzO9JcxNoaRZ3p6e77QfS1EJjy20+SP0MuMdzTpR+YgOUYzHzKCh22Pe
	 Hsrg944GwBng88UnWw6YCPohtJa3qdot8eH4at4rk8BLJTSIqy8dVdGMIT012vz6UR
	 5XbRUmJ+L8/P8WlXVMFwVM8L4IhgKg9+a2x/tRar4MOZC+gZuhGptd1Qfa3BRAXKDj
	 lUNxBfEgY7S/7E7AwwTsjh37zogL9jyLqZBVFdwwVt7i007viVDSZLxlen3zkShQtB
	 lWU7gZjpB9sXdQuOGQPCrIpDIpELDb9R7omqa6YTDTBsstLhAy3tyWCFW59lXq7GD4
	 9tHNENHdfVVsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2798340D11;
	Sun, 19 Apr 2026 19:03:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94CED24D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A84D403DC
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igSvt-rvZYCP for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E3B540341
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E3B540341
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E3B540341
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:03:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F2E7060129;
 Sun, 19 Apr 2026 21:03:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 21:03:29 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 21:03:29 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260418074458.40842-1-chakrabortyshubham66@gmail.com>
References: <20260418074458.40842-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <85e6a74d191ccda42ab5416bf8c01922@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776625411;
 bh=0aJSupEjN558wep+Q1kq1EO0e3Xl4Bq8YHiGjFo52qE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OW+j3kP0TAf/j28NSUvHOq0pD+hP2f5166PEmi7RrI2JeOVeJCAtgz+HugU36qVtH
 X8NUFGXAymicTw+EiA+V5PHG9QouxG6qVYCymFC4T/UOCYUmFRgK2kVEU0VPmU5wFc
 wL2ANtWsS7dPFaBkkhGE6MEIgLvW5eVQuhAclpoeF1ZFb06Jpt+aDXr2++b7fabbqT
 +gFGQA5J57GETxgsgND/58aImFnSbrvnYagtXRzLT8va3V795XJWuV8lFE5A7NoC4w
 l3CvySYr1AivinncIed1oFtV8inU/9SalHZfzrpliGgqFiqwAllc5XcjLcEGqyN5cf
 GhGwqSVuh1WMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OW+j3kP0
Subject: Re: [Buildroot] [PATCH] package/lsof: bump to version 4.99.6
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

On 18/04/2026 09:44, Shubham Chakraborty wrote:
> - Fix clang version parser
> - FreeBSD: Drop deprecated kf_sock_inpcb, add FreeBSD 15 support
> - Linux: Fix kernel version in CFLAGS, handle Linux 6.9 pidfs changes
> - Add closefrom_shim fallback for better portability
> - Fix C23 build compatibility
> - Documentation improvements
> 
> https://github.com/lsof-org/lsof/releases/tag/4.99.6
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
