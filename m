Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EDEC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 09:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B1EF60F4C;
	Tue, 29 Mar 2022 09:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQUOjsrxezMM; Tue, 29 Mar 2022 09:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C8860DFF;
	Tue, 29 Mar 2022 09:40:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B74791BF2BD
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 09:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A42C260F4C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 09:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0bz1DdvWTZrA for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 09:40:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15FE760D56
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 09:40:28 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 6748AC966153;
 Tue, 29 Mar 2022 11:40:26 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 29 Mar 2022 09:40:26 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Dan Jackson <dan@thejacksons.uk>
In-Reply-To: <mailman.22068.1648533484.192135.buildroot@buildroot.org>
References: <mailman.22068.1648533484.192135.buildroot@buildroot.org>
Message-ID: <2854f91f1188e166bf02e3a6ab6249a4@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] Adding USB support to existing device on 2.6.39.3
 kernel - possible?
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dan,

On 2022-03-29 05:58, Dan Jackson <dan@thejacksons.uk> wrote:

> Hello,
> 
> Sorry once again if this is a silly/noob question.
> 
> If I have an existing router device running a 2.6.39.3 kernel, which
> has a USB port and is capable of supporting USB devices, but the
> manufacturer has removed/not installed the necessary kernel modules,
> can I use Buildroot to recreate the missing modules and thus re-enable
> the missing USB support?

It might work: the driver is contained in the USB module, so building 
and loading that module could do the trick.

> If so, how would I do it?

Supposing the Linux kernel source contained in [1] is the one that is 
running on your device, you need to configure Buildroot to build a Linux 
kernel (BR2_LINUX_KERNEL). The manual [2] has some information about how 
to do this for a Kernel source tree (see chapter 8.14.6).

You then need to enable USB support in the kernel (Device Drivers -> USB 
support), probably

   CONFIG_USB=m
   CONFIG_USB_EHCI_HCD=y
   CONFIG_USB_OHCI_HCD=y

is enough, otherwise try some of the hardware specific (driver) options.

Copy usbcore.ko from Buildroot target/lib/modules/{kernel-version}/ to 
the corresponding location on your device and load the driver with 
modprobe.

Depending on which functionality (e.g. USB_STORAGE) you want on your USB 
port, additional configurations changes may be necessary.

Kind regards,
Andreas

> This time I successfully managed to build other binaries (e.g.
> dropbear, busybox) which run OK on the device.
> 
> Thanks,
> Dan Jackson.
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL:
> <http://lists.buildroot.org/pipermail/buildroot/attachments/20220329/43c49a2d/attachment.html>

[1] 
https://sourceforge.net/projects/dg3270.arris/files/DG3270_9.1.103FB/
[2] https://buildroot.org/downloads/manual/manual.html#_advanced_usage,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
