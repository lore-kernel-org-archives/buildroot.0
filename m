Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855E7D13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51A0780F49;
	Sun, 27 Oct 2024 18:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1zGBzl8F3Ry; Sun, 27 Oct 2024 18:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 578C480F3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 578C480F3B;
	Sun, 27 Oct 2024 18:44:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C534971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 699FB80BFA
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoW5r429NH6L for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63C5280BE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63C5280BE6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63C5280BE6
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB49EFF809;
 Sun, 27 Oct 2024 18:44:29 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:43:56 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241027194356.0b937051@windsurf>
In-Reply-To: <20241026221450.3786172-1-james.hilliard1@gmail.com>
References: <20241026221450.3786172-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=103hU7NryGwSLWcrek/Pxctzw1R3H2vpxdt3yiCsScE=;
 b=Fdk2WeXokhamdCRC5e+xK+GHyDWivnHVfjUH9PyZEoZ0YVPgLwFjR43oKUCYJXHIh0hYLu
 to1Jjgv/bRhU+C7jOT5atsx0Lk7O/fSFm6ozxH5mjlHshqoSJQz+brxMZBBn/lujEw0556
 +cGptrO0hAnM7TLltrAUhalLrLidNLp0RE9HecRUHs3lCmsT1QUJIhl/qwbnRE2xTiMmhc
 x8BZHVZMRKDYkjH4Mowtif068xzuViTIDzdB1cURLZCObV4e/EA/BQqzdsg9wGE4Liopsa
 BYwI6vmUplcfbs7jGCWsoi8S4jXmaw94xvejR0NUDWRWDdMFRYRqVaN+T93X2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fdk2WeXo
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 11.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 26 Oct 2024 16:14:50 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate build opts to new format.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pillow/python-pillow.hash |  4 +--
>  package/python-pillow/python-pillow.mk   | 38 ++++++++++++------------
>  2 files changed, 21 insertions(+), 21 deletions(-)

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
