Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024B8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 22:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2E1A402E1;
	Sun, 26 Dec 2021 22:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_cAjvZtqKHX; Sun, 26 Dec 2021 22:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12ABF402BF;
	Sun, 26 Dec 2021 22:50:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E1951BF2B9
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AD4460E1B
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjergIidVWI5 for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 22:50:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EB0560DCB
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 22:50:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D72151BF203;
 Sun, 26 Dec 2021 22:50:13 +0000 (UTC)
Date: Sun, 26 Dec 2021 23:50:13 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
Message-ID: <20211226235013.22faad2e@windsurf>
In-Reply-To: <FAABCD35A3EE5E419EC2DCD8792107CABC6F998E@ikhexmbxc02n01.ikhex.ikoula.com>
References: <20211214075133.4482-1-florent.aumaitre@medianesysteme.com>
 <20211215232839.22ae07a9@gmx.net>
 <FAABCD35A3EE5E419EC2DCD8792107CABC6F998E@ikhexmbxc02n01.ikhex.ikoula.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5: fix parallel build qmake
 package (qt5) doesn't build when using parallel build.
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Naumann Andreas <ANaumann@ultratronik.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Florent,

On Thu, 16 Dec 2021 09:25:19 +0000
Florent AUMAITRE <florent.aumaitre@medianesysteme.com> wrote:

> > Which failure? Does it happen with per-package enabled or without (would like
> > to avoid the forced MAKE1 for all qt packages install) too? In case it happens
> > with per-package disabled it should go to an extra patch...  
> 
> I observe a race condition with some install target
> 2021-11-04T12:43:36 Makefile:886: recipe for target 'install_do_install_qmltypes' failed
> 2021-11-04T12:43:36 Makefile:400: recipe for target 'sub-wavefrontmesh-install_subtargets' failed
> 2021-11-04T12:43:36 make[4]: *** [sub-wavefrontmesh-install_subtargets] Error 2
> 2021-11-04T12:43:36 make[4]: *** Waiting for unfinished jobs...
> 
> Qt5declarative generated makefile (qt5declarative-5.15.2/src/imports/wavefrontmesh/Makefile) install twice /usr/qml/Qt/labs/wavefrontmesh/plugins.qmltypes in target install_qmlfiles and install_do_install_qmltypes.

Could you specify whether this happens with BR2_PER_PACKAGE_DIRECTORIES
enabled or disabled? Also, do you have an example Buildroot
configuration that exhibits this problem?

According to http://autobuild.buildroot.net/?reason=qt5declarative%
there are only 3 "recent" failures of qt5declarative-5.15.2 and they
are not what you're pointing.

We unfortunately can't "blindly" apply a workaround for a problem that
isn't "visible".

However, your commit seems to mix up the $(MAKE) -> $(MAKE1) change
with those PKG_QMAKE_FIXUP_ABSOLUTE_PATH and QT5BASE_CMAKECONFIG_FIXUP
macros which are not explained in the commit log. Could you give more
details?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
