Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B361C282EC
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 22:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B4B160F08;
	Wed,  5 Mar 2025 22:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ugm6tSfEgg5a; Wed,  5 Mar 2025 22:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5124C60F17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5124C60F17;
	Wed,  5 Mar 2025 22:04:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8868A95F
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 22:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 780FF403EE
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 22:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSaKR5HZmXtN for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 22:04:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7371E403A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7371E403A7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7371E403A7
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 22:04:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 19565200A09;
 Wed,  5 Mar 2025 23:04:35 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Mar 2025 23:04:35 +0100
MIME-Version: 1.0
Date: Wed, 05 Mar 2025 23:04:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250304112557.678724-1-m.niestroj@grinn-global.com>
References: <20250304112557.678724-1-m.niestroj@grinn-global.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <202f520a761d3d67b7c77a2a360e6981@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741212278;
 bh=NelIAbfF9aQDSv2OKYhTRo8VaQcFFVIQHxpvUYPMHxY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oq5NKzkFfqNfaLVPCWh9HzV2K2YzC/r9CO9S+Vl78wTlMXM1ZoYc1N8gWEwab9IJ1
 8NYiXM52kr1Up1hK2hlpgEgBlSnBKqeYaSUJQSH32LNd3ZEbxntWcloWid7Kn7Mg21
 r6s+XNHravsItwQXpskqndNJf7LdtF68cmV9OpUkx21+gnpnuaQ6yit3KQjyuZzgif
 18/c1V606C9gCye/o2uQywPi4UDGo+AHJfbFzDPhXH9cgiQSB17m7pCDE6HMHygHJF
 VYw2Sp4tDciAhdngK56Mrg4GF3tfN8DTA2r8FxOt/0n/P89eCOqdGQrOVx/qUsN2rQ
 Mgq1tCbfPTyBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oq5NKzkF
Subject: Re: [Buildroot] [PATCH] package/python-dbus-fast: bump to 2.34.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/03/2025 12:25, Marcin Niestroj wrote:
> See [1] for changelog.
> 
> [1] 
> https://github.com/bluetooth-devices/dbus-fast/blob/main/CHANGELOG.md
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
