Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347D3C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07460600B5;
	Sun, 21 Jul 2024 16:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwOElqYxJFVo; Sun, 21 Jul 2024 16:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1493F605D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1493F605D4;
	Sun, 21 Jul 2024 16:25:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51C0E1BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EE5840124
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rj2J5q0Jk1YQ for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:25:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D80B540120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D80B540120
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D80B540120
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:25:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 098FF60003;
 Sun, 21 Jul 2024 16:25:37 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:25:37 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240721182537.6dd7a967@windsurf>
In-Reply-To: <20240721070147.54855-1-fontaine.fabrice@gmail.com>
References: <20240721070147.54855-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721579138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESk91O/x2qPRVT2ZqD9mmcn8gMaZvHJeb0n+oiJeYO0=;
 b=MUTJTg3/F1RzCz+EHLj5J7dvlMSiIReZNxzWd/Z/XUO4TdRjq+JiLNlmN+Z0R/wa822Q6S
 gC3m9bvYw0OHn/fUe3e0HI+iZvN5EQUX3492vwlcvOQzwfCsdBmG0bGCeRNUjeegGkR+9X
 QrAqh0GFDahCs1dPm7/3xjL0XUKqfvSK+Y3ukN6WfmjZVjTNp+2BfHBeglajO1/n9/Wd/n
 RzLtjuYYo6q0WJWxIG74ELTvgu3/WmoB0bY8az9uXG/WiarlajEjvYrBZmWnxr89g2N/z+
 4ctNgPK8WVSneusz07PiiO1gEfk3nbFpJ++fyZsocwRtNGHgRLh7lqKpIxM4bA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MUTJTg3/
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.10
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
Cc: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jul 2024 09:01:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following build failure with gcc >= 14 thanks to
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=53a89bfd86fff1a00cc77cabb8457a03eaa3bc7d:
> 
> ../include/json_print.h: In function 'print_tv':
> ../include/json_print.h:58:48: error: passing argument 5 of 'print_color_tv' from incompatible pointer type [-Wincompatible-pointer-types]
>    58 |                                                value);                  \
>       |                                                ^~~~~
>       |                                                |
>       |                                                const struct timeval *
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c47c1e13659e4bfcccd98ebd22949e9dd278079e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/iproute2/iproute2.hash | 2 +-
>  package/iproute2/iproute2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
