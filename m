Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DE3C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 17:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7709D60889;
	Mon, 29 Jul 2024 17:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjU3-pe0dasA; Mon, 29 Jul 2024 17:57:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99A4060875
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99A4060875;
	Mon, 29 Jul 2024 17:57:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF131BF424
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09FB3404D2
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zhn679WdwQjL for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 17:57:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8DD04033A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8DD04033A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8DD04033A
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 17:57:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4AA21BF204;
 Mon, 29 Jul 2024 17:57:34 +0000 (UTC)
Date: Mon, 29 Jul 2024 19:57:33 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240729195733.5cf4f11b@windsurf>
In-Reply-To: <20240728075159.4699-1-bernd@kuhls.net>
References: <20240728075159.4699-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722275854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OPsVvynUvqFWIAmQ7kMl4L4a3d0p8ZuQGdL+LgK3q0A=;
 b=o+sgDoIXqsAxc+gMq14HYm3FwvMfTQJGzAwAV3fmG5hET5e2edXBMtUsHjeQQdUGO+mOXB
 hd0Bs09xlE5rUAoBs8p9scxZyDLXHzqVqMtWVInGLEIzOKHJe/ySFRckaSsWbDFdc31bn6
 JpiczZ+goWQSs3qq1cImnOLhvLVuS2Y6ThXtRBeRXAZEnnHbrQ++NOrsX2rcGLhFo/9W6w
 fIw6wfQAIV7dQZWm4sjS2SsrlZwl6TbAH7RSc2huJ1fnTwK3VzhwqClq6Fqc4UpksFqR6q
 62TRi7v3l1+xXqaUEHR6OY0pbeiJafAxihcUThUcbpk5+WEDQ6/eZ6MN+n1q+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o+sgDoIX
Subject: Re: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6, 9, 10}.x series
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

On Sun, 28 Jul 2024 09:51:59 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  linux/Config.in                      |  2 +-
>  linux/linux.hash                     | 16 ++++++++--------
>  package/linux-headers/Config.in.host | 16 ++++++++--------
>  3 files changed, 17 insertions(+), 17 deletions(-)

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
