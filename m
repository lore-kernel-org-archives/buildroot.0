Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6F9CA0EC0
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 20:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D36794138D;
	Mon, 11 Sep 2023 20:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D36794138D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CydbelqKIcxg; Mon, 11 Sep 2023 20:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6CB340571;
	Mon, 11 Sep 2023 20:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6CB340571
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5AB1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D977E61064
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D977E61064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Jg0zGLQR2PY for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:58:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D48AB6105D
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D48AB6105D
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEE1720008;
 Mon, 11 Sep 2023 20:57:52 +0000 (UTC)
Date: Mon, 11 Sep 2023 22:57:52 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230911225752.42be61cc@windsurf>
In-Reply-To: <ZPQ2zZ1dgo6K2mdO@waldemar-brodkorb.de>
References: <ZPQ2zZ1dgo6K2mdO@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694465891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZsaC9IA0DJdoYjXpiRfgjoyerrNQXUHv4q5fvutvSH8=;
 b=ffqcc9rRzeYpcXvRqyKXFF4yqCYKoHlpfvtdKmH8jj3eH5WQGQ/DBwuHBvPnaObkkfE+Ak
 FCT6DIRPKOzmyPhCJTCohsCvJ/E1aoq/clnNzV+ndh73ZqEjxzDXE/HSYnLvfxhQ2wrZYN
 TL3WcaT4nv9iJBYnyUdCE5VRrMnK0aAaP/UKw1gYXkZewnsJ1eoJArC5EiEGXrL28sgQMS
 18fmjsBvW03gJoJUXxRy9MGg6QRWqC4Lj+HWFmPVbCOBoO243VWm3COOwYJvKrCoig/zF7
 xFYorx3H2GfBw5eb7dxjHjld3GJB2G6ik1dfMYBi9isDM07OTPn7fqleINg8uQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ffqcc9rR
Subject: Re: [Buildroot] [PATCH] package/gcc: fix missing .note.GNU-stack
 section
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

On Sun, 3 Sep 2023 09:33:33 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Shellinabox configure fails to detect ptsname_r, because of the following warning
> binutils 2.39+ emits:
> ld: warning: crtend.o: missing .note.GNU-stack section implies executable stack
> ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> 
> Then the build errors out with:
> shellinabox/launcher.c:772:12: error: static declaration of 'ptsname_r' follows non-static declaration
> 
> The same issue exist for cairo 1.16.0 and the detection of pthreads.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/3e4/3e478d22e820703ddfd11d1491e631ef8ed6b29b
>  - http://autobuild.buildroot.net/results/f60/f602ea17d5938a5beb81d07e13de75ba41d5f6a1
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...add-.note.GNU-stack-section-on-linux.patch | 105 ++++++++++++++++++
>  ...add-.note.GNU-stack-section-on-linux.patch | 105 ++++++++++++++++++
>  2 files changed, 210 insertions(+)
>  create mode 100644 package/gcc/11.4.0/0007-xtensa-add-.note.GNU-stack-section-on-linux.patch
>  create mode 100644 package/gcc/12.3.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch

Thanks a *LOT* for getting to the bottom of this. This is really what I
was looking for: the real fix, not some ugly workaround in all packages
that are affected. Really great work, much appreciated!

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
