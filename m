Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8CDD116EA
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 20:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A77A04192F;
	Fri, 28 Nov 2025 20:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-dX3i-DGs7S; Fri, 28 Nov 2025 20:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB4614159B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB4614159B;
	Fri, 28 Nov 2025 20:42:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C454708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71CCC84710
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1MTokC72agt for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 20:42:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 906CA84709
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 906CA84709
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 906CA84709
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:42:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 48D0060129;
 Fri, 28 Nov 2025 21:42:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 21:42:28 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 21:42:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251128181401.3252582-1-bernd@kuhls.net>
References: <20251128181401.3252582-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <02622c79d237cce690f33888f25305d4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764362549;
 bh=9ECdIV7uQN5SyInD8AEv8TWd0m99nOD1RCiIWErV8JE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cV0vilo2HdZEW13j/+MPketwb5ijE6EgrfQhmKvPKV1ryBzqdCRfh2QS/UTy1OB53
 RskF46V+dgj2FBig+ZDZkelCZvekHQxmJs+WYBnS5kOYwr0RSTxJavAK0S43VK43s4
 g9X9Glt3rbxJJj10BdM6jLJ1OhVPNZ8wyb7w7HcxavUXW/kpkHTQ5WPTyytXz2CD1x
 f2R+YdzWahT4+4vCqvT+QFL0Kr+kKN3oUrTosF/dfa/uKrRqHy4D5x8wsy0aUDyfZW
 2zUUM9KDWLv4rzGsh5IbA3agRYvbBdytJ/cCja1wJoZUMHm6MCIMhQkgt1sw6J4++k
 h8Mc5g87lVKjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cV0vilo2
Subject: Re: [Buildroot] [PATCH 1/1] package/xfsprogs: fix build with icu >=
 76
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

On 28/11/2025 19:14, Bernd Kuhls wrote:
> Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 bumped icu
> from version 73-2 to 77-1 causing a build error during linking.
> 
> Fixes:
> https://autobuild.buildroot.net/results/a30/a30bf79be2102f3a77e4a78a488fb3b6a5b63bbb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
