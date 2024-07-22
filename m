Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57358C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CCC240183;
	Mon, 22 Jul 2024 16:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lXw5F04RQ8I; Mon, 22 Jul 2024 16:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C262A40199
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C262A40199;
	Mon, 22 Jul 2024 16:13:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6211BF284
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 867AE80EA9
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYod5hayi57c for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:13:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C23380E0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C23380E0A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C23380E0A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:13:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F29D1C0003;
 Mon, 22 Jul 2024 16:13:02 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:13:01 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722181301.16986c2c@windsurf>
In-Reply-To: <20240722155909.53198-1-fontaine.fabrice@gmail.com>
References: <20240722155909.53198-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721664782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTqnetlXfisA7PyIaX+e2I1ahNXIh6Es3in2EB40mVY=;
 b=Mal8eknyWkMMTHc86lvyRluCpWX4yFjgXz3fHZ1pmeEEo3uON85oYqOy9Jfof6i5M/vmAf
 7p5X1j1sfV9y5d52IgDbf6AOxusj+h+6PxslTGE0QPaEzRVcjdjTMOJlDddXZA4uV3ei5I
 dHo+UCBkHh/nuK06cg210w3ujIrlUARh4z1Mm4YEQJ7hxcOxFVtuJaGCaV+uM3aIVY2kmB
 Sw5/5i2Cx0ZtfD0ziIFY8Sh+HNzhWfmUFfh3GPbqn11M27mfCfCkgEFV4Vj5dk/6LuCZUx
 vtgsWxPfxrTfMMVcP5rw/0C7iy/6mFZ4jVRkoNEP3G4J5rwAOtdK9CnVotP1Dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mal8ekny
Subject: Re: [Buildroot] [PATCH 1/1] package/faifa: bump to latest git commit
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

On Mon, 22 Jul 2024 17:59:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version)
> - libevent is mandatory since
>   https://github.com/ffainelli/faifa/commit/d2339c2a7680e7c87555650e19123e27e1f12031
> - This bump will fix the following build failure with gcc >= 14:
> 
>   hpav_cfg.c: In function 'pushbutton_request':
>   hpav_cfg.c:256:37: error: passing argument 2 of 'send_vendor_pkt' makes pointer from integer without a cast [-Wint-conversion]
>     256 |         return send_vendor_pkt(ctx, mac, HPAV_MMTYPE_MS_PB_ENC,
>         |                                     ^~~
>         |                                     |
>         |                                     uint8_t {aka unsigned char}
>   hpav_cfg.c:123:64: note: expected 'const uint8_t *' {aka 'const unsigned char *'} but argument is of type 'uint8_t' {aka 'unsigned char'}
>     123 | static int send_vendor_pkt(struct context *ctx, const uint8_t *to,
>         |                                                 ~~~~~~~~~~~~~~~^~
>   hpav_cfg.c: In function 'main':
>   hpav_cfg.c:406:48: error: passing argument 2 of 'pushbutton_request' makes integer from pointer without a cast [-Wint-conversion]
>     406 |                 ret = pushbutton_request(&ctx, mac);
>         |                                                ^~~
>         |                                                |
>         |                                                uint8_t * {aka unsigned char *}
>   hpav_cfg.c:254:60: note: expected 'uint8_t' {aka 'unsigned char'} but argument is of type 'uint8_t *' {aka 'unsigned char *'}
>     254 | static int pushbutton_request(struct context *ctx, uint8_t mac)
>         |                                                    ~~~~~~~~^~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5a65337366e52c6234d8d154b7e9a0296e02f1dd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  3 --
>  ...y-include-endian.h-for-BYTE_ORDER-ma.patch | 32 -------------------
>  ...t-include-linux-if_ether.h-for-musl-.patch | 32 -------------------
>  ...-fix-asbolute-symlink-of-libfaifa.so.patch | 32 -------------------
>  package/faifa/Config.in                       |  1 +
>  package/faifa/faifa.hash                      |  2 +-
>  package/faifa/faifa.mk                        |  6 ++--
>  7 files changed, 5 insertions(+), 103 deletions(-)
>  delete mode 100644 package/faifa/0001-sha2.c-explicitly-include-endian.h-for-BYTE_ORDER-ma.patch
>  delete mode 100644 package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch
>  delete mode 100644 package/faifa/0003-Makefile.in-fix-asbolute-symlink-of-libfaifa.so.patch

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
