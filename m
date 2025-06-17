Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D98BC71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7CDA83AFA;
	Tue, 17 Jun 2025 19:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaP4HoCbK2xz; Tue, 17 Jun 2025 19:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 417B083AFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 417B083AFD;
	Tue, 17 Jun 2025 19:00:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82ADFD79
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 695F8413E4
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txuRPaM-EhaO for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:00:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 69872413D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69872413D5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69872413D5
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:00:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 67508780395;
 Tue, 17 Jun 2025 21:00:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 21:00:38 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 21:00:38 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250616191334.3479336-1-bernd@kuhls.net>
References: <20250616191334.3479336-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <bdbd2bffea4229c31395f372ecff3695@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750186839;
 bh=IxlCjpXsFYdzkGnAAartdM6Uvff8XMfsSECH/4zo2y8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jb0QmLAL4rlRQf0Q35JZAz4f+OsZrsxhgXYFvtDwl6F40c94fbj6hpLIiFPcZGvy3
 FuKeAeohMcmBql71N9VwpkAR5uC/zyP3grJNHOtkPa2BZKVcWhbZsJcQyiQ5CREI3b
 +ETfxotgzhGnglA23+ggDAsTNGHD/aWMijyIzZTaRDpRP81KPdp3z0SDLtOuoVq/mu
 82/Cf2m4xkJ7TLfYpL2hxGG6gpc7SMnoVMkVlbMgshUHtvgnwa8p3Xq3h2ryQN+OK3
 Cnn/GMUbJRuZHd2U1F5KbQ6VVTUy5fL9PSUJ9zrj/i3j8nHtLQjNgHPbxzPrdsoyEC
 h9lwVFavukgFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jb0QmLAL
Subject: Re: [Buildroot] [PATCH 1/1] package/perl-uri: bump version to 5.32
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

On 16/06/2025 21:13, Bernd Kuhls wrote:
> Changelog: https://github.com/libwww-perl/URI/blob/master/Changes
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
