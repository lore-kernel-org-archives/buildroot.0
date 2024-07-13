Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF579C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 06:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5761A4033C;
	Sat, 13 Jul 2024 06:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLgcWsgFvEup; Sat, 13 Jul 2024 06:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED1C64024C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED1C64024C;
	Sat, 13 Jul 2024 06:33:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1467D1BF5A2
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 06:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D3B4419E1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 06:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pns4H-Far8sj for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 06:33:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 956FB419DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 956FB419DD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 956FB419DD
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 06:33:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85AD3240002;
 Sat, 13 Jul 2024 06:33:22 +0000 (UTC)
Date: Sat, 13 Jul 2024 08:33:13 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20240713083313.40ba0675@windsurf>
In-Reply-To: <20230724010907.411055-1-christian@aperture.us>
References: <20230724010907.411055-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720852406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kHliAwb+W/gNqN6B6EHNJdCwYnUiEOBMLk5zuI9FlZA=;
 b=WduqYFcDrm/tccw13GixFaFAM+QpF46tDnTASJM/3xEwzF3zvGsRSrTHUNzFhUol6gj1Nt
 MnHgS0yROTFDajFI1/VEPJPg/UZWt1bbJ5QUGKGBjDcpnriop/iIEkJHYBwHlZKtQSCIHa
 Uqzj833ySgW2TXBSGZmrA/V9+gEDvKeOwyBl25aTXg9ApOH3g90gitjFLHnscJE6u6hxor
 3R4UEOL6XU+abTpv1I8q1jC3P6yH0vwRT8ZuVJA09gZZ2VSR0g63g22wTZbW+GSnctyt5r
 k3zxGwHmtqn2fT6eGucSYHGMTI2HVhn6fQmo8tSEOd5a3bj8I5QvFJY9h7NcTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WduqYFcD
Subject: Re: [Buildroot] [PATCH v3 1/1] package/docker-cli-buildx: new
 package
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Jul 2023 18:09:07 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> buildx is a docker CLI plugin implementing extended build features.
> 
> buildx is the default builder as of Docker v23.x, and if the plugin is not
> present, the CLI will output an error warning that it is using the deprecated
> built-in builder instead of the buildx builder.
> 
> However, buildx is a separate repository from docker-cli: it is a plugin that
> needs to be installed at /usr/lib/docker/cli-plugins on the target.
> 
> https://github.com/docker/buildx
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> 
> ---

Sorry for the super long delay: patch applied. I'm sure you'll need to
send a version bump :)

Perhaps with a version bump this part:

+# create the go.mod file with required language version go1.20
+# remove the conflicting vendor/modules.txt
+# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
+define DOCKER_CLI_BUILDX_FIX_VENDORING
+	printf "module $(DOCKER_CLI_BUILDX_GOMOD)\n\ngo 1.20\n" > $(@D)/go.mod
+	rm -f $(@D)/vendor/modules.txt
+endef
+DOCKER_CLI_BUILDX_POST_EXTRACT_HOOKS += DOCKER_CLI_BUILDX_FIX_VENDORING

can do away or be tweaked?

Thanks a lot, and again sorry for the delay.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
