Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535B9C6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:54:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0894360720
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0894360720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE664829BB;
	Wed, 21 Jul 2021 21:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nAuVF0SQ8xmK; Wed, 21 Jul 2021 21:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EFEC8291D;
	Wed, 21 Jul 2021 21:54:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB1721C1187
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA523401D5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFbnw6yfYKHl for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 21:54:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74AD8401C3
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 21:54:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7F1F520006;
 Wed, 21 Jul 2021 21:54:17 +0000 (UTC)
Date: Wed, 21 Jul 2021 23:54:16 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210721235416.5313b242@windsurf>
In-Reply-To: <20210718191403.2705796-1-fontaine.fabrice@gmail.com>
References: <20210718191403.2705796-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: drop rpcgen patches
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 18 Jul 2021 21:14:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> rpcgen patches raise a build failure with host-libtirpc since commit
> 0a5a9741e03e666204d577f82d29d93ba610381b because rpcgen is not provided
> by modern glibc:
> 
> rpcgen -h -o tirpc/rpcsvc/crypt.h tirpc/rpcsvc/crypt.x
> make[1]: rpcgen: No such file or directory
> 
> Those patches were added to build rpcbind back in 2012 with commit
> 18828103cdc8b929b29f5cbc27cd771ab1a26326 however they don't seem to be
> needed anymore as rpcbind builds fine without them
> 
> So drop those patches and autoreconf as well as the host-nfs-utils
> dependency from the target variant.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6607cb9bec426b8c78e649484d5a149a1bf12a7f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...nerate-XDR-header-files-from-.x-sour.patch | 1001 ----------
>  ...es-needed-to-build-rpcbind-on-top-of.patch | 1653 -----------------
>  package/libtirpc/libtirpc.mk                  |    2 -
>  3 files changed, 2656 deletions(-)
>  delete mode 100644 package/libtirpc/0001-Automatically-generate-XDR-header-files-from-.x-sour.patch
>  delete mode 100644 package/libtirpc/0002-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch

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
