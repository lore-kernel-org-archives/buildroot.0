Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDCDC49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C13460625;
	Tue,  6 Aug 2024 22:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NK6eotMutUtN; Tue,  6 Aug 2024 22:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B92C160876
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92C160876;
	Tue,  6 Aug 2024 22:15:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D90FB1BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C641C40277
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VU-KsfIZpwzB for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D30E40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D30E40153
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D30E40153
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:15:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4230640005;
 Tue,  6 Aug 2024 22:15:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbSSX-0004js-1o;
 Wed, 07 Aug 2024 00:15:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240518091707.267692-1-fontaine.fabrice@gmail.com>
 <20240712171541.07e8b250@windsurf>
Date: Wed, 07 Aug 2024 00:15:13 +0200
In-Reply-To: <20240712171541.07e8b250@windsurf> (Thomas Petazzoni via
 buildroot's message of "Fri, 12 Jul 2024 17:15:41 +0200")
Message-ID: <87a5hpqowe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/gpm: fix musl build with gcc 14
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sat, 18 May 2024 11:17:07 +0200
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Fix the following musl build failure with gcc 14:
 >> 
 >> daemon/old_main.c: In function 'old_main':
 >> daemon/old_main.c:56:11: error: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
 >> 56 |       if(!strcmp((which_mouse->opt_dev),"-")) fd=0; /* use stdin */
 >> |           ^~~~~~
 >> daemon/old_main.c:35:1: note: include '<string.h>' or provide a declaration of 'strcmp'
 >> 34 | #include "headers/gpmInt.h"         /* daemon internals */
 >> +++ |+#include <string.h>
 >> 35 |
 >> 
 >> While at it, add Upstream tags to other patches
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/3192740863d57e72e90e622683e7b9fcc057fa8b
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> .checkpackageignore                           |  6 -----
 >> ...usl-support-to-libgpm-and-the-daemon.patch |  4 +--
 >> .../0002-Install-unversioned-solibrary.patch  |  4 +--
 >> ...Really-install-unversioned-solibrary.patch |  3 +--
 >> ...mptyset-API-instead-of-__sigemptyset.patch |  1 +
 >> .../gpm/0005-fix-building-w-newer-glibc.patch |  1 +
 >> ...on.h-avoid-redefinition-of-last_sele.patch |  1 +
 >> package/gpm/0007-Add-include-string-h.patch   | 27 +++++++++++++++++++
 >> 8 files changed, 33 insertions(+), 14 deletions(-)
 >> create mode 100644 package/gpm/0007-Add-include-string-h.patch

 > Applied to master, thanks.

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
