Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE060CA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 21:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81A906146B;
	Sat, 23 Aug 2025 21:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzqvDvtHiqRF; Sat, 23 Aug 2025 21:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D44326146C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D44326146C;
	Sat, 23 Aug 2025 21:31:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45A0E71E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C5E040DA8
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXlXjKI1CEEC for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 21:31:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A1F440C44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A1F440C44
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A1F440C44
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:31:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 42A7E13F86A;
 Sat, 23 Aug 2025 23:31:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 Aug 2025 23:31:39 +0200
MIME-Version: 1.0
Date: Sat, 23 Aug 2025 23:31:39 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250822214842.4059360-1-thomas.petazzoni@bootlin.com>
References: <20250822214842.4059360-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <131863354fa358aee3b9985e7ddab4e2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755984700;
 bh=MP1SKPVy4JpgBMzeV3cJRwTImW0p+viVuecE1sHDa+o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ONOPASDCLIiM2Updz6Di/vaQfXA7b410ZlgZGYNvVq+bkktt5ySa8MpEXrXRe5Ar8
 RA+EzZQxajrH/N8hzV1yDEJVpWgB/1uf0p+FSP3KbqF15MkTYEHm+7UkHaMVZCTyif
 AukYl3tXefG9VppRWsEPJtjB8V0N4nHDGEKLd/8wzpAv9WT6sYpvXgPRHz6H05fPfZ
 +wNtc5xPCYkYlSl9C1qX9SrHqkuxq4iAMkjo0b/0n69mpWQzTA5mdD11OfNi8O0Tq6
 XqxjqV58+dT74NlY/zA0gsyA8JOh27FUW/i6jyMjEjGBM46iQMAcVqvB6sBJSeFhko
 BMHmG/hIPbQJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ONOPASDC
Subject: Re: [Buildroot] [PATCH 1/2] package/gdbm: add upstream patch to fix
 GCC 15.x issues
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

On 22/08/2025 23:48, Thomas Petazzoni via buildroot wrote:
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/3bffec1eba130b3ad7ec270d870c04c2659fce8d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I applied this series to next.
I also applied patch #1 on master.

Thanks,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
