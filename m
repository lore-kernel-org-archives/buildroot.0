Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BA2C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C8934055F;
	Sat, 20 Jul 2024 21:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAGxNLaUzqRx; Sat, 20 Jul 2024 21:12:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA02405D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA02405D5;
	Sat, 20 Jul 2024 21:12:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A81CB1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B173D4055F
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9B9p9A6Shvd for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:12:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5ADEA405E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ADEA405E6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5ADEA405E6
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:12:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EA1620002;
 Sat, 20 Jul 2024 21:12:41 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:12:40 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720231240.2f744e2f@windsurf>
In-Reply-To: <20240720145018.1087079-1-fontaine.fabrice@gmail.com>
References: <20240720145018.1087079-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxJ5c8CTqwLCMnV7zCw6vPCOucioCzIraH4ammOhgiA=;
 b=OjIiww5g59LwPqauORoMJzccDK9su36Oko0edKlLkJKIgwWC1boKcDybXyxNepfG2J7dZ1
 Zk/oMj1qMzKGlkrVm70bV9oWkX0EKR/6kWNj71MeTHVwTWvT3PrWAf03rGgD7noBi9Xtye
 QQ/P7eGHaOtGRAd8zqbnXb8pToTo9bSmXDMav8WDL5YWZvRovaOd+gN8a17yUdl40oMn3Y
 5ijhd8xOoAQVcdiWckZuVVm3IVvrytW8cbabean+vzfgsYYYbWTqxe5FBYbKg7LDA/iXn9
 IMtZJdNj5NupN6QUm/cQXXB8Py7LDlBlyIZLTw7qF8EDXXuKFwMPRjs6oJq9uw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OjIiww5g
Subject: Re: [Buildroot] [PATCH 1/1] package/flashrom: fix satamv handling
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

On Sat, 20 Jul 2024 16:50:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> satamv is only available on x86 resulting in the following build failure
> since switch to meson-package in commit
> 37dded43ae681e8319d7b76f9a612c71991467a9:
> 
> ../output-1/build/flashrom-1.3.0/meson.build:475:6: ERROR: Problem encountered: satamv selected but not supported on this platform
> 
> Fixes: 37dded43ae681e8319d7b76f9a612c71991467a9
>  - http://autobuild.buildroot.org/results/c689bf039d7686a9b42c6fcb84f87b555a9bcfb6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/flashrom/flashrom.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, I had apparently missed this one.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
