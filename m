Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50B2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 14:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 787426076A;
	Sat, 22 Jan 2022 14:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZC81n3RlFF_0; Sat, 22 Jan 2022 14:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0A176079E;
	Sat, 22 Jan 2022 14:11:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BCBC1BF390
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 270A46079E
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJrf5KtpoOzr for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 14:11:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31C846076A
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:11:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E7937240005;
 Sat, 22 Jan 2022 14:11:30 +0000 (UTC)
Date: Sat, 22 Jan 2022 15:11:30 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220122151130.59ae7148@windsurf>
In-Reply-To: <20220117080616.10563-1-heiko.thiery@gmail.com>
References: <20220117080616.10563-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] board/kontron/pitx-imx8m: use extlinux
 instead of U-Boot boot script
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Jan 2022 09:06:16 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  board/kontron/pitx-imx8m/boot.cmd      | 8 --------
>  board/kontron/pitx-imx8m/extlinux.conf | 4 ++++
>  board/kontron/pitx-imx8m/genimage.cfg  | 5 +++--
>  board/kontron/pitx-imx8m/post-build.sh | 7 +++++--
>  board/kontron/pitx-imx8m/post-image.sh | 2 +-
>  configs/kontron_pitx_imx8m_defconfig   | 3 +--
>  6 files changed, 14 insertions(+), 15 deletions(-)
>  delete mode 100644 board/kontron/pitx-imx8m/boot.cmd
>  create mode 100644 board/kontron/pitx-imx8m/extlinux.conf

I have applied, but I am a bit worried about things are going on with
this switch to extlinux.conf.

Indeed, we have:

 * Platforms where the UUID is hardcoded into genimage.cfg and
   extlinux.conf, such as board/beaglev/

 * We have platforms where a "uuid" variable in filled in U-Boot before
   triggering the extlinux.conf logic, and therefore extlinux.conf uses
   root=PARTUUID=${uuid}. For example
   board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf,
   board/orangepi/orangepi-zero/boot.cmd,
   board/solidrun/mx6cubox/rootfs_overlay/boot/extlinux/extlinux.conf,
   board/technexion/imx6ulpico/rootfs_overlay/boot/extlinux/extlinux.conf,
   and a few others.

 * We now have platforms (kontron/smarc-sal28 and kontron/pitx-imx8m)
   where a random UUID is generated in the post-build script, and used
   in genimage and extlinux.conf.

I'm not sure where we want to go, and how much we want to enforce "best
practices" that are common on all platforms, or just let each platform
do its little business.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
