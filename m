Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDADC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 011AC80B95;
	Sun,  6 Aug 2023 12:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 011AC80B95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nvzCIU-pcaz; Sun,  6 Aug 2023 12:25:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42E5380B97;
	Sun,  6 Aug 2023 12:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42E5380B97
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5CF81BF2A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC5844011C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC5844011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vlxkr-aAAZYs for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:25:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95CDD4027F
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95CDD4027F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 030EAE0002;
 Sun,  6 Aug 2023 12:25:34 +0000 (UTC)
Date: Sun, 6 Aug 2023 14:25:33 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806142533.57f53a29@windsurf>
In-Reply-To: <20230801215958.1751367-1-bernd@kuhls.net>
References: <20230801215958.1751367-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691324735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+6oCx9KPpSpOgdpcmzvdDXAWZVC0sFFPeiL6/rr9IdI=;
 b=mmVIhPYZjno2BeoYxFNbMUCIYfmlDfD1+0j58X2gkMnMQwIHiDAUzeTxJOCw0jEPoTCz40
 DNzwqNNP1Z1xouxLw8KEUd0Edr9tsclIgKecx6Gbz+AbgjIvBn+dZwIogO+VZ84rDwGS1+
 AVwBYuBwbqccXdaVial2HcfJ26o7zADXA2vg2JRtnrvYfrnMePOKK0MiiXrOTVoYoP/kh3
 ly7ak1qsiCUDS71CSPFqHnJchQY1M27zTn2h5C24veCVySy8SQZ4I+ZIdl47kbiO/DhtMA
 YuBZrLDez9RXY238fqPWYSfwD6Iyw3PNAyOe3Sb/gdnF2pJ6uR6bGtxlvhuJgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mmVIhPYZ
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: fix build with gcc 12.3
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

Hello Bernd,

On Tue,  1 Aug 2023 23:59:58 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/cd3/cd341365d1c429bfca505a742e86b3090897db23/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...-fix-Work-around-GCC-12.3-bug-109241.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch

You forgot to explain in the commit message when this issue started
occurring. So I've added an explanation in the commit message:

  https://gitlab.com/buildroot.org/buildroot/-/commit/e34063c5be6963cb3fd87e6852af0854ec1c2dc1

It would be *really* nice if you could do something like this on a
systematic fashion.

Applied to master with this change, of course.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
