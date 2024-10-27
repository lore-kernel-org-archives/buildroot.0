Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A16D13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F390540740;
	Sun, 27 Oct 2024 18:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsLz-2KJdCGt; Sun, 27 Oct 2024 18:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B39474070D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B39474070D;
	Sun, 27 Oct 2024 18:45:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1146C5123
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 799C9405D9
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0jdm_PfQD06 for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 49EAB404D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49EAB404D7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49EAB404D7
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2B85FF802;
 Sun, 27 Oct 2024 18:44:40 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:44:20 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194420.1d5b077c@windsurf>
In-Reply-To: <20241027140348.3551966-1-bernd@kuhls.net>
References: <20241027140348.3551966-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TcwZHlKtwVTYIjZBsxUG8UTMFKdUNn1Fb5bSHnjyc9Y=;
 b=OjPR3TwBqMQH9RYvlBPxhGQMC/6OHLaBhdca6zszVgaPI6eFAVwVG57yQFJpq47bNnuc00
 sdCRSk3xQdoVdvxCJdvYNsP6kSMt4U5bRT45/xpFWH5INXTRse13lh3MPDDAgYtHhZjIHi
 mukylDG/LaiAtQ4+wEtPbfbgdYDLoJC5czwJpsbbEGAVSpRSUOL7dUuR+I8yJ9fg8lIR/2
 KCMXXq3QBCtb4ZVDOQY6XMdbCVseBWtKcAgwqwI3yTDJVEYlxM7jWtmTawhmsXjd7ubWBO
 zUggOdD+0p4QzLFDejIUXZFZR9s5PRK0H8OTeV6vEijbF8GL7nBRgPmBNwxC8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OjPR3TwB
Subject: Re: [Buildroot] [PATCH 1/1] package/monit: security bump version to
 5.34.2
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

On Sun, 27 Oct 2024 15:03:48 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog:
> https://bitbucket.org/tildeslash/monit/src/monit-5-34-2/CHANGES
> 
> Fixes CVE-2011-1473.
> 
> Rebased patch 0002, switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0002-configure.ac-fixes-missing-config-macro-dir.patch    | 4 +++-
>  package/monit/monit.hash                                      | 4 ++--
>  package/monit/monit.mk                                        | 4 ++--
>  3 files changed, 7 insertions(+), 5 deletions(-)

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
