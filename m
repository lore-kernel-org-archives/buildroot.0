Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C834CC61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 11:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EA63605E5;
	Sun, 15 Jun 2025 11:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WyWlpv4eCPV2; Sun, 15 Jun 2025 11:42:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3339605E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3339605E6;
	Sun, 15 Jun 2025 11:42:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4BA8151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABA3540025
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLPgmwXEzr6V for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 11:42:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C37F2400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C37F2400AF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C37F2400AF
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:42:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1026F5FFB1;
 Sun, 15 Jun 2025 13:42:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 13:42:15 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 13:42:15 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250614101959.61812-1-bernd@kuhls.net>
References: <20250614101959.61812-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d9fd7a30947fea604c97d3e205a33726@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749987737;
 bh=5Rcx5gZH0XO2KF//0k0dbhffiCh61E2o0tqUv9lsJGw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mUstsDRqewAz3eyf+1mu0Cb47UuxtVyXUVd1ga+8kcVkX7r/64SCd89kVm/v7iI8Z
 7k6KL70K1rnuxRNYF7DQN9q6VrKLD5++IxWR8wWLeI+y7eyjVQgYevafuvv5bxvDyY
 +1o5aWhuuomU14Gzx6wTNVuqdHJJxFuOpOP7yP9p4Ce6YJiEPQ4BdY9lEELIsAOWN7
 u+YitG3Inh4uPZ+SE6UKyTJ0o93B0xjJ5r60hOWRsHamPxK8QVTSp7cdvmO9hXxmQe
 DZ4aIOIKrqqEMCJwM1mTo16yzejPQ9nKbaN1a45bGlKBgPgM8sP2BRIUksPI8dKeUg
 ISrZMUquBzqVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mUstsDRq
Subject: Re: [Buildroot] [PATCH 1/1] package/dht: fix cmake4 compatibility
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

On 14/06/2025 12:19, Bernd Kuhls wrote:
> The only dependee of dht, transmission, forked dht due to upstream
> rejection of cmake support:
> https://github.com/jech/dht/pull/50
> https://github.com/jech/dht/pull/19
> 
> A fix was added to this fork for building with cmake 4.x:
> https://github.com/transmission/dht/commits/post-0.27-transmission/
> 
> Instead of adding yet another patch to buildroot we switch to the repo
> maintained by transmission.
> 
> Fixes:
> https://autobuild.buildroot.org/results/30339a4fdb9c0b608ca3c5ae0692596b21b2fc3f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

For info, I switched _VERSION to use the "git describe --abbrev=40" 
format. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/1b5f8d04c8798e0d4def0ea2b5dfb20329f2fc38

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
