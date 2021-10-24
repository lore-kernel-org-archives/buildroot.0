Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93F4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:00:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801D760F4F
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 801D760F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 478C2402F2;
	Sun, 24 Oct 2021 13:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wY7UvJKmgCpd; Sun, 24 Oct 2021 13:00:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0A6640237;
	Sun, 24 Oct 2021 13:00:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EFEC1BF48C
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EA9680D65
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Xf-NQlFx1JB for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:00:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9041780D4C
 for <buildroot@busybox.net>; Sun, 24 Oct 2021 13:00:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 19D10100002;
 Sun, 24 Oct 2021 13:00:19 +0000 (UTC)
Date: Sun, 24 Oct 2021 15:00:18 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20211024150018.48426994@windsurf>
In-Reply-To: <20211023071201.1016688-4-francois.perrad@gadz.org>
References: <20211023071201.1016688-1-francois.perrad@gadz.org>
 <20211023071201.1016688-4-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4]
 board/stmicroelectronics/stm32mp157*-dk*: cleanup linux config
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 23 Oct 2021 09:12:01 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../stm32mp157a-dk1/linux.config              | 209 ++++++++++++------
>  .../stm32mp157c-dk2/linux-dk2.fragment        |   6 +
>  2 files changed, 150 insertions(+), 65 deletions(-)
> 
> diff --git a/board/stmicroelectronics/stm32mp157a-dk1/linux.config b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
> index eed6ba034..8b474650d 100644
> --- a/board/stmicroelectronics/stm32mp157a-dk1/linux.config
> +++ b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
> @@ -1,3 +1,7 @@
> +
> +#
> +# General setup
> +#

Are these added manually by you?

If so, I guess we don't want that. We don't do that for any other
kernel configuration file in Buildroot.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
