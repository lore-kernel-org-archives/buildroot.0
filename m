Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A27ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 15:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F0883F4C;
	Sun, 18 Sep 2022 15:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39F0883F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3KjY0YHgIh5u; Sun, 18 Sep 2022 15:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4425B83F40;
	Sun, 18 Sep 2022 15:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4425B83F40
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9AAB1BF301
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 15:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1A3640A04
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 15:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1A3640A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7y21Nt0qKrD for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 15:37:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E8B400F2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8E8B400F2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 15:37:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4908:486:8484:20b8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9BFCB19F5B0;
 Sun, 18 Sep 2022 17:37:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Sep 2022 17:37:10 +0200
Date: Sun, 18 Sep 2022 17:37:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220918153710.GC1127102@scaer>
References: <20220918125309.1128650-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918125309.1128650-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663515432;
 bh=7/MRECgjmM42xC7Jpklll1oAX8/u58HFyICoKiH29vg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B2LZEyjUk9w4CH85FGiXmkaQ7qshn6Rt4ky3p++JfoYOlSu1QKYas31/hRgjUeskM
 IDqz80X0eWSOYTxLe+qcIrq0mhn8rA0kW/IiFSlSwpg92EDEwJ9WXs6dlFDLB2MN0v
 xD+rO3w2q8YVMV/kcOiBMvZEhCoUbmJSoAmaiFBdRdKkli5Ptwez0g56Jn23/P82DS
 7t6Hb/Opva7tPzlFrpuoql795Q3Js9lg/k4XBaiG4EYSZJdVmtJonHD0fQ9nV8dYf7
 U4zRSMVN7UV/WZ4ZGlKJYKORoqI9s46jW1MmXnqSBaXEdIdL1c5rLZfiD+sWOmpAxh
 5kVHlpMBAEv+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B2LZEyjU
Subject: Re: [Buildroot] [PATCH] package/mmc-utils: fix build failure due to
 a warning and -Werror enabled
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-09-18 14:53 +0200, Giulio Benetti spake thusly:
> Add patch to fix warning that is treated like error:
> ```
> In function '__bswap_32',
>     inlined from 'do_rpmb_write_block' at mmc_cmds.c:2293:27:
> /home/autobuild/autobuild/instance-15/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/bits/byteswap.h:52:10: error: 'cnt' may be used uninitialized [-Werror=maybe-uninitialized]
>    52 |   return __builtin_bswap32 (__bsx);
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> mmc_cmds.c: In function 'do_rpmb_write_block':
> mmc_cmds.c:2270:22: note: 'cnt' was declared here
>  2270 |         unsigned int cnt;
>       |                      ^~~
> cc1: all warnings being treated as errors
> ```
> Patch is pending upstream:
> https://patchwork.kernel.org/project/linux-mmc/patch/20220918124210.1127345-1-giulio.benetti@benettiengineering.com/

Arnd requested a different fix, arguing the one you proposed is hiding a
compiler warning without fixing the root cause.

Regards,
Yann E. MORIN.

> http://autobuild.buildroot.net/results/18c4fce5416e5d1ccd95900ccef87d4c045a361e/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...ds.c-fix-warning-on-uninitialized-cn.patch | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/mmc-utils/0002-mmc-utils-mmc_cmds.c-fix-warning-on-uninitialized-cn.patch
> 
> diff --git a/package/mmc-utils/0002-mmc-utils-mmc_cmds.c-fix-warning-on-uninitialized-cn.patch b/package/mmc-utils/0002-mmc-utils-mmc_cmds.c-fix-warning-on-uninitialized-cn.patch
> new file mode 100644
> index 0000000000..e2f74879a6
> --- /dev/null
> +++ b/package/mmc-utils/0002-mmc-utils-mmc_cmds.c-fix-warning-on-uninitialized-cn.patch
> @@ -0,0 +1,27 @@
> +From bf783bbc2da0348591dd317ccd53bbfc5a57f2f8 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Sun, 18 Sep 2022 14:10:29 +0200
> +Subject: [PATCH] mmc-utils: mmc_cmds.c: fix warning on uninitialized 'cnt'
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +[Upstream status: https://patchwork.kernel.org/project/linux-mmc/patch/20220918124210.1127345-1-giulio.benetti@benettiengineering.com/]
> +---
> + mmc_cmds.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mmc_cmds.c b/mmc_cmds.c
> +index 12b7802..777d649 100644
> +--- a/mmc_cmds.c
> ++++ b/mmc_cmds.c
> +@@ -2436,7 +2436,7 @@ int do_rpmb_write_block(int nargs, char **argv)
> + 	int ret, dev_fd, key_fd, data_fd;
> + 	unsigned char key[32];
> + 	uint16_t addr;
> +-	unsigned int cnt;
> ++	unsigned int cnt = 0;
> + 	struct rpmb_frame frame_in = {
> + 		.req_resp    = htobe16(MMC_RPMB_WRITE),
> + 		.block_count = htobe16(1)
> +-- 
> +2.34.1
> +
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
