Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0CBC02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 20:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B67E810DE;
	Mon, 27 Jan 2025 20:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ia1z0ZLNs76v; Mon, 27 Jan 2025 20:42:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 941CC810E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 941CC810E7;
	Mon, 27 Jan 2025 20:42:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 900C9AF7
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DC84606A7
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbHqlOuPVWwM for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 20:42:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.107;
 helo=smtp-outgoing-1903.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C4A54606A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4A54606A0
Received: from smtp-outgoing-1903.laposte.net (smtp-outgoing-1903.laposte.net
 [160.92.124.107])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4A54606A0
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:42:10 +0000 (UTC)
X-mail-filterd: {"version":"1.8.0","queueID":"4YhgML1lv7z10MQN","contextId":
 "34a17e26-d2c9-48e3-b8d5-1894e3865ad4"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0120.laposte.net (SMTP Server) with ESMTP id 4YhgML1lv7z10MQN;
 Mon, 27 Jan 2025 21:42:06 +0100 (CET)
X-mail-filterd: {"version":"1.8.0","queueID":"4YhgML0kF3z10MQ4","contextId":
 "373d470d-bd4d-40fa-aed4-d21b3465b123"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0120.laposte.net (SMTP Server) with ESMTPSA id 4YhgML0kF3z10MQ4;
 Mon, 27 Jan 2025 21:42:06 +0100 (CET)
Received: by romuald.bergerie (Postfix, from userid 1000)
 id 883B6637FA8D; Mon, 27 Jan 2025 21:42:24 +0100 (CET)
Date: Mon, 27 Jan 2025 21:42:24 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>
Message-ID: <Z5fvsG9ledOg2-xi@romuald.bergerie>
Mail-Followup-To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Alistair Francis <alistair@alistair23.me>
References: <20250126173402.24273-1-vincent.stehle@laposte.net>
 <20250126173402.24273-3-vincent.stehle@laposte.net>
 <0f703425522cb6ac8c950ddbad188c60@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f703425522cb6ac8c950ddbad188c60@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1738010528;
 bh=q6hlzfRCkWjDRIT90cUkND0YTqRF7ciYzQ7P0inIvFs=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:Content-Transfer-Encoding;
 b=kKtlQwbWIzkjETS0WZ8HRZ5fMSWtzx9CS3S+E/0RgFpeX4sJImLgKjwqzcW8FRu2t2PhA9M8OSDW10PQkGayWqPBF+uxn3v1vZV5/MQDkl6dj5zuofMshpf9GrqLfty5ApnNns7H7uS5WgfwHvTi8whnoiIjFLrx01Qo1r9wpmhIMQIESkMUHRWi5JdRYzFg2RgHy7qi8O1yDwgU+ciGRRfXUcKv3hnq2taknYvroEw13R+tAyzgF55srfpITvqtcj8nWjz0uM+f26e/eAy9+XAw2NvitoTGm19IEHPmtON/7kwH1oyEgI1vwvhNZTE5J+yGYu6ab68Ek02Inq5igA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=kKtlQwbW
Subject: Re: [Buildroot] [PATCH v2 2/2] support/testing: test_xen: repair
 and leverage xen tools
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jan 26, 2025 at 10:49:47PM +0100, Julien Olivain wrote:
> Hi Vincent,
> =

> Thanks for the patch.
> =

> The S99custom startup script generates a "make check-package" error.
> See below.

Hi Julien,

Thank you for tirelessly reviewing those patches!

I will send a v3 to fix the init shell script warnings.

Best regards,
Vincent.

> =

> On 26/01/2025 18:34, Vincent Stehl=E9 via buildroot wrote:
> > Current test runs a Xen hypervisor and a Linux dom0, from which we can
> > detect that we run under Xen but not much more. Indeed, with current
> > test's setup the Xen tools are not functional.
> > =

> > We add back networking to our stripped-down kernel config to repair Xen
> > tools.
> > =

> > With Xen tools functionals, we can enhance the test with the creation of
> > a VM. To be able to use the rootfs that we build in both the dom0 and in
> > this new dom1, we switch to an initramfs; no more rootfs partition in
> > the image. After stripping the ramdisk a bit we can even reduce Qemu's
> > memory to 1 GB.
> > =

> > Suggested-by: Julien Olivain <ju.o@free.fr>
> > Signed-off-by: Vincent Stehl=E9 <vincent.stehle@laposte.net>
> =

> [...]
> =

> > diff --git
> > a/support/testing/tests/package/test_xen/overlay/etc/init.d/S99custom
> > b/support/testing/tests/package/test_xen/overlay/etc/init.d/S99custom
> > new file mode 100755
> > index 0000000000..62b7568a58
> > --- /dev/null
> > +++
> > b/support/testing/tests/package/test_xen/overlay/etc/init.d/S99custom
> > @@ -0,0 +1,43 @@
> > +#!/bin/sh
> > +#
> > +# Custom script for test_xen.py
> > +# This will run both in dom0 and in dom1.
> > +# When we detect that we are in dom0 we mount the boot partition under
> > /mnt,
> > +# to see the kernel image and the initramfs.
> > +#
> =

> Running the command "utils/docker-run make check-package" produces the
> error:
> =

>      support/testing/tests/package/test_xen/overlay/etc/init.d/S99custom:=
0:
> DAEMON variable not defined
> (https://nightly.buildroot.org/#adding-packages-start-script)
>      support/testing/tests/package/test_xen/overlay/etc/init.d/S99custom:=
0:
> run 'shellcheck' and fix the warnings
> =

> Even if it is a custom startup script for the test, I think it would
> be better to comply to the checker (rather than just adding
> a .checkpackageignore entry).

Agreed!

> =

> Could you fix those warnings and send an updated patch, please?

Certainly!

> =

> Best regards,
> =

> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
