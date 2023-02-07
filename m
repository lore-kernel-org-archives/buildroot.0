Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C47C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 254C081EBC;
	Tue,  7 Feb 2023 22:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 254C081EBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDzz0NuC2f5g; Tue,  7 Feb 2023 22:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51AC481EB0;
	Tue,  7 Feb 2023 22:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51AC481EB0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAC7F1BF41C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF69C61066
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF69C61066
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFFrcYG06DDd for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:06:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC8C061067
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC8C061067
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:06:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9E4CFC0004;
 Tue,  7 Feb 2023 22:06:49 +0000 (UTC)
Date: Tue, 7 Feb 2023 23:06:48 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230207230648.7f2efda5@windsurf>
In-Reply-To: <20230207170040.3503236-1-peter@korsgaard.com>
References: <20230207170040.3503236-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675807609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2RvT0aeqM4toYjvu2YOXZKyzXj08nDbfAFwTQuH3iMk=;
 b=gJXYELUvZeOauEeQkw4tYo5ywQzaQu0Y5CmyTQV5tXVdCg+qBhnxpCASCU9Hz8BAgTj7HN
 5uzkDInPD9kqimtultSNLiUjoOlmLLjyI8bEfwdQB0ft+NUpCKIMSBWieSu9dsH3XiZ6GE
 tPEo/ifZm81mb+/EwhPPvJiofZQMQ9+56sBhomoi813wYhcVS3rNBJyBdYcrfyr+0GIEZF
 rwSV3hZl1qQUPdXt6aN0R4+5JWxIjvRythDrI6FIjY4xQPNrTDoCHrwx50sH6i+iw/4Q3g
 /mZNazS6wTp7RY1B6XGT8O7FugwvoleX6WepB47UV5UIIdjODK2/rmInFXpCxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gJXYELUv
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-generic.mk: require git on
 the host for packages using cargo/go vendoring
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

On Tue,  7 Feb 2023 18:00:39 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> The vendoring done for cargo / go packages (may) need git, so ensure we
> check for it in dependencies, similar to how it is done for packages
> directly using git.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/pkg-generic.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
