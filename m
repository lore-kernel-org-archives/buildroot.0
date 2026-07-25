Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BE3C531D0
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 21:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF34960672;
	Sat, 25 Jul 2026 21:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_jw-KQZEKp2; Sat, 25 Jul 2026 21:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21B2C60653
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785015168;
	bh=BUONMlWM6D1eUVbtE1s9ctO2gYcgwL9ZKb+yu/2Ey/o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n0mQiDprna+VfzmykCtNxJRwRP2cne8Ivz6E4OXcT2FGM/gZrp2zx7FAbtWJeu6k4
	 2BT/kKj5r78PaUfuQLtrDBcNOr1A4oL3OEU1EqdSv17X2XHDLbKBrO9327QDE+Uw2W
	 sH31YouVUTAp/0itatd9jCPi+dRPQW3R3mk2JB7o8hz/dJ/3fJKry7ggEjfvH3Zhrg
	 A8VqfqinV3bhMx363KNGWsI6ktYk09aAG0WleVe3lKHeDHOYE2jzxYvxAk+qc8uIr9
	 utFzihqptPsZcJO0McZGMgTCKqkPuHu+XQ/wNrcw9+294F/C9Kygw7dgTclbnnPt9M
	 VdIbt0CCpH+6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B2C60653;
	Sat, 25 Jul 2026 21:32:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96FF2347
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8876580E1C
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:32:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CNUHFFznu8S for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 21:32:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70DC980DDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70DC980DDF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70DC980DDF
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:32:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8363D5FF88;
 Sat, 25 Jul 2026 23:32:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jul 2026 23:32:42 +0200
MIME-Version: 1.0
Date: Sat, 25 Jul 2026 23:32:42 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <23f5f721705e82a88212b4930d7876d4c1983ddf.1784867189.git.yann.morin@orange.com>
References: <23f5f721705e82a88212b4930d7876d4c1983ddf.1784867189.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <9fd801ed39b4803de03af75083d8f7ab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785015163;
 bh=vB0WnCJWxipNQpi168NRXi30EdpNLxPqLRWjHP2dN58=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TYoRlhRtfr9WF+jQsMZF/MaeIGzT5MlRc/dx4iD4N7RCAPgQM2y6AqTJZhWCs1zh2
 c2zOMDOIBx9jYFW09/5BI3cM/3EHGC8TMwiro18EMsoEca0bwtJLGI/GhUhDIL5BDO
 aegn9CDAAjmxBz92d0goFjsjAA6xL+pR76QxMJnZx0oMahG5DSxvYClfJcXq/621HO
 ETYCfTt7eIl9lf6YBuHLoLyk/0Kx/+i9qSBUTvi9mLC3OmhnNCKEAmWYW9YRpGMyxZ
 FKcF1hELUSbOq9W4eI/UdjyqihNsYdxZvyX9PxhBW01l9TsBoME7+h0wcDT1r9OeZa
 5TB4HkJx9RMDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TYoRlhRt
Subject: Re: [Buildroot] [PATCH] package/docker-credential-acr-env: needs
 NPTL
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

On 24/07/2026 06:26, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> docker-credential-gcr calls pthread_getattr_np() which is only 
> available
> with NPTL; i.e. always available with glibc (where it originates from,
> since 2.2.3), always available with musl (which has had it since 0.9.10
> in 2013), and only available when uClibc has NPTL (since 1.0.0 in 
> 2015).
> 
> Fixes: 
> https://autobuild.buildroot.org/results/525273d178d89ae8eef306d6ec662af368f20f73/
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
