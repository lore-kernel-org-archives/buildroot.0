Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD5DC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 16:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9298E41244;
	Fri, 23 Aug 2024 16:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rC0uI32HwJEP; Fri, 23 Aug 2024 16:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4704841260
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4704841260;
	Fri, 23 Aug 2024 16:39:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 959081BF31F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81F8B41260
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkncsKazpx2A for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 16:39:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 36B1F41244
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36B1F41244
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36B1F41244
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 16:39:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DA8860005;
 Fri, 23 Aug 2024 16:39:09 +0000 (UTC)
Date: Fri, 23 Aug 2024 18:39:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240823183908.03867002@windsurf>
In-Reply-To: <20240822182050.65230-5-bernd@kuhls.net>
References: <20240822182050.65230-1-bernd@kuhls.net>
 <20240822182050.65230-5-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724431150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XoxClkDtKyZ1jQzcscrnEVbdiTAkftzZ+UMQrj9XxHM=;
 b=Ve7nvTxjsyS72FbhlH9tQ2j1nG5VneroNGPhK78xeVg8+uYRRwCkpk79QSLsSeNGvk1NWQ
 zl7BuSMrowB71w5uyzb+3ryaxh5WAe9PcYPJfnJKHqNUx8EWyufUC4RGgPuZ4p9LDtImgK
 o/kFZVK6pvoyZ5nQJCA6RkxsTNWEjTzV/koetXpg+vEXA82xxAcqroZiJgn4/XL2fhd9wW
 GdnfUnFQ0g52CpfNv5btDexI7LIWLlM8+HFyUS2pStcQ+2bQIi55AO4bPSVbtUDYTZARHy
 OjoxpHHLE8akEUL+LN+T4oSB9IGjgTJ18f+QnOOZffjORWTWJ+ax6XNcVTekMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ve7nvTxj
Subject: Re: [Buildroot] [PATCH/next 05/13] package/libcurl: bump to version
 8.9.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 Louis-Paul Cordier <lpdev@cordier.org>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Petr Vorel <petr.vorel@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Aug 2024 20:20:42 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://curl.se/changes.html#8_9_1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master because it's a security bump, as noted by Baruch and
Petr. I've amended the commit title and log accordingly. Thanks Baruch
and Petr for noticing!

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
