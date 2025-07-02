Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93A9C8303C
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 21:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F85612D0;
	Wed,  2 Jul 2025 21:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJEQ8l7CWGfU; Wed,  2 Jul 2025 21:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E89F0612B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E89F0612B9;
	Wed,  2 Jul 2025 21:41:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6528D193
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AC4884586
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PpYy1WJuQ9Dl for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 21:41:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A0AA84581
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A0AA84581
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A0AA84581
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:41:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AC0CE78035E;
 Wed,  2 Jul 2025 23:41:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Jul 2025 23:41:17 +0200
MIME-Version: 1.0
Date: Wed, 02 Jul 2025 23:41:17 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250702163802.2754805-1-aperez@igalia.com>
References: <20250702163802.2754805-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <50f2590c00d5e7cc23e4a9800ed32a0f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751492478;
 bh=4HPyL9gYLH5+yICfb+iqVFZWlVNy0qoei1sO239fDh0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NA5PaM5BrIxXiUMD2XaVT8smqNcw4ulbyDbkGoCoXnq8W/Zo1/2662IWF7553SopD
 zlWwsnJE9sdiM91gL3cMsjZyJk2CGUcMWdGMVOkgVffr1J0u1sAfjld8yJ2/Uvqpkt
 2c0G20ShZvKU+gY2rXQrVX+bi3lTlPlGMnvYOUm6/RQME3Rsw9OXfNTyQsCA6CruM9
 QZiEsdgT6+p061DaPUoBllttryt5mJAzQRILUCK8TtfScfmZEnlC+PHnFpfKmu6ude
 DOFVi1T4kzHpdlBmPIwX4DKnMT3JZO6EbZuLdK88JG9cbsS/i7lI6KoDbG67Dirq/m
 sge+Qdq+8iKPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NA5PaM5B
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.18.5
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

On 02/07/2025 18:38, Adrian Perez de Castro wrote:
> This is a small bugfix release, mainly containing event handling fixes
> for Wayland, and the possibility to explicitly configure the gamepad
> support at build time.
> 
> Release notes:
> 
>   https://wpewebkit.org/release/cog-0.18.5.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
