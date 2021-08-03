Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86535C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:55:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3426E60EE7
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3426E60EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04B6E60747;
	Tue,  3 Aug 2021 20:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yLJ_cUFhNJ2d; Tue,  3 Aug 2021 20:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50A156063A;
	Tue,  3 Aug 2021 20:55:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94A2B1BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 830AE400C7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5VesvEha17ak for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:55:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 201FD40001
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:55:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 476D420005;
 Tue,  3 Aug 2021 20:55:44 +0000 (UTC)
Date: Tue, 3 Aug 2021 22:55:42 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20210803225542.442262e6@windsurf>
In-Reply-To: <20210725111231.359830-3-arnout@mind.be>
References: <20210725111231.359830-1-arnout@mind.be>
 <20210725111231.359830-3-arnout@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 3/3] package/armadillo: allow to select
 between lapack or openblas
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 25 Jul 2021 13:12:31 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> armadillo can use lapack or openblas as BLAS provider. LAPACK support is
> optional.
> 
> This patch
> - adds an _ARCH_SUPPORTS variable to check if one is available
> - adds an option to choose lapack or openblas as BLAS provider
> 
> The choice is required since applications may potentially need lapack.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v4 -> v5: [Done by Arnout]
> - Consistent naming of BR2_PACKAGE_ARMADILLO_OPENBLAS (Yann E. Morin)
> - Remove double dependency on lapack/clapack (Yann E. Morin)
> - Remove stray 'endchoice'
> - "Solve" circular dependency by removing clapack
> Changes v3 -> v4: [Done by Arnout]
> - Split off lapack/clapack arch depends in separate patches
> - Simplify the comments (no need for the powerpc complexity)
> - Remove the choices because clapack/lapack choice doesn't work. Keep a
>   single config for openblas.
> Changes v2 -> v3:
> - drop all default statements for choice (Thomas)
> - add explicit -l since blas libary is called liblas for (c)lapack and
>   libopenblas for openblas (Thomas)
> - add a choice for lapack selection between lapack, clapack or none
> Changes v1 -> v2:
> - add openblas as blas provider
> ---
>  package/armadillo/Config.in    | 34 ++++++++++++++++++++++++++--------
>  package/armadillo/armadillo.mk | 18 +++++++++++++++++-
>  2 files changed, 43 insertions(+), 9 deletions(-)

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
