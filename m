Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0AED13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B447D60B43;
	Sun, 27 Oct 2024 18:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fP9OQmP6B70V; Sun, 27 Oct 2024 18:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79BCE60A3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79BCE60A3E;
	Sun, 27 Oct 2024 18:45:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F3932AEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF36281387
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtR-3Akwz3-U for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E04A08140A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E04A08140A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E04A08140A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E418FF804;
 Sun, 27 Oct 2024 18:44:42 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:43:02 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194302.2a1867dd@windsurf>
In-Reply-To: <20241026210124.2667191-1-bernd@kuhls.net>
References: <20241026210124.2667191-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JSQUPb8lOGWntT/4AE6cDFKzG/5XJIwBIjj3f7xfJKs=;
 b=IC6v0SWcIE/km8D6TG+pJq6sILJ9J8cufCRnNiG34nVguPjjZZovYi/06Elp+ziH6RFB3R
 8HVAVEwbesF5W5Ad2lFgc4bKMHEknUPAnd+TEsqcPdk7VoKgIH3PJTfPbLxBFwqcPLv2Mi
 1ZtCZ4PCN9z0dMfseNXR59FaIJCSnrGmYMs8a4KewhN0M8Igol7dzl9F9BjcFIEJEL3EYz
 omTEWMxMp68UrPZxSvrj1ML2yFWkqWCyRnTR5Puy476BeaU7YYPjPErzMMYo4sIZgPhAoJ
 hWGfESOekmxJelTyuluCymQFmdnuoYmp7MddOaQ/21XpPa0RAfW23Y76P57pGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IC6v0SWc
Subject: Re: [Buildroot] [PATCH 1/1] package/libsoundtouch: bump version to
 2.3.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 26 Oct 2024 23:01:24 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://www.surina.net/soundtouch/README.html (section 5.)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libsoundtouch/libsoundtouch.hash | 2 +-
>  package/libsoundtouch/libsoundtouch.mk   | 2 +-
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
