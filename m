Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29848C83F1D
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 13:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1DEE409C1;
	Sun, 13 Jul 2025 13:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPyjcyU5Lhgt; Sun, 13 Jul 2025 13:49:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A523409A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A523409A7;
	Sun, 13 Jul 2025 13:49:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3BBF5E
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 13:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E122660ADA
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 13:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HpK9PQ3fvNa for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 13:49:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41BC560AC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41BC560AC8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41BC560AC8
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 13:49:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 93B0C13F88D;
 Sun, 13 Jul 2025 15:49:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 15:49:26 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 15:49:26 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Jan_=C4=8Cerm=C3=A1k?=
 <sairon@sairon.cz>
In-Reply-To: <20250713125521.18543-1-fl@n621.de>
References: <20250713125521.18543-1-fl@n621.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <2a135167eacdbdb7f092f42e8904c98d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752414569;
 bh=Z5RyoAH+mz67guHE3HzdpBEIknsrLBAoa6l5fAi6ofk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j9AFsn64LDciyZSV52fvf7u3ZCsQYHM6qOp/PEFylfoEF5GlnSRaty0Dv7qyYihWg
 LZVldTUfTkAYG/d18/oYpvKNbvgi8JDMT24IFQ+0NQ5AA8xPul+vZm3Ery1Rgdq5Hc
 qHkN+ohjfHcK6EIlDpAChRCRl3ATuPbbQOvkpTSyY5LFsBxKpsaBF3Bb9vVQQrZOfs
 qBM6a6RcJ4BSqvfZVPTRDCVIgof8eI38vV/dAraRWpptXQ8IUhlw0VnV8gpZMWNJPf
 CthRAhUQ0AnnZ+nDVrJRFX405R989/tKiT2Xgshqbs8NC7OPV9S2st03jNUrO/+BxH
 TFPNuI8mxeK4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j9AFsn64
Subject: Re: [Buildroot] [PATCH 1/1] fs: erofs: reword "all-fragments"
 Kconfig text
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

On 13/07/2025 14:55, Florian Larysch wrote:
> Currently, both BR2_TARGET_ROOTFS_EROFS_ALL_FRAGMENTS and
> BR2_TARGET_ROOTFS_EROFS_FRAGMENTS have the same Kconfig prompt, making
> them hard to distinguish.
> 
> Reword the one for -Eall-fragments to be distinct.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
