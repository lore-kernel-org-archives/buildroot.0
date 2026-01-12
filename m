Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437F0CF45BD
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 17:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10887600B8;
	Mon, 12 Jan 2026 17:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PGOvHgDxuBP; Mon, 12 Jan 2026 17:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36DCD6060C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240549;
	bh=2+4pQD0b2HsFiw+rvldhalwHnMLVzsTSSQ7W441jw6Y=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UFjGY7G6knq56olPUYQUCKbIT/bC8yjZrebUNfJEIuh0bkA+Q80d9YFVf1sPEAksJ
	 J028wGfkVtBfgc5CtgCeB6umNvA0Jk5ulJWsF8XiFnjX8mxQZDLwNMquMCZDbZgsrx
	 VQwdAx4LAhR81Y+Q2n2xWI0rH+rKBKDkyOyMd+Jpw10oTC7QrFBQAEcQf8WVk+gkZb
	 xEHhO338JVtTQub1+pP4BVtH+TSqIpVcnmG5qx+s0YOt2BWj7g5aWNIW3RM9sWgDgN
	 xlhBHEaheIYJUhRnS0L163f2ZISrtviYPkRgP4poeVc7DH2sLWtwb7EEwk8wsDDLZ/
	 OeOj9N1rheh2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36DCD6060C;
	Mon, 12 Jan 2026 17:55:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56E4218D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AA1460BCE
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQ6MsNi2ME1M for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 17:55:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6467860BCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6467860BCC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6467860BCC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:55:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7FB9419F576;
 Mon, 12 Jan 2026 18:55:44 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 Jan 2026 18:55:44 +0100
MIME-Version: 1.0
Date: Mon, 12 Jan 2026 18:55:44 +0100
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20260112090123.67683-1-fido_max@inbox.ru>
References: <20260112090123.67683-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.12
Message-ID: <cce8abfad83066a9d715412499aab3cc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768240545;
 bh=x9J/Pt0AoR0urmLF2svN0AVm9V9c1y3Yho04oAtSprY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dRdM/3mLZVC1DLcieptKNHofbS+ImHJCMXMxJbzcPvtubzhSl+H4bSp6Hqr2dMaav
 kREGMsGTNMV+HUMOfAfai9oKLhVF3rqkM+ri24Fr78TNezzYi+K/4NvHqCWTAaz+J9
 A87nmU/RjSU/CR51uGc0+BXukLUijwQRyiuRUCWByzw/cWjWrV6vhcfASwpYuNdIaS
 8ECwuUeppJH6hQAHhocKG7iZ7C3Mm+L6VYw+PRFp3YHbCwbzwj8iY4eyjTSyeJw93E
 oKi3QcNeqLF7/FWGPBniW8cHAEc38oaAg26A22w8P1GnABlqNgnvvU/fDXU9J+B6Uj
 OoyD1XVMuIf0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dRdM/3mL
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to
 2.24.0
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

On 12/01/2026 10:01, Maxim Kochetkov via buildroot wrote:
> Changelog: 
> https://github.com/timescale/timescaledb/blob/2.24.0/CHANGELOG.md
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
