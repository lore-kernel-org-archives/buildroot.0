Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA429C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87DF04048E;
	Tue,  4 Feb 2025 15:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kp3wQsMjiUEd; Tue,  4 Feb 2025 15:10:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EDEB40871
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EDEB40871;
	Tue,  4 Feb 2025 15:10:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F428185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83D0F605D9
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abuogJmNOKwD for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78754605A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78754605A3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78754605A3
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:10:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1720F780371;
 Tue,  4 Feb 2025 16:10:11 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:57226])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Feb 2025 16:10:11 +0100
MIME-Version: 1.0
Date: Tue, 04 Feb 2025 16:10:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, romain.naour@gmail.com
In-Reply-To: <20250203141425.48418-1-vjardin@free.fr>
References: <20250203141425.48418-1-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <4126e709763b47f9e182f83f6221bdbd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738681814;
 bh=qx65zoG9WrkjU+DQRVXOyysBW4CNPXnRhLMqzLATj+4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VqMWoeax3psJrCxhkTtmV5ho7CpuJGHUHNE6dcV6bX8XKje5w/17kWgZ4ePTEg7AY
 WQgLGN99kp4ncPI1BN+Yq3gyCKdcq/w0VjGZ+SHahVcE/mEuAGgsS7uHl9/Pv0ZQH5
 BFJwSOWJJf6rRGwkgSTJNsXw4qGkYPdkL0S0AI++QsbZRG+MdEO4JzcmSujTAmruCl
 MRW00eUGOP6LcNDK9R/A6C+WkiQu1nJNMjjfHK4e8eLIUj/JukQVdVkzP4dvlPe2y/
 12SqQWPvlXcyd7N6lK9EauYSspMDCev8YGWa6JkKqzMhJcw5Hagczy7ejmHcIHXe59
 qcx3zOaC+3meA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VqMWoeax
Subject: Re: [Buildroot] [PATCH v1 1/1] package/libbpf: bump to version 1.5.0
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

On 03/02/2025 15:14, Vincent Jardin wrote:
> Changelog: https://github.com/libbpf/libbpf/releases/tag/v1.5.0
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Vincent Jardin <vjardin@vjardin@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
