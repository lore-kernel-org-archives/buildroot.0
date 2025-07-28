Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39AAC83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 23:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A78D241101;
	Mon, 28 Jul 2025 23:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7d9zqkX5VUNt; Mon, 28 Jul 2025 23:17:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4FC8410FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4FC8410FC;
	Mon, 28 Jul 2025 23:17:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A96E2D96
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AC1081289
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvbD6y-Do6m4 for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 23:17:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF7D981213
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF7D981213
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF7D981213
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:17:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F1DAC5FF95;
 Tue, 29 Jul 2025 01:17:33 +0200 (CEST)
Received: from [192.214.236.6:46594] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Jul 2025 01:17:33 +0200
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 01:17:33 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250727195904.4022529-1-giulio.benetti@benettiengineering.com>
References: <20250727195904.4022529-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <97902175dbe8f7a92248910382b26b52@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753744655;
 bh=fB0o5D2xut7mxMsfswrLV9HFeu5iQzbd6I3ykzQwCko=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=se8EPc18eeicMNv0BHZUCPKEWsBlNLBxoEjhIlJBx25yzXTYuaYnBqw21HzBB4hQQ
 9RS9Duaw350ODCEQk0nCyyj0HYrXidC62aeurSGHj+Iwe2PxTHzFBsDCDF3Nex2aie
 /pg2wXX/E1KoO3AazGpJEolNq+OwLxgXprMG39JPUj6MNTzT8AzgqlZI4AvV2gZPGP
 JP6MLcwslqGFbwZejKwT1kGN0zbnHu9un4EF9g5ID1GJJoZWGJxMAX+pVNBwCyJkfr
 rWyUHtUkp8WOwK6STvtczwo2Mg3crirTZRzV1gQYmfFPdvJ5z1WOAKxDCLyrxYfbdO
 0ES0DWN9wRGSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=se8EPc18
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 11.3.3
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

On 27/07/2025 21:59, Giulio Benetti wrote:
> Release Notes:
> https://github.com/harfbuzz/harfbuzz/releases/tag/11.3.3
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
