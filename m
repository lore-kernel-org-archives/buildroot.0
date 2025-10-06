Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED18CAC5B8
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 21:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 037F360FFA;
	Mon,  6 Oct 2025 21:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYB3qVuUm3Oa; Mon,  6 Oct 2025 21:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C6D261071
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C6D261071;
	Mon,  6 Oct 2025 21:04:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 590BE226
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 21:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AE7681E08
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 21:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXmbiGbAkzc8 for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 21:04:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54A2C81BA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54A2C81BA8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54A2C81BA8
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 21:04:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6FF3013F89C;
 Mon,  6 Oct 2025 23:04:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Oct 2025 23:04:37 +0200
MIME-Version: 1.0
Date: Mon, 06 Oct 2025 23:04:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251004112144.939391-1-bernd@kuhls.net>
References: <20251004112144.939391-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <6819f9ea0d7ffcbb09745f6200b6bdf9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759784678;
 bh=OPEdP5QFGDF2MH7HFlJg0arYBH7RbJ7rcELyf4F/DOk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eu/O1puoZIAuHWm5QGk9mw1jcucTOMufOmgGmk9laPp9HoIhcEZpm3PXHh+ZJt/1C
 FufaTw3LwedoNaZ5ldB72n8v506+0s5xr5YJPV4aLVp4ahsCvn0tdJAet4kndmXAwh
 k0ShttYx9PoYDStjqXsYDmKvQlpM6naA3mykP8pogErL0LP1cUowGj0YKgCc+QGUYh
 rPP0Jrz1qOsidi4qySEQlRsf7un7Nd7hBL45f038PzyaauzKhWudtcOO+swdhfsj1b
 +gyw5p7jW8IjVIAEy4JgQfu5vvNMxRPDP663YCA8za2XinVgVjVvGclh9BArjWwu2F
 ED8uw1WfM+4OQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eu/O1puo
Subject: Re: [Buildroot] [PATCH 1/1] package/libdecor: bump version to 0.2.3
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

On 04/10/2025 13:21, Bernd Kuhls wrote:
> Added optional support for gtk3 which was added upstream:
> https://gitlab.freedesktop.org/libdecor/libdecor/-/commit/e87dcfdaf83f332fa83b43c804fcf93c151ff0f5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
