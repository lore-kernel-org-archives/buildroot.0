Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D62CEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 18:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 134FD60B70;
	Sun, 18 Jun 2023 18:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 134FD60B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OfI3GOjgqaOM; Sun, 18 Jun 2023 18:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3895060745;
	Sun, 18 Jun 2023 18:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3895060745
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D10F21BF59B
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 18:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAE2760745
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 18:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAE2760745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-VkZdYqDM8t for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 18:35:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D11A260740
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D11A260740
 for <buildroot@uclibc.org>; Sun, 18 Jun 2023 18:35:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qAxEy-0009iT-TC
 for buildroot@uclibc.org; Sun, 18 Jun 2023 20:35:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 18 Jun 2023 20:34:46 +0200
Message-ID: <pan$ae126$3b193365$84b07393$14723f99@ID-313208.user.individual.net>
References: <20230507142319.1001150-1-bernd.kuhls@t-online.de>
 <20230507142319.1001150-2-bernd.kuhls@t-online.de>
 <20230618162525.GB2754__2479.91979574493$1687105555$gmane$org@scaer>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 2/2] package/libdisplay-info: new package
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

Am Sun, 18 Jun 2023 18:25:25 +0200 schrieb Yann E. MORIN:

Hi Yann,

>> +Upstream: https://gitlab.freedesktop.org/emersion/libdisplay-info/-/
merge_requests/163
> 
> This has now been merged, good! So, when you respin, please update to
> use a pointer to the actual commit, not the MR. Thanks!

done in v2.

>> +# workaround for static_assert on uclibc-ng < 1.0.42
>> +LIBDISPLAY_INFO_CFLAGS += $(TARGET_CFLAGS) -
Dstatic_assert=_Static_assert
> 
> So what happens with toolchains using uclibc-ng >= 1.0.42 ?

No negative impact, it just works ;) A similar fix is used by iproute2:
https://git.busybox.net/buildroot/commit/package/iproute2/iproute2.mk?
id=f640de44fac0c31e26e23a35b39d2b49b2060fbd

>> +LIBDISPLAY_INFO_CONF_OPTS += -Db_staticpic=false
> 
> If static+PIC is really borked on coldfire, then we should do that for
> all packages, not just libdisplay-info, no?
> 
> If so, then it should go into the meson-package infra, i.e. in
> package/pkg-meson.mk around line 158.

Done: https://patchwork.ozlabs.org/project/buildroot/patch/
20230618183105.2474342-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
