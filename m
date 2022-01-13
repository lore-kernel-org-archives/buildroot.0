Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C76AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 20:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 250A2401CE;
	Thu, 13 Jan 2022 20:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iPKLk6wQk2sZ; Thu, 13 Jan 2022 20:51:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FE0D40196;
	Thu, 13 Jan 2022 20:51:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAA6B1BF3ED
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B751B40196
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RonJgO8yK0kW for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 20:51:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 578314010C
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 20:51:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5E2A460002;
 Thu, 13 Jan 2022 20:51:05 +0000 (UTC)
Date: Thu, 13 Jan 2022 21:51:04 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220113215104.02a734a1@windsurf>
In-Reply-To: <20220110200151.830192-1-ju.o@free.fr>
References: <20220110200151.830192-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gnupg: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Mon, 10 Jan 2022 21:01:51 +0100
Julien Olivain <ju.o@free.fr> wrote:

>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/python-gnupg/Config.in         | 15 +++++++++++++++
>  package/python-gnupg/python-gnupg.hash |  5 +++++
>  package/python-gnupg/python-gnupg.mk   | 13 +++++++++++++
>  5 files changed, 35 insertions(+)

Thanks for the patch, which I have applied, with a change (see below).
However, more importantly, could you write and contribute a test case
for python-gnupg in our runtime test infrastructure ? See
https://buildroot.org/downloads/manual/manual.html#_using_the_runtime_tests_framework
for some amount of details.

> +config BR2_PACKAGE_PYTHON_GNUPG
> +	bool "python-gnupg"
> +	select BR2_PACKAGE_GNUPG2 if !BR2_PACKAGE_GNUPG # runtime

This generates a circular dependency reported by kconfig, because
another package does exactly the opposite. So I have inverted the logic
here:

select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2 # runtime

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
