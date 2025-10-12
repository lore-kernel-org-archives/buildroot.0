Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E27CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 10:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23C6940D03;
	Sun, 12 Oct 2025 10:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTi2ZNU2lY5u; Sun, 12 Oct 2025 10:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E08940D38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E08940D38;
	Sun, 12 Oct 2025 10:28:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F301512B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8FE3817F2
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANZOnCX22jF2 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 10:28:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E22DC81799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E22DC81799
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E22DC81799
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:28:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0512619F54D;
 Sun, 12 Oct 2025 12:28:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Oct 2025 12:28:00 +0200
MIME-Version: 1.0
Date: Sun, 12 Oct 2025 12:28:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251012085802.3442610-1-bernd@kuhls.net>
References: <20251012085802.3442610-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3cdf00ddf782895ee8787bc0f276bcad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760264882;
 bh=Y5OSbV7Y/cVmUUSHdR+QqEq1wKNxBMl7QnVpBX1f3vE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tpwApvCdxUNAKFy8WlDRGtydrcbJ6gliyG7VKoopIDz/NjcQj0EbS2pSRP4+sChaP
 mqh+1IQXIyS8QXwcygsjtcpLIoafvebP1+mlt5dAWWNy/gD2JijWc61R93AcJgDsdJ
 +BkLRNYASlzzmwB+mFl9VZE3Tpbr9/Zq/S9E9ptFrNX/Be0zz0kJ1zxqvrUlScZ1oD
 hnXuWNEF3Tf2eF0hIvxdbIxqwRAzIcB2Am2t+cyRZiIj0IYNKeJikk1ZFcdhZSh1bx
 bGCKI1TZkSc4wMbro0HX9MS+eTdSD/9CqrWU5hOH8v0+Gqcq5aM05qOS/VLJ4Hioa7
 Z4IDaUQNDQQYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tpwApvCd
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpg-error: bump version to
 1.56
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

On 12/10/2025 10:58, Bernd Kuhls wrote:
> Release notes:
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=blob;f=NEWS;hb=b3b68bde07b02dd2b6d78356ac90baa652a309fa
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
