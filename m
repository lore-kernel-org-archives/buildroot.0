Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF7EE77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 15:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A37F40649;
	Thu, 26 Dec 2024 15:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QixyoRnAwNfO; Thu, 26 Dec 2024 15:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 206AB40644
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 206AB40644;
	Thu, 26 Dec 2024 15:01:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18841F15
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 15:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E789480C1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 15:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0E3hH-CW0cu for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 15:01:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6846080C0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6846080C0D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6846080C0D
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 15:01:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCBADFF808;
 Thu, 26 Dec 2024 15:01:47 +0000 (UTC)
Date: Thu, 26 Dec 2024 16:01:46 +0100
To: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>
Cc: "Thomas Bonnefille via buildroot" <buildroot@buildroot.org>,
 =?UTF-8?B?TWlxdcOobA==?= Raynal <miquel.raynal@bootlin.com>, "Mahyar
 Koshkouei" <mahyar.koshkouei@gmail.com>, "Eric Le Bihan"
 <eric.le.bihan.dev@free.fr>
Message-ID: <20241226160146.3a93f3c8@windsurf>
In-Reply-To: <D6IFV7MLF3EN.2NH20DP0JW6F@bootlin.com>
References: <20241221-fix_mpv-v1-1-d7ba39606571@bootlin.com>
 <20241222161820.7c8b1081@windsurf>
 <D6IFV7MLF3EN.2NH20DP0JW6F@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735225308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GmkzM4ErZ2EAyMGOCVs3kaJyRZF+gk48ys17YW6l2D8=;
 b=LM+cU0BTgv//T1575ppYnMx4lLLYbNdZb0RZWsczdqpuO7hQmtGNFz+QuKl7ABcKxJBhoU
 5dNIDbBVINtuEqClfG6BnHTfmpqhba3ModInkfp4ZGcPphsynqqD+UCEqyGVoRDvokYUiu
 N9EW3pg52xikAthnPvsEY4qoIWk8sVxJKx98+pxlsAk60Mwt7QE1N0++1JpZgTFZ1TjkdY
 aZv+T6Mo0DsWvyG1fMZ9H/dB+HyK/LwJqLtVLv7mWPdcCRj4M2gnSUcFHeDhY1acQ+NWrZ
 KNGDFl3I4k2dnuUHg1cVQnTfQDb4AUWFxaqgd09I63Dj4CX7dV5Xp0uvoWkjDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LM+cU0BT
Subject: Re: [Buildroot] [PATCH] package/mpv: use meson instead of waf
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

Hello Thomas,

On Sun, 22 Dec 2024 19:25:42 +0100
"Thomas Bonnefille" <thomas.bonnefille@bootlin.com> wrote:

> I don't have an in depth analysis of the problem however, what I can say
> is that the error appeared with commit
> fd5623150dcc23441c4f0bd586378daeb91d66ea which bump waf from v2.0.26
> (August 2023) to v2.1.1 (July 2024).

This is already a very good analysis: we know what broke the build, and
therefore since when it was broken.

> I would think that waf isn't backward compatible and as the mpv version
> we're currently using is pretty old (November 2022), it broke with the
> new Waf version.

Seems totally possible indeed.

And therefore, here is a more minimal fix:

diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index a09015619d..44f2665a70 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  41df981b7b84e33a2ef4478aaf81d6f4f5c8b9cd2c0d337ac142fc20b387d1a9  mpv-0.35.1.tar.gz
+sha256  dcec3e179f9c33a66544f1b3d7d91f20f6373530510fa6a858cddb6bfdcde14b  waf-2.0.26
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index cf37091186..70283df274 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -6,6 +6,9 @@
 
 MPV_VERSION = 0.35.1
 MPV_SITE = $(call github,mpv-player,mpv,v$(MPV_VERSION))
+# The waf version from package/waf is too recent, so we download our
+# own
+MPV_EXTRA_DOWNLOADS = https://waf.io/waf-2.0.26
 MPV_DEPENDENCIES = \
 	host-pkgconf ffmpeg libass zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
@@ -14,7 +17,10 @@ MPV_LICENSE_FILES = LICENSE.GPL
 MPV_CPE_ID_VENDOR = mpv
 MPV_INSTALL_STAGING = YES
 
-MPV_NEEDS_EXTERNAL_WAF = YES
+define MPV_INSTALL_WAF
+	$(INSTALL) -D -m 0755 $(MPV_DL_DIR)/waf-2.0.26 $(@D)/waf
+endef
+MPV_POST_PATCH_HOOKS += MPV_INSTALL_WAF
 
 # Some of these options need testing and/or tweaks
 MPV_CONF_OPTS = \

The idea is to have mpv download its own version of waf.

However, now that we understand that the issue was introduced by commit
fd5623150dcc23441c4f0bd586378daeb91d66ea, which got merged in 2024.08,
we know we don't need to backport the fix to our LTS branch. Therefore,
having a more "invasive" fix such as the one you proposed is acceptable.

> > Indeed, we want to know if we want to backport the fix to our stable
> > 2024.02.x branch or not.   
> 
> I think that, as far as the waf version get still stuck on
> v2.0.26, the mpv package will not break (at least not this way).

Right.

> Can you develop ? I'm not sure what kind of regression can be introduced
> ?
> I don't know if it answers the question but the meson build system has
> been added to mpv with "waf-compatibility" in mind and so all the
> options were translated from waf to meson. [1]

When you switch to one build system (waf) to another (meson), there is
a fairly high chance that the way dependencies are detected is going to
be slightly different, causing some subtle differences in behavior.
After all, all the dependency detection logic and all the build logic
is completely changed. We have regularly seen regressions when switch
from build system A to build system B. Of course, it doesn't mean it
shouldn't be done, but it means that considering such a switch as a fix
for our LTS branch is clearly not good.

But again, as the issue was introduced only in 2024.08, I think your
proposal to switch to meson-package is fine.

> I don't know why they get rid of waf but it was first deprecated and
> then remove in favor of meson, so I thought this was a mandatory step to
> operate this switch in Buildroot.

Oh, yes definitely the only solution moving forward is to switch to
meson. But as I've explained above: what we do moving forward (which
can be invasive) may need to be different than what we do more
conservatively in our LTS branch.

In addition to this migration to meson, what about bumping to a newer
version of mpv? Of course, in a separate commit.

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
