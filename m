Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB85D10F39
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 23:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0E1042DE9;
	Sun, 17 Nov 2024 23:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlJqHIKJh0ri; Sun, 17 Nov 2024 23:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F57842DEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F57842DEE;
	Sun, 17 Nov 2024 23:31:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B746DB3
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 23:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69382409D3
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 23:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGGv_Vbb6OFX for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 23:30:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D2EE40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D2EE40025
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D2EE40025
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 23:30:57 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:4a2:8c06:3742:179a])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 51C7D2003D6;
 Mon, 18 Nov 2024 00:30:53 +0100 (CET)
Date: Mon, 18 Nov 2024 00:30:53 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <frvecn6fyk3qgusfpyrdday6dfcaevuees2rocvpq4ks7lxh3h@muc3p4tqo6gu>
References: <20241117215429.136783-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241117215429.136783-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731886254;
 bh=2kjYy1/zRSrSrHL8nolQ487DxfgdC4u7uC6CSZyiRDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O9FaiVRZp+wipvSf+IjloIhGZJfVPnL5UmQBoNgHmaRWWwX25nwYxg4fvmF4MMYgk
 KJph7FR0c/ZzRRyggRCyQj+mfS3gtHquLQidgR936asfO8CqjGEaEhU4djTni2xART
 Pmvt4t0xLerOSJdnoNyxVAMyl9vfEhuHxlAYqa8OU7PpxHPdsg0m/hYkTZeH2F3Q3N
 dibMTlcS1FB7Lj94tWNwQ/07zzrHjKuZhqkt3Na2UsQt4J/MBNUb4rTqGjXR4oxnAD
 +OmNjdKIN0JYYyWwbxFxuvHDXT7QzydPWYOFrripL4rbyKG0tmP2qUsDLv9H+DQC4k
 FsjpOL3mvg/sg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=O9FaiVRZ
Subject: Re: [Buildroot] [PATCH] package/libnvme: bump to version 1.11.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Nov 17, 2024 at 10:54:29PM UTC, Giulio Benetti wrote:
> For release note, see:
> https://github.com/linux-nvme/libnvme/releases/tag/v1.11.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

LGTM

Reviewed-by: Vincent Jardin <vjardin@free.fr>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
