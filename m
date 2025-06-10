Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F5EC61DB2
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 21:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D87780E62;
	Tue, 10 Jun 2025 21:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXrVcRRdK4W0; Tue, 10 Jun 2025 21:54:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9461E83DFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9461E83DFA;
	Tue, 10 Jun 2025 21:54:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F34B183
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 21:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9A4542115
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 21:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvCWhBNIcpQW for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 21:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D484420F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D484420F8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D484420F8
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 21:54:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1440813F89A;
 Tue, 10 Jun 2025 23:54:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Jun 2025 23:54:16 +0200
MIME-Version: 1.0
Date: Tue, 10 Jun 2025 23:54:16 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250610152807.46341-1-neal.frager@amd.com>
References: <20250610152807.46341-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c0bb00ffe0a713c16ff85e63db818cf1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749592464;
 bh=7KSPWyFmJSW6Lz/azkl3xFJaJud8+5Az6t48kE+eCo8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dmUg73ZYp6WVGaqS7blnqRdLYCDzgqnbOq1yRIRFycMtojmyW7p/QiwIvPHcFaQYW
 +YKCLrqR11NHBz8+a4RSzAZoUZ6K9zfSf8INmpB51OawTye/YOapnB0ov+fC+lddjb
 XYyJDW+iZwlgr8Ly5kX0TxBqaEVAKgQmKJCkufLspYJ5owFADRDE9Fqx7q0iJJy3Om
 bGhiNN/0XZjv64MFCd8m02HeWNh4OKVQ7K6RJ1OLo9EgiHniJHLnhf2NHt+N/ZuZEs
 WXtiZCFYzidQSm/8+yqd2t7NZltEdxdHO/ez0v+sKmN3OSNTuBcu6V/muErnquvVn6
 4kgcqEi2/vbKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dmUg73ZY
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_*: move to external
 Bootlin stable toolchain
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

On 10/06/2025 17:28, Neal Frager via buildroot wrote:
> This moves the versal defconfigs to the Bootlin glibc stable external 
> toolchain
> as per[1].
> 
> [1]: 
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> This patch has been run-tested on the vek280 evaluation board.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
