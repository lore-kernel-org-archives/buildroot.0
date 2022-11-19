Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567D7C4332F
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 13:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC0F960B9D;
	Sat, 19 Nov 2022 13:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC0F960B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRrElwzBRPQZ; Sat, 19 Nov 2022 13:47:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DD0560AD7;
	Sat, 19 Nov 2022 13:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DD0560AD7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9739A1BF2BA
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 13:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 731C160AD7
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 13:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 731C160AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bOoHC6dfYsLj for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 13:47:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5264C60AAC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5264C60AAC
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 13:47:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C841740002;
 Sat, 19 Nov 2022 13:47:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1owOCC-003TM2-KU; Sat, 19 Nov 2022 14:47:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221116222908.26711-1-fontaine.fabrice@gmail.com>
Date: Sat, 19 Nov 2022 14:47:48 +0100
In-Reply-To: <20221116222908.26711-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 16 Nov 2022 23:29:08 +0100")
Message-ID: <87mt8n6oor.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: fix configure options
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Rename configure options to avoid the following build failure raised
 > since bump to version 3.2.5 in commit
 > ae2807821d897c16141d003f646475fee9e77cba:

 > ./simd-checksum-x86_64.cpp: In function 'uint32_t get_checksum1_cpp(char*, int32_t)':
 > ./simd-checksum-x86_64.cpp:89:52: error: multiversioning needs 'ifunc' which is not supported on this target
 >    89 | __attribute__ ((target("default"))) MVSTATIC int32
 > get_checksum1_avx2_64(schar* buf, int32 len, int32 i, uint32* ps1,
 > uint32* ps2) { return i; }
 >       |                                                    ^~~~~~~~~~~~~~~~~~~~~
 > ./simd-checksum-x86_64.cpp:480:1: error: use of multiversioned function without a default
 >   480 | }
 >       | ^
 > If you can't fix the issue, re-run ./configure with --disable-roll-simd.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/069da8e585da2e51bfd4f475cc12b9a134954b08

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
