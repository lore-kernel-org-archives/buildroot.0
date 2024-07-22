Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40339C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 13:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0890140248;
	Mon, 22 Jul 2024 13:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id McKU8Q27RrA2; Mon, 22 Jul 2024 13:13:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B725C4024C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B725C4024C;
	Mon, 22 Jul 2024 13:13:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD4501BF2A3
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB471605D4
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arnmb9uncPnI for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 13:13:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FC50605C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FC50605C1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FC50605C1
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 13:13:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 801D91C0008;
 Mon, 22 Jul 2024 13:13:15 +0000 (UTC)
Date: Mon, 22 Jul 2024 15:13:14 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240722151314.6abebd25@windsurf>
In-Reply-To: <20240719173723.546583-1-ju.o@free.fr>
References: <20240719173723.546583-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721653995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPIwBwTlvclv8W3HF8asBbakYaHvJUZPH908TOWeJKw=;
 b=mnSdrHIYI9Uuk4wVaPBMOjaZ4QhCM3UUswVkrKxANpnyOT+8u2L/nM8k73CYTG4CZLWSFf
 JeuKzD8IgIq/tm+QGqR3gPNWGslariEUvUVDCyCSBQo4z5ChSy07ZtccOPHEDUVQvd3vGa
 gsrg3Npd1SorZsLnPSqqSrt5DGz4Yksn4IHkHNj4r4LnC6NleRjWHYhZI8B+SjxCfjN0y7
 AJt6K5zR9vxT9JE7eijOQCygzJaDcKjVNP79mO2I2FJKNrqOYeXUU10K2ulKsmTbQe01vt
 mQyFYwL7G0JHdiDNznmeg7IHka/FX4vy7jHAImIrlnHzSg3+ytiB0pFl0XezsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mnSdrHIY
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.29
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

Hello Julien,

On Fri, 19 Jul 2024 19:37:23 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release announce, see [1].
> 
> This commit removes the package patch, which is now included in this
> new version.
> 
> The license hash also changed, due to a FSF address update. See [2].
> This commit also adds a comment in the hash file about the pgp
> signature check.
> 
> [1] https://lists.infradead.org/pipermail/kexec/2024-July/030452.html
> [2] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=f53bcef5063c70960b2b8eb8990722d5c9d1b99e
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  ...uilding-on-x86_64-with-binutils-2-41.patch | 94 -------------------
>  package/kexec/kexec.hash                      |  6 +-
>  package/kexec/kexec.mk                        |  2 +-
>  3 files changed, 5 insertions(+), 97 deletions(-)
>  delete mode 100644 package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch

Not sure if it's related to this bump or not, but our kexec test case
is failing:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/7391792961

Could you perhaps have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
