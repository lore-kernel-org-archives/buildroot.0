Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3757FEF4EA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 08:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0F7080FA0;
	Mon,  6 Apr 2026 08:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0c_-jY8s_iXf; Mon,  6 Apr 2026 08:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9992E80F95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775464011;
	bh=dG65EMQbaxFnGV39UPn4m4wQuNnhHBrXLSyE891+Ib4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QLmqfkuX2388EoS938uZg7G7tLS+KUTjpaCsr1Jhf54t40ice5su6fgtoTHBSJ+nn
	 EVwBZzSfdaWBuH6CJFvYYsStzHBK/Ndc+LeyUrZybS7S+JNKoOxlmu73wm0p6DrO63
	 24/nsRB+msGsDj6AfMaq0J8ej5HPCkCFAgW8oVsze6tQgvJ8NbcPPJMnRWvR0eeG1D
	 hCfl4uHP7MEWGOIh2NwSLLUZNl6A15xpuzcyNerQgzbBGFU2O3SIWqGWs2FolcbsZW
	 SJSDz24Jgda8SczOEbX9Nf/dZHEyfb9u6J2Pzpba131tU9qa+4pLcvULGEHImh4de4
	 i5doGrndPIvHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9992E80F95;
	Mon,  6 Apr 2026 08:26:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C16DC1EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B248080F95
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvM-Vi4rHBWy for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 08:26:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C9A480F94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C9A480F94
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C9A480F94
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:26:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C0D9A78035E;
 Mon,  6 Apr 2026 10:26:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 10:26:44 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 10:26:44 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260403202058.3076288-1-giulio.benetti@benettiengineering.com>
References: <20260403202058.3076288-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <47c6e5c7ee13f50e4fb1e5fb73b2e501@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775464005;
 bh=o5zcvpaIujsNQLv2FcFgTu6hQD//KkrxlESYnKvRNWE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uSqWx6JQqecr1HS28jd3G0RuJWBBY2WZFK5nqH203k9utAHsvRfRpntW6phrpUvR6
 Xe/625Xx4nxSQnEYd+wOoWDHqAfl3wRfuGzditbZ9Abhpl2Uz7aNk+7/P2e+ZkP9sv
 +tfvZkQNuDlE6tGEKTPCd2ti92GGn1UwN2dQ/910MrprxzlIPjl1Yho2sI/Wq1d9ae
 WnI9QC8ltI355Uj+5Tm+qA9xYl9cK00pLZYUz9FCVBcEJyDNX3dsyZ8berGvFdE47C
 /ocXtrpo6mjxRiW73X0nrclHOtWDlsIbcBAnxGFZbGEB2LRMjCxDdPgkMgdgcdSxb6
 jGw0YplpSoLug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uSqWx6JQ
Subject: Re: [Buildroot] [PATCH] package/mali-driver: bump to version
 2026-04-03
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

On 03/04/2026 22:20, Giulio Benetti wrote:
> Fixed build with Linux 7.0
> 
> Fixes:
> still not occured
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
