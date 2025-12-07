Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29774D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E0BE60B25;
	Sun,  7 Dec 2025 17:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCHJOxKcxOHq; Sun,  7 Dec 2025 17:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8D7C6077B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765126868;
	bh=T6gmhSpCFglByXL69UwfUlBU3Hn2SeEZEQeKS9EqvuE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KAkskMlnZlkFwWGxHVnd8HVYjiCa0AttO/C+NAOLVSc4781/MiqiFS1k2Swh/LdZb
	 1QcnnbFxY7NgXH9nQvYrZG7M8/EeNN6wlPL9Tb7XuDZe+JkUeQPCTH7t0fBt95Ye0F
	 UrerXB2svozk+eqNIvBMpjK87DYKOpdVtDNaEWjT+atUla9CKZGdGSQcF1leyMxa/j
	 WuH+5bJBzoM+y+O2VxYUzRE9X/sLE/iFqohpjcVia9d7sQ+pHtJXzxaT9epybPU2CC
	 SsMS4GSyHC7Chx85sw7OOUTL/IzOnrfhyjZjScOnjTIxXXD+fsXQ+8TbjCgtmFOqIv
	 +iLNBVuqeD9Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8D7C6077B;
	Sun,  7 Dec 2025 17:01:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD04B2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3AE6403FB
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWMuKHISbhpa for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:01:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61F9A40168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61F9A40168
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61F9A40168
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9A5575FFBA;
 Sun,  7 Dec 2025 18:00:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Dec 2025 18:00:47 +0100
MIME-Version: 1.0
Date: Sun, 07 Dec 2025 18:00:47 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Bartosz Bilas <b.bilas@grinn-global.com>, Eric
 Limpens <limpens@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, Pieterjan Camerlynck
 <pieterjanca@gmail.com>, Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao
 <tianyuanhao3@163.com>
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <dd86a8675f97b0c86c131133c85f39c7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765126858;
 bh=kZY8gi/bwRPJat6NomzRgD8QA0jVusUj1USTk9Ah1nc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KlKxFMyTp6tIkzuu5o5q+OtdKdxjQpA3ZY/pCIOA0sJUivVSFLSG2yfUa0orBB9EH
 rm2O8NOO5lxo95gL+eCnKUda3sgBHwAUe0oQVaIDK0il4p4wfBaxyo6ZL0B00jssJ8
 Clsf1up/afoMgQN7S29tDbM4rU5Lnw1JhdeBy95Xf/uTGSh3xx66XjHHWqP2hS5Ltu
 02Bp1WluIrtytPdS3AkESc3v2zN//w+JblXd8qhz9Ubd/ARF+6/6STGJ7TwS3t0bRH
 SQWHuYzeNS4Wig/JBNXVgqIE8VkN6veF9kwVUjv2tEetnxZJeeOWGpecYChfTm9uQL
 SKxXPud/Nq5bQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KlKxFMyT
Subject: Re: [Buildroot] [PATCH/next 01/14] package/pulseview: fix cmake 4
 compatibility
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

On 07/12/2025 15:26, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
