Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877C210F286F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 21:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DEB140C8D;
	Fri, 27 Mar 2026 21:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hyp7_y0nBj_S; Fri, 27 Mar 2026 21:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92BE140C50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774646331;
	bh=kXHAZmVNhFmT9MBF4lCvIGxiqsby/FRqdUMuNzlYhkk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rSa2H5WD7TbIZzgjuEWgrYki4ntY+/XCWUbSnNm4MwzVWPRkDfoEJreakofZrEnPa
	 owtb98vsjmpRakyab5VFdytTruQImRhgGZNPkZ7WC4qNhfYfy7FS6491fxilt4zKQi
	 uGQzaZFwyTs9ur2WYZzcUF3Z/RU3YRw+cyWv5i8C1RAnuww/W05Nh+/Nqi7Z/cJYLB
	 ZOmiiLbVlkj7ke1ULAznkycUyVYAhHcuaOHfTvYQUWdNrfwMlC0Ri6yVRsPVTk+byW
	 GA4eQlyp/BqOgb7xMuavlrUXBgchRLJ/MjTcLiF3RoqBV3mvTfR6bgsR8Vd9YIvsQy
	 nMOvU6SpZIH3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92BE140C50;
	Fri, 27 Mar 2026 21:18:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F7892AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45C2080E13
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FQmaxnG0yB0 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 21:18:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6AF0180DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AF0180DF9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AF0180DF9
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:18:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1B93F5FFB1;
 Fri, 27 Mar 2026 22:18:46 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 22:18:45 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 22:18:45 +0100
To: Vincent Cruz <mooz@blockos.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20260327112542.1173652-2-mooz@blockos.org>
References: <20260327112542.1173652-2-mooz@blockos.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <ed10163d3876eb09f3546bf610dc15e5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774646327;
 bh=Sq00neCWS6afaXQDjnIf53UpuQddCKyuXlB6b5xvZ5M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hhlhk0ls2ODfWxOXWCRh41T1ArJAMI5BMvc8BQz0TrPVsOYnQlaRS84KMj8ZDt2Vd
 vUnToWcXORRMAh9K5ebxOu3wNXplyObseTqXy8kQBeaqvU7sfzYqKi/rqv1V7K5lKd
 zBMnzyxwuXfRd1ksx8zhNMkc8w9JLzX08wsVp04jHVfZxpNArcigJ17O5GCuffGHUt
 mRX8mBwYztoK5RDIzkekANXG+a83iFxFUiz5gqo7vHq5dpFs18JV2H35NhgnE9+snk
 S1ClRCTFwQgJ+fpzdKaBFIkcnplgCz5E2C0fpRKcLRJU8VriLoZtjx0Kyaf1yVyiz1
 tLJcA6CKi4agQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Hhlhk0ls
Subject: Re: [Buildroot] [PATCH v3] package/rwmem: bump to version 2.0
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

On 27/03/2026 12:25, Vincent Cruz wrote:
> For more details, see:
> https://github.com/tomba/rwmem/compare/c89bc9ad9...2.0
> 
> Signed-off-by: Vincent Cruz <mooz@blockos.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
