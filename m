Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C7EC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C514E81206;
	Wed,  1 May 2024 19:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGrfgTE8lvLK; Wed,  1 May 2024 19:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D34268143D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D34268143D;
	Wed,  1 May 2024 19:51:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14B741BF983
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01A5760BC7
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ap5aQdasuyEY for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:51:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D190C60602
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D190C60602
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D190C60602
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:51:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 415ED20002;
 Wed,  1 May 2024 19:51:28 +0000 (UTC)
Date: Wed, 1 May 2024 21:51:27 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240501215127.2d729695@windsurf>
In-Reply-To: <20240331203403.815497-1-yann.morin.1998@free.fr>
References: <20240331203403.815497-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714593089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REuxRT8xBtEZbjTTBa59t7FpyXQf2OpsD7d7OjPgJNs=;
 b=pqzJC8E1hef9rX3Ao95uX7CJ9ifeuOdKXLsKerADMaFlqEq/qREny8qCe9JBTZNWJU6owB
 mwMRGrlCb6rAv/LkKl56dpNBD18T7xRME7PsuDDAqfau5hDTSOsTB5wauyPNMXJ7l2GNG0
 YUnXUzMczQlCTU7cImWboHxmyfqu0Azks2XcWTuu6aoDffmc6HxqX634r5yfcLSewiQIhV
 4wd1MzUD2eg86uZPa1ushRYn4o8OvDsP5wJsSgQsgGJdkGrg4N6oeYI8Bvmm2Yu5rzkOUs
 WoyNDIYXkQVkvbrkom0q0WTE8LxZM8a1cy+1P65tGgTrqEqdB2Ot0I29XnG//w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pqzJC8E1
Subject: Re: [Buildroot] [PATCH] utils/check-package: new check for
 Buildroot's defconfig files
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 31 Mar 2024 22:34:03 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Now that we do have support for checking hashes for custom versions
> (for the few packages for which we do support custom versions, like the
> kernel, some bootloaders...), we want to ensure that our defconfig
> files, when they enable one or more such custom version, do enable
> checking the hashes for those versions, and thus we want to require all
> our defconfigs do enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.
> 
> Add a check for that condition.
> 
> We need to be careful that we only check Buildroot's defconfig, whether
> in-tree or in a br2-external, and not kernel or other kconfig-based
> defconfig files, like those in board/ sub-directories. So we only match
> defconfig files that are in a configs/ directory, whether at the
> toplevel (for in-tree defconfigs), or not (for br2-external defconfigs).
> 
> Since we only have two defconfigs that check hashes for custom versions,
> regnerate .checkpackageignore to ignore all so-far broken defconfigs.
> 
> Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> 
> ---
> Note: this patch does not contain a regenerated .checkpackageignore, for
> ease of review; I can resubmit with it regenerated after reviews, or a
> committer may regenerate when applying.
> ---
>  utils/check-package                    |  9 +++++++++
>  utils/checkpackagelib/lib_defconfig.py | 20 ++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 utils/checkpackagelib/lib_defconfig.py

Applied to master, after updating .checkpackageignore of course. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
