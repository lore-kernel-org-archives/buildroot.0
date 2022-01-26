Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008EEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFFF183104;
	Wed, 26 Jan 2022 22:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nMlqq4g6atLF; Wed, 26 Jan 2022 22:14:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0210982AB9;
	Wed, 26 Jan 2022 22:14:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8B31BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C2FC82AB9
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hC9Aw4M-IE2p for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:14:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 928E88133C
 for <buildroot@busybox.net>; Wed, 26 Jan 2022 22:14:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 974B11C0003;
 Wed, 26 Jan 2022 22:14:33 +0000 (UTC)
Date: Wed, 26 Jan 2022 23:14:32 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220126231432.37374caf@windsurf>
In-Reply-To: <20220126090457.32015-1-mf@go-sys.de>
References: <20220126090457.32015-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: add optional
 nmcli support
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
Cc: buildroot@busybox.net, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Yann on legacy handling (see below)

On Wed, 26 Jan 2022 10:04:57 +0100
Michael Fischer <mf@go-sys.de> wrote:

> When NetworkManager is built without the READLINE package the nmcli was not build.

Well, this was kind of expected, and isn't really a correct
explanation for this change.

A better explanation I believe is more something like this:

"""
The network-manager package builds the nmcli utility when the readline
package is enabled. However, this is not necessarily obvious to the
user. Therefore, this commit adds an explicit option to enable the
nmcli tool, which automatically selects readline.
"""

> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

> +config BR2_PACKAGE_NETWORK_MANAGER_CLI
> +        bool "nmcli support"
> +        select BR2_PACKAGE_READLINE
> +        help
> +          This option enables support for NetworkManager Command Line Interface

I think this line is too long, make sure to run "make check-package".

But a bigger problem is the legacy handling. Indeed, before your patch,
a configuration with BR2_PACKAGE_NETWORK_MANAGER=y and
BR2_PACKAGE_READLINE=y gets nmcli. After your patch, such a
configuration no longer has nmcli compiled, because
BR2_PACKAGE_NETWORK_MANAGER_CLI is not enabled.

Is this important to address, I don't know.

Is it possible to address is by doing:

config BR2_PACKAGE_NETWORK_MANAGER_CLI
        bool "nmcli support"
	default y if BR2_PACKAGE_READLINE
        select BR2_PACKAGE_READLINE

I don't know if Kconfig is happy about such a construct. Yann? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
