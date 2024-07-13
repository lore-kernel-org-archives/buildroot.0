Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322BDC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1AFA413AE;
	Sat, 13 Jul 2024 14:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCvH4jwLxE0r; Sat, 13 Jul 2024 14:20:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A44BF413DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A44BF413DA;
	Sat, 13 Jul 2024 14:20:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0599E1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6870400A4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1YVPkb32uG-k for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:20:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99F5D40096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99F5D40096
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99F5D40096
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:20:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 835CD20002;
 Sat, 13 Jul 2024 14:20:35 +0000 (UTC)
Date: Sat, 13 Jul 2024 16:20:34 +0200
To: <yann.morin@orange.com>
Message-ID: <20240713162034.15edd2be@windsurf>
In-Reply-To: <fb85e4dd41a441b26ae93b621f8f2462ab0eeafc.1698941362.git.yann.morin@orange.com>
References: <cover.1698941362.git.yann.morin@orange.com>
 <fb85e4dd41a441b26ae93b621f8f2462ab0eeafc.1698941362.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720880435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjWkDqJcMq0GT9iRZJ/EW7Zm2jBki8bEEo/KMaU5WDA=;
 b=CIfwdl2OMtknpNHlCMxZ6rBrenrRoM/QIunTCbBwT2LvyonpOMwyW8+FBSlAUpVJzFD4fz
 NV+90p6auBNpJYRbUcbUl4pDD0XXrrMWC7+pxd6YEFShq1aW5vSYGG0B5a208nTkD1cQyo
 3vZPb9X11zJrQ3zkSHoC2kACee0u/0sRsPCK8h2j9D+mygWqgh1MQyvZ7vqvTIBqPt/Ycf
 54KAd4BmJ6IcBZl81oPjjn+P0MnHef/dt3Ov4x2pdIBKGMC9pfA7MLPh/eq7AY7JDdP9r7
 83W0MTE7eob/T+SMs/l31rTKdG5WFiqrdBB19mKfTQUwGAG0Hj+SWMjnE3Fn3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CIfwdl2O
Subject: Re: [Buildroot] [PATCH 8/8] package/skopeo: new host package
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

Hello Yann,

On Thu, 2 Nov 2023 17:09:27 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> skopeo is a command line utility that performs various operations on
> container images and image repositories.
> 
> We introduce it as a host-only package, as the expected usage is to
> transform an OCI image into a docker image, or to help in uploading an
> OCI image to a (local) docker daemon or to a docker registry, for
> example, in a post-build script.
> 
> As such, it needs a prompt in the host packages section.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  package/Config.in.host        |  1 +
>  package/skopeo/Config.in.host |  7 +++++++
>  package/skopeo/skopeo.hash    |  2 ++
>  package/skopeo/skopeo.mk      | 22 ++++++++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/skopeo/Config.in.host
>  create mode 100644 package/skopeo/skopeo.hash
>  create mode 100644 package/skopeo/skopeo.mk

Entry in DEVELOPERS file was missing.

> diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
> new file mode 100644
> index 0000000000..25b0d92fd7
> --- /dev/null
> +++ b/package/skopeo/skopeo.hash
> @@ -0,0 +1,2 @@

Comment "# Locally calculated" was missing.

> +sha256  0b788fc5725ac79327f7c29797821a2bafc1c3c87bbfcb2998c2a1be949e314d  skopeo-1.13.3.tar.gz

Had to add -go2 here, but not your fault, this was changed after you
sent this patch, by some other Yann :-)

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
