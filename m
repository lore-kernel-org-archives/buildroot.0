Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBB0FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21CA94298E;
	Fri, 24 Apr 2026 16:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VlQZm5I9uqI; Fri, 24 Apr 2026 16:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F12FF4297A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777049263;
	bh=t5fOLShXskHB0kdxL89zNHF9ymzSrDUYMQ/1x7pMn/Y=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qOoDA/W7DZRFEKiohz50pUTH7FV/OBKra1tC7Td4pa/RxyP8pn2KI39R4E1r9M/jF
	 7SYxsBo/S2gdVdMAkrKpKG+JqqYhoPFZiMRnZgkDsrPKl5GkYDNyfMvJw3eXRl5KKx
	 /xp+gio/k4lf0r9Rge+S4fS3KMCMihMhp86glkJ0oMgvWr+ImVGh/gmHneV2VQT+td
	 q8pAS/OGp710KsNac/xtUDCeZBPvC7pRJLpFQoLgFKuYArIS5Kl6ZKEb/wi1wc/5KY
	 ox8vY0XnjEusn/W7Nyn1F9SkVwfF3r9Qqtd786C9JfYa6iv4aw5qO+XG2Iy6G2ElI+
	 k9dPeXmah5ClA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F12FF4297A;
	Fri, 24 Apr 2026 16:47:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6113224D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CC8342980
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTYt0_u-VbFx for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:47:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F2D14297A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F2D14297A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F2D14297A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:47:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 43CBD60139;
 Fri, 24 Apr 2026 18:47:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Apr 2026 18:47:37 +0200
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 18:47:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260419183739.2596300-1-bernd@kuhls.net>
References: <20260419183739.2596300-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <2fcb21763c1b25015a00b7803dfbc825@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777049258;
 bh=NkC8kHFRi7S7DZltcP4NkjPnLWzwC3HvHdCD4owPwB4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BKVwb3zCmw6Il//Y+kVvTdpWP7cEBlWvZ5dHcgiLcdffhJyEpIZEEJYotSzZVIMKX
 zdgt7HRJCrI0IaxmxF6PW//nAhLbDapKk+gycNsHcNfWCfXdGPnqdaczOIWHFQEibd
 XM4y6lhMMHsW5n/vY9VUoYSIpIQbPCJHwVidG+z9uHbHyDrrEawiShCMKwrr635X4L
 bhgY2fjT8mjt8CG1EjGcwfXv4rXTOMDHFdeoI+dr3/M2i/YVlwzmAAdZ+t0hUsrcpE
 TSj+GQ/xW8y93Xf8htv6N4mW0oGNttkb/UDX+XtM089ebgvbJ+YuM5Uksa9Qr4yI6e
 EGqBR2n+etoFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BKVwb3zC
Subject: Re: [Buildroot] [PATCH 1/1] package/netsnmp: bump version to 5.9.5.2
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

On 19/04/2026 20:37, Bernd Kuhls wrote:
> https://github.com/net-snmp/net-snmp/blob/v5.9.5.2/CHANGES
> 
> Removed all patches, they are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
