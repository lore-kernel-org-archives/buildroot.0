Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3AAEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 888A461293;
	Thu, 20 Jul 2023 21:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 888A461293
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PGXacjc0yVNz; Thu, 20 Jul 2023 21:19:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF06C60A64;
	Thu, 20 Jul 2023 21:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF06C60A64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A24921BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BBA960A64
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BBA960A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RUsEmbs-GXhM for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:18:56 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8888E607C7
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8888E607C7
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBDB6240003;
 Thu, 20 Jul 2023 21:18:52 +0000 (UTC)
Date: Thu, 20 Jul 2023 23:18:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230720231851.5beb0f3f@windsurf>
In-Reply-To: <20230720202632.2567755-1-bernd@kuhls.net>
References: <20230720202632.2567755-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689887933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adz/bYl+uhCg0tWqwlyULu4SliT8rxoSElWDXUm3Zu0=;
 b=pv1r/VH/Hgp9gOxoovlid7OVvMybji4kdoX6vXmL0tgH7MtH+8A5eMLC8MZBQeA+SEQs+f
 IL1P4lkKIkq0BgYbxuQLLmR849H+aXVIKxS1Sd0vDeLitV7PIX8aFQadtmoukpcF6QSQXd
 0r+Uv+CvEPYDmDw9BjOEPS93hqY4x7cICiKUfQMvButKoXHy80kC7Ow8IShIGrfXhTNSx4
 DkwT9Of55lSW3atXFtbO8306a0rfh2mWAHnRv8C8SrQzz0723xeuu0/+r7uPHODT8TzjRc
 7sj8/DMjc7ofOiKtSWMMb1LOLJ6C23k27BvSUrBNs4FnnQ7l925vUjqIFxPTww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pv1r/VH/
Subject: Re: [Buildroot] [PATCH 1/1] package/libuhttpd: fix build with
 openssl3
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Jul 2023 22:26:32 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/c09/c09c77e399e9ee410995a91a22306897eca667d1/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...eLists.txt-remove-Werror-from-CFLAGS.patch | 38 +++++++++++++++++++
>  ...eLists.txt-remove-Werror-from-CFLAGS.patch | 38 +++++++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 package/libuhttpd/0002-CMakeLists.txt-remove-Werror-from-CFLAGS.patch
>  create mode 100644 package/libuhttpd/0003-CMakeLists.txt-remove-Werror-from-CFLAGS.patch

Applied to master, thanks. However, I don't think your two patches are
acceptable upstream: the right change for upstream is to fix the usage
of the deprecated OpenSSL functions.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
