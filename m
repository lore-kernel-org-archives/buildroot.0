Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E8EC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 10:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C716640C2B;
	Fri, 12 Jul 2024 10:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NySf4TIUtBTZ; Fri, 12 Jul 2024 10:05:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7933A415DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7933A415DB;
	Fri, 12 Jul 2024 10:05:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D424C1BF47F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFBB4845FC
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75rZWRnHoFKm for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 10:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99F09845FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99F09845FA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99F09845FA
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 10:05:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC8A31BF209;
 Fri, 12 Jul 2024 10:05:32 +0000 (UTC)
Date: Fri, 12 Jul 2024 12:05:22 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712120522.20c03ebd@windsurf>
In-Reply-To: <20240625211847.1419944-11-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-11-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720778737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xqdvSHYTu5rF3yQZ7MlZdKBZNy/xsxLIz8M1UF6GCbo=;
 b=oyty90o81zDsvoSj6fTSCP4cN7sGDEigyz6QzsvH5q0ATc/cu3E5072xMJy6Qme2s62LJ4
 ccsCmbuvJJsh3EdgvgfaaaM9PKe09AxgTEC13jUcH6XAk9nCT7ltgafm+aL3nfDTsDSh9D
 9x9UveiKzSd+kwVt8cg9yxJFbiZA3AOzSfOCK5akXqhsWjz03G56rUyARtqNWldzIR23sk
 4j7ZpOXSvSoR1xfpaEEluFcu4IOlCselbdNNaRoQH15uY/lwG7v+tiz22Dy8CPr8X8e3Af
 p89Y0iXRZUdmrY7bknZ5ip2M4OjTAx0KY+nqb02ep/0R4yXu8ICRkej/mBxkWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oyty90o8
Subject: Re: [Buildroot] [PATCH v9 11/14] package/qt6/qt6wayland: new package
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Tue, 25 Jun 2024 23:18:35 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> diff --git a/package/qt6/qt6wayland/Config.in b/package/qt6/qt6wayland/Config.in
> new file mode 100644
> index 0000000000..11179a4416
> --- /dev/null
> +++ b/package/qt6/qt6wayland/Config.in
> @@ -0,0 +1,27 @@
> +comment "qt6wayland needs an OpenGL-capable backend"
> +	depends on !BR2_PACKAGE_QT6_GL_SUPPORTS
> +
> +config BR2_PACKAGE_QT6WAYLAND
> +	bool "qt6wayland"
> +	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
> +	select BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_QT6BASE_GUI
> +	select BR2_PACKAGE_HOST_QT6BASE_GUI

I added a small comment above this line that explains why it is needed.


> +QT6WAYLAND_LICENSE = \
> +	GPL-2.0+ or LGPL-3.0, \
> +	GPL-3.0, GFDL-1.3 no invariants (docs)

Changed to:

QT6WAYLAND_LICENSE = \
	BSD-3-Clause (examples, tests), \
	GPL-3.0 (compositor), \
	LGPL-3.0 or GPL-2.0 or GPL-3.0, \
	GPL-3.0 WITH Qt-GPL-exception-1.0 (tests), \
	GFDL-1.3 no invariants (docs)

> +QT6WAYLAND_DEPENDENCIES = \
> +	qt6base \
> +	wayland \
> +	host-qt6wayland

Added a comment that explains why host-qt6wayland is needed.

> +
> +HOST_QT6WAYLAND_CONF_OPTS = \
> +	-DFEATURE_wayland_client=OFF \
> +	-DFEATURE_wayland_server=OFF
> +
> +HOST_QT6WAYLAND_DEPENDENCIES = host-qt6base

I have moved these HOST_ variables further down, to not mix variable
definitions for the host package and for the target package.

> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> +QT6WAYLAND_DEPENDENCIES += qt6declarative
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6WAYLAND_COMPOSITOR),y)
> +QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=ON
> +QT6WAYLAND_DEPENDENCIES += libxkbcommon
> +else
> +QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=OFF
> +endif

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
