Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BE2CE7A89
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76A3F40114;
	Thu,  5 Sep 2024 19:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qF93eMyNbApp; Thu,  5 Sep 2024 19:32:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2228E40175
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2228E40175;
	Thu,  5 Sep 2024 19:32:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 566B31BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4394981AF3
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFck2FnZm9nf for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:32:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2009C814B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2009C814B3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2009C814B3
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:32:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC29160003;
 Thu,  5 Sep 2024 19:32:09 +0000 (UTC)
Date: Thu, 5 Sep 2024 21:32:08 +0200
To: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Message-ID: <20240905213208.390416dc@windsurf>
In-Reply-To: <20240905162402.1320569-1-guillaume.chaye@zeetim.com>
References: <20240905162402.1320569-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725564730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUE6sTofGPycKYv4Z2nUD/3kH9e+dJf6YDkpIFbE4TE=;
 b=nnpuG3z6qAZ46DUF9zNIiaPjWw3rWIal23kIaWa5EcWKIAVZqlnhW2srYKZ43yMVMDCw0u
 YAlZDKYlErStMDVN6CBy58/4PRulu65WtC7ysSDOMgX6xENxogC8iNG+6uAGJpPFIaWBVs
 wpa+3UrntX5zprtNMT7LyF7FEyEaOZCSES3tK3Xm85KrtF19LGdDubOSxxC41SIuO8hFum
 G/po+bSG8/RosiVqPzBCWA9RUPz3dbZgqSCF2C5Q1+B0BZaEGncYz4VxtpLTFGrr/8E2cq
 5PVC807xsRQyIsTvhA3JUq4gHmNqT+9gMXgjQKzcHQabog7HbeVZQGjEfjvayg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nnpuG3z6
Subject: Re: [Buildroot] [PATCH 5/5] package/librsvg: fix svg with gdk-pixbuf
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

Hello,

On Thu,  5 Sep 2024 18:24:02 +0200
"Guillaume GC. Chaye" <guillaume.chaye@zeetim.com> wrote:

> Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>

Thanks for the patch. However, it really, really needs a non-empty
commit log with some explanation.

> diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
> index 81a6667817..0187218a98 100644
> --- a/package/librsvg/librsvg.mk
> +++ b/package/librsvg/librsvg.mk
> @@ -12,7 +12,7 @@ LIBRSVG_INSTALL_STAGING = YES
>  LIBRSVG_CONF_ENV = \
>  	LIBS=$(TARGET_NLS_LIBS) \
>  	RUST_TARGET=$(RUSTC_TARGET_NAME)
> -LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools
> +LIBRSVG_CONF_OPTS = --disable-tools

You're removing --disable-pixbuf-loader, so probably it means that
pixbuf-loader support is important... so we probably need
--enable-pixbuf-loader, no?

>  HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
>  LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf host-rustc libglib2 libxml2 pango \
>  	$(TARGET_NLS_DEPENDENCIES)
> @@ -30,5 +30,22 @@ else
>  LIBRSVG_CONF_OPTS += --disable-introspection
>  endif
>  
> +# gdk-pixbuf requires the loaders.cache file populated to work properly

gdk-pixbuf? I guess this is due to a copy/paste.

> +# Rather than doing so at runtime, since the fs can be read-only, do so
> +# here after building and installing to target.
> +# And since the cache file will contain relative host directory names we
> +# need to prepend them with /usr/.
> +ifeq ($(BR2_STATIC_LIBS),)
> +define LIBRSVG_PIXBUF_UPDATE_CACHE
> +	GDK_PIXBUF_MODULEDIR=$(HOST_DIR)/lib/gdk-pixbuf-2.0/2.10.0/loaders \
> +		$(HOST_DIR)/bin/gdk-pixbuf-query-loaders \
> +		> $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
> +	$(SED) 's,^"lib,"/usr/lib,g' \
> +		$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
> +endef
> +LIBRSVG_POST_INSTALL_TARGET_HOOKS += LIBRSVG_PIXBUF_UPDATE_CACHE

Why do we need this a second time, when it's already done in
package/gdk-pixbuf/gdk-pixbuf.mk ? Also the 2.10.0 hardcoded here is
probably wrong? Maybe it's already wrong in gdk-pixbuf.mk?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
