Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C28C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A75EB4026E;
	Mon,  8 Jul 2024 21:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0cw8dhR3U4f; Mon,  8 Jul 2024 21:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5927C40288
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5927C40288;
	Mon,  8 Jul 2024 21:12:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05E2B1BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D05A960849
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mZBC6xdObcD for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:11:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D2F7E60848
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2F7E60848
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2F7E60848
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:11:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FCB9E0003;
 Mon,  8 Jul 2024 21:11:52 +0000 (UTC)
Date: Mon, 8 Jul 2024 23:11:51 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240708231151.2606b9ff@windsurf>
In-Reply-To: <20240705094449.8550-2-fiona.klute@gmx.de>
References: <20240705094449.8550-1-fiona.klute@gmx.de>
 <20240705094449.8550-2-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720473112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxSrcAbP9j84AVBf5VlE5D2R8966DhJAfoAEfdr85C8=;
 b=XkloSmXYbtnPiC8P5ILklE1gVLhSLwNola4NN9vVlKxsKVom0RiCoE918G3aW9lxmiNEqW
 P+N6WSHMR1VdfHbEGt3farv1HL7uTyiKXgyhvPbhdP4RoSz9xHx6dUndD3wnQBdTDGdaxQ
 OmWzypXddQDZLiRsYwGeN9ZZzPQd2zY42zDj5D+b0O6NNhkUY9xHPFRrh2FNxFqbjhmha1
 21ORiUUv/PTEysiu8Wqab19YxGVvLPBii0ER1d84p2PMxoH87vqp/3sQ1vadURJz6Zh91X
 O8JM35aS1JFyPelALwVSuO5mSzYNJ2csatBFYdS6btUXvFyfgbszv2lisf9KHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XkloSmXY
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual: describe relying on
 default options
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
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  5 Jul 2024 11:44:48 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> People can assume that e.g. Busybox options enabled in the package are
> enabled when writing code for Buildroot. Anyone who uses custom
> configurations that disable default options needs to make sure
> relevant scripts etc. still work for themselves.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  docs/manual/integration-principles.adoc | 18 ++++++++++++++++++
>  docs/manual/integration.adoc            |  2 ++
>  2 files changed, 20 insertions(+)
>  create mode 100644 docs/manual/integration-principles.adoc
> 
> diff --git a/docs/manual/integration-principles.adoc b/docs/manual/integration-principles.adoc
> new file mode 100644
> index 0000000000..9e2f43a18a
> --- /dev/null
> +++ b/docs/manual/integration-principles.adoc
> @@ -0,0 +1,18 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +[[integration-principles]]
> +=== Integration Principles
> +
> +Some foundational packages like Busybox can be configured with or
> +without certain features. When writing Buildroot code that uses such
> +packages, contributors may assume that the options enabled in the
> +Buildroot-provided configurations are enabled. For example,
> ++package/busybox/busybox.config+ sets
> ++CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y+, so init scripts
> +meant for use with Busybox init may use +start-stop-daemon+ with long
> +form options.
> +
> +People who use custom configurations that disable such default options
> +are responsible for making sure that all relevant scripts still work,
> +and if not, adapting them accordingly (in an overlay).

I understand the wish to document this, but I'm not sure an
"Integration principles" is the right place. Shouldn't we document that
in a section where we document the expectations in terms of init
scripts instead?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
