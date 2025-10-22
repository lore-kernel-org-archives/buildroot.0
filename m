Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466D6CCD1BE
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 20:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C1F08410F;
	Wed, 22 Oct 2025 20:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRIlaVyp0nA6; Wed, 22 Oct 2025 20:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74A7984103
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A7984103;
	Wed, 22 Oct 2025 20:52:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1B0CDE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3C0D84103
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SbAHu1FYs3A for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 20:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA71684102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA71684102
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA71684102
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:51:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6118E5FFC0;
 Wed, 22 Oct 2025 22:51:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Oct 2025 22:51:56 +0200
MIME-Version: 1.0
Date: Wed, 22 Oct 2025 22:51:56 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20251022063129.84571-1-fido_max@inbox.ru>
References: <20251022063129.84571-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.11
Message-ID: <97d755f567bb2285537f8232a915d9fb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761166317;
 bh=es+0MSfv/D79rPMY7nHx11A5Ou3KVwxJvVMV401Gocc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ShjHNkaJhrljn+jyvbA+tuUaWP+rhT1D/nLlMXZVxxpU8zSZKBzS5JYkWY/Sx/PWR
 QoRfYiuV1gjl6cO61vrk3M1PjGkIaUXyIP70sZ7v6W+cbsK500huBxrvH29IyUOk2f
 6UtxVIouDdpo2WPvEs6PcxZPV5Gu9I+wKB/OrhiaNqyMeV6N+zw94wlY2cw0KOyX0c
 xTnsHzdn6hXjqCYwmv0YFe90uU8L8Rojf8ibx7Tc8p0ef8OrMYcMxJHZpEcyBiAZt2
 7ECkxVcCIe2rgIkBWmHPh/jcCYrl6t3PEJq5TreBHBV4OmFxIA9u+oZbV+8RUSPKMZ
 tk8Ko+COJXWnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ShjHNkaJ
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.6.0
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

On 22/10/2025 08:31, Maxim Kochetkov via buildroot wrote:
> Changelog: https://github.com/postgis/postgis/blob/3.6.0/NEWS
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
