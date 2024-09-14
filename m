Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C9AC02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63649846DB;
	Sat, 14 Sep 2024 08:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ntx1shdlbxpe; Sat, 14 Sep 2024 08:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6450E846F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6450E846F5;
	Sat, 14 Sep 2024 08:00:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAEA51BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAE0160739
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKkBsFnNALCF for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:00:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ACC4B60761
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACC4B60761
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACC4B60761
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:00:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 232A1FF808;
 Sat, 14 Sep 2024 08:00:18 +0000 (UTC)
Date: Sat, 14 Sep 2024 10:00:17 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240914100017.16eebbf1@windsurf>
In-Reply-To: <20240911155023.2921034-1-dario.binacchi@amarulasolutions.com>
References: <20240911155023.2921034-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726300820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QG1n7rWoQI5XW7MtSdFD0nc+NxoVYTw8m01Oe4gOZ/s=;
 b=ZsvNIOasP4KnLriVy8/EXB6fMI5CXQup9F0TqBkuQ0iM7pswiIVMLaivZwY2kSw23Go7JL
 URL7KUpaPQbWq0AL/vOKjFsieQqrORS4sGAgzjVBGW/5Mf/sOWPRHpTnCBLhXHts6E/+VO
 ZEP5HAZJZEItVn1ROw9YVvbiLwxO6UUGWnI/GvXU5KBsSdLgJ8VKZyx4o7Ip+M/ZJI9sV0
 012vpyaxCm9exSFQQ+uPbjFSW5gvTn7j8vFSP1LUkVHbKLF7oqIaEkmfmMbUoKPgNMbE8/
 6hGFm7jtII0t4gget2KEN9in/9xEBToaqha6yza3xngMiYaYTWutM3Y9Uewl6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZsvNIOas
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rp-pppoe: fixup download URL
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
Cc: Jaco Kroon <jaco@uls.co.za>, Dianne Skoll <dianne@skoll.ca>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 11 Sep 2024 17:50:23 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> As reported in [1], the download of rp-pppoe-3.15.tar.gz is no longer
> guaranteed from the download section of the project.
> 
> Fortunately, Jacon Kroon is hosting the RP-PPPoE source code for versions
> 3.15 and 4.0 in a location that permits automated downloads.
> 
> Fixes:
> - http://autobuild.buildroot.org/results/8676456feec9dd401152887101ad1a9ce96cb769
> 
> [1] https://dianne.skoll.ca/pipermail/rp-pppoe/2024q3/000652.html
> 
> Cc: Jaco Kroon <jaco@uls.co.za>
> Cc: Dianne Skoll <dianne@skoll.ca>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>   - Change download URL.

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
