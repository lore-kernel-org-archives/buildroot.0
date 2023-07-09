Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBE3EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 763136072A;
	Sun,  9 Jul 2023 16:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 763136072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CXEupFLThvza; Sun,  9 Jul 2023 16:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1640606EC;
	Sun,  9 Jul 2023 16:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1640606EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE0C11BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94226606EC
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94226606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPzELPTOvU38 for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:55:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B17960681
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B17960681
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:55:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id E85CFD0822
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:47:13 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD417E0003;
 Sun,  9 Jul 2023 16:47:07 +0000 (UTC)
Date: Sun, 9 Jul 2023 18:47:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230709184706.40d4259f@windsurf>
In-Reply-To: <20230709081924.802356-1-bernd@kuhls.net>
References: <20230709081924.802356-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688921228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+Lt5TejJ0L6ny0I3jssEJIR7nMbf+ybWUYPjYc+w8o=;
 b=W73CN9zY8zZI2lOBEfTDTlQKqwIU6tXbMAG5c2JUJ2cvY1vp863Yg6i/DlvBaab7bQC0W+
 HMIBIqARAB96TdxKAzKObgzH4It0BcsNINeoP+MkdIOkY80B9z2l3TUNifp7LRCQhBR/T1
 BSleYf09m51eMawmQqXjkPRH5UBd50I4UnKKABsCo9W4mZ97KYOwAhbPO56SxSL/dlyRIw
 J8BXroITSBJ9YQ2YNKiCUNJFh1ZnZM5g9ztFlCI8cBAXFqZTrPIlpgc1rQGutofCkSaWxY
 6VtgjOrX6wk3CTgKdqL+MNYw6BgKPRUUCLHwxBCDGcvdn6tkP/SwY5PjHnOBMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W73CN9zY
Subject: Re: [Buildroot] [PATCH 1/1] package/valgrind: bump version to 3.21.0
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

On Sun,  9 Jul 2023 10:19:24 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Added sha1 hash provided by upstream, removed md5 hash.
> 
> Release notes: https://valgrind.org/docs/manual/dist.news.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/valgrind/valgrind.hash | 4 ++--
>  package/valgrind/valgrind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
