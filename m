Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C53DECD6D6
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 20:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A94A840D8;
	Wed, 11 Feb 2026 20:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6kI9AeSNMLt; Wed, 11 Feb 2026 20:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DB64840E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770842024;
	bh=CR6ofGlt8Dgf43R/BTynguStMA1MCsoYSeUdB6e2xXY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hTScenUr8vpOXDYdONFhwWADfz9Mpz+yjMlPp74mOeHcsmWXDoOJUVPSNq4R8pxGW
	 YNd6J3zK5wsXg8qNgdmC2IQnuYuAEufUgkXfa/VA1NVxJEAxuAGrJG1fstnoMs+EnZ
	 2vzv4T0aTihK5jC1UPzXfvkWlgJ/nWVhK8PAbLyqfkUJpzjqI6NzEoNgb0gh5P44js
	 7ymwEKts5iYstuG7Rl3Kp8beojN5kK0MsyHhi02LrskaPkaMpJGRsD4XrcdopH+0PU
	 cwL4yCaizgMJ/FicMUfu/qa+2PF37mPxFoMsJun9r0bL90zXW7YqlLBAOc6J0GkuqJ
	 czxiXRkqYJVXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DB64840E1;
	Wed, 11 Feb 2026 20:33:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E77823D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F37880AD8
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qxsu6uevU5UF for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 20:33:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47F67840D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47F67840D8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47F67840D8
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:33:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6874D13F8AE;
 Wed, 11 Feb 2026 21:33:37 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 11 Feb 2026 21:33:37 +0100
MIME-Version: 1.0
Date: Wed, 11 Feb 2026 21:33:37 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260211154210.4018909-2-buildroot@heine.tech>
References: <20260211154210.4018909-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.13
Message-ID: <05bd016a4910a3a58ea0caf7de33d566@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770842019;
 bh=OmlVEDEy4G8k/z5ArF9tYp6JHqouxXK9RxkC5TwC0WE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dd5f+9N/5gZQtG/UUR65djEb4EoRIdKTXtBzG1bXdBPv8dKZ+O94E6XLzVq6hQuXG
 KEQGz4IH/zPrTJ9Tu0aGgjsv3SmMiybp+uecBMnfjxiWSVgI5KDXH/84C2tJsiOVcf
 eQ14IoB/p6M4ItQ9DTCx0HlcJzIZ1A9mmz5duIthh1rPhcEBwHdhFoJyMwGPO88YyB
 C+29vqufFxyIGsZSsKxuaFJgt4cGgIMYsiJcMU7iOBt9QaapV2MMHyDon7Z5fQiUyY
 xsWeF1wBaAu6peg3MtgyFKQrrNBd0dK795lXj+H20FBSSzqZKdIUFTXIqyXWlN5gLs
 ThUbFVtP3Odtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dd5f+9N/
Subject: Re: [Buildroot] [PATCH] package/i2pd: bump to version 2.59.0
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

On 11/02/2026 16:42, Michael Nosthoff via buildroot wrote:
> - Requirement for Boost.DateTime was removed in 2.54.0 [0]
> - Requirement for Boost.System was removed in 2.59.0 [1]
> - drop "WITH_GUI" conf_opt as it was dropped in 2.32.0 [2]
> - LICENSE hash changed due to year bump.
> 
> Release notes:
> https://github.com/PurpleI2P/i2pd/releases/tag/2.59.0
> 
> [0] 
> https://github.com/PurpleI2P/i2pd/commit/0992a5124fc9d214624fccdf4386a50f53d6f8ef
> [1] 
> https://github.com/PurpleI2P/i2pd/commit/06a86f31a12815fbd16615cc9fa17199bac1ac17
> [2] 
> https://github.com/PurpleI2P/i2pd/commit/db6a0e6ad9124ef9b6217af487b3c844234ba5e1
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
