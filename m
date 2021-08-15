Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70703C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 07:23:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAA2D60D07
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 07:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAA2D60D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A6D940129;
	Sun, 15 Aug 2021 07:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVh4bfYcqPaC; Sun, 15 Aug 2021 07:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C6E240130;
	Sun, 15 Aug 2021 07:23:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E71B1BF4DB
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 07:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E23680E58
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 07:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqQLd1we0w-j for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 07:23:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE10D80DA6
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 07:23:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id B6E00240004;
 Sun, 15 Aug 2021 07:23:11 +0000 (UTC)
Date: Sun, 15 Aug 2021 09:23:10 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210815092310.456d9d58@windsurf>
In-Reply-To: <20210814094246.171463-1-fontaine.fabrice@gmail.com>
References: <20210814094246.171463-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/poppler: fix build with gcc 11
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat, 14 Aug 2021 11:42:46 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 11:
> 
> In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib/gthread.h:32,
>                  from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib/gasyncqueue.h:32,
>                  from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib.h:32,
>                  from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/gobject/gbinding.h:28,
>                  from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib-object.h:22,
>                  from /tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler.h:22,
>                  from /tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-action.cc:19:
> /tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-action.cc: In function 'GType poppler_dest_get_type()':
> /tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-private.h:155:13: error: argument 2 of '__atomic_load' must not be a pointer to a 'volatile' type
>   155 |         if (g_once_init_enter (&g_define_type_id__volatile)) {                        \
>       |             ^~~~~~~~~~~~~~~~~
> /tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-action.cc:28:1: note: in expansion of macro 'POPPLER_DEFINE_BOXED_TYPE'
>    28 | POPPLER_DEFINE_BOXED_TYPE (PopplerDest, poppler_dest, poppler_dest_copy, poppler_dest_free)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/dfcaac6487aaeb10412c3fe72a23135f8a70fefe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...pler-private.h-fix-build-with-gcc-11.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/poppler/0001-glib-poppler-private.h-fix-build-with-gcc-11.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
