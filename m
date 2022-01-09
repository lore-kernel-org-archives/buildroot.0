Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E546BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 14:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E1B94032E;
	Sun,  9 Jan 2022 14:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_DTdohcS5lw; Sun,  9 Jan 2022 14:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 993974032C;
	Sun,  9 Jan 2022 14:19:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 142091BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1FED81A58
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VFlxupw1cmtg for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 14:19:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8CE681A3B
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 14:19:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D37F51BF206;
 Sun,  9 Jan 2022 14:19:13 +0000 (UTC)
Date: Sun, 9 Jan 2022 15:19:12 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bartosz Bilas <b.bilas@grinn-global.com>
Message-ID: <20220109151912.6423b8f1@windsurf>
In-Reply-To: <20200923182300.58950-1-b.bilas@grinn-global.com>
References: <20200923182300.58950-1-b.bilas@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/qt5/qt5declarative: remove optional
 quick module option
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 23 Sep 2020 20:23:00 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Since commit [1] we are not able to disable/enable this module
> so let's force to set Qt5 OpenGL support by default
> if it's possible because currently quick's components
> are being built anyway.
> 
> This should fix the build errors with qt5location package
> which includes couple of built-in components that require
> OpenGL support [2] when Qt Quick module is detected.
> 
> http://autobuild.buildroot.net/results/ddd/ddda7cdb9400f6ca7d548e9b5ada18674fbe42e0/
> http://autobuild.buildroot.net/results/ddb/ddb25ebb591ed6029a7bd4934464171358553936/
> 
> [1] https://git.buildroot.net/buildroot/commit/package/qt5/qt5declarative/qt5declarative.mk?id=1bdceb5d735aad5fbf32b35e3a7f573ecb727e20
> [2] https://code.woboq.org/qt5/qtdeclarative/src/quick/scenegraph/coreapi/qsgmaterialshader.h.html#105
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  package/qt5/qt5declarative/Config.in | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Sorry for the slow feedback/decision. The proper fix for this issue has
been committed in December:

  https://git.buildroot.net/buildroot/commit/package/qt5/qt5location?id=cea2b082eb35d9fd466833098463e2adcbb40022

This allows qt5location to build without opengl, so there's no longer a
need to force qt5declarative to enable opengl support.

The BR2_PACKAGE_QT5DECLARATIVE_QUICK indeed no longer does anything in
qt5declarative.mk itself, but it does ensure that the necessary
dependencies for the quick module are enabled, and that therefore the
quick module will be built.

So I've marked the patch as Superseded.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
