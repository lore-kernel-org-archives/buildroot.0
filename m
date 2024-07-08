Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64C1C3DA42
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB38C60826;
	Mon,  8 Jul 2024 20:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqssyzVsto_j; Mon,  8 Jul 2024 20:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 766C860B70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 766C860B70;
	Mon,  8 Jul 2024 20:22:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BBB31BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 789F34033A
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_UI_xhnjuT7 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24EC140133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24EC140133
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24EC140133
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82B711BF206;
 Mon,  8 Jul 2024 20:22:20 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:22:00 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222200.7eaa6cf3@windsurf>
In-Reply-To: <20240707125921.4125163-1-dario.binacchi@amarulasolutions.com>
References: <20240707125921.4125163-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jyXPgcjVXLz0rVh42hcsdN497q8eerOtunHNcAhXTls=;
 b=XbhK6TYYFV7JIy7UVMDWYjlpndGiBup05qTfGnHYfSX9AzJSH6eaClO8OMVIbIbyW5f+45
 GNX/8pqEoDvZkxyuwiXSAj0VP2DwcsIund4weXu64MzD306q2qJPqZBKt0CTBTeXu8084v
 etvmA0+36H1PRSLrVKofiAeQIuAN/JNYU/Kgs80qX3qyU7tMLHetHLpV6GPfhV48u7CWDc
 atKk+j4LuLEtOGX4MQ86Cy5nT3EE56FfKFboE60s3Ev44EGmIcQOLTi3lAoU49tAThKjXC
 N/hxaI9IUuSNOWqB6BcCZ4eGVvgyc+l4XLVr9ReNP9ZkWneOJ+KFSfaqvVKxBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XbhK6TYY
Subject: Re: [Buildroot] [PATCH 1/1] package/rygel: update the patches to be
 applied with fuzz 0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jul 2024 14:59:21 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, rygel fails to build with output:
> 
>     Applying 0001-meson.build-fix-g_ir_compiler-calls.patch using patch:
>     patching file src/librygel-core/meson.build
>     Hunk #1 succeeded at 73 (offset 3 lines).
>     patching file src/librygel-renderer-gst/meson.build
>     Hunk #1 succeeded at 37 (offset 1 line).
>     patching file src/librygel-renderer/meson.build
>     Hunk #1 FAILED at 43.
>     1 out of 1 hunk FAILED -- saving rejects to file src/librygel-renderer/meson.build.rej
>     patching file src/librygel-server/meson.build
>     Hunk #1 FAILED at 122.
>     1 out of 1 hunk FAILED -- saving rejects to file src/librygel-server/meson.build.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .checkpackageignore                              |  1 -
>  ...001-meson.build-fix-g_ir_compiler-calls.patch | 16 +++++++++-------
>  2 files changed, 9 insertions(+), 8 deletions(-)

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
