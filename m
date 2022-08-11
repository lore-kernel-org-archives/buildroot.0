Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51B8C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 21:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5488E415D5;
	Thu, 11 Aug 2022 21:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5488E415D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLnQ-KZPG9MC; Thu, 11 Aug 2022 21:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AA3A410AE;
	Thu, 11 Aug 2022 21:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AA3A410AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 271E01BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01586410AE
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01586410AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJyt8Wss5Fiy for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 21:00:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F046410AD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F046410AD
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 21:00:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CF6ED240003;
 Thu, 11 Aug 2022 21:00:38 +0000 (UTC)
Date: Thu, 11 Aug 2022 23:00:37 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220811230037.3f5ad9d1@windsurf>
In-Reply-To: <20220809211837.2549340-1-fontaine.fabrice@gmail.com>
References: <20220809211837.2549340-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660251639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAiRMCtLpdGkSwy2h0/PGcPlYkO+z6qwT2tlGyxhMic=;
 b=CVc1T3BZ4SAGKrDnP+MNH/pdOlTXfW0LS56ZDsCgp5rgInya6AxI6GyBo0NtNIPz6hcuKF
 0lKuvUuh6Yq9KPLOccX0aR//Pi9qoTCu10Cif8/1wVsWGeHQVo3P+Y+wUJHVTqME2PDzLa
 4n85SEcZMqqeK1Po1ONgINEb1E33ACUewmwK3T5ChZl59oNH+v9yi+iBrrnqVzUcHUGk0A
 DJKw8wzQy951WW/R7XIQL5MO77uCbjTR2WdwdH54E1T9bmb8/AO0lfV5hd0VD0dLiG2vFr
 hezGn6ngGkJNGK9xpHkALdIDS9Gk066+cf8/YXME5xD3oP4jLACJMM4S4rzE7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CVc1T3BZ
Subject: Re: [Buildroot] [PATCH 1/1] package/glog: fix build without threads
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
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Aug 2022 23:18:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without threads raised since bump to
> version 0.6.0 in commit 017dbc770c4fd58d7d52cf290dd3fc39a3603e0d and
> https://github.com/google/glog/commit/4a4331f2f2de4c35ce72badf0bdc604c04eebb26:
> 
> CMake Error at /home/giuliobenetti/autobuild/run/instance-1/output-1/build/glog-0.6.0/CMakeFiles/CMakeTmp/CMakeLists.txt:18 (add_executable):
>   Target "cmTC_ed950" links to target "Threads::Threads" but the target was
>   not found.  Perhaps a find_package() call is missing for an IMPORTED
>   target, or an ALIAS target is missing?
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bf0846a51da69169286c7af38089d204d3d242d1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../glog/0001-added-emscripten-support.patch  | 290 ++++++++++++++++++
>  1 file changed, 290 insertions(+)
>  create mode 100644 package/glog/0001-added-emscripten-support.patch

Applied to master after extending the comment in the patch itself to
indicate why we have this patch: it fixes build without threads, but
the fix is mixed in a larger commit adding emscripten support.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
