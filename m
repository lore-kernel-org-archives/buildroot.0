Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5CDC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 14:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BFBA606AE;
	Wed, 17 Jul 2024 14:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orIjw8BO6b31; Wed, 17 Jul 2024 14:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E089607AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E089607AF;
	Wed, 17 Jul 2024 14:58:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E97A1BF35D
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 14:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2658D4050A
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 14:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8GSO0hV4k4L for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 14:58:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B95EB40401
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B95EB40401
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B95EB40401
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 14:58:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF86C60002;
 Wed, 17 Jul 2024 14:58:42 +0000 (UTC)
Date: Wed, 17 Jul 2024 16:58:41 +0200
To: Fred Lefranc <fred.lefranc.evs@gmail.com>
Message-ID: <20240717165841.4b643240@windsurf>
In-Reply-To: <20240717121147.1353901-1-fred.lefranc+evs@gmail.com>
References: <20240716075933.1315047-1-fred.lefranc+evs@gmail.com>
 <20240717121147.1353901-1-fred.lefranc+evs@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721228323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ln0VhxrNmckD5f3J1ofw2SNpbwQ9JH8xPve+HlPooU4=;
 b=V5gl73reT7Z1na5jLzChZJyf1BGJ90LDZfwWj0zGpKy2eN9ykG9T59nj+hNXq+tyWdWXOS
 PcmBziJSfpDnQEvXMbUNW5hNXbjHruvqaG2iG3xgbXukw3PigKIgsTpp6s6FJQSgEZtoOu
 DeKMuErRcfMIR0gsSsirIIXr3kQn/ZUGQWTkB8TDPG56HYzIz7K7QH3n7KjPqM+ZCGDUq1
 LK5oP2Dy5nWefis5uFKuy1h6yWo9O/pp0D21K8Z5cYDVsYD73oQWgUfO+QQlYUSKzO2jhd
 ecRHkpytOtdnjt0qIcj+q1U95URbFwYU74bcnLwgSw1tqQ5101DmUPhZmKaHYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V5gl73re
Subject: Re: [Buildroot] [PATCH v4] package/busybox: fix build with glibc
 2.39
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
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 17 Jul 2024 14:11:46 +0200
Fred Lefranc <fred.lefranc.evs@gmail.com> wrote:

> When glibc was bumped to version 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97,
> it removed the deprecated libcrypt support.
> 
> In such a situation, until the upgrade of glibc to 2.39, Busybox could rely on the
> libcrypt provided by glibc. Since version 2.39, glibc no longer provides libcrypt,
> causing a build failure with Busybox configurations that have CONFIG_USE_BB_CRYPT
> disabled.
> 
> To fix this, add the libxcrypt dependency to Busybox when BR2_PACKAGE_LIBXCRYPT is
> selected. The user is still responsible for enabling BR2_PACKAGE_LIBXCRYPT when
> their Busybox configuration has CONFIG_USE_BB_CRYPT disabled.
> 
> Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
> ---
> Changes v3 -> v4
>   - fix commit message to explain the non-working case
> Changes v2 -> v3
>   - fix commit message
> Changes v1 -> v2
>   - busybox.mk: fix BUSYBOX_DEPENDENCIES ident & remove the check
> for BR2_TOOLCHAIN_USES_GLIBC (req by Thomas)
>   - Config.in: remove libxcrypt mandatory dependency
> (req by Thomas)
> ---
>  package/busybox/busybox.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks for your persistence, patch applied! The lines of the commit log
were a bit too long, so I rewrapped the paragraphs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
