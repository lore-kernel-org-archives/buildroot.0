Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360F6D132AE
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 11:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2CB560868;
	Mon,  4 Nov 2024 11:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZ8PvIg3qUqw; Mon,  4 Nov 2024 11:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81167607AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81167607AF;
	Mon,  4 Nov 2024 11:12:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC0B1B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 11:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8F2F40502
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 11:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwFoR_7PidyK for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 11:12:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BAE540516
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BAE540516
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BAE540516
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 11:12:23 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 453B4C37D3
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 11:12:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA30A60004;
 Mon,  4 Nov 2024 11:12:13 +0000 (UTC)
Date: Mon, 4 Nov 2024 12:12:10 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20241104121210.581f0447@booty>
In-Reply-To: <20241104081453.430619-1-neal.frager@amd.com>
References: <20241104081453.430619-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730718734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kSIAoqgReVWlgrCrU4OLmzv+sVDdRK05S/+uhXtvUCQ=;
 b=NJEt3z2ARdc2do4pWqfqD95j4OwSINfljWS7G8EvfdgqOgqEO28Oc9rQF7mfadw/3mARBV
 uhP9QkmcdLdEk7j5WKmsP0p1xTy5pmgGRd0eFnWJyxvE7HzPGRnNBtUw5hKtjuQliG4rKJ
 DV/GhDAiYz4WaWPDLTx6Zx5J/nQdfDJoccVwIIFuMRE7SDmDQiAW11dUT6x/Be6LOdQ4qd
 k2EbqWxhcqvmrNKLXyC6zu00lEsRNViCRhGzHOjSEJMIpR7BhmW/EV8gN2kpPj5p0hFE1G
 bPi6vkQiWekAMT+prldhkrjx6gdQgv1ESf4UVloM++YJwfza96DXql61fpC/jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NJEt3z2A
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/versal: re-adding
 xilinx-prebuilt version
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
Cc: brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, romain.naour@smile.fr, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 4 Nov 2024 08:14:52 +0000
Neal Frager <neal.frager@amd.com> wrote:

> The regenerate all defconfigs commit removed the xilinx-prebuilt version from
> the versal defconfigs.  If the version is not defined in the defconfig, then
> it is not possible to change the xilinx-prebuilt default version number
> independently of the board configs.  For this reason, this patch re-adds
> the xilinx-prebuilt version to the versal defconfigs.
> 
> Also, the vck190 board name has been added to the versal_vck190_defconfig in
> case the default versal board name ever changes.
> 
> https://github.com/buildroot/buildroot/commit/edc0a6b1a43689fb832bc024b5997312e0770e99
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
