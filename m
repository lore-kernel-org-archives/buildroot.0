Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE43CD98C7
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 20:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5294082286;
	Thu, 11 Jun 2026 20:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKDjQswx5wCu; Thu, 11 Jun 2026 20:42:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C66A681FCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781210527;
	bh=BE2DDDMyyDpn2WrvFBWMmA7NhliJIKTZRK/YLQkb0RM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dCCuqiGzkCEe2YkBUVUUtLmlXKdqq/edSmn/GNxgPsPjVJ5XHuSlRlMrMLTby0E/t
	 BOVX6yD2fYTjyPl9+z1ThCHpHTVLGALJv53TbGqphv8+lKvqUV/YqyI07UQFCaNfsQ
	 5BWYIVa36aq0IUbc3mbJf7hOhDqTLNAcX1LKEOgOXEDaR4YhYfcOPfINma/BH/yXac
	 HFpB4GhnJZd3t8Dz5HoRCNTrWtG84nIRegWtEIlyAOP/ffLiwID0e/CCJrFVxiGhs2
	 KTj6C4aksK/DmyBJq57WqwcEc6hWw7ZG59oSvChqZqsW6i86MZeKNjFYYYv0/YZb4S
	 KQBo85VVvBQBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C66A681FCC;
	Thu, 11 Jun 2026 20:42:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B192F4
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B02760BEF
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkSWKg6LHpVT for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 20:42:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9574F60BED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9574F60BED
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9574F60BED
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:42:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9FC555FFB7;
 Thu, 11 Jun 2026 22:41:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 11 Jun 2026 22:41:59 +0200
MIME-Version: 1.0
Date: Thu, 11 Jun 2026 22:41:59 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>
In-Reply-To: <20260608223458.950479-1-titouan.christophe@mind.be>
References: <20260608223458.950479-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.16
Message-ID: <50878c36c7eccc5ff4fa0d60c5a4db9e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781210521;
 bh=l34F+jdIJzZsVIklolXbAoAyDtmV1EWmXwTnwdPuWzg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MpFcatlj6wqhQGQ+FlS7LQRMwbVl5WEyUJewu+pHo/rB0NzKd2qO0oaz+/M35Fctt
 RnZWY2lznfXSFcnLmVojl7k/iM20ykD7dpD4uiGqYdrZjY/sPEtfDied3sg7m7dBX5
 ULkMTs2rD2U1RS01xzlWW4BGkN2+C6QoiC76tMTvVh3WE1jVU686bdkHEErZ0/4o/h
 8xquf3hulWWBCruyp9NIFZQDKYSPa3l7DEN1uPQc2bZEWAks+nc+OCtINmWyPzuhR+
 m3lIHpaLhHSn/39QQS3lTBDpRD7A7jo+bRptJSz++7G1l9u4VzL75XH6tshKk1gRV2
 LgNB6ErSDzNWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MpFcatlj
Subject: Re: [Buildroot] [PATCH] package/redis: bump to v8.8.0
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

On 09/06/2026 00:34, Titouan Christophe via buildroot wrote:
> This is a new feature release of Redis Open Source. See the release 
> notes:
> https://github.com/redis/redis/blob/8.8.0/00-RELEASENOTES
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
