Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E1AC5475B
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 21:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3904400EF;
	Fri,  8 Mar 2024 21:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PMtpdWmEhCNj; Fri,  8 Mar 2024 21:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE0CC402C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE0CC402C3;
	Fri,  8 Mar 2024 21:48:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB2C71BF48D
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 21:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B72EF60AF4
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 21:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IoqcwYXYnlkn for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 21:48:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABD8A60A7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABD8A60A7F
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABD8A60A7F
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 21:48:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 749CCC2196
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 21:46:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07358FF802;
 Fri,  8 Mar 2024 21:46:03 +0000 (UTC)
Date: Fri, 8 Mar 2024 22:46:03 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240308224603.66c09e5c@booty>
In-Reply-To: <20240304074140.1537910-5-neal.frager@amd.com>
References: <20240304074140.1537910-1-neal.frager@amd.com>
 <20240304074140.1537910-5-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709934364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZQejxZh9t3aeyjapwnkH6jzrXN46WUZnLmf1hth+tI=;
 b=QoZuwQsu5+zDkW7ZY8gIZeQuL6H1A5GOLSynhBKlhkRYALxFFEWjKBaRFTmkO36stpsB/N
 iKIJ+ixEi+utP5CUNuDsiWLolb6rq5s7eQqrhKys41X2gYdeUgHS+4pqogGDsfW4G5OE0X
 w7zg83X6RbCLZSDDU2DQ4lGWA1ebOgqxBrGIZlm2PXJz9DBLvEhptUvhCzaFBEem7Bx3e9
 CYAQ6y9JZ5Q36keGmBuqFvikEyEyWYROrDCe27Oasm1qRKYmtXb2J/d6ksNnwDMs6sFuy4
 OYZOmwFvDn6GwiLTifrPDgw7GFh+X7Fsu3yIQW+HZwQGKMxpQpZvxNQx+hZokA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QoZuwQsu
Subject: Re: [Buildroot] [PATCH v11 5/6] configs/versal_vck190_defconfig:
 build plm and psmfw source
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
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 4 Mar 2024 07:41:39 +0000
Neal Frager <neal.frager@amd.com> wrote:

> From: Neal Frager <neal.frager@amd.com>
> To: <buildroot@buildroot.org>
> CC: <luca.ceresoli@bootlin.com>, <thomas.petazzoni@bootlin.com>,  <peter@korsgaard.com>, <michal.simek@amd.com>, <ibai.erkiaga-elorza@amd.com>,  Neal Frager <neal.frager@amd.com>
> Subject: [PATCH v11 5/6] configs/versal_vck190_defconfig: build plm and psmfw source
> Date: Mon, 4 Mar 2024 07:41:39 +0000
> X-Mailer: git-send-email 2.25.1
> 
> This patch migrates the versal_vck190_defconfig to use the new
> versal-firmware package for building the versal plm and psmfw from source.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
