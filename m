Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A751ED6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D3A1822E9;
	Thu, 22 Jan 2026 19:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfZHVYR6TiKW; Thu, 22 Jan 2026 19:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D774822E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769110656;
	bh=irILpfpX7tlrUDDbVC0T+hjjPkJhviwNLBJQ+Qv+mRo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AXWziTiGQ4LFnq5NOkMZzu3V/JespXEyiU0jWzcDka5sa07x8Zf0F/bUddo7AS/gT
	 uRs6639TlGeEd/o7oCUPQvohPwFhzDAaJjtSuoFoJjTqIIXHGTMoABwnHLrlWQEVRL
	 PqwoJUIi6wKcF5yeeDT/c4eh+UnHv5tsGeVnZ08SnYdzOoK99zlPbVFVNplF4NHV14
	 v5Z88wjw2i/kWImE3WM/tEB5vTTqminTRs8BV1fCS5ekNGzi8uiWnBpdAUDuUMsDtZ
	 smA2yqTbn/c6L/BSRKgnuyexlGskrbDIggekAuaM6/mO+OXiASGm+eeit/Z65uTM4o
	 tssO0GlliAREA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D774822E6;
	Thu, 22 Jan 2026 19:37:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD3F34DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7D3F822E6
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVH1FauQEbjd for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:37:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5424822E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5424822E5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5424822E5
 for <buildroot@busybox.net>; Thu, 22 Jan 2026 19:37:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B5EF32003B4;
 Thu, 22 Jan 2026 20:37:31 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 20:37:31 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 20:37:31 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260116110600.809065-1-francois.perrad@gadz.org>
References: <20260116110600.809065-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.12
Message-ID: <3e6d10c24e1b7ed6412a12f3052892ae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769110653;
 bh=9RQSm/gMbfg0uI0NyNBhPVBCmH/I4gz9ZbVrKin7hwU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=thJjfNpKHWGLRI9+d7R2oE0TCuyV8g6w/jzBBb2osEFUzwMfxSvwOI0U/Jk6gEpj3
 tIu1iH/lp3gD8Hivda9B9WSiH5xA2GuNemlhAcKElrdRkCBqKWA/hlLuPkIqxAdxLR
 kYsMkcroHQFzyEnvxgLcm2JpsMm59xxPDNrxAdCwWZSOooaP8Sz8qaaU4Kfq+g1JRw
 RIgdC3++cYE5vOYIbJxg1k0XkK9CaI1rybnDDydvgXTJejAc7OecHKU4V3KuBTERtE
 NMtSbiAYmzYsc60qb9tTupS9Agbt9CzrKswalUzStdsi1JcaED3Dc/27N8/iHUoUgO
 nQE+HTM1SmTgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=thJjfNpK
Subject: Re: [Buildroot] [PATCH] package/janet: bump to version 1.40.1
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

On 16/01/2026 12:05, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
