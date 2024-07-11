Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4433C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 17:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 766B8400E4;
	Thu, 11 Jul 2024 17:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6vbHqhqT4cU; Thu, 11 Jul 2024 17:33:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FAB64022F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FAB64022F;
	Thu, 11 Jul 2024 17:33:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 933761BF47D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D7F583FC5
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qK4hv1sq5F5M for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 17:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4C8883FC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4C8883FC3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4C8883FC3
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 17:33:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97EC740006;
 Thu, 11 Jul 2024 17:33:13 +0000 (UTC)
Date: Thu, 11 Jul 2024 19:33:11 +0200
To: Kurt Van Dijck via buildroot <buildroot@buildroot.org>
Message-ID: <20240711193311.12331db0@windsurf>
In-Reply-To: <20240612093118.22195-1-dev.kurt@vandijck-laurijssen.be>
References: <20240612093118.22195-1-dev.kurt@vandijck-laurijssen.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720719194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDw5v/KDYTdbrZcB2J9C8XdbtAStVsywsEAdbI/3VOA=;
 b=DbslGOtS96IqjojkiV9LwJFmzZgMbJDdG/ieuBcIje6Eb5q1/Zumi0ndwvhxiG6DRYioZR
 iG0QHoKF5xzMgaUQvq6TKHWCsLaTfd1trsSXyRlSpoO74Aklfj/6WpDSAqiOOPZPum+9bQ
 cT/m78KEnys/2Mt/rEaft2UQeT2CTPPiEXhmTI9LJ8b6RAlk1j3kd4jIZFhoECpC5jXVLP
 MwmOcEGWGtc1TgcVpqRhKx71vocdlbQxDPjkM/YCTT3FvV13hbw3KXiI+2FUqd5nEXIt4T
 HZOx17tcgKWDnp4NBJ+28V4hIep0QhXunn9TURstPS+zhxXWtqwgVRAtdBbSew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DbslGOtS
Subject: Re: [Buildroot] [PATCH] bcusdk: fix build without libxml
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
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kurt,

On Wed, 12 Jun 2024 11:30:57 +0200
Kurt Van Dijck via buildroot <buildroot@buildroot.org> wrote:

> bcusdk is configured without libxml.
> This commit removes the autotools libxml dependency.
> 
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

Thanks for your patch. However, could you clarify which build failure
it is fixing? Which Buildroot configuration is broken, which error
message?

I don't seem to see any build failure related to this in our
autobuilders... but there are other build failures related to bcusdk:

  http://autobuild.buildroot.net/?reason=bcusdk%

Some more comments below.

> ---
>  package/bcusdk/0003-remove-xml-autoconf.patch | 11 +++++++++++
>  package/bcusdk/bcusdk.mk                      |  2 ++
>  2 files changed, 13 insertions(+)
>  create mode 100644 package/bcusdk/0003-remove-xml-autoconf.patch
> 
> diff --git a/package/bcusdk/0003-remove-xml-autoconf.patch b/package/bcusdk/0003-remove-xml-autoconf.patch
> new file mode 100644
> index 0000000000..33ce45fe12
> --- /dev/null
> +++ b/package/bcusdk/0003-remove-xml-autoconf.patch

We need this patch to be generated with "git format-patch", and to have
a proper commit message + your Signed-off-by line. I encourage you to
look at the two other patches in package/bcusdk/ to see the format that
is expected.

Also, we expect the patch to be submitted upstream, and the patch to
carry an Upstream: tag that references the upstream pull request (or
patch posted to a mailing list).

> @@ -0,0 +1,11 @@
> +--- a/configure.in	2024-06-12 11:20:16.800828493 +0200
> ++++ b/configure.in	2024-06-12 11:18:19.275693151 +0200
> +@@ -81,7 +81,7 @@
> + 
> + if test x$onlyeibd = xfalse ; then
> + 
> +-AM_PATH_XML2(2.6.16,,[AC_MSG_ERROR([limxml2 not found])])
> ++#AM_PATH_XML2(2.6.16,,[AC_MSG_ERROR([limxml2 not found])])

Don't comment code, remove it entirely. But you need to clarify in the
commit message why it is not needed.

> + AC_PATH_PROG(TAS,[m68hc05-as],,[$PATH:$bindir:$prefix/bin])
> + AC_PATH_PROG(TLD,[m68hc05-ld],,[$PATH:$bindir:$prefix/bin])
> + AC_PATH_PROG(TAR,[m68hc05-ar],,[$PATH:$bindir:$prefix/bin])
> diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
> index f14b23c7cc..c572df725d 100644
> --- a/package/bcusdk/bcusdk.mk
> +++ b/package/bcusdk/bcusdk.mk
> @@ -23,6 +23,8 @@ BCUSDK_CONF_OPTS = \
>  
>  BCUSDK_DEPENDENCIES = libpthsem
>  
> +BCUSDK_AUTORECONF=YES

We need a comment above that explains why autoreconf is needed. Usually
just the patch file name is enough. And we need spaces around the =
sign.

Could you rework your patch according to those suggestions, and post a
new iteration?

And of course, ideally if you could fix the other build failure(s)
occurring with bcusdk, it would be awesome.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
