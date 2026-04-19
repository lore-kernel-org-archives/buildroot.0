Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B8AEA7197
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BEA740EF9;
	Sun, 19 Apr 2026 19:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtL9vwlTbZnz; Sun, 19 Apr 2026 19:31:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABDFF40EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776627070;
	bh=3HGDOTovSGH+KuNV7Z4dUcqmQb4tyDY6MfY85Dvmtq4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sGwZGfub4JQNmlwlfoL9MCUZii6VJUAW4Q/pOwfZ5VGisIxzzzXwreIph3/uCBigI
	 w+ex5W1ULE6oSI3vOAcbBiVNaiCwsT+L84L4lgLf0uaAU1s26snvKD/dXPdnEv7dYp
	 wzhZNrGQODAw/xQVq+B3j2uN6H1M33XJY9wsNsfUYtpN+xVE7hpdiEpZeWezz5Ho6V
	 J6Vws29/s7I6VBAVFxIMLLj84nGaeVUZMurs7WWoN2Nclf8S3Qt5fHqIk3srnXZ85/
	 uiRp0kH/QIdrH3w8qi6k16IOX+eJyLRToE7pbNMWClF3r8gDRCB3lmUjFGpPWp9NYh
	 7KwmQiNNsKMEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABDFF40EE9;
	Sun, 19 Apr 2026 19:31:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA24324D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFDE440EE9
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JizzFD5Zch9x for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:31:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0E6340EE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0E6340EE7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0E6340EE7
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:31:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 949D719F5C3;
 Sun, 19 Apr 2026 21:31:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 21:31:03 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 21:31:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Danomi Manchego <danomimanchego123@gmail.com>
In-Reply-To: <20260419142220.695101-1-bernd@kuhls.net>
References: <20260419142220.695101-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <8740b1a04b9b7466df65e422be1394ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776627065;
 bh=S/mthimZmdAdSGn0F3Hv9QZf7qgRvEv3gIfJq5jgmSc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xf79QRuLMQ+qOoTc79BSUSRWs842i7AOY+REzIy+aM+yZF4oFKIL9kYU/SwZ0+Ds9
 kFGY+zqBYWHpgSYvZ0DVvNWRxV+z4GqV/fLGmaIpSN2OfLuayI273x3Z0eyxGLPQdp
 Z4ciNXvgc/+ZhqoMw9/NEDVR74YQU7vtmCGeZ59bWbXxayF4MfRdbIxdAJ9lTATnfO
 MafveOSzbgfQ9jghtcfx0xuUJpEM20MIhv8kgsR3CpvG8JvDNm/jNqvrZtZBNWx8By
 FyplhUx7tsLvgLcVufJ51goTqeOYGTuKf6hKYRPn8oN8bQnB2ehnFlzw6D5QeF+akF
 VENF0fbgj8g6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Xf79QRuL
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: bump version to
 4.5.8
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

On 19/04/2026 16:22, Bernd Kuhls wrote:
> https://github.com/warmcat/libwebsockets/compare/v4.5.7...v4.5.8
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
