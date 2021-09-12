Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C04C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:34:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC8E61050
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CC8E61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 199DD40565;
	Sun, 12 Sep 2021 20:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JhW31pZyyS1e; Sun, 12 Sep 2021 20:34:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 244794056D;
	Sun, 12 Sep 2021 20:34:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7EA41BF404
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6F6B40287
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhTHa20_6Iti for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:34:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9190340272
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:34:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bc3c:8ee4:eb9c:c13b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E84032003CA;
 Sun, 12 Sep 2021 22:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631478886;
 bh=Wb5+vXzNPhYC2Vt4Az0W8StWglbO6g56UpPwQzhXkHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AzirRgBm1KDf8TT+1rWxg2psyOWPL3gs40uZx4g66nnCOPVcOsVx3u3fQ1SXwt9/N
 OHZ2MPEaXfqjS7ZUAtSKMf/P/nMktyyiS6QPd7o2S+QOtJ8g/UuKsYhJhcmsMMtnd9
 kl5vg84PFyigWAAy+Ws9VmwqXWj99rrOBIa4+prjBbfMHblKA/FkBp4P+ujfx4S/QS
 DPsIVYunL9ma15MOzOp0H/mfU3pInNN9ThvQfBcrnDaxjd3gOfMe9fWfL0MluMXRB+
 Er4TzjUx+XXQdCJ7iHRw1LvcoX3MNX0TbyxuVX4zTbBheCUYV6z+DwP5vPr7w8OBrV
 GmOevXimdho+A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Sep 2021 22:34:39 +0200
Date: Sun, 12 Sep 2021 22:34:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210912203439.GL1053080@scaer>
References: <20210912122252.1811311-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912122252.1811311-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix build
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
Cc: Marcin Bis <marcin@bis.org.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-12 14:22 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure which is only raised once on
> autobuilders even if pause is defined in glibc since at least 1995 and
> https://sourceware.org/git/?p=glibc.git;a=commit;h=28f540f45bbacd939bfd07f213bcad2bf730b1bf
> and in bluez5_utils since version 5.5 and
> https://github.com/bluez/bluez/commit/caab74c97542a56b591f0b16b44ab6ba4b40f0f5:

I was very confused about that, so I investigated a bit.

So, to speed up the build, I tried a build on ARM with a prebuilt
Bootlin toolchain: no failure.

Ah, but the s390x [0][1] and arc [2] failures all use an internal
toolchain. And indeed, I could reproduce the arc failure.

And guess what happened recently with the internal toolchain? We bumped
the glibc version to 2.34.

And indeed, reverting to glibc 2.33 makes the issue disappear.

So, here are the results for an arm build:

         \   bluez5_utils
    glibc \  5.60  |  5.61
    -------\-------+--------
    2.33   |  OK   |   OK
    -------+-------+--------
    2.34   |  KO   |   KO

So, even bluez5_utils 5.60 would have failed with glibc 2.33 if we
hadn't bump glibc "so fast" after we bumped bluez5_utils.

And it did not fail with pre-built toolchains becasue none is using
glibc 2.34 yet.

So, what changed in glibc between 2.33 and 2.34 that makes 'pause()'
conflict? That's a bit hard to see... Indeed, the source file for pause
hasn't changed in a meaningful way in ages.

All that I could notice about it, was that the pause() from NPTL was
dropped, to use the generic pause()... Not sure however if that's the
real cause...

Anyway, the issue is triggerred by glibc 2.34.

And your patch does make sense anyway, so do not forget to send it
upstream with the explanations about glibc 2.34. ;-)

I've tweaked the commit message too, and applied to master, thanks.

Regards,
Yann E. MORIN.

[0] http://autobuild.buildroot.org/results/c4f/c4fbface34be8815838fd7201621d7a8fddd32c5/
[1] http://autobuild.buildroot.org/results/853/85376fcfea208850542e9102f014c17ffda01e67/
[2] http://autobuild.buildroot.org/results/62b/62b88740f19fbe4a1ad7959dc141d539eb88c1f8/

> profiles/audio/media.c:1284:13: error: conflicting types for 'pause'
>  1284 | static bool pause(void *user_data)
>       |             ^~~~~
> In file included from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/bits/sigstksz.h:24,
>                  from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
>                  from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
>                  from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib.h:34,
>                  from profiles/audio/media.c:21:
> /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/unistd.h:489:12: note: previous declaration of 'pause' was here
>   489 | extern int pause (void);
>       |            ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c4f/c4fbface34be8815838fd7201621d7a8fddd32c5/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-profiles-audio-media.c-rename-pause.patch | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch
> 
> diff --git a/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch b/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch
> new file mode 100644
> index 0000000000..a7fabc9edd
> --- /dev/null
> +++ b/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch
> @@ -0,0 +1,52 @@
> +From 0bb5785a68a2799db003364770be3764af9b9034 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 12 Sep 2021 13:55:49 +0200
> +Subject: [PATCH] profiles/audio/media.c: rename pause
> +
> +Rename pause to media_player_pause to avoid the following build failure:
> +
> +profiles/audio/media.c:1284:13: error: conflicting types for 'pause'
> + 1284 | static bool pause(void *user_data)
> +      |             ^~~~~
> +In file included from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/bits/sigstksz.h:24,
> +                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
> +                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
> +                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib.h:34,
> +                 from profiles/audio/media.c:21:
> +/tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/unistd.h:489:12: note: previous declaration of 'pause' was here
> +  489 | extern int pause (void);
> +      |            ^~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/c4fbface34be8815838fd7201621d7a8fddd32c5
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + profiles/audio/media.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/profiles/audio/media.c b/profiles/audio/media.c
> +index 267722542..f93b74e67 100644
> +--- a/profiles/audio/media.c
> ++++ b/profiles/audio/media.c
> +@@ -1281,7 +1281,7 @@ static bool stop(void *user_data)
> + 	return media_player_send(mp, "Stop");
> + }
> + 
> +-static bool pause(void *user_data)
> ++static bool media_player_pause(void *user_data)
> + {
> + 	struct media_player *mp = user_data;
> + 
> +@@ -1331,7 +1331,7 @@ static struct avrcp_player_cb player_cb = {
> + 	.set_volume = set_volume,
> + 	.play = play,
> + 	.stop = stop,
> +-	.pause = pause,
> ++	.pause = media_player_pause,
> + 	.next = next,
> + 	.previous = previous,
> + };
> +-- 
> +2.33.0
> +
> -- 
> 2.33.0
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
