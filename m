Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1431C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F58B41640;
	Fri, 22 Jul 2022 21:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F58B41640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7vumm2JPaFl; Fri, 22 Jul 2022 21:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EC5B4159A;
	Fri, 22 Jul 2022 21:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EC5B4159A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87FD31BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 527D74163C
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 527D74163C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5TqIWnSoozg for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:31:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C93144159A
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C93144159A
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:31:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DF833240004;
 Fri, 22 Jul 2022 21:31:12 +0000 (UTC)
Date: Fri, 22 Jul 2022 23:31:12 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220722233112.7c00f940@windsurf>
In-Reply-To: <20211228095539.25395-1-giulio.benetti@benettiengineering.com>
References: <CAPi7W825_W9CaJKSSY4DW9qT2GjWtfvTOP9KaCz2KCAyKF8LiA@mail.gmail.com>
 <20211228095539.25395-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658525474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wx2VgeAcFcildLpGUKiIhJQya5t33U4Pgut5bTTpi7k=;
 b=V2V5M5Jhs/FdzHlZtvfNvUTSLQxqTj9mxj2sDXzTu4Rig1g8URAEbGtDiuMQQrVbIb6I1D
 RJ9z4SXSY8h311KKeiAiZN4hlJBiK+1O/F+G8DL70YGctl+5pMZG4kEia4fGbVBr4aP4NX
 UC/pbSTXJEZ1zhAUfQ17E2dkJeMvIt9en33JJ9swxCEv2yy/I1lNKcK3vOA9ydVAvdTn7z
 Vx9LXTJLeqMAMKtoHeyG6tdxFeP3zeUmMSnoHt9Kz3rAOh3ZUXSTqt48OQpoQ8nfV5jCr/
 odbNl5ASxHO5gDseYkyjFwxeffYwJzaDC0vHwCGC3LypDNEZ9UvjJPQRkoDDOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V2V5M5Jh
Subject: Re: [Buildroot] [PATCH v3] package/harfbuzz: fix host build failure
 due to C++11
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Simon Dawson <spdawson@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>, James Knight <james.knight@collins.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Tue, 28 Dec 2021 10:55:39 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Package harfbuzz fails to build for host with error:
> ```
> ../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
>    static_assert (std::is_trivially_copyable<K>::value, "");
> ```
> 
> Only starting from gcc version 5.0 we have 'is_trivially_copyable' member
> of std. So let's depend on BR2_HOST_GCC_AT_LEAST_5 for harfbuzz itself
> and all host-harfbuzz dependencies, but let's also depend on
> BR2_TOOLCHAIN_GCC_AT_LEAST_5 for all the harfbuzz direct and reverse
> dependencies since the configure/build statements are the same for host
> and target harfbuzz package.
> 
> Fixes:
> http://autobuild.buildroot.net/results/89e1194c1659d7e1af9db8ffe5feee770c448f76
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * add BR2_TOOLCHAIN_GCC_AT_LEAST_5 to harfbuzz and its dependencies
> V2->V3:
> * add BR2_HOST_GCC_AT_LEAST_5 to all host-harfbuzz dependencies
> ---
>  package/adwaita-icon-theme/Config.in           |  5 +++++
>  package/cwiid/Config.in                        |  2 +-
>  package/efl/Config.in                          |  1 +
>  package/enlightenment/Config.in                |  6 +++---
>  package/gstreamer1/gst1-plugins-bad/Config.in  | 17 +++++++++--------
>  package/gstreamer1/gst1-plugins-base/Config.in |  6 +++---
>  package/gtkmm3/Config.in                       |  2 +-
>  package/harfbuzz/Config.in                     |  8 +++++---
>  package/imagemagick/Config.in.host             |  4 ++++
>  package/kodi/Config.in                         |  2 +-
>  package/libass/Config.in                       |  6 +++---
>  package/libfm/Config.in                        |  6 +++---
>  package/libgtk2/Config.in                      |  6 +++---
>  package/libgtk3/Config.in                      |  2 +-
>  package/librsvg/Config.in                      |  6 +++---
>  package/mupdf/Config.in                        |  6 +++---
>  package/openbox/Config.in                      |  6 +++---
>  package/pango/Config.in                        |  8 +++++---
>  package/pangomm/Config.in                      |  8 ++++----
>  package/pcmanfm/Config.in                      |  6 +++---
>  package/pinentry/Config.in                     |  6 +++---
>  package/python-pymupdf/Config.in               |  6 +++---
>  package/qt5/qt5base/Config.in                  |  2 +-
>  package/rrdtool/Config.in                      |  6 +++---
>  package/supertuxkart/Config.in                 |  6 +++---
>  package/xscreensaver/Config.in                 |  6 +++---
>  26 files changed, 80 insertions(+), 65 deletions(-)

This patch is no longer needed since harfbuzz upstream commit
c657c4e1f8e6f23828fefbc441b01f7bee685c79, which is upstream since
release 4.3.0.

This commit goes like this:

commit c657c4e1f8e6f23828fefbc441b01f7bee685c79
Author: Thomas Devoogdt <thomas.devoogdt@barco.com>
Date:   Tue May 10 10:00:06 2022 +0200

    [meta] fix type traits on gcc 4.9 #3526
    
    Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Much simpler than having to propagate this crazy host gcc dependency!
:-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
