Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E78C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 09:50:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B1296113C
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 09:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B1296113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5EC060595;
	Sat,  7 Aug 2021 09:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSD9kM5sqcEh; Sat,  7 Aug 2021 09:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66E460689;
	Sat,  7 Aug 2021 09:50:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9DD1BF5E0
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 09:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 077FE8340C
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 09:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXlEFqBBI7Lq for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 09:50:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCE2A82C04
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 09:50:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f16c:16be:6f47:5c9a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 31CF013F866;
 Sat,  7 Aug 2021 11:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628329811;
 bh=I3GebyLAsSeoHiY6SE+bl9WTqKWqXYhwt+WTkNwHC2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Aw9ID7xQQ2LmMbJEJaqB9XMLXINXAwVTi8wo/YME587qeOFyblAIhna3K//ekExFx
 HcVbks7aeo2yOzTGx3W4fBN5wUZsIAD+t1Uqr4w6xpKnxtO8DsL4xcsJS+vnHGG6iF
 mDsXuBtyfAc8utkVKv2tjWdRdTZFAwJREqxYpbKwWPSvcriAOC7wnjUqEfAIWfjBOL
 u/jHy80nnWMgY9EbZfYzcPnI/ejMi05VsDI/wZrbix3C+/DkvtqC8fBpJwzpZMECYx
 3FC8Iu1s6bCqgTe0uGOUc+EQvrHnX4inDNElre71E3YRAaiZSoTGproVGlgytuB0wT
 RLIRoll7sgD6g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 11:50:02 +0200
Date: Sat, 7 Aug 2021 11:50:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210807095002.GY27036@scaer>
References: <20210806143641.3449707-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806143641.3449707-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: add -latomic to
 libavformat.pc
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-06 16:36 +0200, Fabrice Fontaine spake thusly:
> -latomic was added to extralibs to fix static build of ffmpeg in commit
> fc8798197b57488a852e2c14b4677b5eb0114a0b. However, extralibs is not
> added to libavformat.pc resulting in the following static build failure
> of motion:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libavformat.a(fifo.o): in function `fifo_init':
> /home/buildroot/autobuild/instance-1/output-1/build/ffmpeg-4.4/libavformat/fifo.c:519: undefined reference to `__atomic_store_8'
> 
> So add a patch to add extralibs (and so -latomic) to libavformat.pc
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/62ec618e40081a250b8129ec6f5a178eb06fba1d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-add-extralibs-to-extralibs_avformat.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/ffmpeg/0004-configure-add-extralibs-to-extralibs_avformat.patch
> 
> diff --git a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_avformat.patch b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_avformat.patch
> new file mode 100644
> index 0000000000..f4a2f75e59
> --- /dev/null
> +++ b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_avformat.patch
> @@ -0,0 +1,30 @@
> +From 2aee898241246d293bed9b609926b4a8014dfcb9 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 6 Aug 2021 09:17:20 +0200
> +Subject: [PATCH] configure: add extralibs to extralibs_avformat
> +
> +Add extralibs to extralibs_avformat to allow applications such as motion
> +to retrieve ffmpeg dependencies such as -latomic through pkg-config
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: not upstreamable]
> +---
> + configure | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure b/configure
> +index 0bb3a7cf2b..cb366c3ba6 100755
> +--- a/configure
> ++++ b/configure
> +@@ -7604,7 +7604,7 @@ LIBPREF=${LIBPREF}
> + LIBSUF=${LIBSUF}
> + extralibs_avutil="$avutil_extralibs"
> + extralibs_avcodec="$avcodec_extralibs"
> +-extralibs_avformat="$avformat_extralibs"
> ++extralibs_avformat="$avformat_extralibs $extralibs"
> + extralibs_avdevice="$avdevice_extralibs"
> + extralibs_avfilter="$avfilter_extralibs"
> + extralibs_avresample="$avresample_extralibs"

Shouldn't we also add $extralibs to all, instead of just avformat?

Regards,
Yann E. MORIN.

> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
