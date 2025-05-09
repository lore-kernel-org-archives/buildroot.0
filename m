Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5A2C3ABC3
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 13:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B43940C68;
	Fri,  9 May 2025 13:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GXg9BQ3X01R; Fri,  9 May 2025 13:13:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D48D540C93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D48D540C93;
	Fri,  9 May 2025 13:13:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3439415A
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AAB28210A
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJIDcPKy7wEl for <buildroot@buildroot.org>;
 Fri,  9 May 2025 13:13:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB23D83BC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB23D83BC9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB23D83BC9
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:13:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D1B2B60137;
 Fri,  9 May 2025 15:13:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 May 2025 15:13:52 +0200
MIME-Version: 1.0
Date: Fri, 09 May 2025 15:13:52 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250507191741.2684629-1-giulio.benetti@benettiengineering.com>
References: <20250507191741.2684629-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <bd570b81cb7d342b07a22d3f79fe3a8a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746796434;
 bh=wHs9gg9wlee85/uvSePlgmPjjg53mkfqs4cJn6NZlAM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SGLFCEM0SEo7LuQ58wSoiSDtybelBDuOPyMth6iyBYorIDfkWopwR3tQd/18Le4rM
 NMZ6A5WJgjTrjVZZKOhBKLtDJiblhfS5RavFwJXTXpPfz7tt9TG3h9Ayu+eMl2lFhH
 x7UNiBVgSnzWlzIBqAlP/umt4/2xhghYkhEQcFoVdvFwfPifcRzvSvX8z+J5HRTSko
 6lerFrwumYHWt9x0EXipbfbf+vFHSQHaYGtP2TkVnsaoxZp6r4e1/n2jdXLGvWCi3k
 vmUg1PA4Hhplm23/UAhECFZtLalUQ/GltDBjzOP4J6IO9uXZhjr0XyLXaGGQfOtjlK
 FZIAGUzOwSkIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SGLFCEM0
Subject: Re: [Buildroot] [PATCH] package/swupdate: bump to version 2025.05
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

On 07/05/2025 21:17, Giulio Benetti wrote:
> For release note, see:
> https://github.com/sbabic/swupdate/releases/tag/2025.05
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
