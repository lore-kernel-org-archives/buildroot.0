Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FA5C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8B9540492;
	Fri,  1 Dec 2023 20:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8B9540492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hTKCamkaGa2; Fri,  1 Dec 2023 20:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9D5F41A01;
	Fri,  1 Dec 2023 20:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9D5F41A01
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 325631BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17D5E60AEB
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17D5E60AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vIWquelpCDpe for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:25:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7B3A60BC1
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B3A60BC1
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7D17240004;
 Fri,  1 Dec 2023 20:25:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9A4S-004Ty1-0L;
 Fri, 01 Dec 2023 21:25:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, romain.naour@smile.fr
References: <20231129211011.1207351-1-fontaine.fabrice@gmail.com>
Date: Fri, 01 Dec 2023 21:25:08 +0100
In-Reply-To: <20231129211011.1207351-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 29 Nov 2023 22:10:11 +0100")
Message-ID: <87jzpx4qmz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/zlib-ng: fix arm build
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

 > Set CMAKE_C_COMPILER_TARGET to BR2_ARCH to fix the following arm build
 > failure raised since bump to version 2.0.6 in commit
 > d2249821d3f30202ca2a35ad24918378d9a0a0e8:

 > -- Detecting C compile features - done
 > -- Arch not recognized, falling back to cmake arch: 'l'
 > -- Basearch 'l' not recognized, defaulting to 'x86'.
 > -- Basearch of 'l' has been detected as: 'x86'

 > [...]

 > /home/buildroot/autobuild/instance-0/output-1/build/zlib-ng-2.1.3/arch/x86/x86_features.c:17:12: fatal error: cpuid.h: No such file or directory
 >    17 | #  include <cpuid.h>
 >       |            ^~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1551aa69be19239a8d8e081f033e4027d679ab8f
 >  - http://autobuild.buildroot.org/results/075d704c0f11710353bac43478e4501addcd747d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/zlib-ng/zlib-ng.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
 > index fbb906503a..33e8754c9d 100644
 > --- a/package/zlib-ng/zlib-ng.mk
 > +++ b/package/zlib-ng/zlib-ng.mk
 > @@ -13,6 +13,7 @@ ZLIB_NG_PROVIDES = zlib
 
 >  # Build with zlib compatible API, gzFile support and optimizations on
 >  ZLIB_NG_CONF_OPTS += \
 > +	-DCMAKE_C_COMPILER_TARGET=$(BR2_ARCH) \

Hmm,
https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_COMPILER_TARGET.html
states:

This variable may only be set in a toolchain file specified by the
CMAKE_TOOLCHAIN_FILE variable.

Should we set this in the toolchain file instead? Romain?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
