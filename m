Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C67C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 262CD435DF;
	Wed, 10 Jan 2024 20:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 262CD435DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uL1QV-7IzZau; Wed, 10 Jan 2024 20:09:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F05C043731;
	Wed, 10 Jan 2024 20:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F05C043731
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B8851BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F06843731
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F06843731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bid__bZpXbnG for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:09:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7532F435DF
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7532F435DF
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5A7A1BF205;
 Wed, 10 Jan 2024 20:09:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNeso-008mKD-39;
 Wed, 10 Jan 2024 21:09:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20231231181437.582286-1-ju.o@free.fr>
Date: Wed, 10 Jan 2024 21:09:02 +0100
In-Reply-To: <20231231181437.582286-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 31 Dec 2023 19:14:37 +0100")
Message-ID: <87bk9t9cip.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH RFC 1/1] boot/edk2: unset MAKEFLAGS in build
 environment
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Yann reported in [1] that edk2 build could sometimes fail. The issue
 > can be reproduced when per-package directories is enabled, or also
 > when building on a system with GNU Make >= 4.4 using the
 > "--shuffle=reverse" option (such as Fedora 39). Those are pointing
 > toward a Makefile dependency issue.

 > The issue can be reproduced with commands:

 >     cat > .config <<EOF
 >     BR2_riscv=y
 >     BR2_RISCV_64=y
 >     BR2_TOOLCHAIN_EXTERNAL=y
 >     BR2_TARGET_EDK2=y
 >     EOF
 >     make olddefconfig

 > Then, building either with:

 >     make --shuffle=reverse

 > Or:

 >     utils/config -e BR2_PER_PACKAGE_DIRECTORIES
 >     make olddefconfig
 >     make -j$(nproc)

 > It is interesting to mention that when using "make --shuffle=reverse"
 > to build, the build can be completed if restarted only with "make". It
 > will not pull any other Buildroot package. This fact hints toward a
 > Makefile dependency issue internal to the EDK2 build system, rather
 > than in the Buildroot recipe.

 > The EDK2 build system is quite unique. See [2]. It generates files,
 > makefiles and internally uses GNU Make to compile code. This system is
 > likely not tested as being a sub-Make process in a complex Makefile
 > such as Buildroot.

 > In order to prevent Buildroot to pass unexpected Make flags to the
 > EDK2 sub-Make, this commit unset the MAKEFLAGS variable in the EDK2
 > build environment. This will put the EDK2 build script in a more
 > common and tested state. See GNU Make documentation about recursive use
 > of Make, more specifically [3].

 > Note: as mentioned, the build failure is likely due to an internal
 > issue of the EDK2 build system. The failure points to a missing
 > dependency in the EDK2 generator itself. This commit does not fix this
 > issue, but rather put the EDK2 build system in a normalized
 > environment, avoiding Buildroot flags being passed to the internal
 > EDK2 sub-Make invocation. The upstream EDK2 build system most likely
 > need a fix too.

 > Fixes:

 >     make[2]: *** No rule to make target '/buildroot/output/build/edk2-edk2-stable202308/Build/RiscVVirtQemu/RELEASE_GCC5/RISCV64/MdeModulePkg/Application/UiApp/UiApp/DEBUG/UiApp.efi', needed by '/buildroot/output/build/edk2-edk2-stable202308/Build/RiscVVirtQemu/RELEASE_GCC5/FV/Ffs/462CAA21-7614-4503-836E-8AB6F4662331UiApp/UiApp.offset'.  Stop.

 >     build.py...
 >      : error 7000: Failed to execute command
 > 	    make tbuild [/buildroot/output/build/edk2-edk2-stable202308/Build/RiscVVirtQemu/RELEASE_GCC5/RISCV64/MdeModulePkg/Application/UiApp/UiApp]

 >     build.py...
 >      : error F002: Failed to build module
 > 	    /buildroot/output/build/edk2-edk2-stable202308/MdeModulePkg/Application/UiApp/UiApp.inf [RISCV64, GCC5, RELEASE]

 > [1] https://lists.buildroot.org/pipermail/buildroot/2023-December/681507.html
 > [2] https://tianocore-docs.github.io/edk2-BuildSpecification/draft/4_edk_ii_build_process_overview/42_build_process_overview.html
 > [3] https://www.gnu.org/software/make/manual/make.html#Options_002fRecursion

 > Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Nice description!

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
