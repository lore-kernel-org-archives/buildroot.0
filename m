Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2884BC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4D5741167;
	Thu,  9 Jun 2022 20:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R635BotL29zq; Thu,  9 Jun 2022 20:33:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0E3B4100B;
	Thu,  9 Jun 2022 20:33:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0603D1BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA06084262
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:32:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTHSa2ddMNja for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:32:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC99A8425F
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:32:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7A0A8240002;
 Thu,  9 Jun 2022 20:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654806767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIIqzggUb+RvL597t/CbPE3dJTzkIjvk2gtI8X8OZ50=;
 b=S+IsrX1lx7NcJ2nZkem2BDjE87059wKNkIZj5UBcYOxFoLAoYuOIPLV1TAwfqqPRu55fam
 MGHzRBjohHP1XK6zy/ErdthmBx0G2xOHhjl8sf4H4k82MdYL3equQt82MiEAR0ySoZS58y
 gcOmmV97fHnlyCppMK0tQD26Zk3/X52zQiyqwOnOMMF4SZPfjuv3z27zdMuSSNfgmGQhvv
 VUgGcSJVE3AEs7omj5nBsr+FSFT5f3F67e2frMgGSR/dLw84VxQVMqOGn6GTvUnxmzPkfA
 tMVtR0g51F6xox6JHl8nmKCNySRD8883S2egtsrh1vLEYSiKArhwnrbsjWipXQ==
Date: Thu, 9 Jun 2022 22:32:46 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220609223246.43975ad1@windsurf>
In-Reply-To: <20220608191137.2065197-1-fontaine.fabrice@gmail.com>
References: <20220608191137.2065197-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-userland: fix libexecinfo
 workaround
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Jun 2022 21:11:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix libexecinfo workaround to avoid the following ffmpeg build failure
> with BR2_PACKAGE_RPI_USERLAND raised on uclibc and musl since commit
> bc4cc27705de50356d7e9945e41bd989fdc56fe8:
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/arm-linux-gcc --sysroot=/home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot -mcpu=arm926ej-s -Wl,--as-needed -Wl,-z,noexecstack -o /tmp/ffconf.5K0cMIh3/test /tmp/ffconf.5K0cMIh3/test.o -lmmal_core -lmmal_util -lmmal_vc_client -lbcm_host -latomic
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libvcos.so: undefined reference to `backtrace_symbols'
> 
> [...]
> 
> ERROR: mmal not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/64d21872d25fef35b72106133ed2aed300f52f2f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...on-t-override-CMAKE_EXE_LINKER_FLAGS.patch | 58 -------------------
>  ...threads-CMakeLists.txt-fix-build-wit.patch | 45 ++++++++++++++
>  package/rpi-userland/rpi-userland.mk          |  1 -
>  3 files changed, 45 insertions(+), 59 deletions(-)
>  delete mode 100644 package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch
>  create mode 100644 package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch

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
