Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AE0C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 19:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C388C8211B;
	Tue, 13 May 2025 19:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMw8_6GBgY0F; Tue, 13 May 2025 19:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0767082375
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0767082375;
	Tue, 13 May 2025 19:26:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7AAD150
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9896241197
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I40zCVO8f7Gt for <buildroot@buildroot.org>;
 Tue, 13 May 2025 19:26:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7D9241193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7D9241193
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7D9241193
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:26:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 13AD213F86A;
 Tue, 13 May 2025 21:26:02 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 21:26:02 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 21:26:02 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250512214743.439158-1-bernd@kuhls.net>
References: <20250512214743.439158-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <97d7fa45b9c85558d41e613180c89f98@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747164364;
 bh=u+wt6Z4548lJm9K7P63YwN6PAsU7eOE76H9gPiS4HdQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IRvjvX4JUBW899KXw6kHszZxNsjKPye9qxHt9TRdOvMVNvdHMMtHjSF05t2s5F4rs
 hvAX722SIo1bclKQyL/BHOxqhoAz0CVGG56VqcHt/3d7J5zzsRoeICN3vJCEcl2Svf
 iNtQGqN3WDDg0Zz6ZHXjwGgtTSJiI8F3SeeotXHWZRkep6wf9A4W0xAiyyQFSNIDUP
 QqkPbUfyBY/PV+c4OPMtBmPxtFZou0nCkZF1Jga3i3OARn/O3Osoz2DUyJkeJ0j/iu
 Obmcxm9ui2hNuCOm9ThDB32oClDD7eK1cUsHIltjgDle0ycguDVMe7DEklzxCTOP7o
 kcAXNEkwxEIwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IRvjvX4J
Subject: Re: [Buildroot] [PATCH] package/berkeleydb: fix build with gcc-15.x
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

On 12/05/2025 23:47, Bernd Kuhls wrote:
> Inspired by
> https://src.fedoraproject.org/rpms/libdb/c/c250c61cc3d56c5cff7ba59308f46245a32bdc69
> 
> "GCC 15 defaults to C23.  The last release of this package was over a
>  decade ago, and it is no longer maintained, therefore it should not be
>  expected to compile to the latest standards."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
