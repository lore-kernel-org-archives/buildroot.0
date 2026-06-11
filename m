Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484FECD98C7
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 21:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0448D82382;
	Thu, 11 Jun 2026 21:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmirpFhMBXIy; Thu, 11 Jun 2026 21:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7A7A82376
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781212938;
	bh=nrQ6XaCEKQ+j6a8kmru5lIZjQ6b3h7EdgMWcZoGJAxU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EpSnLqtwUrfdSNMVRvf3+4gN8JH+REoaMiwOB9QFBJBJOz3GStaiB1VTKVrRv0RQg
	 AlbmkQ4PxA45tgZQv4qlPcPmKdAGLqIZcM+fLIKdE7EQFevnhXRkMv/nJzdu4Zageo
	 pWzTaLQire3HGfGESJC8z66Iao5A/oqbyWwmQjz7xqblJhrcWPtNTc8G2bzMPdSV4C
	 MAQpSW4CgbDk6tuMBQc/GeJeZ4dPLZ8hYKph1+NdGE+vvjeR1f9SbN0MxSxjvMocg8
	 NBCEjTadTyGgFuuAKSRc9REgtwLZwSC+BpjyV78MtoIuR2HxF6ED8A9epgK6b9kf5/
	 D1dW9u7oiHUTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7A7A82376;
	Thu, 11 Jun 2026 21:22:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F10BB237
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 21:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D216340540
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 21:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pf0yr91qt9kB for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 21:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5B4140542
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5B4140542
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5B4140542
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 21:22:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5FCF6780375;
 Thu, 11 Jun 2026 23:22:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 11 Jun 2026 23:22:10 +0200
MIME-Version: 1.0
Date: Thu, 11 Jun 2026 23:22:10 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260608150453.191574-1-shirokovalexs@gmail.com>
References: <20260608150453.191574-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <4a9523f200d9434a83fb51dca4057242@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781212931;
 bh=ki6i+PXZR1m8Lc8xLvorjUfuBJjxQdx0CrEIX3tSs98=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Bu/rlXpsMZjIGY/c8dw5hKiPVZVmtgHACOhRbehRJ/K6l8E7UgC+eweSQpHUCUVnU
 F2QyV/vyS5uhAyHenKdG4BjxyAW6sZLDTzRqdMMe8Z8R9tA0ea6czXypuOXn0+8hJx
 gnbIH/ZWYy9jyaxceGbs9i6qZuGXme4LNBP56YTN7vRqkuiZGA0azDRrc0gHPFqNeX
 1eSW+Ac5x7jcZdZX/7TbYyLoRu1W8KbMdr+4bJrrmAwKPHYJvAiAs8BSZdyBhfPufL
 QDc7JjiEVu6LKV+GyM4MQP3vQ2u7niSxPCsM6eVhU6oclxvsNe6oX998n8ChfZVnDO
 MvHH56gnj3dhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Bu/rlXps
Subject: Re: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.57.0
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

On 08/06/2026 17:04, Alexander Shirokov wrote:
> Changelog: https://github.com/Canop/broot/blob/v1.57.0/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
