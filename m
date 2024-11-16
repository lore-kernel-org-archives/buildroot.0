Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E453DD68BEA
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 11:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD9C841EA2;
	Sat, 16 Nov 2024 11:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HW9zONL0EkZo; Sat, 16 Nov 2024 11:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3914C41E8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3914C41E8D;
	Sat, 16 Nov 2024 11:32:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B027F1EB8
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 11:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C079431A6
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 11:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssFMyDuW6SFk for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 11:32:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99C5E400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99C5E400E0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99C5E400E0
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 11:32:40 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:ec16:eb41:83aa:c38c])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4D4702003CA;
 Sat, 16 Nov 2024 12:32:36 +0100 (CET)
Date: Sat, 16 Nov 2024 12:32:36 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <uzkqd3tco4pvgprixhilwcxp4swb65phmjhsuiguusuxhphtco@yfry7ub5nkkg>
References: <20241115220215.1057916-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241115220215.1057916-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731756757;
 bh=DM53qrqgPyPD6fNJAO5RifHA/RCWaa2HzKo44xHvhK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D0w0Ng50uXaQzK0Ycx6gBXu5MyKvIqow9Hr+BhuVTxqGgsTUABYGPNy+BxDp+S+/G
 nz+d4kVZWoaJ1Pv/ZhHjIRIhw4yELgNnVkK4FZFpCiEgcIykl0+mIprbJf6VYaQpeY
 abzMTqrv1BhpdKz3kXX4bK4Pgx6rwz0fuxV4VdSXA0/HKUKWSSn+2ZCSmVHwB2aI+9
 bvlHKgZs8WX9HuvnSHmZ7eBql0jB+2ogIr4L4vguJUUPfNXqeaNgWfI0Jnb10DDyCb
 LXVvraFobB1GiFIXIPSmpnDcOXixxa0TH7jJe/j/8jdWv5Ak/XEDF9gxtWlqtmP76d
 kXrXjZR9yvqcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D0w0Ng50
Subject: Re: [Buildroot] [PATCH next 1/1] Config.in: switch GNU mirrors URL
 to https
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Nov 15, 2024 at 11:02:15PM UTC, Julien Olivain wrote:
> As explained on [1], the primary GNU mirrors URL is https.
> This commit updates BR2_GNU_MIRROR to switch to it.
> 
> [1] https://www.gnu.org/prep/ftp.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

LGTM, thanks for the hints on reviews. Let's start easy ;)

Reviewed-by: Vincent Jardin <vjardin@free.fr>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
