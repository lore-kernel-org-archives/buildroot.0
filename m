Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F97C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26AE54023B;
	Sat,  8 Jan 2022 22:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BM53lMXt5UcX; Sat,  8 Jan 2022 22:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4363840185;
	Sat,  8 Jan 2022 22:05:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 707B31BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E99E8145D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxhpjS6UwwzS for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:05:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B9018145C
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:05:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 738C640002;
 Sat,  8 Jan 2022 22:05:49 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n6JqO-0000GF-Rn; Sat, 08 Jan 2022 23:05:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220108210752.3245794-1-fontaine.fabrice@gmail.com>
Date: Sat, 08 Jan 2022 23:05:48 +0100
In-Reply-To: <20220108210752.3245794-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 8 Jan 2022 22:07:52 +0100")
Message-ID: <87h7adevcz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/safeclib: fix build without
 stack-protector
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

 > Fix the following build failure without stack-protector raised since
 > bump to version 02092020 in commit
 > ebe808ac4071395b4d1e90d617c33a5e6e514af1 and
 > https://github.com/rurban/safeclib/commit/caa4408eb4a5c767f0474258af3b6ccf444e10aa:

 > /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real:
 > ../src/.libs/libsafec-3.6.0.a(safe_mem_constraint.o): in function
 > `handle_mem_bos_chk_warn':
 > safe_mem_constraint.c:(.text+0x40): undefined reference to `__stack_chk_guard'

 > If stack-protector is enabled in the Buildroot config, the toolchain
 > wrapper will make sure it is used, so there's no need for the safeclib
 > configure to handle it.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a481ee2d26a094358b0298617cce691be3077f22

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---

 > +++ b/package/safeclib/safeclib.mk
 > @@ -11,5 +11,8 @@ SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).tar.xz
 >  SAFECLIB_LICENSE = MIT
 >  SAFECLIB_LICENSE_FILES = COPYING
 >  SAFECLIB_INSTALL_STAGING = YES
 > +# We're patching configure.ac
 > +SAFECLIB_AUTORECONF = YES
 > +SAFECLIB_CONF_OPTS = --disable-hardening

I've added a comment explaining why this is done, similar to how we do
it in tpm2-tools.mk and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
