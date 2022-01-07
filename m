Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F5EC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 19:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8742D4290F;
	Fri,  7 Jan 2022 19:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGxVQMC8Srhi; Fri,  7 Jan 2022 19:15:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E418E428E0;
	Fri,  7 Jan 2022 19:15:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4B731BF5DC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91A2C40141
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0U8g20MWV88 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 19:15:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2615340002
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 19:15:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 149E4200007;
 Fri,  7 Jan 2022 19:15:45 +0000 (UTC)
Date: Fri, 7 Jan 2022 20:15:44 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220107201544.39790a38@windsurf>
In-Reply-To: <20220104181107.3171973-1-fontaine.fabrice@gmail.com>
References: <20220104181107.3171973-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/liburing: new package
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
Cc: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  4 Jan 2022 19:11:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This is the io_uring library, liburing. liburing provides helpers to
> setup and teardown io_uring instances, and also a simplified interface
> for applications that don't need (or want) to deal with the full kernel
> side implementation.
> 
> https://git.kernel.dk/cgit/liburing
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/liburing/Config.in     | 13 ++++++++++++
>  package/liburing/liburing.hash |  8 ++++++++
>  package/liburing/liburing.mk   | 36 ++++++++++++++++++++++++++++++++++
>  5 files changed, 59 insertions(+)
>  create mode 100644 package/liburing/Config.in
>  create mode 100644 package/liburing/liburing.hash
>  create mode 100644 package/liburing/liburing.mk

I have applied, after adding a dependency on headers >= 5.1.

I think this dependency is not strictly needed for building, because
liburing apparently bundles a copy of the kernel header (if I
understood correctly). But anyway, since it can't work on kernels <
5.1, this headers dependency also hints the user about this requirement.

Maybe some kernel config fixup would be useful in liburing.mk, to
ensure the kernel is built with the needed kernel config option;

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
