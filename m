Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A584CC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 763B584607;
	Sun, 11 Feb 2024 21:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDykaSu3wdqR; Sun, 11 Feb 2024 21:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CA3784611
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA3784611;
	Sun, 11 Feb 2024 21:39:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB5FF1BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B742360EA5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 907TdMKbSXc1 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C321760E67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C321760E67
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C321760E67
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:39:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C53341C0003;
 Sun, 11 Feb 2024 21:39:53 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:39:52 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240211223944.19730c36@windsurf>
In-Reply-To: <20240211154401.5516-1-fontaine.fabrice@gmail.com>
References: <20240211154401.5516-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707687593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqFC3o9tO4ibskTAkwHYSmgEDLXVnC+F0pSibhYL5OU=;
 b=RhGWJcDC4mTO9mlVd0s7e906NJmzMKbbjmNxDTWbfDoyXyATvnJw4SlRXHjVNMT8NVQ/Sj
 6Jx5sNvFcHRL9/loAZMZX4GDZ4Q7NL0uhIUDsBcz3qxGhfG474AFNNRHHfd16B8rqUacJs
 vK34NpKQ0MVPuPSdNK7YpheS54GQ/0CvJlqvCdJnUDRSnDZiktOoED8AUqoM1h8eVbKuw3
 /rBwMBc2K0QLCNOFaXg8aHNmoIgZ3qr1DSrNdrt/OQOhpY95gU6sbS9hRegGAYgdnXDbYB
 K/8Oe8ty5PTlX9933YhiWy0zt2kuF0L7CdZjyHgs2PaqqU1yAHce2VYqBCHCcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RhGWJcDC
Subject: Re: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: fix static build
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

On Sun, 11 Feb 2024 16:44:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static build failure raised, at least, since bump to
> version 2.42.10 in commit cd2757bd76d2bc2411e67a27a25b8ab55d40bdb7:
> 

[...]

> Fixes:
>  - http://autobuild.buildroot.org/results/e194d8f90caed7ceefd200d4e40d5fa5b3567d03
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-pixbuf-meson.build-fix-static-build.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/gdk-pixbuf/0001-gdk-pixbuf-meson.build-fix-static-build.patch

I am not sure to fully grasp the issue and the fix, so I was planning
on waiting to get some feedback from upstream (hopefully).

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
