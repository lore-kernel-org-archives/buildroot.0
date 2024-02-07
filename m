Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3078C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93CD4414BE;
	Wed,  7 Feb 2024 10:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IOpNmGKybeQ; Wed,  7 Feb 2024 10:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48FE6415A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48FE6415A2;
	Wed,  7 Feb 2024 10:41:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37C0B1BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32B896136F
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id okgWMUnZlVRl for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:41:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA4D361306
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA4D361306
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA4D361306
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:41:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BD98240008;
 Wed,  7 Feb 2024 10:41:47 +0000 (UTC)
Date: Wed, 7 Feb 2024 11:41:46 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240207114146.3335b6b8@windsurf>
In-Reply-To: <df16b2a080d81430777e362a57818411d1c57a94.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
 <df16b2a080d81430777e362a57818411d1c57a94.1706448055.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707302507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMMexl1ZLlj/pC5mE7Jo847R58zlq1gNbdcOPeypVp8=;
 b=Ojnzj9fX7UeQjPTlxkmq9RHqxo+bECaDsipmwQnb4u95wonYo6LH2Ibatz9dneJc8U4O8n
 LUbqJZlchv6u8I/Hd8kb+8fV5comlwrbzagq2nJjpFQ731FSa6GmHe8qIxEZ/FLB19/En4
 B66cevBn3Bx521nxIDSHdq34MOOxqKDk4L5MqJsmcWgupesBtdWkSyFKiF/9JkKNXZmNI5
 dXX/XtVYgL+xbZPsIPQGFV5asOP9Yo2kU6i0i7KmrW/Gsa5L+D/sTKj2axjIeSOQDX3G1S
 1SePX2+hj6cqG0lLPhTZXaZ/SgbtHP3Q41vDQIxnhIqvWpJ+a7OUv4g7bur7NQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ojnzj9fX
Subject: Re: [Buildroot] [PATCH 02/10] package/ivi-homescreen: fix
 dependencies for gstreamer plugin
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Jan 2024 14:20:51 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The gstreamer plugin select the EGL backend of gst1-plugins-base, but
> forgot to propagate all of its dependencies, notably the _HAS_API
> condition, causing unmet dependencies warnings (unfortunately, not
> errors), such as;
> 
>     $ KCONFIG_SEED=0x597D22A8 make randconfig
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
>       Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API [=n] && BR2_PACKAGE_HAS_LIBEGL [=y]
>       Selected by [y]:
>       - BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN [=y] && BR2_PACKAGE_IVI_HOMESCREEN [=y] && BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS [=y] && BR2_PACKAGE_HAS_LIBEGL [=y]
> 
> We can't select _HAS_API, because it is a symbol that represents a
> capability provided by other features of gst1-plugins-base; it's
> semantically like a virtual package: we can't select it, we can only
> depend on it.
> 
> Add this dependency to fix this situation.
> 
> This however causes circular (recursive) dependencies errors:
> 
>     package/gstreamer1/gst1-plugins-base/Config.in:135:error: recursive dependency detected!
>     package/gstreamer1/gst1-plugins-base/Config.in:135:     symbol BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL is selected by BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN
>     package/ivi-homescreen/Config.in:221:   symbol BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
>     package/gstreamer1/gst1-plugins-base/Config.in:149:     symbol BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API is selected by BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
>     package/gstreamer1/gst1-plugins-base/Config.in:152:     symbol BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
> 
> Indeed, _HAS_API is only even set when gstreamer1, gst1-plugins-base,
> and the gst1-plugins-base's lib-opengl support, are all already enabled.
> As such, the dependency on _HAS_API already implies those, and there is
> no need to select them.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/ivi-homescreen/Config.in | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

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
