Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC41C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9313D40629;
	Tue, 17 Jun 2025 19:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwGFMdI-ufVO; Tue, 17 Jun 2025 19:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D905A4047D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D905A4047D;
	Tue, 17 Jun 2025 19:01:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BBEE16B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D33583AF7
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQYbKo5G8frv for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:01:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68A4183B29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68A4183B29
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68A4183B29
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:01:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7CF9513F8B5;
 Tue, 17 Jun 2025 21:01:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 21:01:19 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 21:01:19 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250616191419.3479584-1-bernd@kuhls.net>
References: <20250616191419.3479584-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <561810f49d6b1523ead14235a89c9ba6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750186880;
 bh=TWqlIaVVkT8AWBveJQx7xSyPIgeQ3UjR1qOil5y86UY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ieMvbX5O/XPLSDfTi4CbJFU4y/4KchZT8mnjTXxohcn6lY+NXkJTK5Dq60hH4OEly
 g/2kOdtUTmztl46Hc+Caucp2LjPQX0dKlZpX81DhqcuS5BvZc/SwPbht05V9S8LyTC
 rpyXp4Mm9JEzcQYWWXCgwlWqmKbUsq1jYPuI/aqcDsst5efxABESrENiLL+7mjjV4b
 Y5mIosIm+hRfY1yE0wx4995dEa3/U3HMLFO4HyB0aRpY0KFD8kcy/ybq9vBRi1Saqd
 X/UBuKvt7KVEq2H/bx1MGiBS4Rv1At63xsO6vr6OGUZCFNOBsYX8RT3BCjtfkDP8di
 gtyO93wzOAb3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ieMvbX5O
Subject: Re: [Buildroot] [PATCH 1/1] package/libass: bump version to 0.17.4
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

On 16/06/2025 21:14, Bernd Kuhls wrote:
> Release notes: https://github.com/libass/libass/releases/tag/0.17.4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
