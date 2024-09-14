Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC82C02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 07:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9FE18452B;
	Sat, 14 Sep 2024 07:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtK5QJ4HjrYX; Sat, 14 Sep 2024 07:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA2D2846DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA2D2846DC;
	Sat, 14 Sep 2024 07:49:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 831E31BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72EBD606E8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNXFDKtFErjh for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 07:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F2BC606F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F2BC606F7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F2BC606F7
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 07:49:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72042FF802;
 Sat, 14 Sep 2024 07:49:16 +0000 (UTC)
Date: Sat, 14 Sep 2024 09:49:15 +0200
To: Antoine Coutant via buildroot <buildroot@buildroot.org>
Message-ID: <20240914094915.6ea47b74@windsurf>
In-Reply-To: <20240913115319.169625-1-antoine.coutant@smile.fr>
References: <20240913115319.169625-1-antoine.coutant@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726300156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6Zc8DvfDlFuJRAMEhbNJ+TjLwzgf6juuA186SnyBPY=;
 b=bg7UZ0TY1MC3EkA+BzPRn0R60nF4KmAAP+Q2yhVhW3SLdYX7H46nejeGtbs7PDjpzF2v20
 F0eAVBfy2FmR8ZOB8JSJYj5GiIq57MYKI0uCO9Ydy8h0nzTMbJePB8qMBeSRGEb3v2HeLU
 HjxUvlYsEethwWylLDa2Th7DUQkHUFXEh3wfzVYR3/IAlskeZu0wDrSm7QHTYAcgSKujej
 rg/c5Oo+4f0ZlpRSfURNxvWVbpaemn8jlskhXGZaDACmUrz3Eq7xVWlxOodAx3wfOnKgJF
 G+aQGoMU9tW9bmbIMmMcihqFohEcYIzh+wqR5+vm90Zf9CLUpJ8sjghIhfHLCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bg7UZ0TY
Subject: Re: [Buildroot] [PATCH 1/1] package/environment-setup: export
 pkgconf's evironment variables
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 13 Sep 2024 13:53:19 +0200
Antoine Coutant via buildroot <buildroot@buildroot.org> wrote:

> pkgconf can not find libraries outside of the default sysroot without
> PKG_CONFIG_PATH and PKG_CONFIG_PATH properly set.
> 
> Make environment-setup export those variables so that pkgconf can
> look for libraries in the buildroot sysroot.
> 
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> ---
> The issue can be reproduced by searching for libraries using buildroot's
> pkgconf after sourcing environment-setup.
> 
> I found the issue when compiling using meson. The meson "dependency"
> keyword uses pkgconf to find libraries, which uses pkgconf
> (and other programs) [1].
> 
> [1]: https://mesonbuild.com/Dependencies.html
> 
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>

This patch shouldn't be needed I believe. We install
HOST_DIR/bin/pkg-config which properly defines those variables. Why are
you using HOST_DIR/bin/pkgconf directly and not HOST_DIR/bin/pkg-config
?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
