Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7497CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD06D80A49;
	Wed, 17 Sep 2025 16:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2osU3u_L9_3X; Wed, 17 Sep 2025 16:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD4C2809BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD4C2809BB;
	Wed, 17 Sep 2025 16:54:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55609199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C0134072B
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kr3EcMjSOeew for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:54:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3CB5F40725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CB5F40725
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CB5F40725
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:54:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9B75819F576;
 Wed, 17 Sep 2025 18:54:20 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:54:20 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:54:20 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250916013606.2596265-1-james.hilliard1@gmail.com>
References: <20250916013606.2596265-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c54875d530ca9662310a34af581a888b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758128061;
 bh=eYVu02OEDjpWO+pWFx+QLPprhr3vVw2irrEnbVuQ0SA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZSD1MAB0kMSbXsNLCeuMj+RVrzTnArK31cCGlSqwhRumBZLZgZF87gFRtUTuCafuY
 A47eAlITL5pJST5GeOk9duMVCshCzzdYI3Z4rNr4YcavY+BTLGZMrJCzi2X7/yrGh0
 /ENANV9TDS2sPjs3rpaXE5lE9zGSDjHUkJcmGuGS5U8EIolgD7g4E39QFvzjKeoIDG
 NSJF4e6xcflnwOk2V92JKNiQLVLsxM6bwNJuTgZPSz+NuiHeYF4bKR5zLLGue6ckDM
 XsG4YxIqfyk0lX7pdfiSvgcGT8zOmLdkDngzrW81MvE6b5kChb+wNROoJIuPSaGMOK
 q/r8KLKN0aDbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZSD1MAB0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-selenium: bump to
 version 4.35.0
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

On 16/09/2025 03:36, James Hilliard wrote:
> License hash changed due to year update:
> https://github.com/SeleniumHQ/selenium/commit/c62597e5cdbfb7065a7587bddccc253c3e739846
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
