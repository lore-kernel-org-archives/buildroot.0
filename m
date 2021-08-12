Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D15C4320A
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:48:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C238860F57
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C238860F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81FA4400EF;
	Thu, 12 Aug 2021 21:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfeFdvjKeg4d; Thu, 12 Aug 2021 21:48:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 242B9401D3;
	Thu, 12 Aug 2021 21:48:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2EC51BF354
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3A3061411
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:47:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2Qw5UCucfqY for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:47:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5BAE6140A
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:47:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 902FA1C0003;
 Thu, 12 Aug 2021 21:47:41 +0000 (UTC)
Date: Thu, 12 Aug 2021 23:47:40 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210812234740.4647dcc8@windsurf>
In-Reply-To: <20210810091445.3652881-1-fontaine.fabrice@gmail.com>
References: <20210810091445.3652881-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sconeserver: fix build with gcc
 11
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Tue, 10 Aug 2021 11:14:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 11:
> 
> In file included from ../sconex/sconex.h:229,
>                  from ../sconex/Descriptor.h:63,
>                  from Descriptor.cpp:22:
> Descriptor.cpp: In member function 'void scx::Descriptor::add_stream(scx::Stream*)':
> Descriptor.cpp:150:22: error: ordered comparison of pointer with integer zero ('scx::Stream*' and 'int')
>   150 |   DEBUG_ASSERT(stream>=0,"add_stream() Invalid stream");
>       |                ~~~~~~^~~
> Descriptor.cpp: In member function 'bool scx::Descriptor::remove_stream(scx::Stream*)':
> Descriptor.cpp:204:22: error: ordered comparison of pointer with integer zero ('scx::Stream*' and 'int')
>   204 |   DEBUG_ASSERT(stream>=0,"remove_stream() Invalid stream");
>       |                ~~~~~~^~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ccc9562e83fd2bd312d21b3124be42dfe4b7e850
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...Descriptor.cpp-fix-build-with-gcc-11.patch | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/sconeserver/0001-sconex-Descriptor.cpp-fix-build-with-gcc-11.patch

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
