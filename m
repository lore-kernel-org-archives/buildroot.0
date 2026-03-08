Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512FAEA8537
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 16:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90AF760EFF;
	Sun,  8 Mar 2026 16:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_L9xnoajcPo; Sun,  8 Mar 2026 16:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 079D160AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772989162;
	bh=tUslQL6L6z2BJvZhT0DBntkwJeqz4OqqswEXB+WnLkQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DMmYK96kOjl63jQvLzh3cJm3vrPsmCS24na5KC6STDFF+8oK/035k4aPgtiNG3A9L
	 qE73o9siW8nFStY3/63DrYyRuyGk4xG4zSFEBLOVYAN3IFkLT7GI7T6Z7MrbS26lxN
	 Krqw/zAFEBza1JVUcxGKB4MM677JLNux/IBNexRMYom7Hy9bem228GyNvXr2vbLCFP
	 CfnV3yDBJGvV0ig2hS09Ou7W7cMwq/BwOmgdRrv/r0CGL0DD/mZO7ngIP9Mt5ms7nc
	 WEbxdT/kdobL9E7sJ60i6JyP0Qk/kc3nVG1cIPGyi3P8r1JkOZFvuz0ttv5qk9QPeQ
	 DPW+TaV5pQybA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 079D160AB3;
	Sun,  8 Mar 2026 16:59:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE793223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0043835D9
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlKXQo59VpjD for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 16:59:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0C2E835B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0C2E835B1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0C2E835B1
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:59:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 286AB6012D;
 Sun,  8 Mar 2026 17:59:16 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Mar 2026 17:59:15 +0100
MIME-Version: 1.0
Date: Sun, 08 Mar 2026 17:59:15 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260308155355.2566264-1-bernd@kuhls.net>
References: <20260308155355.2566264-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <af0afa9c82ee9046b79f9ed754f9c582@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772989157;
 bh=tcKtbYsRBDq/gl2oGqF49d0OxN/xk4RV1mL8KyXHsG0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gqGLZC/5WWnpYtTP4fY7XnyWGuTemES04m1DsU5SH/sTegNXtn7rdTRnRGNmNn2Rw
 J4v/iadrMJBw4pRxQhLq7g8OjOZXvJJRuqS7KPsI9ljHflgFAKGoN3ARlRiaHuk8eJ
 D7JHJfYyUXGJmv3iGbW2DAWvsPqF5i3It6C/MA1Nece7eXO1CGqfOO724+6UWaYfla
 5Dal5CKbipcw97CwFBQz+ommAT5BVdWnOSsX0KJ3nrY+DeYe5nvaJbY49iu8jJHhLP
 BZVOZqWMJfgUc8XVZLKBY8b7+zJ7PruX8Gg4mq7fR1Q4/EeKQ7cRVn6JSPgOVNXUEJ
 95qjTj8XUj4Lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gqGLZC/5
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.405
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

On 08/03/2026 16:53, Bernd Kuhls wrote:
> https://github.com/vcrhonek/hwdata/releases/tag/v0.405
> https://github.com/vcrhonek/hwdata/releases/tag/v0.404
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
