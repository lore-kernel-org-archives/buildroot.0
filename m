Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ADDC5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 07:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 914FA81A6D;
	Wed,  6 Mar 2024 07:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtwAjmqVNV-X; Wed,  6 Mar 2024 07:25:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A850D81AEF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A850D81AEF;
	Wed,  6 Mar 2024 07:25:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B8F91BF584
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 07:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7574C60750
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 07:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tfg5GZjuV59Y for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 07:25:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41FF4605BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41FF4605BD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41FF4605BD
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 07:25:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6B8320003;
 Wed,  6 Mar 2024 07:25:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rhleZ-0017Rt-0J;
 Wed, 06 Mar 2024 08:25:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240305132148.919233-1-fontaine.fabrice@gmail.com>
Date: Wed, 06 Mar 2024 08:25:27 +0100
In-Reply-To: <20240305132148.919233-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 5 Mar 2024 14:21:48 +0100")
Message-ID: <87zfvbyg7s.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libcgroup: fix build with
 BR2_TIME_BITS_64
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

 > Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
 > following build failure with BR2_TIME_BITS_64 raised since commit
 > 3c427c64726560ea1743282a3fdb78f5b28692eb:

 > In file included from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
 >                  from ../include/libcgroup/error.h:9,
 >                  from ../include/libcgroup.h:21,
 >                  from log.c:15:
 > /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >    26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >       |     ^~~~~

 > Indeed, this LFS workaround is there since the addition of the package
 > in commit ff7191c12e88b044848f6655f7015335235bdc7a and is only needed to
 > fix a build failure with the old codesourcery-arm toolchain from 2014
 > which uses glibc < 2.23. as glibc 2.23 was released in February 2016:
 > https://sourceware.org/glibc/wiki/Release/2.23, drop this workaround as
 > already done for libselinux in commit
 > c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
 > drop codesourcery-arm toolchain.

 > Fixes: 3c427c64726560ea1743282a3fdb78f5b28692eb
 >  - No autobuilder failures (yet)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
