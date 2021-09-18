Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16113C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 16:02:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0BFD60EE9
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 16:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0BFD60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB50660704;
	Sat, 18 Sep 2021 16:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBGTItLioXD3; Sat, 18 Sep 2021 16:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96871606C6;
	Sat, 18 Sep 2021 16:02:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E84941BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 16:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D80A8605C8
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 16:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DwUxvJDnfuDo for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 16:00:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8005600B6
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 16:00:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2221FB004D5;
 Sat, 18 Sep 2021 18:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631980839;
 bh=W2lQFQW+kfM4ITOgOsdbAzTNcAJfeYbgcffqJV0I32g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KMTUjrJhJUqnWuWTE/Ft7e3viy9OHUYp1L/1QdCreFxLGGsjsGSAUAZLBIleF9j6x
 Yj1EtiQqP0PymflwPUmmFyi20fwwCNB+3NbmAYPwrB66JG2vsqYcIVbgTRXexzvkjj
 KWDJ+TopIMX8A/fK5Wx+RxoykhTGKibpWFI42gpwUZ1xbyN1x6kQwG5xKZ/YBbEE+V
 4+Ea+lCLLhjTWJtMbmIdkS8i7cJxjc+DiFNoCwVtAJPOakmyp68meRZnbQCHiwpOlQ
 lnOsKndFMDs7SQlXc8gn1X78ba+giYZJLBsbyXydSVyTz1+LrJ5PSuS3e0JyfpUTHG
 qdEK8wTfLf2lQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 18:00:34 +0200
Date: Sat, 18 Sep 2021 18:00:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210918160034.GE1053080@scaer>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 00/13] GStreamer 1.18.5 stable bug fix
 release
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Peter, All,

On 2021-09-13 23:03 +0200, Peter Seiderer spake thusly:
> GStreamer 1.18.5 stable bug fix release
> 
> For details see [1].
> 
> [1] https://gstreamer.freedesktop.org/releases/1.18/#1.18.5
> 
> Peter Seiderer (13):
>   package/gstreamer1: bump version to 1.18.5
>   package/gst1-plugins-base: bump version to 1.18.5
>   package/gst1-plugins-good: bump version to 1.18.5
>   package/gst1-plugins-bad: bump version to 1.18.5
>   package/gst1-plugins-ugly: bump version to 1.18.5
>   package/gst1-devtools: bump version to 1.18.5
>   package/gst1-libav: bump version to 1.18.5
>   package/gst1-vaapi: bump version to 1.18.5
>   package/gst1-rtsp-server: bump version to 1.18.5
>   package/gstreamer1-editing-services: bump version to 1.18.5
>   package/gst-omx: bump version to 1.18.5
>   package/gst1-python: bump version to 1.18.5
>   package/gst1-interpipe: bump version to 1.1.5

Whole series applied to master, thanks.

Regards,
Yann E. MORIN.

>  package/gstreamer1/gst-omx/gst-omx.hash       |  4 +-
>  package/gstreamer1/gst-omx/gst-omx.mk         |  2 +-
>  .../gst1-devtools/gst1-devtools.hash          |  4 +-
>  .../gstreamer1/gst1-devtools/gst1-devtools.mk |  2 +-
>  .../gst1-interpipe/gst1-interpipe.hash        |  2 +-
>  .../gst1-interpipe/gst1-interpipe.mk          |  2 +-
>  package/gstreamer1/gst1-libav/gst1-libav.hash |  4 +-
>  package/gstreamer1/gst1-libav/gst1-libav.mk   |  2 +-
>  .../gst1-plugins-bad/gst1-plugins-bad.hash    |  4 +-
>  .../gst1-plugins-bad/gst1-plugins-bad.mk      |  2 +-
>  ...gstgl-Fix-build-when-Meson-0.58.0rc1.patch | 51 -------------------
>  .../gst1-plugins-base/gst1-plugins-base.hash  |  4 +-
>  .../gst1-plugins-base/gst1-plugins-base.mk    |  2 +-
>  .../gst1-plugins-good/gst1-plugins-good.hash  |  4 +-
>  .../gst1-plugins-good/gst1-plugins-good.mk    |  2 +-
>  .../gst1-plugins-ugly/gst1-plugins-ugly.hash  |  4 +-
>  .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |  2 +-
>  .../gstreamer1/gst1-python/gst1-python.hash   |  4 +-
>  package/gstreamer1/gst1-python/gst1-python.mk |  2 +-
>  .../gst1-rtsp-server/gst1-rtsp-server.hash    |  4 +-
>  .../gst1-rtsp-server/gst1-rtsp-server.mk      |  2 +-
>  package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  4 +-
>  package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   |  2 +-
>  .../gstreamer1-editing-services.hash          |  4 +-
>  .../gstreamer1-editing-services.mk            |  2 +-
>  package/gstreamer1/gstreamer1/gstreamer1.hash |  4 +-
>  package/gstreamer1/gstreamer1/gstreamer1.mk   |  2 +-
>  27 files changed, 38 insertions(+), 89 deletions(-)
>  delete mode 100644 package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch
> 
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
