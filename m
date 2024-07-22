Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53BCC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 20:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FD62810C7;
	Mon, 22 Jul 2024 20:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9oo4X_3qdPrI; Mon, 22 Jul 2024 20:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83BFC81139
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83BFC81139;
	Mon, 22 Jul 2024 20:28:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D7811BF296
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 679A3401AF
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AA_Z_6HNCjT for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 20:28:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 119A3400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 119A3400AC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 119A3400AC
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 20:28:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB44660002;
 Mon, 22 Jul 2024 20:28:33 +0000 (UTC)
Date: Mon, 22 Jul 2024 22:28:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240722222832.4f270d7c@windsurf>
In-Reply-To: <20240722174847.24596-1-bernd@kuhls.net>
References: <20240722174847.24596-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721680113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wvvgWZw8oQufxcLYG9+LYEjEnvXaWIzGT9C6gbr7JpI=;
 b=inp0XmWWmB5GDHoRWN2xOzTLwWBL0Qq+iEnRlJiiFnJOl6fQ79cH6apqaNCRYRvc8cVXCE
 nlPgd9j8qoZbEirK2EiObQNjpgQao1z3bwLvyBkdUh+7SgbNUm/FwmGroi4x/xX4HGf6xg
 grQ/GP5D1VIPYpB9+uU0OXmo+okyJTFhtzX85vI+RokuwYvXsQJrCca9jBPtY0QkbIBhew
 7CwQyWBdrBSdJ2aQulI76Ba1123nXY9CGs7iRYOel1QAH9g75NYyCV9SdovlJVhU693qFJ
 IvtkeZtePX+q+xBSe/dvaYa2MfgIvEB6D8k4tJMFHM6EfrITcFRV9+SayKMpNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=inp0XmWW
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi-pvr-stalker: bump version
 to 21.1.1-Omega
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

On Mon, 22 Jul 2024 19:48:46 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-stalker/kodi-pvr-stalker.hash | 2 +-
>  package/kodi-pvr-stalker/kodi-pvr-stalker.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
