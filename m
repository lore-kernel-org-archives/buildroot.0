Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B20CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 253BE608EA;
	Tue,  3 Sep 2024 20:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjGqa0X_p-cp; Tue,  3 Sep 2024 20:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E22D608F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E22D608F6;
	Tue,  3 Sep 2024 20:02:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 496151BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37032608B3
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IORPzN9O4K4G for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:02:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E980608DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E980608DA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E980608DA
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:02:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64A641C0002;
 Tue,  3 Sep 2024 20:02:28 +0000 (UTC)
Date: Tue, 3 Sep 2024 22:02:27 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240903220227.1d5de8a8@windsurf>
In-Reply-To: <20240902214343.249108-1-dario.binacchi@amarulasolutions.com>
References: <20240902214343.249108-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725393748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+HSvvSUF29WcY6QPnAh2URgiFEJ0+p7fsWCrFuSLcs=;
 b=ICT+zy28DQ3B7B/2GerQDJgjWnU3fB4Tq02tjWeXAOhrlvJ1YBwj42EnO+w3oxp8AEK1Ng
 m0y/H50O0k/FPwHSLjdxRCLqfN+PdTBm59XDwz7ZsT/AvZmMy32pNJzx2dOfLZcx0Mebfw
 LsRL5fUfg7tmVVmkpKcCqJsnGQeFWVLG9SmDjj9GzVB98oYAfmU1sqTGjkNkphaAh2j/6Z
 VfnNfniqQfDC685Vx6qqqkmQQAi0rZjLoL3ukIoIGV4AK4dezCWNFbZTZxvctDlUXj3XJN
 43fuBpsJAWdF1cSVie5w0zeWwALIX2iKVvV4s/tN4RWc8x+DK2GBaiGYl7imZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ICT+zy28
Subject: Re: [Buildroot] [PATCH 1/1] package/gerbera: fix build against fmt
 11.
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
Cc: linux-amarula@amarulasolutions.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Sep 2024 23:43:43 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The commit adds a backported upstream patch to fix the following build
> failure:
> 
> build/gerbera-1.12.1/src/cds/cds_objects.cc: In static member function 'static std::string CdsObject::mapFlags(int)':
> build/gerbera-1.12.1/src/cds/cds_objects.cc:174:35: error: 'join' is not a member of 'fmt'
> 
> Upstreaming the patch was added in version 2.2.0.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/aaf054b0bb336d45203b0d869ec6f9e00528ec8e
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../0002-Build-against-fmt-11.0.0.patch       | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 package/gerbera/0002-Build-against-fmt-11.0.0.patch

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
