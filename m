Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE86D5B16E
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 14:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FE72402DC;
	Mon, 15 Dec 2025 14:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sf0f9OseDN75; Mon, 15 Dec 2025 14:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD5AD402CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765807888;
	bh=QJPRByx192pSxnFullPfIHdLiajwwNl5yW58erg1IV8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b4SxPOLw7lyFfTiIOB9HpnLsGuy0U5HxSBmeBBKZnj9nbvtxJfqj+B+Y8UD/YK3sO
	 fLBqFEev8J8A2PafzI2P4TRgyDdfv3WPfNfXOJbwh7Y248klmnsvLf2pvSViafS2BM
	 9mNqzk2szYT9bJPXcdK1azF5YKBSxfbd6Q1eXW8pjPMNa8Dqz9hjLVasx4lq2xcJM/
	 AVLR9gRhDWsdANq1eBAWD9WK61npifhJBR2VStO23CdheGCc0D6rMHHjmGQQRbuV1G
	 htdGCq684je7UcBNunJuSEx4vddK2boPdlVgoium2AU0m38BoHF1A3mEjvbJzraEPd
	 q92WqazIzxviQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD5AD402CB;
	Mon, 15 Dec 2025 14:11:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B541117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C91060E8A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlhuZc9ug0gw for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 14:11:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0604B60E85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0604B60E85
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0604B60E85
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:11:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 50EA51A21DB;
 Mon, 15 Dec 2025 14:11:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1DF7D60664;
 Mon, 15 Dec 2025 14:11:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 63E6811942392; Mon, 15 Dec 2025 15:11:18 +0100 (CET)
Date: Mon, 15 Dec 2025 15:11:18 +0100
To: Sadik SM <s-sadik@ti.com>
Cc: <buildroot@buildroot.org>, Bryan Brattlof <bb@ti.com>
Message-ID: <20251215151118.24797369@windsurf>
In-Reply-To: <20251215132425.136858-1-s-sadik@ti.com>
References: <20251215132425.136858-1-s-sadik@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765807879; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kotaAd08mkA1ABgDgbNxvM/sOrbGwVP1xAy+z6GboAo=;
 b=snoorLKX7Xf/cAE6I5UjSPW7E5SVAxRLGIu2PFLddPmmSevx6vcMZakV+Dz6XUXg4kra53
 xgau+R5ILBFphAUG03Or1SOK/1ocaSoYODiiCCzlT63Ce0dnkk/v0Na/7eN3ob6kVSc+rJ
 SdvnOX4nIl02nKLAwUbmOjV5dkoPfW5CCBU8AgrAjOOl7IPVlObp+ewcfNFQy1tt+wXlK2
 gtWLGivRCGg1rMVbTAhRbbSLSo4EUaO8ZzyEMuo1M7QsmfNbgj/QREN5B3Ga1N4w9mxP2R
 tKkHH6I+Lbwc0yNwaB/+4YmdWd5060zRgnYnNLnAnN7bYyS5EK4rdr3BGrzu1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=snoorLKX
Subject: Re: [Buildroot] [PATCH] package: new: add k3conf tool package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks a lot for your patch! Please find below a review of your patch.

First the commit title should be:

	package/k3conf: new package

On Mon, 15 Dec 2025 18:54:25 +0530
Sadik SM <s-sadik@ti.com> wrote:

> From: sadik <s-sadik@ti.com>

Please use your full first name / last name, with proper capitalization.

> add the k3conf tool in the package section

This sentence is not needed.

> 
> K3CONF is a Linux user-space standalone application
> designed to provide a quick'n easy way to dynamically
> diagnose Texas Instruments' K3 architecture based
> processors. K3CONF is intended to provide similar
> experience to that of OMAPCONF that runs on legacy TI platforms.
> 
> K3CONF currently supports Texas Instruments AM654, J721E, J7200, 
> AM64x,AM62x,J721S2,J784S4,J722S, AM62Ax, AM62Px, and AM62Lx devices.
> Along with the BeagleBoard variants of the above mentioned TI SOC's.
> 
> Signed-off-by: sadik <s-sadik@ti.com>

Please use your full first name / last name, with proper capitalization.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1b27df9beb..396452f261 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2962,6 +2962,9 @@ F:	package/agent-proxy/
>  N:	Ryan Wilkins <ryan@deadfrog.net>
>  F:	package/biosdevname/
>  
> +N:  Sadik SM <s-sadik@ti.com>
> +F:  package/k3conf

Please use the same indentation as in the rest of the document. Put a
final / in package/k3conf/, like for other entries.

Use your full first name / last name.


> diff --git a/package/k3conf/Config.in b/package/k3conf/Config.in
> new file mode 100644
> index 0000000000..f282ad672b
> --- /dev/null
> +++ b/package/k3conf/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_K3CONF
> +    bool "k3conf"
> +    help
> +      A Powerful Diagnostic Tool for Texas Instruments K3 based Processors.

Please find the indentation to match other Config.in files: one tab for
bool/help, one tab + two spaces for the help text.

Add the upstream URL of the project at the end of the help text.

You can run "make check-package" to check for coding style issues.

I think you can add a "depends on BR2_aarch64" dependency to this
package since anyway it doesn't make sense for other CPU architectures.


> diff --git a/package/k3conf/k3conf.hash b/package/k3conf/k3conf.hash
> new file mode 100644
> index 0000000000..47d9eca6a0
> --- /dev/null
> +++ b/package/k3conf/k3conf.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated sha256sum
> +sha256  a3459f80e7af5672da6b41bc0814114690dd549aac4cf81ba4e5dc84d42ab9c6  k3conf-v0.4-git4.tar.gz

Please add a hash for the license file.

> diff --git a/package/k3conf/k3conf.mk b/package/k3conf/k3conf.mk
> new file mode 100644
> index 0000000000..b248fb63d5
> --- /dev/null
> +++ b/package/k3conf/k3conf.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# k3conf
> +#
> +################################################################################
> +
> +K3CONF_VERSION = v0.4
> +K3CONF_SITE = https://git.ti.com/git/k3conf/k3conf.git
> +K3CONF_SITE_METHOD = git
> +K3CONF_LICENSE = BSD-3-Clause
> +K3CONF_LICENSE_FILES = LICENSE
> +
> +

Only one blank line.

> +K3CONF_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release

This is not needed, it's already passed by the cmake-package
infrastructure.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
