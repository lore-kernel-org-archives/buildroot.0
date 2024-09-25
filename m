Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C9BC369C7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 11:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A3B64245F;
	Wed, 25 Sep 2024 11:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjN7HBQW7mxp; Wed, 25 Sep 2024 11:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31B09424AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31B09424AD;
	Wed, 25 Sep 2024 11:08:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1ED591BF41F
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 11:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CF644052D
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 11:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fs8eN7qpCMka for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 11:08:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A25C64037C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A25C64037C
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A25C64037C
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 11:08:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id D1C41C3649
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 11:04:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63EE520003;
 Wed, 25 Sep 2024 11:03:56 +0000 (UTC)
Date: Wed, 25 Sep 2024 13:03:53 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240925130353.5093d3ef@booty>
In-Reply-To: <20240922131229.499878-1-neal.frager@amd.com>
References: <20240922131229.499878-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727262236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOJiA8A5hEHjleQ+92bum2ak++1umD8dZU79IiA8h+s=;
 b=ZTDB9kskyjlArT8XrBTRPTCjBswZlMQyLzNV79iLE2kAT6UkPKMoQpH7Q9K00zmV4j9qt+
 Iz6osgk8YM1aXPqrxoaw2bO4zQTGjbyycLKQImhGuyxNAtHNa90JzMshJij/x92r72lLav
 tz7Oh60RuF6HOz5Tvn4SuCbSwsKu8y4FlBQMGv3b6OsTX4X7X4L0aVOf7sqXm+f/fLAmbV
 O4Z03b+qPGfBMg2BvfHOmEhr5ZObutuqUqrY+fxf16Y2bfXHtXjRNJZHzVLf0nsGr91m2Y
 Z0CAJcx2MsBYULJTL2seP/NCBRlm4YaYpcf7SAt4ADTqDtt4q4GZw/uKSbu7ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZTDB9ksk
Subject: Re: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 binutils 2.43.1
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Sun, 22 Sep 2024 14:12:29 +0100
Neal Frager <neal.frager@amd.com> wrote:

> package/binutils-bare-metal: bump to 2.43.1
> 
> See here the release announcement for changes:
> https://sourceware.org/pipermail/binutils/2024-August/136396.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
