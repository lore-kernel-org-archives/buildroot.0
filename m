Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5DBC433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 12:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96B634058B;
	Sun, 20 Nov 2022 12:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96B634058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 62WqRZOk374I; Sun, 20 Nov 2022 12:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0DF14023F;
	Sun, 20 Nov 2022 12:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0DF14023F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C01941BF381
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 12:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1A5740932
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 12:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1A5740932
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpMumttJucrK for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 12:39:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4902B40919
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4902B40919
 for <buildroot@uclibc.org>; Sun, 20 Nov 2022 12:39:00 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1owjb7-000217-1S
 for buildroot@uclibc.org; Sun, 20 Nov 2022 13:38:57 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Nov 2022 12:52:41 +0100
Message-ID: <pan$46e69$9b1a6193$44c9cd85$9a8f98e@ID-313208.user.individual.net>
References: <20221120073635.E473781FEF__12689.1224341065$1668929821$gmane$org@smtp1.osuosl.org>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-11-19
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

Am Sun, 20 Nov 2022 07:36:30 -0000 schrieb Thomas Petazzoni via buildroot:

>     arm      |        libudfread-1.1.2        | NOK |
>     http://autobuild.buildroot.net/results/
78b5333b6d3cd5850cb6d3ea927a024d7bd7ec31

Hi,

trying to debug this build error

src/udfread.c:108:3: error: #error no atomic operation support
  108 | # error no atomic operation support
      |   ^~~~~
src/udfread.c: In function '_read_subdir':
src/udfread.c:1104:14: error: implicit declaration of function 
'atomic_pointer_compare_and_exchange' [-Werror=implicit-function-
declaration]
 1104 |         if (!atomic_pointer_compare_and_exchange(&dir->subdirs, 
NULL, subdirs)) {
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I reached a dead end trying to understand the logic of atomic operations 
in gcc and buildroot. The toolchain seems to have everything needed:

$ grep "ATOMIC\|SYNC" .config | grep TOOLCHAIN
BR2_TOOLCHAIN_HAS_SYNC_1=y
BR2_TOOLCHAIN_HAS_SYNC_2=y
BR2_TOOLCHAIN_HAS_SYNC_4=y
BR2_TOOLCHAIN_HAS_ATOMIC=y

although gcc lacks the necessary defines

$ output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-
gcc-11.3.0.br_real -E -dM - < /dev/null | grep SYNC
$

in particular __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 which libudfread checks 
for:

https://code.videolan.org/videolan/libudfread/-/blob/master/src/
udfread.c#L63

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
