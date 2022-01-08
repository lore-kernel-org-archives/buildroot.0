Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F68C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A813240128;
	Sat,  8 Jan 2022 16:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMap1RGPBq7A; Sat,  8 Jan 2022 16:20:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F21940106;
	Sat,  8 Jan 2022 16:20:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2348E1BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E65340106
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rhr6Fa9VUfy1 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:20:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B845C400BA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:20:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 8628D1BF203;
 Sat,  8 Jan 2022 16:20:21 +0000 (UTC)
Date: Sat, 8 Jan 2022 17:20:19 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <20220108172019.4cb27c8e@windsurf>
In-Reply-To: <20200306071440.30433-4-miquel.raynal@bootlin.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
 <20200306071440.30433-4-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/7] package/rockchip-mali-bifrost: new
 package with binary blobs
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
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  6 Mar 2020 08:14:36 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> There is already a package adding Mali blobs for Sunxi Mali Utgard
> GPUs. Many Rockchip SoCs feature a Mali Bifrost GPU and need specific
> libraries provided under binary form with a non-GPL compliant license
> by Rockchip. Package these libraries.
> 
> Define a common *_INSTALL_CMDS macro, which takes as argument the base
> destination path, and use it to implement *_INSTALL_TARGET_CMDS and
> *_INSTALL_STAGING_CMDS.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  package/Config.in                             |   1 +
>  ...4-binaries-and-only-install-the-bifr.patch | 169 ++++++++++++++++++
>  package/rockchip-mali-bifrost/Config.in       |  20 +++
>  .../rockchip-mali-bifrost.hash                |   2 +
>  .../rockchip-mali-bifrost.mk                  |  85 +++++++++
>  5 files changed, 277 insertions(+)
>  create mode 100644 package/rockchip-mali-bifrost/0001-cmake-Use-AArch64-binaries-and-only-install-the-bifr.patch
>  create mode 100644 package/rockchip-mali-bifrost/Config.in
>  create mode 100644 package/rockchip-mali-bifrost/rockchip-mali-bifrost.hash
>  create mode 100644 package/rockchip-mali-bifrost/rockchip-mali-bifrost.mk

Thanks for this patch, which we have finally applied! I did a large
number of changes, almost rewriting it entirely:

    [Thomas:
    - Rename to rockchip-mali, because it contains other blobs than
      Bifrost ones
    - Add missing entry in DEVELOPERS file
    - Change BR2_arm to BR2_ARM_EABIHF as only EABIhf blobs are provided
      for arm32
    - Add BR2_TOOLCHAIN_HAS_THREADS inherited from libdrm.
    - Expose as a libgbm provider.
    - Drop the patch, which was not necessary.
    - Rework the entire installation logic, to be much simpler.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
