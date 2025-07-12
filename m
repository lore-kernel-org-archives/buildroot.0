Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215A9C83F20
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 10:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E635060B02;
	Sat, 12 Jul 2025 10:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inW1OWz0nSGL; Sat, 12 Jul 2025 10:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C72A60EF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C72A60EF8;
	Sat, 12 Jul 2025 10:41:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB07C436
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACCC780ECE
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7F2mCkAjc1JH for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 10:41:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4AD280EAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4AD280EAC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4AD280EAC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:41:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2A1EE780507;
 Sat, 12 Jul 2025 12:41:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Jul 2025 12:41:37 +0200
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 12:41:37 +0200
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250710-loongarch-fabi-v2-3-72fcf95c8b65@flygoat.com>
References: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
 <20250710-loongarch-fabi-v2-3-72fcf95c8b65@flygoat.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <efb0bf447c2515b818daadb7ae00394f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752316898;
 bh=62tzz/aMBGTCvNSo/7BRuqmLEDCkI4YUN8Y+SCeLivI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fQhgAZUZ5u+innicFwSMAgUcqoDLOP5ljJ2wAcDaw72wBeuIhluKAz926HX3SeLF6
 emU+mqCpzr7K3yxE1p/LkuYf2Ih0cDqGl4PDZgHbW6iCcpnZPlY2g3vAdKQM3XQ72+
 LHiTu5De/JbCWHfGJ/sLK5gRElZAfn7/zISRQYT9nOyxlxEAq/42LpPzeO/uHV4AQv
 BwrKiX0c5LJSBRi0OhrZwEXEqIZI7mbuvYGRdy16nwW/Djk7N5LAIcLrsxMf4LpUYz
 GocTn+9wlpEgbP9zs6k8GmhDgcof07nuN+PWNYGzO0b/V08iTXANpNwt5OxmTu6sck
 6CNDFeBVVJGdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fQhgAZUZ
Subject: Re: [Buildroot] [PATCH v2 3/3] arch/loongarch: Fix minimal GCC
 version for taget arch options
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

On 10/07/2025 12:41, Jiaxun Yang wrote:
> Both la64v1.0 and la64v1.1 requires GCC 14 as minimum.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/04a904f08d6e0aacbd308692c99e77a334d72b95/
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
