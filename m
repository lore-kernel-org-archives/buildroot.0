Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743BFF3381A
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 08:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3585E6148D;
	Tue, 17 Mar 2026 08:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVp0MnuAH2zU; Tue, 17 Mar 2026 08:52:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 327D2613B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773737548;
	bh=pk16oL+PCvTrtFCfRlJ+x9NUPLmjm7voL4PbAnrPiew=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=fU0F8CXVgLf+eOR0o5IUiPibUah0hT40dcH5hgzUBUML1LL6r+wqlXFfUrL5I5imx
	 N4w9BhoRiGlk9hYygm6FLwSW3LAcDGKtn8nsjk8qRo6KPGsLxMJ8/bDkCVCcXPwIPz
	 diuEGKCJjCzdoyjm13Pf0kcMpJJSgh2fzzs4jA6wXOBnTPOdf19ORHDparRSiomhWl
	 42ZmZLsfXSUhNJToO+J5UPGLKia4AhtnRDewnQ7rfpIz8f6VIKfEv5ayjgG5RvyHvv
	 oar13/jwUzSqa4QyxhNkJlEL077hp602+KTpAjz9n67NABSQqmP2pnCZHORkFiadvs
	 C2ZOPI+MVZsOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 327D2613B1;
	Tue, 17 Mar 2026 08:52:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7053D3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 08:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CD2240BDD
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 08:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbXVDXpesTCN for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 08:52:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1E774004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1E774004D
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1E774004D
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 08:52:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 554A6C55058;
 Tue, 17 Mar 2026 08:52:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5092D5FC9A;
 Tue, 17 Mar 2026 08:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 928BD104503AD; Tue, 17 Mar 2026 09:52:16 +0100 (CET)
Mime-Version: 1.0
Date: Tue, 17 Mar 2026 09:52:15 +0100
Message-Id: <DH4XHATZWUW8.VLNYBU22SOBQ@bootlin.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20260315154343.3144013-1-neal.frager@amd.com>
 <20260315154343.3144013-2-neal.frager@amd.com>
In-Reply-To: <20260315154343.3144013-2-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1773737541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MNnXrGVKHR4Y5JLVTr946/MuBu97O1OZiDppKFq4K8s=;
 b=br3Yt6kVc1y4nTeMBZFSQ8lPmYngrywUADKzCHFPWX2a8ij7Ze5/G8Qky3Qvut0rPYOedT
 RJPC2rdkgvuvgWFUuGoZvH5K9Z6TDrbi8jSFhCYxd+yTsrFSNDbF44BEVGEWiDw9OrkjQM
 ijp3UhwTRcdGc0Kzc94c1EDasL3SPFdS2CaOXlMjwhxXnUqy0nymHbpYYLvszDixwvG2S0
 k8ZfjtWzUYGW9GhTLqE4y+qDkYIeIm7dYLUIc/UG/bYgKDRtosdWVIsnaSXVfINdU/Iukj
 rWenKajgPKmo+6eg1lnaTHKM5ZgvKI4R/Am7CoMy22H+6V7oBcj0ZDYpjXdQag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=br3Yt6kV
Subject: Re: [Buildroot] [PATCH v5 2/3] board/versal/post-image.sh: add
 custom hardware support
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, yann.morin@orange.com,
 brandon.maier@collins.com, fiona.klute@gmx.de, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun Mar 15, 2026 at 4:43 PM CET, Neal Frager wrote:
> By switching to the LINUX_DTBS variable, the post-image.sh script can now
> work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
> or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
> the transition users will make when migrating from a versal evaluation board
> to a versal custom platform.
>
> To keep the example post-image script as simple as possible, it assumes that
> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
> filename that u-boot will use for booting. Users are free to implement their
> own post-image scripts for use cases with multiple DTBs.
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
