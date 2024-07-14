Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD37C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C40E60586;
	Sun, 14 Jul 2024 15:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1CAjsnbeTSv; Sun, 14 Jul 2024 15:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7254160611
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7254160611;
	Sun, 14 Jul 2024 15:06:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 182E31BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E6008123E
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbPcLyx7JEBo for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:06:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 426958123C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 426958123C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 426958123C
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:06:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0BCE1BF209;
 Sun, 14 Jul 2024 15:06:03 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:06:03 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240714170603.7756706e@windsurf>
In-Reply-To: <20240714090141.407553-1-roykollensvendsen@gmail.com>
References: <20240714090141.407553-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SOHwG3F8NNua9Htv4oelha4ZEeMcHs1Hy7Gp6Epb8k=;
 b=aOBlTc6yqQ4oFHcwCBqoJ+r+y7OqGhjCFGq1Nf6pxiyRgPrh7WH/NCMTTeJ6bxwCaZbMaO
 wqCbGQdhnxm0cceojFbY3kVtbP50UazFmVo7VqbjEDT/0INzbgsTlEHyzRoZpdGUhj7Q6n
 FBqW8FNhofABXX9cUuBSCP84v+uVHrRVjP+AEXzT1xgkfmshp7a3uFozN4BxRx3gSyjG6Y
 kS2gqwZS+IGupTSiLpi5FUa0LurGmvlcjd57h8C2vgbuCb5+GKiAy8yimpWQj3Bw5nBRpY
 UzvlhHKVqU96b8Y1Oj5l8bOatXyhLiwnbAsjARPqYXGl7EGvwd/pERefj5PARw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aOBlTc6y
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself for package/qt6
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

On Sun, 14 Jul 2024 11:01:39 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  DEVELOPERS | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

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
