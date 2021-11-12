Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B04C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:27:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0F5160698
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0F5160698
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 851CF827CE;
	Fri, 12 Nov 2021 22:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iWurX-N3Wijs; Fri, 12 Nov 2021 22:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBFD48272C;
	Fri, 12 Nov 2021 22:27:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65AA71BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5407E40183
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-3VLdPkv4JL for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:27:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7233740103
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:27:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1EB85240005;
 Fri, 12 Nov 2021 22:27:39 +0000 (UTC)
Date: Fri, 12 Nov 2021 23:27:39 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211112232739.6211b3b0@windsurf>
In-Reply-To: <20211112180802.3610653-1-fontaine.fabrice@gmail.com>
References: <20211112180802.3610653-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: add girdir to
 glib-2.0.pc
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
Cc: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I'm adding Adam Duskett in Cc of this one, to get his review on this
GOI related patch.

Thanks!

Thomas

On Fri, 12 Nov 2021 19:08:02 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add girdir to glib-2.0.pc to fix the following build failure with atk,
> gcr or harfbuzz:
> 
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
> Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> 
> This build failure could also be fixed by removing our update of girdir
> in gobject-introspection.mk but this will have side effects as gir files
> won't be installed in the correct directory. So patch glib-2.0.pc
> instead.
> 
> Note: autotools-based packages have already been fixed by
> https://git.buildroot.net/buildroot/commit/?id=8dda79970661090f202e1f20e5982ba53fdaeb95
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
>  - http://autobuild.buildroot.org/results/67a47386019c2a700df348ad6846064e0950e87b
>  - http://autobuild.buildroot.org/results/2c6a4470542af574f9407fa5867f0408ec2b4880
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...eson.build-add-girdir-to-glib.2.0.pc.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
> 
> diff --git a/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch b/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
> new file mode 100644
> index 0000000000..7eeecbe336
> --- /dev/null
> +++ b/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
> @@ -0,0 +1,33 @@
> +From 04bdfff007c91fc620ed0b7cd02fd2e1e83bdefc Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 12 Nov 2021 18:01:05 +0100
> +Subject: [PATCH] glib/meson.build: add girdir to glib.2.0.pc
> +
> +Add girdir to glib-2.0.pc to fix the following build failure with atk:
> +
> +/home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
> +Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + glib/meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/glib/meson.build b/glib/meson.build
> +index f78f32969..6c5486699 100644
> +--- a/glib/meson.build
> ++++ b/glib/meson.build
> +@@ -377,6 +377,7 @@ pkg.generate(libglib,
> +   subdirs : ['glib-2.0'],
> +   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
> +   variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
> ++               'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
> +                'glib_genmarshal=' + join_paths('${bindir}', 'glib-genmarshal'),
> +                'gobject_query=' + join_paths('${bindir}', 'gobject-query'),
> +                'glib_mkenums=' + join_paths('${bindir}', 'glib-mkenums')],
> +-- 
> +2.33.0
> +



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
