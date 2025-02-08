Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1371AC02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 22:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE03060756;
	Sat,  8 Feb 2025 22:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SN-fUvlby4gF; Sat,  8 Feb 2025 22:04:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C69C76083C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C69C76083C;
	Sat,  8 Feb 2025 22:04:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAF8C12B
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 22:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEE138392B
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 22:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSlGPTRTsRrj for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 22:04:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6877380C0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6877380C0B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6877380C0B
 for <buildroot@busybox.net>; Sat,  8 Feb 2025 22:04:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3F218780331;
 Sat,  8 Feb 2025 23:04:41 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:58984])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Feb 2025 23:04:41 +0100
MIME-Version: 1.0
Date: Sat, 08 Feb 2025 23:04:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20250205074616.3285104-1-francois.perrad@gadz.org>
References: <20250205074616.3285104-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.9
Message-ID: <c114c4b75f73a2e5546f9e0e6bccfe3d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739052282;
 bh=GbYdHZrrG/gVZT7ZKKr67DEFPnrRfQtEMSPvkqft/h4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AoJRUazk32s7s8X6tGq9jfkQQg/z2ogkeiiPb+5BnTRQIyeV+5z+pQn34ZniD/G4I
 sAATDxkYdOyJAHycmAbD5hGwIZ8/oUcJJHDrSMlvQ1c9b7DpSyYb4AgFP6SJMdq4/8
 71ttPtK+8phqhSA9OwB9i1nfsgmnCNP4uDVL1wAkb79bMl8IsEMoUmlnB0bF/XoAJ2
 Ri3sEtZHXSnBMjtyDG0hRlAf1aBOaqckPZBhcTjSjj73UegxFCUDuRH1uaQAOUEP78
 q7sC0w75jV96LeCUN3aOzHo9bK7eLGssVVPu4gJ5hezNQh6d5vOTW1vCL1mQZYJYdB
 qVSrSlusKsFwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AoJRUazk
Subject: Re: [Buildroot] [PATCH] package/perl: bump to version 5.40.1
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

On 05/02/2025 08:46, Francois Perrad via buildroot wrote:
> diff README:
>     -Perl is Copyright (C) 1993 - 2024 by Larry Wall and others.
>     +Perl is Copyright (C) 1993 - 2025 by Larry Wall and others.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
