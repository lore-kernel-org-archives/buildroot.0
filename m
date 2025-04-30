Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE13BC3ABAA
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 21:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4366B607B5;
	Wed, 30 Apr 2025 21:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1-My5nGhu86; Wed, 30 Apr 2025 21:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D0DA608B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D0DA608B9;
	Wed, 30 Apr 2025 21:33:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53543E4
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 21:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39E8280EDC
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 21:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9X9Y6Wq430A for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 21:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1628A80BE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1628A80BE2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1628A80BE2
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 21:33:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 512195FFA3;
 Wed, 30 Apr 2025 23:33:50 +0200 (CEST)
Received: from 2a01:cb1d:9279:be00:c208:5c5d:a534:6e05
 via 2a01:cb1d:9279:be00:c208:5c5d:a534:6e05 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 30 Apr 2025 23:33:50 +0200
MIME-Version: 1.0
Date: Wed, 30 Apr 2025 23:33:50 +0200
From: Julien Olivain <ju.o@free.fr>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, thomas.perale@mind.be
In-Reply-To: <20250430143303.551581-1-titouan.christophe@mind.be>
References: <20250430143303.551581-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <f921f66b65c66b4a1c52a553668b11a1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746048832;
 bh=HEv+6JYaiD/jK1Wxqod2GD2TQywCQ7IX2UZLU2EulW8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=on6XfSEfk+AOTvIiWdk32iiVO2SdEBx2p+nJfxKJGokZJk5f1zimhCXU+ui+j66Df
 xEI9yGhWVjIytbfIvAHGwMbHWK3vqR/jhxuqY6wvGaKP6/hJh5ldBKoNvJ28BDKoR2
 t/miFKEc0HTIuzJ5okZvz0uz5bJTpqyCWTgIlspwTdfsQMgY78CjGQBEAs2g6NFdSe
 ee9Om10r+6ZaY+942Pp2JdY8j7H5HfeNmzqG+L8SEEzXJ22UGBveF2E1js8PRVlyn4
 QCZgGecnxR97B94gD7sa8BJM7biLZ1jyIoXIcHv7sW8048H1s6wTDh8xMPSyCNGRbs
 hJafEB8z9k62A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=on6XfSEf
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to v4.2.11
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

On 30/04/2025 16:33, Titouan Christophe via buildroot wrote:
> This fixes the following CVE:
> 
> - CVE-2025-1492: The Bundle Protocol and CBOR dissectors could crash
> 
>     It may be possible to make Wireshark crash by injecting a malformed
>     packet onto the wire or by convincing someone to read a malformed
>     packet trace file.
> 
> See https://www.wireshark.org/security/wnpa-sec-2025-01
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
