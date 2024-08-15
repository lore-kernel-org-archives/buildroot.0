Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E534C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 12:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0038A40335;
	Thu, 15 Aug 2024 12:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMClNx5fovP3; Thu, 15 Aug 2024 12:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDBA540B36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDBA540B36;
	Thu, 15 Aug 2024 12:48:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 616421BF574
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FA2560726
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evBLTl16vk7L for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 12:48:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C13560677
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C13560677
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C13560677
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 12:48:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB2AA1BF204;
 Thu, 15 Aug 2024 12:48:34 +0000 (UTC)
Date: Thu, 15 Aug 2024 14:48:33 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240815144833.19db7a80@windsurf>
In-Reply-To: <20240810111124.421286-1-ju.o@free.fr>
References: <20240810111124.421286-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723726114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6xPYalgx2IpRk7/6EDqsisj8KAFYFFhwt93tKw8C2Zg=;
 b=pxXWrhqW+0VaBkmX1gtt3y1BOEdzjPPTVlqjpLqxxG4TDJ5N3+bYqNIL+MIbJZE7y/6C+w
 HaCHXpsDTxmkCtyak6VQspQ/1IjEjfkeC8flUrNRczQQ5f6TdQLbGRxVUlL91GiOhDvO9l
 3iuYDq8R/q0GhEQW8Lmzalgu3Q+C5ugdBSqji+MoPZ9U42ZJXN+PpNy2W3BC6dpFNCpNjY
 M/6CEJZTStYHyOUmuTJqo+iUVhlh2zRgoTgv7UF8OOdFebuCeeP+zzPJ/j5dKAi/rUfVLl
 NKj/TgxcIa0CuMPhc2jNZAydjis9qFKWtQzPmas+HvQStJD3UTCMFvRa/0jIpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pxXWrhqW
Subject: Re: [Buildroot] [PATCH next 1/1] package/openblas: bump to version
 v0.3.28
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Aug 2024 13:11:24 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v0.3.27, see:
> https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.28
> 
> This commit also removes the package patch 0002 since it is now included
> in this version.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7550620374
> ---
>  ...-should-not-be-run-in-cross-compiles.patch | 33 -------------------
>  package/openblas/openblas.hash                |  6 ++--
>  package/openblas/openblas.mk                  |  2 +-
>  3 files changed, 4 insertions(+), 37 deletions(-)
>  delete mode 100644 package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
