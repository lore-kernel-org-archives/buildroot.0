Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7787C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 05:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 508E983E45;
	Thu, 18 Aug 2022 05:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 508E983E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mENgtflWMdi1; Thu, 18 Aug 2022 05:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AB8183E3A;
	Thu, 18 Aug 2022 05:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AB8183E3A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5678D1BF869
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 05:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FC8C419C3
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 05:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FC8C419C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IHhPeOI9hN64 for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 05:55:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E296419C2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E296419C2
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 05:55:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8372E20003;
 Thu, 18 Aug 2022 05:55:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oOYV7-00Cepf-DX; Thu, 18 Aug 2022 07:55:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20211105201257.2589008-1-fontaine.fabrice@gmail.com>
 <0484d5a9-a281-8cdf-d060-f566843dfbd0@mind.be>
Date: Thu, 18 Aug 2022 07:55:29 +0200
In-Reply-To: <0484d5a9-a281-8cdf-d060-f566843dfbd0@mind.be> (Arnout
 Vandecappelle's message of "Mon, 25 Jul 2022 21:28:46 +0200")
Message-ID: <87r11e859q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bird: fix build with autoconf
 >= 2.70
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
Cc: Adrien =?utf-8?Q?Gallou=C3=ABt?= <adrien@gallouet.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 > On 05/11/2021 21:12, Fabrice Fontaine wrote:
 >> Fix the following build failure raised since bump of autoconf to version
 >> 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:
 >> checking for glob.h... no
 >> configure: error: glob.h not found.
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/d7aab7df196e0f6d6389b87ff29da7c2971e6b6d
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> ...gure.ac-fix-build-with-autoconf-2.70.patch | 43 +++++++++++++++++++
 >> 1 file changed, 43 insertions(+)
 >> create mode 100644 package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
 >> diff --git
 >> a/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
 >> b/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
 >> new file mode 100644
 >> index 0000000000..b412a55ead
 >> --- /dev/null
 >> +++ b/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
 >> @@ -0,0 +1,43 @@
 >> +From aa5bc6d2e59c5257d777a45ee4a0e0a784c44244 Mon Sep 17 00:00:00 2001
 >> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> +Date: Fri, 5 Nov 2021 20:58:41 +0100
 >> +Subject: [PATCH] configure.ac: fix build with autoconf >= 2.70
 >> +
 >> +On some embedded toolchains, glob.h detection fails because -g is
 >> +wrongly added (even when CFLAGS is overwritten):
 >> +
 >> +configure:5881: checking for glob.h
 >> +configure:5904:
 >> /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/mips64el-linux-gcc
 >> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 >> -D_FILE_OFFSET_BITS=64 -Os -g0 -pthread -fno-strict-aliasing
 >> -fno-strict-overflow -flto -Wall -Wextra -Wstrict-prototypes
 >> -Wno-parentheses -Wno-pointer-sign -Wno-missing-field-initializers
 >> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 >> -pthread -flto=4 -g conftest.c >&5
 >> +/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld:
 >> /tmp/ccldlED9.ltrans0.ltrans.o:(.debug_info+0x2a): undefined
 >> reference to `conftest.c.fb729d13'
 >> +/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld:
 >> /tmp/ccldlED9.ltrans0.ltrans.o:(.debug_info+0x2f): undefined
 >> reference to `conftest.c.fb729d13'

 >  Since this is involving functions that are generated by LTO, I think
 >  it's more likely that the issue is triggered by the -flto=4 rather
 > than the -g.

 >  Also, I saw that it only occurs on GCC8, not on any of the other
 >  myriad GCC versions that we run in the autobuilders. So it's clearly
 > a compiler bug.

 >  Regardless, this patch does fix it, so I applied to master, thanks. I
 >  largely rewrote the commit message (both of the patch and the
 > buildroot commit) and I added the quotes that I suggested
 > earlier. I've also added a comment in the .mk file to explain the
 > AUTORECONF (just pointing to the patch since the earlier reason is no
 > longer valid).

 >  Perhaps you could do another attempt to send the patch upstream?

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
