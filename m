Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CAFC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:36:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1513D60F38
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1513D60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D123482B75;
	Sun,  8 Aug 2021 20:36:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bq2gU2amnqSZ; Sun,  8 Aug 2021 20:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22A4382CD4;
	Sun,  8 Aug 2021 20:36:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 697021BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57B66401BD
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z7Ia1Ps53QId for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:36:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 014B1400AE
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:36:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1BBE9200003;
 Sun,  8 Aug 2021 20:36:36 +0000 (UTC)
Date: Sun, 8 Aug 2021 22:36:36 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Message-ID: <20210808223636.465b7c2f@windsurf>
In-Reply-To: <20210806143839.2905163-1-quentin.schulz@theobroma-systems.com>
References: <20210806143839.2905163-1-quentin.schulz@theobroma-systems.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/qt5/qt5base: do not link against
 host libatomic when building host tools within qt5* target packages
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
Cc: Peter Seiderer <ps.report@gmx.net>, Quentin Schulz <foss@0leil.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Fri,  6 Aug 2021 16:38:39 +0200
Quentin Schulz <quentin.schulz@theobroma-systems.com> wrote:

> qt5declarative builds qmltyperegistrar for the host as part of its build
> process.
> When building qt target packages (which is the case for qt5declarative),
> -spec devices/linux-buildroot-g++ is passed to qmake in QT5_QMAKE
> variable and this spec currently has -latomic in its LIBS.
> 
> This -latomic makes it to the build of the host build of
> qmltyperegistrar which is not useful.
> 
> This was discovered on Fedora 34 where libatomic is not pulled with gcc
> package, therefore was missing on the host machine.
> 
> This makes sure that -latomic is not added for host build of qt
> packages.
> 
> Fixes: 7d286be4f9 ("package/qt5base: link with -latomic when needed")
> 
> Cc: Quentin Schulz <foss@0leil.net>
> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
