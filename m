Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DCAC02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9211C846C9;
	Sat, 14 Sep 2024 08:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcjNLUoj9ULN; Sat, 14 Sep 2024 08:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACC0E846F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACC0E846F5;
	Sat, 14 Sep 2024 08:24:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E313E1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D23F560671
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8ICuETNSE2F for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:24:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94A9660656
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94A9660656
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94A9660656
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:24:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A90591C0002;
 Sat, 14 Sep 2024 08:24:50 +0000 (UTC)
Date: Sat, 14 Sep 2024 10:24:49 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240914102449.698accae@windsurf>
In-Reply-To: <20240914071930.1189715-4-peter@korsgaard.com>
References: <20240914071930.1189715-1-peter@korsgaard.com>
 <20240914071930.1189715-4-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726302290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kg8+EM2W9kEHDS8i1zafOeJGXQI675z6u/mSoxp1/+8=;
 b=fsjXjh7uPAWDs1BhzigNNe3xa3y2KUhYPydooZLHDBzIYkuosf2Qyx7Biyvlfflvp5Dv6y
 6ZaBd558BoX+1mq3VChgoUxL6AsVMrdPT35WAuqkIt2xZoWxphQ7VUJdLH2eZygeQ1hmT0
 NWfdJbDX9T6IO22KcNJcnd1HEl/aB73zKmQrAW/w6P4EPb+etoKrKhZ/tb/o9J0gMFI1DS
 i3y3NcpKA/Y+6BzzVVWdX3wjUaIMRwtxxAWPLxJNPf5e5HBljZlci2aIhybL8C1v0oW7m+
 7YVv7N3PvseOVUMy4OeAEmw5bRnFJKz+OPoLRilw0dtVcFZhBlN/8itlChJz2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fsjXjh7u
Subject: Re: [Buildroot] [PATCH 04/23] package/keepalived: fix summarize
 typo in help text
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
Cc: Ilias Apalodimas <apalos@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 09:19:11 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
> index 2a0663fed0..3263f1217f 100644
> --- a/package/keepalived/Config.in
> +++ b/package/keepalived/Config.in
> @@ -10,7 +10,7 @@ config BR2_PACKAGE_KEEPALIVED
>  	  checks. Keepalived implements a framework based on three
>  	  family checks: Layer3, Layer4 & Layer5. This framework gives
>  	  the daemon the ability of checking a LVS server pool
> -	  states. Keepalived can be sumarize as a LVS driving daemon.
> +	  states. Keepalived can be summarize as a LVS driving daemon.

I'm not a native speaker, but I believe this should have been
summarized, with an ending "d", so I fixed that up.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
