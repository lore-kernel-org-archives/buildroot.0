Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92072C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6C2D40B9A;
	Tue, 16 Jul 2024 12:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MrumJ66M7lPR; Tue, 16 Jul 2024 12:15:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD14F40B02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD14F40B02;
	Tue, 16 Jul 2024 12:15:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E7091BF38A
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46AD240B02
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqxfPjHphUam for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:15:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87B4C401F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87B4C401F3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87B4C401F3
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:15:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F56EFF807;
 Tue, 16 Jul 2024 12:15:36 +0000 (UTC)
Date: Tue, 16 Jul 2024 14:15:33 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240716141533.7a23365d@windsurf>
In-Reply-To: <20240605234131.3370484-2-james.hilliard1@gmail.com>
References: <20240605234131.3370484-1-james.hilliard1@gmail.com>
 <20240605234131.3370484-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721132136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t91EDyF73NjMi7JXrH/ceu5PAF0w3vJNmJaxkESZ1Xk=;
 b=aeGRNshnjKy/2MgfO+P7FHxtzM42ql4kVZqdiLsY2qhGsFpecycuWOkbgPfe2IhyEKhE6P
 TcIPyZO9miyJZr8GgHqyyb5agydnuj4P8ZOE3ZHgGSh+1RC73Gr0uuR1qBbNpjHEPegXkX
 qwYbpyIPxnStp14Kr2cNKG1WHzd8CHhBqa68p7NDxa25JA7VlCGt91w0fCdOqqJnXTFAmi
 iT2vajqKWRxhJF9dITG1xw0Nc0eokaadFGaaxVZ9OQPwgAK4qs5NI8pUnecUYuR7lKmAKg
 Il+LhBi4M7ZLrLCO9eehCcKxMoSt0gCNJQJccKWl4LdlahWn0t+3iiXh97ZMgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aeGRNshn
Subject: Re: [Buildroot] [PATCH 2/4] package/fwupd-efi: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Wed,  5 Jun 2024 17:41:29 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                |  1 +
>  package/fwupd-efi/Config.in      |  8 ++++++++
>  package/fwupd-efi/fwupd-efi.hash |  3 +++
>  package/fwupd-efi/fwupd-efi.mk   | 25 +++++++++++++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/fwupd-efi/Config.in
>  create mode 100644 package/fwupd-efi/fwupd-efi.hash
>  create mode 100644 package/fwupd-efi/fwupd-efi.mk

Thanks for the patch! Entry in DEVELOPERS file is missing (I had added
it locally), but more importantly, the build fails:

FAILED: efi/fwup-sbat.o 
/home/thomas/projets/buildroot/output/build/fwupd-efi-1.6/efi/generate_sbat.py efi/fwup-sbat.o --cc /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc --cflags '-Og -g3 --param=ssp-buffer-size=4 -fexceptions -Wall -Wextra -Wvla -std=gnu11 -fpic -funsigned-char -fshort-wchar -ffreestanding -fno-strict-aliasing -fno-stack-protector -fno-stack-check -fno-merge-all-constants -Wsign-compare -Wno-missing-field-initializers -Wno-address-of-packed-member -grecord-gcc-switches -DDEBUGDIR="/usr/lib/debug" -I. -isystem /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-musleabihf/sysroot/usr/include/efi -isystem /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-musleabihf/sysroot/usr/include/efi/arm -fno-merge-constants' --objcopy /usr/bin/objcopy --project-name fwupd-efi --project-version 1.6 --sbat-version 1 --sbat-generation 1 --sbat-distro-id buildroot --sbat-distro-generation 0 --sbat-distro-summary Buildroot --sbat-distro-pkgname fwupd-efi --sbat-distro-
 version fwupd-efi-1.6 --sbat-distro-url https://gitlab.com/buildroot.org/buildroot/-/tree/master/package/fwupd-efi
/usr/bin/objcopy: Unable to recognise the format of the input file `efi/fwup-sbat.o'
Traceback (most recent call last):
  File "/home/thomas/projets/buildroot/output/build/fwupd-efi-1.6/efi/generate_sbat.py", line 118, in <module>
    _generate_sbat(_args)
  File "/home/thomas/projets/buildroot/output/build/fwupd-efi-1.6/efi/generate_sbat.py", line 80, in _generate_sbat
    subprocess.run(argv, check=True)
  File "/usr/lib64/python3.12/subprocess.py", line 571, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command '['/usr/bin/objcopy', '--add-section', '.sbat=/tmp/tmpd55y25q9', '--set-section-flags', '.sbat=contents,alloc,load,readonly,data', 'efi/fwup-sbat.o']' returned non-zero exit status 1.

I think it's due to the fact that it is using /usr/bin/objcopy instead
of the cross objcopy. You probably didn't notice as you were building
for x86-64, and therefore the host objcopy didn't work.

Could you test building for a foreign architecture, and preferably
using ./utils/docker-run (see my review on PATCH 4/4 to understand why
docker-run is important).

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
