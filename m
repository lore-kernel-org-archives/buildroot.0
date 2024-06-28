Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A3BC30658
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 14:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D47841C32;
	Fri, 28 Jun 2024 14:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0M9dMX5vJCw; Fri, 28 Jun 2024 14:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D89341C3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D89341C3B;
	Fri, 28 Jun 2024 14:13:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B45A81BF57B
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 14:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC3D780C05
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 14:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ph8vV6HXgixV for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 14:13:55 +0000 (UTC)
X-Greylist: delayed 16877 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 28 Jun 2024 14:13:55 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8031A80BED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8031A80BED
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8031A80BED
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 14:13:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BC851C0008;
 Fri, 28 Jun 2024 14:13:51 +0000 (UTC)
Date: Fri, 28 Jun 2024 16:13:49 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240628161349.4dd003a1@booty>
In-Reply-To: <20240628122436.1630911-1-neal.frager@amd.com>
References: <20240628122436.1630911-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719584032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iz80LUf5G8PXZO3lc+mNHrWW39wlN3g0v1Luv7rJH+I=;
 b=jbyY77YCJB3HOQUfzAFuSQ2Ykl52AwQhCzoIE2QRKlQteZAPf2jwvgK8lYFjlUHZShbaeB
 BXtKAfVSR1yjzWK1vpL0dOY8pV0JdU/ZKDTcHOIIBKNmRYr/3t8oB63VYag3sjdC+Q7j0b
 OHKGYms7d+ZVJ2HGSS7sdLxZUZAeD/3PEF3wTUxylGDmBlnz5dxTEBE7NaCoDfKxpyGi3Q
 5sj4RppU03B/5tWOksD7d7mUyeLMay+v1NvxSSoL+jzw+g7RMd4LbF9mFxqHSW8mW4od6t
 JWosRf9ESFZ8LpotRsCB+LODT2RA15l0YH7aR5g/8WgBrC7Lp/EnBSV9bgmk+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jbyY77YC
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt/Config.in:
 versal needs bootgen
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Fri, 28 Jun 2024 13:24:36 +0100
Neal Frager <neal.frager@amd.com> wrote:

> When building for versal targets, bootgen is required for packaging the
> boot.bin.  This patch adds the dependency.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  boot/xilinx-prebuilt/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
> index d3df1c06e7..a1c2075d7c 100644
> --- a/boot/xilinx-prebuilt/Config.in
> +++ b/boot/xilinx-prebuilt/Config.in
> @@ -28,6 +28,7 @@ config BR2_TARGET_XILINX_PREBUILT_KRIA
>  
>  config BR2_TARGET_XILINX_PREBUILT_VERSAL
>  	bool "versal"
> +	depends on BR2_PACKAGE_HOST_BOOTGEN

Looking at this better, I'm not sure it's the right thing to do.

xilinx-prebuilt can "build" perfectly without bootgen.

This is similar to genimage, which is not needed to build any Buildroot
package, but is used by several defconfigs to generate a bootable SD
card image afterwards. Thus each of these defconfigs also sets
BR2_PACKAGE_HOST_GENIMAGE=y.

Sure bootgen differs in that (as far as I understand) the *typical*
usage of xilinx-prebuilt requires host-bootgen in a post-build script.
However in principle another tool could be used in its place.

So as I said I'm not sure. Adding the 'depends on', possibly with a
line of comment to clarify this, could still be seen as a convenience,
but it would break existing defconfigs if the 'depends on' were removed
later on to accommodate other use cases that do not involve bootgen.

If there are no stronger opinions I'd vote to not add this.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
