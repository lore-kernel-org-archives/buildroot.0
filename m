Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3105C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4CBE83F4B;
	Fri, 12 Jul 2024 22:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrbi1YEkVD1M; Fri, 12 Jul 2024 22:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3ADB83F4C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3ADB83F4C;
	Fri, 12 Jul 2024 22:09:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 136A41BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3CEF407AF
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_wsXL81-FFv for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:09:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B657407AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B657407AA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B657407AA
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:09:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C486AFF803;
 Fri, 12 Jul 2024 22:09:49 +0000 (UTC)
Date: Sat, 13 Jul 2024 00:09:49 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240713000949.429000e4@windsurf>
In-Reply-To: <20240712220431.453080-1-ju.o@free.fr>
References: <20240712220431.453080-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720822189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzIA5NCkJ1fEbfshL9ftXfAkQA0WmE9fWHglU/3jId0=;
 b=NDMKjQ0rF6zA9ArzZdU3vejwu5aQn6GUKURmX5CqETlLNlYUlcZo1oZCTFVDQndUnK05nB
 EKpf9NrnnF9+Qvx0+YIhLYTTMbqWtmTB6l+cjyH4CL9qVKLVNTqVjtLZrHdhqOwqYSWRSA
 UhCQEqwRCewqLlNnjpHbeCwsiwhiv1xDcSeHq5tixBxbEkrjnnysEmsRpCxj8lWNujvMtv
 SR8wM26rjVR7PjHACSzvgMyBh9P33UJS9i0Z1nxEhyzg7XLRinj85VD/ydcEeLLs8Gbr+b
 vy/yQiuTy4zOzQpSh8u8yFhxUN+kCS23JG5FanlS88cXyWC3RVzNVQRgSevryQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NDMKjQ0r
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: update Kconfig
 package homepage URL
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

On Sat, 13 Jul 2024 00:04:31 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The btrfs-progs homepage [1] show a banner:
> 
>     OBSOLETE CONTENT
>     This wiki has been archived and the content is no longer updated.
> 
>     NOTE: this wiki is archived and not updated anymore (02/2023).
>     Contents will be migrated to https://btrfs.readthedocs.io
> 
> This commit updates the URL to the new one at [2].
> 
> [1] https://btrfs.wiki.kernel.org/index.php/Main_Page
> [2] https://btrfs.readthedocs.io
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/btrfs-progs/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
