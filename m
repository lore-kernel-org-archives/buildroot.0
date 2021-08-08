Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB25C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:39:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 217FF60F38
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 217FF60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE940401B1;
	Sun,  8 Aug 2021 20:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Lw-dujUlLLU; Sun,  8 Aug 2021 20:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C4D5400F1;
	Sun,  8 Aug 2021 20:39:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0EC1BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2990681D0C
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WwTDIZ-04nfC for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:39:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2789581CE3
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:39:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id ED082E0002;
 Sun,  8 Aug 2021 20:39:22 +0000 (UTC)
Date: Sun, 8 Aug 2021 22:39:21 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20210808223921.5ff7c8b0@windsurf>
In-Reply-To: <20210808094844.385703-1-egorenar@linux.ibm.com>
References: <20210808094844.385703-1-egorenar@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/prelink-cross: fix handling of
 TLS offsets for s390 arch
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: yann.morin.1998@free.fr, aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun,  8 Aug 2021 11:48:44 +0200
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> /tmp/instance-1/output-1/host/sbin/prelink-rtld: error while loading
> shared libraries: /lib64/libc.so.6: cannot handle TLS data
> ERROR: can't resolve libraries to shared libraries: glib-2.0, gobject-2.0
> ninja: build stopped: subcommand failed.
> make: *** [package/pkg-generic.mk:270:
> /tmp/instance-1/output-1/build/gobject-introspection-1.68.0/.stamp_built]
> Error 1
> make: Leaving directory '/tmp/instance-1/buildroot'

Thanks a lot for having looked at this problem and submitted a patch. I
have applied, after adjusting a bit the commit log, see below.

> 
> Fixes:
> - http://autobuild.buildroot.org/?reason=gobject-introspection-1.68.0&arch=s390x

This is not a correct way to reference an autobuilder failure. Indeed,
this point to a list of failures, which today are what you are fixing,
but tomorrow? Maybe there will be another s390 failure in
gobject-introspection, which is different. This would cause anybody
look at your commit log and following the link to be very confused. So
we always point to one (or several) specific build failures.

> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  ...c-Fix-TLS-offsets-computation-for-s3.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
