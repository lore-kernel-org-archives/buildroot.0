Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899E8C25B45
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 19:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12E8061323;
	Mon, 23 Oct 2023 19:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12E8061323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKaVrOzyvCqE; Mon, 23 Oct 2023 19:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6315F6131F;
	Mon, 23 Oct 2023 19:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6315F6131F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14A621BF36C
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 19:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE6AD4207B
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 19:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE6AD4207B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNWVqzT0zQdn for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 19:37:11 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2094B42164
 for <buildroot@uclibc.org>; Mon, 23 Oct 2023 19:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2094B42164
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qv0jc-0002qX-FQ
 for buildroot@uclibc.org; Mon, 23 Oct 2023 21:37:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 23 Oct 2023 21:36:11 +0200
Message-ID: <pan$455c4$fdeb1b54$fe1f7f5c$b1f78f42@ID-313208.user.individual.net>
References: <20231022162052.540388-1-bernd@kuhls.net>
 <721a32e6.19ae.18b5a5d7704.Coremail.andyshrk@163.com>
 <ZTY9wZpTWfdBwdx3__21731.7699267127$1698053611$gmane$org@fdugast-desk.home>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH v4 1/1] package/igt-gpu-tools: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mon, 23 Oct 2023 11:32:49 +0200 schrieb Francois Dugast:

> Besides, something seems wrong with the binaries because I get this
> error when executing any of them:
> 
>     # igt_stats igt_stats[102]: segfault at 2a9f6 ip 000000000002a9f6 sp
>     00007ffe1c1ff258 error 14 in igt_stats[55eb718d8000+1000] likely on
>     CPU 0 (core 0, socket 0)
>     Code: Unable to access opcode bytes at 0x2a9cc.
>     Segmentation fault

Hi Francois,

building igt_stats with these default options changed

BR2_SSP_NONE=y
BR2_RELRO_NONE=y
BR2_FORTIFY_SOURCE_NONE=y
BR2_ENABLE_DEBUG=y
BR2_ENABLE_RUNTIME_DEBUG=y
# BR2_STRIP_strip is not set
BR2_OPTIMIZE_G=y

solved the segfault, maybe the problem is related to
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/
102#note_1253728 ?

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
