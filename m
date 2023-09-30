Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56DEE728E1
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A5AF4212C;
	Sat, 30 Sep 2023 19:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A5AF4212C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yo4rpha0rhy7; Sat, 30 Sep 2023 19:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 964F6420F6;
	Sat, 30 Sep 2023 19:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 964F6420F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BEE21BF2A7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0279281CBA
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0279281CBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eq-QK0bSwlwy for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:03:20 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A9B381C6F
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A9B381C6F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38F4F1C0003;
 Sat, 30 Sep 2023 19:03:16 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmfFE-00FkU0-Fa; Sat, 30 Sep 2023 21:03:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <A79A145F-0D4E-40BC-9B67-889333FCDCF7@superbox.one>
 <20230423130519.GH2696@scaer>
Date: Sat, 30 Sep 2023 21:03:16 +0200
In-Reply-To: <20230423130519.GH2696@scaer> (Yann E. MORIN's message of "Sun,
 23 Apr 2023 15:05:19 +0200")
Message-ID: <878r8n8owb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] opkg-utils binaries did not installed with make
 install-utils
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
Cc: Michael Hacker <mh@superbox.one>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Michael, All,
 > On 2023-04-19 05:22 +0200, Michael Hacker spake thusly:
 >> There seems to be something wrong in the
 >> opkg-utils.mk. install-utils does not run correctly and some tools
 >> are missing, e.g. opkg-utils.
 >> 
 >> I have a patch for it and after that everything is installed correctly:
 >> 
 >> diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
 >> index ad267c5c94..384a7323ee 100644
 >> --- a/buildroot/package/opkg-utils/opkg-utils.mk
 >> +++ b/buildroot/package/opkg-utils/opkg-utils.mk
 >> @@ -16.7 +16.7 @@ HOST_OPKG_UTILS_DEPENDENCIES = \
 >> host-xz
 >> 
 >> # Nothing to build; only scripts to install.
 >> -define OPKG_UTILS_INSTALL_CMDS
 >> +define OPKG_UTILS_INSTALL_TARGET_CMDS

 > Eh, good catch! ;-)

 > Can you please resend with a proper commit log, and your sign-off:

 >     package/opkg-utils: actually install to target

 >     Commit b9bf1c6535cb (package/opkg-utils: add opkg-utils as target
 >     pkg) mis-spelled the macro to install to target, most probably as a
 >     bad copy-paste from the host macro.

 >     Fix that.

 >     Signed-off-by: You Real Name <your-email>

That never happened, so I've pushed a fix myself.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
