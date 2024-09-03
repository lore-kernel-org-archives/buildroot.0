Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DC7CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CDA560680;
	Tue,  3 Sep 2024 20:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOTGlIbzFIo4; Tue,  3 Sep 2024 20:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17EF260687
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17EF260687;
	Tue,  3 Sep 2024 20:26:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1259A1BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F394F40198
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tn054ejbZANV for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:26:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D5C040112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D5C040112
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D5C040112
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:26:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 065EF60004;
 Tue,  3 Sep 2024 20:26:50 +0000 (UTC)
Date: Tue, 3 Sep 2024 22:26:50 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20240903222650.10afba32@windsurf>
In-Reply-To: <20240903160038.19535-2-nicolas.cavallari@green-communications.fr>
References: <20240903160038.19535-1-nicolas.cavallari@green-communications.fr>
 <20240903160038.19535-2-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725395211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sx3yNERhx5wG9vBe97dAHZaVgJPQjV+99wrAiqKvzyA=;
 b=fgCewEN1ed5y1fmFyZ2bz/mOuD87IvZCx0nLEXxm5Ab2GGpBAcWlAmUF4cFFgNbnuNB2mb
 A8dgBfVxocGLdqoaystKVr9e8yGsF4WueXzSFlm0da9+Wk9VgZjseY/knDT1EH0ode2a4A
 dXfZRKHYZBLCo5BWpXgGyQVLMPCNfqyjv6x/jZ4ST/o8VsnFjFq3e6warU8e5CNeYWrkD9
 cbdr8SPr5eIpvBJ1nfEWlC7H6gODJtQHXFdK11QM4skkqiqt2pUEw5P22YKpy6yXNgkw0F
 zgtNtWkRuoxjeezWrI+LEWEda6n802CDWCFn4gEbTmsrFqiECY+Q8xCGLFMRdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fgCewEN1
Subject: Re: [Buildroot] [PATCH 2/2] package/bluez-alsa: bump version to
 4.3.1
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

On Tue,  3 Sep 2024 18:00:31 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> Add new optional dependencies on bluez midi support, opus, systemd and
> spandsp.

We need your Signed-off-by line.

> ---
>  package/bluez-alsa/bluez-alsa.hash |  2 +-
>  package/bluez-alsa/bluez-alsa.mk   | 30 +++++++++++++++++++++++++++++-
>  2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
> index 5513865603..fbcbabea28 100644
> --- a/package/bluez-alsa/bluez-alsa.hash
> +++ b/package/bluez-alsa/bluez-alsa.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated:
> -sha256  b69a3e6dd69315194403ee930ac1553aed3fb9a3988e502ae5c24a8bfef70f9f  bluez-alsa-4.1.1.tar.gz
> +sha256  933fe898dfac21fdfeb5f4ffa685c2aa2db9c064d639170ac2652f156e956a2a  bluez-alsa-4.3.1.tar.gz
>  sha256  956564dcf06ba65cd7a5eb6cdfd695e2ab0f09ea9684e4eaf079f5d533bd206d  LICENSE
> diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
> index 38682c2755..8a5abe3f7f 100644
> --- a/package/bluez-alsa/bluez-alsa.mk
> +++ b/package/bluez-alsa/bluez-alsa.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BLUEZ_ALSA_VERSION = 4.1.1
> +BLUEZ_ALSA_VERSION = 4.3.1
>  BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,v$(BLUEZ_ALSA_VERSION))
>  BLUEZ_ALSA_LICENSE = MIT
>  BLUEZ_ALSA_LICENSE_FILES = LICENSE
> @@ -16,6 +16,7 @@ BLUEZ_ALSA_AUTORECONF = YES
>  BLUEZ_ALSA_CONF_OPTS = \
>  	--enable-a2dpconf \
>  	--enable-aplay \
> +	--enable-cli \
>  	--disable-debug-time \
>  	--with-alsaplugindir=/usr/lib/alsa-lib \
>  	--with-alsaconfdir=/etc/alsa/conf.d
> @@ -73,6 +74,12 @@ else
>  BLUEZ_ALSA_CONF_OPTS += --disable-rfcomm
>  endif
>  
> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI),y)
> +BLUEZ_ALSA_CONF_OPTS += --enable-midi
> +else
> +BLUEZ_ALSA_CONF_OPTS += --disable-midi
> +endif

Maybe group with the other conditions testing
BR2_PACKAGE_BLUEZ5_UTILS_* options in the same file?

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
