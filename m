Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFA3C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45B4A42582;
	Fri, 10 May 2024 20:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_6h9aeQBOIW; Fri, 10 May 2024 20:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D84D4258F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D84D4258F;
	Fri, 10 May 2024 20:33:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE6601BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FF4761645
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUjLPKO-QXG1 for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:33:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7BE96165A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7BE96165A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7BE96165A
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:33:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFB04E0002;
 Fri, 10 May 2024 20:32:58 +0000 (UTC)
Date: Fri, 10 May 2024 22:32:58 +0200
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Message-ID: <20240510223258.255bafa5@windsurf>
In-Reply-To: <20240310104807.10227-1-kilian.zinnecker@mail.de>
References: <20240310104807.10227-1-kilian.zinnecker@mail.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715373179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snAiYVoNgkgUS0DASqf0dHMNfpNh0ySCvOatqP+hB24=;
 b=kw1p2EUV4MLkcowvIAqsnDSVu1B7ukWNUTnsgxouTcq1TtxNkZiBVsJtekyy0brekeTdmP
 SlB9/jAl6OBaCs5sIOWWbjm26Jow6j9sgOQaFxN0aTCdsI+0cA9vKZ5f9uiNP29MM1d53v
 P0qBanxGFdAvcZP2W9UY64oWGNjcPNhx1rqA0+0vilwriSEkl2tlXcNg9NQMAzZQH54USd
 1GXOyF6xwFRVKZs9WlRlyNs9/1ZQG8efewcPu2ep4kAmVI9ge8/alyH5nFej8ntGQi2OON
 79y4NtCcHeT2Mr4WUuRPSgYJmuHvzZZt3oYqRHQqH7ioleT85rUTaReL8lZq+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kw1p2EUV
Subject: Re: [Buildroot] [PATCH] configs/rock5b: Remove futile unsetting of
 rock5b_defconfig param
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 10 Mar 2024 11:48:07 +0100
Kilian Zinnecker via buildroot <buildroot@buildroot.org> wrote:

> The rock5b_defconfig contained a
> "# BR2BR2_LINUX_KERNEL_INTREE_DTS_NAME is not set" line. This
> caused check-dotconfig.py to throw a warning in the buildroot CI,
> because the explicit unsetting of the parameter is not taken on in
> the actual dotconfig, but instead the dotconfig will contain the
> line 'BR2BR2_LINUX_KERNEL_INTREE_DTS_NAME=""'.
> 
> This patch removes the parameter from the rock5b_defconfig. The
> resulting dotconfig from the original rock5b_defconfig and the
> rock5b_defconfig without the parameter is identical, but the
> check-dotconfig.py does not throw a warning anymore.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
>  configs/rock5b_defconfig | 1 -
>  1 file changed, 1 deletion(-)

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
