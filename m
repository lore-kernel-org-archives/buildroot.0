Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2295C54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 11:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 808144016D;
	Sun, 17 Mar 2024 11:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIVrkT6d8Men; Sun, 17 Mar 2024 11:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95BB340275
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95BB340275;
	Sun, 17 Mar 2024 11:22:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E9A11BF420
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 11:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 574304064C
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 11:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XysvFDgr7HB for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 11:22:57 +0000 (UTC)
Received-SPF: Temperror (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73E3640642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73E3640642
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73E3640642
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 11:22:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 460BDC0002;
 Sun, 17 Mar 2024 11:22:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rlob2-001f36-1m;
 Sun, 17 Mar 2024 12:22:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240221181650.1115046-1-fontaine.fabrice@gmail.com>
Date: Sun, 17 Mar 2024 12:22:32 +0100
In-Reply-To: <20240221181650.1115046-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Feb 2024 19:16:50 +0100")
Message-ID: <871q89je6f.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,1/1] package/zlib-ng: fix arm build
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > zlib-ng usage uses CMAKE_C_COMPILER_TARGET which is non-standard and
 > is not supposed to be used by the CMakeLists.txt machinery of a
 > particular package.

 > Indeed, [1] specifies that:

 >   Some compiler drivers are inherently cross-compilers, such as clang
 >   and QNX qcc. These compiler drivers support a command-line argument
 >   to specify the target to cross-compile for.

 > buildroot is not using clang nor QNX qcc.
 > [2] also refers to this variable only for clang [3] and QNX [4].

 > Therefore, zlib-ng's usage of this variable is a bit of a hack, and it's
 > actually why it works when passed as an argument, because they are in
 > fact not supposed to use this variable.

 > So set CMAKE_C_COMPILER_TARGET to BR2_ARCH to fix the following arm
 > build failure raised since bump to version 2.0.6 in commit
 > d2249821d3f30202ca2a35ad24918378d9a0a0e8:

 > -- Detecting C compile features - done
 > -- Arch not recognized, falling back to cmake arch: 'l'
 > -- Basearch 'l' not recognized, defaulting to 'x86'.
 > -- Basearch of 'l' has been detected as: 'x86'

 > [...]

 > /home/buildroot/autobuild/instance-0/output-1/build/zlib-ng-2.1.3/arch/x86/x86_features.c:17:12: fatal error: cpuid.h: No such file or directory
 >    17 | #  include <cpuid.h>
 >       |            ^~~~~~~~~

 > [1] https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_COMPILER_TARGET.html
 > [2] https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html
 > [3] https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-using-clang
 > [4] https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-for-qnx

 > Fixes: d2249821d3f30202ca2a35ad24918378d9a0a0e8
 >  - http://autobuild.buildroot.org/results/1551aa69be19239a8d8e081f033e4027d679ab8f
 >  - http://autobuild.buildroot.org/results/075d704c0f11710353bac43478e4501addcd747d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni and Peter Korsgaard):
 >  - Update commit message

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
