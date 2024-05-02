Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71322C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 248E6415B0;
	Thu,  2 May 2024 07:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXY7O7BT7VXk; Thu,  2 May 2024 07:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B36D2415C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B36D2415C1;
	Thu,  2 May 2024 07:49:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD931BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA47960E00
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZj4M9Ze53Gp for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:49:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9664360DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9664360DF9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9664360DF9
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:49:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 951986000D;
 Thu,  2 May 2024 07:49:38 +0000 (UTC)
Date: Thu, 2 May 2024 09:49:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240502094937.679fbd09@windsurf>
In-Reply-To: <20240411210222.2127990-1-bernd@kuhls.net>
References: <20240411210222.2127990-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714636178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o0Kdg1se81tg2c+9m58jUBplpoJEyY5IupP/KYeu8zk=;
 b=EhGnMEG5Pqf6JRVytKKeDXicE+kzAjFxkbVrieikR2SCQ41BS5WzvljPdvnQqYf+o5K8jg
 uKuPDp+Dqn8J0LiTPrP5vgkXFxmmKs8M1vVh6vrACH1c/DOcJvWHO35dyU4x1USR9nwZWX
 w0v62lmmBgZYvstwwDqX1P6+iHFhPKG2SSFL9jjbkmnNmA0zCs0vjmOxxiK/SqLJA5Zojc
 0NOhhhSMayAWh3DF/cmEgi9by6aB5jX+CmBZ6EjWp5Yqng3SGtWAWu8PHlS6h1otg3PdgA
 SuPPg91Wmf5xq1MjlWDioFzx+UnftgPAjp8S84fOTl4JCiQxwAtZEPghpr6ftg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EhGnMEG5
Subject: Re: [Buildroot] [PATCH] package/libpciaccess: bump version to 0.18.1
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

On Thu, 11 Apr 2024 23:02:22 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch which is included in upstream release.
> 
> Release notes:
> https://lists.x.org/archives/xorg-announce/2024-March/003483.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...lding-static-library-not-just-shared.patch | 48 -------------------
>  package/libpciaccess/libpciaccess.hash        |  4 +-
>  package/libpciaccess/libpciaccess.mk          |  2 +-
>  3 files changed, 3 insertions(+), 51 deletions(-)
>  delete mode 100644 package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch

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
