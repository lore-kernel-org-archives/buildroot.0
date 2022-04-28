Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EEFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B34B283F32;
	Thu, 28 Apr 2022 21:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GnHFFoJKmkU; Thu, 28 Apr 2022 21:45:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3B5883E5D;
	Thu, 28 Apr 2022 21:45:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11BE31BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87AE41BFA
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ju2jKYJbYnts for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:45:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EC8041BF5
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:45:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77236240008;
 Thu, 28 Apr 2022 21:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651182328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nC0Hz/3BGT2H3SspvstptBTC+fPKb21f0MonWQPJPLQ=;
 b=SeHT6Hmot9zDdw6XIxq98O4ykX/nLFAG7cKV/ZUGmnDe6iflb8r7zMPdxZzr/CqNOBIjNW
 LZnHewn0T2r4250TuODxqy52511+KmiuJ2pe2AB8KKMxfJWQY0Gwd8DgurHUbLunkUfMmB
 xU6pjikfte3yHuQtWesGxT2Bw3SSkMhLLUXDNyLVte0yDWMEzfMVJ1GGxYER/4MiykKxfN
 1YEFh11QWykt0EDIXAJGf60U8PbO32/Tju17XzWwcxZgtbsRr3iGnr2IPvxdOjIa2P9YVf
 fpBwrvVqC16UJQOvIw4pUrJ64cBe9H80kHoUq67ySjR0tRB+TPljN41ISTngPw==
Date: Thu, 28 Apr 2022 23:45:27 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220428234527.3c5bb3b9@windsurf>
In-Reply-To: <20220427205057.4044072-1-fontaine.fabrice@gmail.com>
References: <20220427205057.4044072-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/numactl: needs atomic
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Apr 2022 22:50:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> numactl unconditionally uses __atomic_fetch_and resulting in the
> following build failure on microblaze since commit
> 4ed540ddf59bec4b389be44d7f42820d2466904f:

This explanation is unfortunately incorrect. It has nothing to do with
microblaze, because BR2_TOOLCHAIN_HAS_ATOMIC is true on microblaze:

config BR2_TOOLCHAIN_HAS_LIBATOMIC
        bool
        default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && \
                !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64 && \
                BR2_TOOLCHAIN_HAS_THREADS && \
                !BR2_BINFMT_FLAT

config BR2_TOOLCHAIN_HAS_ATOMIC
        bool
        default y if BR2_TOOLCHAIN_HAS_LIBATOMIC
        default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_arm
        default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_armeb
        default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_xtensa
        default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_ARCH_IS_64

However, the key thing is that the build failure
http://autobuild.buildroot.org/results/e225cb83dae390d9dc543d4da85c52180efbd40a
has thread support disabled, and when threads are disabled, libatomic
is not built, and therefore BR2_TOOLCHAIN_HAS_LIBATOMIC is false.

However, I don't see anywhere in the numactl build system where
-latomic is passed. Does it build on architectures that need to link
against libatomic to get atomic intrinsics?

Could you double check this, and rework the commit message?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
