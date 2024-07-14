Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBB1C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 16:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3EFF402A8;
	Sun, 14 Jul 2024 16:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lS_EQbVzi1oR; Sun, 14 Jul 2024 16:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C90D4042A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C90D4042A;
	Sun, 14 Jul 2024 16:59:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27EAF1BF20F
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 212614042A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLGPOHdRwMqE for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 16:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BEF8D402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEF8D402A8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEF8D402A8
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 16:59:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C0CC240004;
 Sun, 14 Jul 2024 16:59:12 +0000 (UTC)
Date: Sun, 14 Jul 2024 18:59:11 +0200
To: Athaariq Ardhiansyah <foss@athaariq.my.id>
Message-ID: <20240714185911.2740dc9d@windsurf>
In-Reply-To: <20240714160457.39434-3-foss@athaariq.my.id>
References: <20240714160457.39434-1-foss@athaariq.my.id>
 <20240714160457.39434-3-foss@athaariq.my.id>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720976352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+6K6eXzmQeDiB0p7GC0KXmWVB4feg2/7En+0QrX4vg4=;
 b=YAFSUys+GHs4f41v4iEpMX6lwI97KHZ/dosNxAN0pvbbNi++tcRbDPmZX/vxdBLXrsWxWu
 XqXS4o30esJhr4iSrNP7igpJE+xJ0j0lPAvsG5y7Ty0ESx/fVBLrJtMM//qj0A4aJOyPS9
 6OOLgJ9YtXYq58os7dyOllPmi74kIJPKvdCI1OboFj0kO51LfGigGYG4bdnzaQaiVOKhT1
 QL3eezzUNlfWruQNtr726OPc6ezZHqWc6Tf7Jpjp1wPNhGjvonEMQyazpNxySC70ALcTCy
 ALUBnhrE2kvhuTv7K3ifbBKwDAyoKHpF+Soq3Kcl5TarUTXGdXATNQpKU2zoSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YAFSUys+
Subject: Re: [Buildroot] [PATCH v4 3/3] board/raspberrypi: add support for
 Raspberry Pi 5
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 14 Jul 2024 23:04:54 +0700
Athaariq Ardhiansyah <foss@athaariq.my.id> wrote:

> Since the last Raspberry Pi 5 submission has no progress, I'm submitting
> these patches anyway. The newly released Raspberry Pi 5 board shares
> similar software structure except it has less proprietary API.
> Therefore, rpi-userland and all of raspberry-centric GPIO utilities are
> no longer supported.
> 
> Keep in mind that RPi 5 has no native 32-bit support due to Cortex-A76
> processor specification. That is the reason why I did not add _64.
> 
> Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
> 
> ---
> Changes v1 -> v2:
>   - Fix missing newlines due to terminal issue
> 
> Changes v3 -> v4:
>   - Rebase to master
>   - Drop 4K page size, until we figured out how to run 32bit userspace
>     on top of 64bit kernel
>   - Change back from commit ID to commit tag
>   - Rewrite the commit description
>   - Fix incorrect CPU from upstream config, RPi5 has no LITTLE.big
> 
> Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
> ---
>  board/raspberrypi/config_5.txt                | 42 +++++++++++++++++++
>  .../patches/linux-headers/linux-headers.hash  |  1 -
>  board/raspberrypi/patches/linux/linux.hash    |  2 +-
>  configs/raspberrypi5_defconfig                | 17 ++++----
>  4 files changed, 50 insertions(+), 12 deletions(-)
>  delete mode 120000 board/raspberrypi/patches/linux-headers/linux-headers.hash

Thanks, but here you're submitted a diff against the previous
raspberrypi5_defconfig submission. Please submit a full patch adding
the complete support for RPi5, not a diff against some random other
patch posted on the mailing list.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
