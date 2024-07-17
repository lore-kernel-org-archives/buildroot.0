Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A0DC3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 20:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F15240C23;
	Wed, 17 Jul 2024 20:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PF0UcotLKnno; Wed, 17 Jul 2024 20:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA079400EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA079400EA;
	Wed, 17 Jul 2024 20:59:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1B3A1BF20D
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBCC4608C1
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klpsneAfHt1f for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 20:59:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8174D6069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8174D6069B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8174D6069B
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 20:59:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E628C0002;
 Wed, 17 Jul 2024 20:59:39 +0000 (UTC)
Date: Wed, 17 Jul 2024 22:59:38 +0200
To: Andreas Naumann <anaumann@ultratronik.de>
Message-ID: <20240717225938.31659b3d@windsurf>
In-Reply-To: <20240717194808.126443-1-anaumann@ultratronik.de>
References: <20240717194808.126443-1-anaumann@ultratronik.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721249979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1iuxcLfAe1Ni0EQqtbi1+Qi20FDcoZahdroE6xHzxk=;
 b=KLXo6nnFJdhT6XanhlQgTYo7pcP1p5uThhW3CCCspY2rFxLRCvII0uK/sYduOhpPEHToDg
 Trq0nQIetGn2beISrCDN0M+FCVr+noTSrH3w+mwH3pQ2oClvEvEAN+VoV+LlOrvv3hHvAJ
 Y/l4GoBMrrSeqOrOkW598pAk+9dw0y/9DtYFXO1Lg4VkPHP6reIkpf2sAJzTqfAoKuyNNb
 4uPQEMH0APTx95LWtpWUjopUzNB2AVwBPXC7hao0Z3CvwxZFzWosih3HnPx7qgxbG3zR6r
 DsY7owwB+abN6J+T9MywwE70riiFxQqNLcd6eA6lDBHKRP1ZA4JzDAO+oPPShw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KLXo6nnF
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6opcua: new package
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Wed, 17 Jul 2024 21:48:08 +0200
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Add qt6 version of qtopcua from git as it's not contained in the
> official qt release submodule directory.
> 
> Fulfill the mandatory dependency on qt6base, and qt6base-network in
> particular, as well as the need for host tool qopcuaxmldatatypes2cpp
> which is provided by host-qt6opcua.
> For host-qt6opcua set the dependency on host-qt6base-network as well.
> 
> Existence of the optional dependency openssl enables
> FEATURE_open62541_security. (This has changed from qt5opcua where
> mbedtls was supported.)
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

Thanks applied, with minor changes, see below.

> ---
>  package/qt6/Config.in              |  1 +
>  package/qt6/qt6opcua/Config.in     | 14 +++++++++
>  package/qt6/qt6opcua/qt6opcua.hash |  9 ++++++
>  package/qt6/qt6opcua/qt6opcua.mk   | 46 ++++++++++++++++++++++++++++++
>  4 files changed, 70 insertions(+)

Entry in DEVELOPERS file missing.



>  create mode 100644 package/qt6/qt6opcua/Config.in
>  create mode 100644 package/qt6/qt6opcua/qt6opcua.hash
>  create mode 100644 package/qt6/qt6opcua/qt6opcua.mk
> 
> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> index e84806d5e4..29c1c25c7f 100644
> --- a/package/qt6/Config.in
> +++ b/package/qt6/Config.in
> @@ -48,6 +48,7 @@ source "package/qt6/qt6core5compat/Config.in"
>  source "package/qt6/qt6declarative/Config.in"
>  source "package/qt6/qt6languageserver/Config.in"
>  source "package/qt6/qt6mqtt/Config.in"
> +source "package/qt6/qt6opcua/Config.in"
>  source "package/qt6/qt6serialbus/Config.in"
>  source "package/qt6/qt6serialport/Config.in"
>  source "package/qt6/qt6shadertools/Config.in"
> diff --git a/package/qt6/qt6opcua/Config.in b/package/qt6/qt6opcua/Config.in
> new file mode 100644
> index 0000000000..84a51f544f
> --- /dev/null
> +++ b/package/qt6/qt6opcua/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_QT6OPCUA
> +	bool "qt6opcua"
> +	select BR2_PACKAGE_QT6BASE_NETWORK
> +        # qt6opcuda needs host-qt6opcua, and host-qt6opcua needs
> +        # network support in qt6base.

Dang, I realize now the indentation here is with spaces, it should have
been with tabs. I'll fix that up.


> +QT6OPCUA_LICENSE = \
> +	GPL-2.0 or GPL-3.0 or LGPL-3.0, \
> +	GPL-3.0 WITH Qt-GPL-exception-1.0 (tools), \

The tools are also under "GPL-2.0 or GPL-3.0 or LGPL-3.0" as far I can
see, so I dropped this line.

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
