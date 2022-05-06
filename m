Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64326C433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 05:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDD4A40533;
	Fri,  6 May 2022 05:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brScIpDh9ek6; Fri,  6 May 2022 05:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D65E240119;
	Fri,  6 May 2022 05:21:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0633D1BF867
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 05:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9BA6607B5
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 05:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hj_1UM_vHhsy for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 05:21:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D48C960625
 for <buildroot@buildroot.org>; Fri,  6 May 2022 05:21:37 +0000 (UTC)
Received: from opfedar07.francetelecom.fr (unknown [xx.xx.xx.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar21.francetelecom.fr (ESMTP service) with ESMTPS id 4Kvf7M3Fpmz7txR; 
 Fri,  6 May 2022 07:21:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1651814495;
 bh=SLrNbEsElIsQ4QNSMh4BRRwKD8YY7ffv4u3L8Qz/CN4=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=SBQ+LKqauTSq5krU4pmVLid/T9eWz45t2p5OA/EsDRNds4No14xDjBVDbzIIdaeFG
 CiXI79okMs1eevG5VqKrZDNYhOhJzhyWLwwutiddX/HXWnE3F7ccKj0j7qbOoKDWux
 BHZn8MUfhmTiqwuSj13M5PM/KepBT99vMcvMbWeAjIHGLuJPjUQc+D4CT3w05KIjsB
 y/SY0Jg+3x1JLbSigAKM3XaqJ5Gtr3s8hREVfcD+aKy/fi0sAseE58NesTjk4cavX2
 1PMzI7ptMxVQBXJIt00XO/XfRSH2+f4VorO2h9acZ0VRmjuH6jVLTX4Ukh9t0sqX1b
 BYmIx1fD5GBeQ==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 06 May 2022 07:21:32 +0200
Date: Fri, 6 May 2022 07:21:32 +0200
From: <yann.morin@orange.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <31076_1651814495_6274B05F_31076_440_1_20220506052132.GB2870@tl-lnx-nyma7486>
References: <24588_1651771186_62740732_24588_360_1_2d4cd3ac6995d7b5119ef4dfdc22b975992b8a73.1651770627.git.yann.morin@orange.com>
 <c8c34832-4993-4779-e125-4beea032836b@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8c34832-4993-4779-e125-4beea032836b@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX203.corporate.adroot.infra.ftgroup (10.115.26.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: Re: [Buildroot] [PATCH] package/pkg-download: do not try to vendor
 _EXTRA_DOWNLOADS
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-05-05 22:37 +0200, Arnout Vandecappelle spake thusly:
> On 05/05/2022 19:19, yann.morin@orange.com wrote:
> >From: "Yann E. MORIN" <yann.morin@orange.com>
> >
> >For golang- or cargo-based packages, we apply a vendoring pass after the
> >package's "main" download is done. Whether to vendor or not is based on
> >the heuristic that a specific directory exists or not; for golang
> >packages, we look for '/vendor', while for cargo, we look for '/VENDOR'.
> >
> >This is fine for the "main" (by lack of a better term) download, but
> >this falls flat on its face for extra downloads. Indeed, so packages may
> >need to download data sets, or assets, as _EXTRA_DOWNLOADS. Those are
> >usually just data blobs, and are not actual golang or cargo packages; as
> >such they do not need to be vendored, but worse, if we try to actually
> >vendor them, this fails because the required files for vendoring are
> >missing from the archives in such data sets.
> >
> >We fix that by decoupling the download for the extra download, from the
> >download for the main archive. We pass the post-processing option only
> >to the main download.
> >
> >This makes the hard assumption that extra downloads will never need to
> >be post-processed for vendoring, of course; we hope this will always be
> >correct in practice.
> >
> >Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> >Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
>  Applied to master, thanks, with a few changes:
> 
>      - no loop needed for MAIN_DOWNLOAD, it can have only one;

In fact, that was on purpose: it can have no main download...
Indeed, a package can very well only declare extra downloads...
I forgot to explain that in the commit log, sorry.

So, either we do the loop, which is a simple way to expand to nothing
when there is no item but the reason is not obvious, or we add an
explicit $(if ...) test, which is going to be a bit more verbose...

What's your preference?

>      - remove superfluous backslash in the definition of MAIN_DOWNLOAD;

Ah, yes I forgot to drop it... Good catch.

>      - introduce _ADDITIONAL_DOWNLOADS to avoid filter-out.

I did that initially, but I thought that yet another variable could be
easily avoided with the filtering our. But OK, that's fine with me too.

Thanks!

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
