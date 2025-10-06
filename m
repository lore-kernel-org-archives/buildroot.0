Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A714CAC5B8
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 20:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2DE961598;
	Mon,  6 Oct 2025 20:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADyqGEOWv30H; Mon,  6 Oct 2025 20:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 317496148C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 317496148C;
	Mon,  6 Oct 2025 20:47:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 346B7272
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25F496148C
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m745EupB-NeK for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 20:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3873C6144D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3873C6144D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3873C6144D
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:47:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1460220039E;
 Mon,  6 Oct 2025 22:47:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Oct 2025 22:47:43 +0200
MIME-Version: 1.0
Date: Mon, 06 Oct 2025 22:47:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251004121705.1972951-1-bernd@kuhls.net>
References: <20251004121705.1972951-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <01e5099336009f1667f2270f5c52ebcf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759783665;
 bh=Nziod16QDLKzxkawPmLAv9Ph7DhYKmDiW9RC+cohQ8E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gzSMHYSiuh+l/QG1CVO+jzDYkDTZ2QeeLyUE9le32NObQwtXypb1tGOxkDdQ3LCt6
 DjhqmR7mGHmr3WtQllBZ7oVrR8pA+E7Vtyq+asdMBnFO6LUKF1Ou2yixRcVOJd1Bav
 fyn2xywfErILAKATVkCayAyPScsVyrzIT+4BfJGCI+nGtZDHPM0Gq7SoxuG+aVGou/
 fPECyQWQtLLOOucG6pE8ZL6tY4FLKYtbQiRjHTibuG7vSkiqqC+1WlCj7uwEnMSrtf
 X1tUu2JajAERZKVT4fmpqmyFcOXHS1Eecqj6zIhk3d6hEibSe13GmnuPPIkJwC0mga
 UTg6viqo5HSkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gzSMHYSi
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libao: bump version to 1.2.2
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

On 04/10/2025 14:17, Bernd Kuhls wrote:
> Added upstream patch to fix a missing include, autobuild did not record
> any build errors but Arch Linux provides the patch:
> https://gitlab.archlinux.org/archlinux/packaging/packages/libao/-/commit/bad3196d4e3030d31b01eb3bd41fff8afc8ca113
> 
> Switched to gitlab tarball because the previous site does not provide a
> tarball for version 1.2.2 which was tagged in 2016:
> https://gitlab.xiph.org/xiph/libao/-/tags/1.2.2
> 
> Added autoreconf due to usage of gitlab tarball which does not contain
> a configure script.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
