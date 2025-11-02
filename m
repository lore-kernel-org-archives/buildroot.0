Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910FDCCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 12:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F528440A;
	Sun,  2 Nov 2025 12:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSCpo-VFN_oD; Sun,  2 Nov 2025 12:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC29843FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CC29843FC;
	Sun,  2 Nov 2025 12:39:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24E51222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16FB340B21
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvjxabLxGPzb for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 12:39:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 23A82408FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23A82408FA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23A82408FA
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:39:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 559BE13F899;
 Sun,  2 Nov 2025 13:39:45 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 13:39:45 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 13:39:45 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251102083059.4649-1-bernd@kuhls.net>
References: <20251102083059.4649-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <65e827fd3e53cabb089713dcac6ee9b3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762087186;
 bh=mPtEEZRXo+ZJNooczJCkK5ej83LEIjatqrKfRXXroNY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tq2T1uv9BYYh2cFGKR4dtonPGw3tPAg1MSrxyTNRtwt6SY9txBmpd78+/wllh8XU1
 F+hfIh//WRUjOLVBEtHJo6W0h3GDbZWPWWY6Zi6Pz1rThqZAiok3lIJlwEDt7gCB8K
 PQ05PFB8ClfQ89fH5JEU03RLSMHJvnvvuJ0+UR6ZQZHlIkL2hDfjXYIoOw3fKETgyV
 Dc0c5tfnUEDTo99SkgR7w6NEg/ykIVNM/hrN4yAhrD/hXGeHuJIu+gmdxeM7QmKh23
 ebykrWOZmyVECvco8OCZy6N41eMgTPe+aaTosp8AcRYhoIkhn7JoSrtDbZR1HfkNeZ
 EDps6XASMSDqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Tq2T1uv9
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: bump version to 1.5.1
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

On 02/11/2025 09:30, Bernd Kuhls wrote:
> Release notes:
> https://blog.clamav.net/2025/10/clamav-150-released.html
> https://blog.clamav.net/2025/10/clamav-151-patch-version-published.html
> 
> Added variables to fix build errors:
> https://gitlab.com/jolivain/buildroot/-/pipelines/2088905409
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
