Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4A2CA1010
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 21:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 147F241949;
	Wed,  3 Sep 2025 21:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTm_a7TsIbKS; Wed,  3 Sep 2025 21:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49D9041955
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D9041955;
	Wed,  3 Sep 2025 21:50:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E678930
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F52E6156D
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U064MA-u_GHX for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 21:50:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 244E7613A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 244E7613A5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 244E7613A5
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:50:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 593502003CA;
 Wed,  3 Sep 2025 23:50:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Sep 2025 23:50:48 +0200
MIME-Version: 1.0
Date: Wed, 03 Sep 2025 23:50:48 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250903062531.1250298-1-fido_max@inbox.ru>
References: <20250903062531.1250298-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.11
Message-ID: <977c9c52042bd3eba3881a62d8dd4618@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756936249;
 bh=cLf3tLoKp0iva7HKDM0p4ek0n1K//RI/elC7bQ9CwpM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rJXB72krIj8kdO/48+D2ejmUiOcneS8CBdbZ/hn+KanFZhmNqK9PNq4eWo3CYSiCR
 NWOlvRZCuV6nzekTE3l2Kq8uf/b78sHq4Q2dunEIZSBxxmVQ57lK3aOTfFDRIpaLMV
 BpCRVmhqJPCRHiv24f0SVzt4cftAA0zROM0qXP6J6fH1wGqMG1eTdtJhpmf7u7W0Ov
 PIwytYar7VHldS3h1wHn/8Odna03CNsS8KJ1HEgZ9+FXg8OxowiNif4n6/0BUu/voz
 U+PyldsrC7iMrNdqrT5B7QAOJTFD/z8DBdrGwxZPN87WNrm3AQpm9gfdfuKZkcC8UJ
 tmIeP5K/uVT3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rJXB72kr
Subject: Re: [Buildroot] [PATCH 1/1] package/protozero: bump version to 1.8.1
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

On 03/09/2025 08:25, Maxim Kochetkov via buildroot wrote:
> Release-notes: https://github.com/mapbox/protozero/releases/tag/v1.8.1
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
