Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC96C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 23:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA47E81454;
	Sun, 26 Dec 2021 23:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Csm3OVPaiOWg; Sun, 26 Dec 2021 23:00:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26781813CC;
	Sun, 26 Dec 2021 23:00:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA201BF2B9
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 23:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D8C760E14
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 23:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWNG6EVeA_Qk for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 23:00:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEC2360D4D
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 23:00:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4C27FC0008;
 Sun, 26 Dec 2021 23:00:39 +0000 (UTC)
Date: Mon, 27 Dec 2021 00:00:38 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
Message-ID: <20211227000038.10a692ca@windsurf>
In-Reply-To: <20211214111330.8720-1-florent.aumaitre@medianesysteme.com>
References: <20211214111330.8720-1-florent.aumaitre@medianesysteme.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyqt5: Fix parallel build
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
Cc: Manuel =?UTF-8?B?VsO2Z2VsZQ==?= <develop@manuel-voegele.de>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Florent,

On Tue, 14 Dec 2021 12:13:30 +0100
Florent AUMAITRE <florent.aumaitre@medianesysteme.com> wrote:

> This patch fix build of python-pyqt5 package when parallel build is used
> 
> Signed-off-by: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>

So in fact, if I understand correctly, python-pyqt5 needs the same
fixup as qt5base. Obviously, what we will be looking for is a solution
that does not involve duplicating the logic that we have in qt5.mk
into python-pyqt5.mk.

> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +define PYTHON_PYQT5_QT_CONF_FIXUP
> +	$(PYTHON_PYQT5_INSTALL_QT_CONF)
> +endef
> +endif
> +
> +PYTHON_PYQT5_PRE_CONFIGURE_HOOKS += PYTHON_PYQT5_QT_CONF_FIXUP

Could you try simply doing:

PYTHON_PYQT5_PRE_CONFIGURE_HOOKS += QT5_QT_CONF_FIXUP

this should automatically re-use the existing QT5_INSTALL_QT_CONF macro
from package/qt5/qt5.mk, which will re-generate the qt.conf file in
your package HOST_DIR.

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
