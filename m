Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006BFCDE001
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 16:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA72782F31;
	Thu, 25 Jun 2026 16:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0f__1JL7Yvzz; Thu, 25 Jun 2026 16:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECA5382F13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782403455;
	bh=EtVVtc5lOUlTb2YG+JC2j6jCGJwtvWQojplfGsb4OJI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aTxtPhUmWJ4vLUkPrQBZp5/9I8d7Hh/IM6vompNzUl6QIXiXRIWUvsA/WQb977X6h
	 Y9bq98NZxw/u26QdTDtrpw3J/Zdcw6nrL+2gwayU8rm54Ys1OSAO4pwzzs0YoHU6rU
	 vYlxCvefWzGKaiqTI7FtXP+qbEGPOCQpR5r+aHE0GznKdeqlYdWZMzk0c8zkaOH10q
	 uIEjgY+09x+G3csw5fDnUcg72+2WvQDIzRgYlZ3wj8rPTgnnwUBbbu0BH/gi7g0Oxz
	 5BB6Mo2wEaKtA/6VBA0NnkwDscK4FWcrt4TqcPrO0VwMzKX8mtlHwgwpzZigMuBNZm
	 8pPwylazehMAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECA5382F13;
	Thu, 25 Jun 2026 16:04:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 224CA18F
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 16:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1467C40289
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 16:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFn7uZozvW6U for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 16:04:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E9524025E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E9524025E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E9524025E
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 16:04:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A94FC78035B;
 Thu, 25 Jun 2026 18:04:07 +0200 (CEST)
Received: from 2a0d:e487:119f:5231:6cab:f084:5c2d:94e1
 via 2a0d:e487:119f:5231:6cab:f084:5c2d:94e1 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 25 Jun 2026 18:04:07 +0200
MIME-Version: 1.0
Date: Thu, 25 Jun 2026 18:04:07 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260625123536.3814862-1-giulio.benetti@benettiengineering.com>
References: <20260625123536.3814862-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <130969657e9ffc7a29bf3e9a611bfa0c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1782403449;
 bh=61tiyhvGzcFYkVe0DAwarrGdZX6OJTkrVKZ8t+RX/D4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ruHB5n9rYNTUdc6vNPxt4Ru2GfT+dqNs6/+M/+0f/thuKAiijV+p1IUbGCB6Yxtyd
 wz3KoyNQZnR6CBfwQxF5auwl8s3tkdiUwoHYYi4f3TG9VAnI2cdhKjsjsO7QQvnOxv
 MlAYS1fak3BnZMNmzf9iQUksF+sWY6OSFTdF78Hl3xrft/5cxAGGL0K5BTpiq0VM+d
 LqDmajRZlSGRF+07hbR86WFOD7wVcT24VDckTjH1FPNLbcnNy9eWxAd1mSyLVAYdwn
 Y2MIgjKhgXTR9ldqB5pKNCG+/oHoq0/Mg7Xh+0sLTcKVgsteJviwifipOTXtJzNjTC
 WSQMPtE+5w/jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ruHB5n9r
Subject: Re: [Buildroot] [PATCH] package/mongoose: security bump to version
 7.22
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

On 25/06/2026 14:35, Giulio Benetti wrote:
> Release notes:
> https://github.com/cesanta/mongoose/releases/tag/7.22
> 
> Fixes CVE-2026-37635.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
