Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52B1C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 14:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D3B160B2C;
	Wed, 17 Jul 2024 14:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNci_0dtBUUK; Wed, 17 Jul 2024 14:59:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E11960B4A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E11960B4A;
	Wed, 17 Jul 2024 14:59:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EA6A1BF20D
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 14:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C8F76090A
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 14:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjvEQKepqQ1I for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 14:59:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46F4460654
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46F4460654
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46F4460654
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 14:59:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5569C40009;
 Wed, 17 Jul 2024 14:59:00 +0000 (UTC)
Date: Wed, 17 Jul 2024 16:58:59 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20240717165859.171095b0@windsurf>
In-Reply-To: <20240717133702.4377-1-tianyuanhao3@163.com>
References: <20240717133702.4377-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721228340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVJglhBWh0lib9dI6HwrGJYlROufROnhVoJW5uJbe3M=;
 b=ndJcv/OJsvc0dGsmRrWY9aeTmsCbuAlqgdZqgO1bnHdwve9LPsvg5lSZwwq+s6mi+jIVTQ
 xp+Q/khBV+yoflkklLEYooTsQPSkwvDPr7Jq2NJiqSblT85sY3G0QDQL7VKdCDsfR+Bl8x
 QgHt2VNrzF3YHW/5rS0F2QQNXF5Myn673LxkVv8GIWrGMGAnPsgMpCVGjy5zHzlPuZyl7d
 2fy4fC1imQqVZgBVwKEWCOB8yyjaFDdx/3qam/l6PR1dH5rWLe0atLXTGbXcHOGcPGq4b5
 eJWMb6tYxe7zxfF9WnY+hugqF0PwcUaYy7OwkEgQgBr4tmyA9L6cA+jL9asN+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ndJcv/OJ
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: drop libgcrypt dependency
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

On Wed, 17 Jul 2024 06:37:02 -0700
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> This reverts commit 4d5fd84496 (package/crun: add libgcrypt optional
> dependency, 2022-12-30).
> 
> Since bump to 1.15, libgcrypt is not an optional dependency anymore as
> it has been droped in 1.14 with
> https://github.com/containers/crun/commit/8d96f0884b46765693b6d86125216c895e095ed6
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/crun/crun.mk | 4 ----
>  1 file changed, 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
