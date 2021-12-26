Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359D0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 10:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E061860D73;
	Sun, 26 Dec 2021 10:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Puc0hLMND_rV; Sun, 26 Dec 2021 10:51:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38FE060D6C;
	Sun, 26 Dec 2021 10:51:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD1D31BF476
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C932040966
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tDaCQ37Xm06B for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 10:51:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 956274091B
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:51:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 99400FF805;
 Sun, 26 Dec 2021 10:51:17 +0000 (UTC)
Date: Sun, 26 Dec 2021 11:51:17 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211226115117.776c2de1@windsurf>
In-Reply-To: <20211225193816.491118-1-fontaine.fabrice@gmail.com>
References: <20211225193816.491118-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/memcached: fix build with gcc 10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 25 Dec 2021 20:38:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 1.6.12 in
> commit f727b6da04c21732bbd07d8c70aa814bc56014a1:
> 
> logger.c: In function '_logger_parse_cce':
> logger.c:297:13: error: 'rport' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   297 |     total = snprintf(scratch, LOGGER_PARSE_SCRATCH,
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   298 |             "ts=%d.%d gid=%llu type=conn_close rip=%s rport=%hu transport=%s reason=%s cfd=%d\n",
>       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   299 |             (int) e->tv.tv_sec, (int) e->tv.tv_usec, (unsigned long long) e->gid,
>       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   300 |             rip, rport, transport_map[le->transport],
>       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   301 |             reason_map[le->reason], le->sfd);
>       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7a46ac38d10b1859034017e0294961daa8f48dd2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-logger.c-initialize-rport.patch      | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/memcached/0001-logger.c-initialize-rport.patch

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
