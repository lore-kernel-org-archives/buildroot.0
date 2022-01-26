Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B3BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C02DF84DFA;
	Wed, 26 Jan 2022 22:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SoES4MMz5JzT; Wed, 26 Jan 2022 22:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14BEC84D8A;
	Wed, 26 Jan 2022 22:16:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6D2D1BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E350441670
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzTiq6WpWZ_c for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:16:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C66A641808
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:16:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D4BEE1C0004;
 Wed, 26 Jan 2022 22:16:38 +0000 (UTC)
Date: Wed, 26 Jan 2022 23:16:38 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220126231638.5183ec78@windsurf>
In-Reply-To: <20220126202942.1495636-1-fontaine.fabrice@gmail.com>
References: <20220126202942.1495636-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: link examples with
 -latomic
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jan 2022 21:29:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Link examples with -latomic to avoid the following build failure raised
> since commit 3edc1cc44c7bd2deed31d28fa9534e67f32334e8:
> 
> FAILED: spa/examples/adapter-control
> /home/buildroot/autobuild/instance-0/output-1/host/bin/sparc-linux-gcc  -o spa/examples/adapter-control spa/examples/adapter-control.p/adapter-control.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,--start-group -lintl -ldl -pthread -lm -Wl,--end-group
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: spa/examples/adapter-control.p/adapter-control.c.o: in function `spa_graph_node_trigger':
> adapter-control.c:(.text+0xdf4): undefined reference to `__atomic_fetch_sub_4'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/192f40a5c6e05fc11507494e19db52a47082fc35
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...eson.build-add-atomic_dep-dependency.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/pipewire/0001-spa-meson.build-add-atomic_dep-dependency.patch

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
