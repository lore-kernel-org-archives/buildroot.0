Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE20CCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 13:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C9C61134;
	Sun, 19 Oct 2025 13:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjkK0zz8bOi5; Sun, 19 Oct 2025 13:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 659B761126
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 659B761126;
	Sun, 19 Oct 2025 13:41:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A416A43F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89F9A61126
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-YROWNDq4Wm for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 13:41:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 952CF61123
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 952CF61123
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 952CF61123
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:41:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A550260129;
 Sun, 19 Oct 2025 15:40:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 15:40:59 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 15:40:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251018165935.1092067-1-bernd@kuhls.net>
References: <20251018165935.1092067-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <a42c3b0aa63067f244654f6200be5e5d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760881260;
 bh=J8S92mRVOFqPu8Hf9zd4ppjBvX3lcmKBzoGbjIyyRFA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F/mSivl1wyd3dUBPD1dkSle3e6EPlLLmQzOckhXeMkmBojDGEX6pwXgXvmWzKwAMC
 8ydrKuTR5kk5KBEmvuYboSYX3fTgdVTSkDD2eVIkk9LhT14IVWTtVzBilK3KM2jzbn
 OZO7G8y+DMC7zPzqIA2a7Vnnmg2v39sgdNd+T6LPV3K/gDPh0plWC19W8XCMHH6//w
 I9mOz+3Xee4xpbL1yVH+l6DsL6+/ZBZW8+FO4WUxaAuVuDAZocWnG0k6ZbNpJZA22t
 /bbrhV4WmNzW0p698g+I2WL/sERF3lUNgx0nDyXU0Yu0D6TxnK46D4u1Wr9zso8E5a
 4w6vEyCXniuVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F/mSivl1
Subject: Re: [Buildroot] [PATCH 1/1] package/mjpg-streamer: fix build with
 gcc >= 14
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

On 18/10/2025 18:59, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/3a5/3a5674e4e7bb3f2894575191af24598e2a696912/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
