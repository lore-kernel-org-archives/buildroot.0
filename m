Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38430CD98C7
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E80605CE;
	Thu, 11 Jun 2026 20:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7zh-LzcMUDj; Thu, 11 Jun 2026 20:23:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 154A96060D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781209385;
	bh=px+WcWM/iyw78iV96McUY491jEpX9pPIUAp62v0eK0Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FtifvwdOssXw//ZtxCbOX61r/m4H6cYlUoMPzeAGrIS8iMd7yxinAKlNqIUiNOcc7
	 riw6iFDsTyZ4mobCbY3J4sJhL7gySz9cRptPKjHLoKdk6b+ZRq60aJlWVtwSJIqWK6
	 Ws33ZILUOHIDdW5PG6MAwx81aNjFPC0akZlWd657dJNJ9EBbwIq76MheLpNZNjDUPK
	 q/biVOINWwkGGHl8EowjxW76DCZQqxoPquDJWBKF9rsW48QXIMwTA5TVdpzABJV1Ru
	 lqzq/UlXz444HxEuGd9+Mek8IntpE8zH4Oq8fnat7sHwqEMunXsJPhumINcsKZG2aP
	 mJzqxAJ2EiJiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 154A96060D;
	Thu, 11 Jun 2026 20:23:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A43D7F4
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8641C60611
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LooM_4lJe9Dy for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 20:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D3F16060D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D3F16060D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D3F16060D
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:23:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 18DFB780375;
 Thu, 11 Jun 2026 22:22:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 11 Jun 2026 22:22:57 +0200
MIME-Version: 1.0
Date: Thu, 11 Jun 2026 22:22:57 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260609100515.2206615-1-yegorslists@googlemail.com>
References: <20260609100515.2206615-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <7ff77909fb68c16aef78c6972dddb0a8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781209379;
 bh=5PXCgOAcx1jK+bJ9hBvvmwFM5aQHy7oIGwyFp8ye7kc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vbg0Ftv0kgPBlAy3e0SrQgQBwkIxtve0du3ki31Bdrq/LU11Mcq4HBytthKSefOPt
 qMqH332PRQjDTDMzuwL73RvDtZhnHLRgk2AOGfKSJ3ZwIT2T0zWEc12H28kbhqUzsD
 XBHlnPDqcTOsVs7vogQFcBRxWRhcuKguOfMt0OyrxzjRBod27IgyjbeHh7Yy/DG24c
 E67xkX/MjnVjV4B3EzLMGfZTtO/WWqTbGW5qo0uHugkJ1em3lWtKZWaaIAFyB4MuXu
 W/mQD1BiGSt+PAPtk/K5kKhSkkLsB7nDPf6L/3UHN6Ya4wi/99jvxIOTRmUc18Qo65
 MfmDHjxfEbilg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vbg0Ftv0
Subject: Re: [Buildroot] [PATCH v2] package/python-webpy: bump to version
 0.76
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

On 09/06/2026 12:05, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Change log:
> 
> 99e5eed Fix session.py to allow suppression of the cookie (#737)
> c962428 Document development setup (#823)
> 2598dfe Allow python v3.14.x (#822)
> 7853e70 Bump actions/checkout from 5 to 6 (#817)
> 3e05bc6 refactor: remove python2 compatible import usages (#728)
> c888e19 Remove required Python version limit  (#805)
> dc561bc Bump actions/setup-python from 5 to 6 (#814)
> 1444393 Bump actions/checkout from 4 to 5 (#812)
> efcad93 Fix query for #807 and #808 (#809)
> 19da0b8 pre-commit run --all-files, fix SQLQuery (#808)
> 3ba1b40 Address CVE-2025-3818 (#807)
> 9aeaf55 Fix: disable accessing special variables from template (#803)
> 25dc267 Automate PyPI release on new tag push (#797)
> 952d1fd Propagate field notes (#790)
> d364932 Fix: enable Python 3.12 to parse templates (#785)
> 5709b1f Bump actions/setup-python from 4 to 5 (#788)
> 9913d80 Keep GitHub Actions up to date with Dependabot (#787)
> cab78cf Fix: update deprecated sqlite3 datetime and timestamp adapters 
> (#786)
> ed3e92c Fix storify and multipart (#778)
> 
> Remove the upstreamed patch and add a license file.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master. For info, I slightly reworked the patch. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/dab0de6277c484998842f4617a9730ce2ae3b050

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
