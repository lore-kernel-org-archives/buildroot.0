Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE74C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:23:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76C3A60BD3
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76C3A60BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34175400AE;
	Sun,  8 Aug 2021 20:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9_Q5SrbbiOS; Sun,  8 Aug 2021 20:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3055A401BD;
	Sun,  8 Aug 2021 20:22:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1508A1BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1118C402C9
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3vVfrheYdKHG for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:22:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE132402C1
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:22:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 26F96240003;
 Sun,  8 Aug 2021 20:22:53 +0000 (UTC)
Date: Sun, 8 Aug 2021 22:22:52 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210808222252.622b4470@windsurf>
In-Reply-To: <20210807213254.2103314-1-fontaine.fabrice@gmail.com>
References: <20210807213254.2103314-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix build on ARM big
 endian
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat,  7 Aug 2021 23:32:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the follownig build failure on ARM big endian raised since bump to
> version 3.68 in commit 0a73b9b962421ce7a72c88e5f5bbd8849f21b041:
> 
> Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Compress_Native':
> sha256-armv8.c:(.text.SHA256_Compress_Native+0x0): multiple definition of `SHA256_Compress_Native'
> Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Compress_Native+0x0): first defined here
> Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Update_Native':
> sha256-armv8.c:(.text.SHA256_Update_Native+0x0): multiple definition of `SHA256_Update_Native'
> Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Update_Native+0x0): first defined here
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/237aba0c16a34fec1b0fe50fe08cace438eda1bf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...2.c-fix-SHA256-redefinition-on-ARM-b.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch

I have applied to master. Giulio: I saw your comments, and we will
definitely be interested in hearing upstream's feedback.

However, what happens seems pretty clear: on Aarch64 (little endian or
big endian), sha256-armv8.c gets compiled, and it defines a function
called SHA256_Compress_Native(). This sha256-armv8.c code is included
inside a USE_HW_SHA2 conditional, so it is only compiled in if
USE_HW_SHA2 is defined.

sha512.c, which is architecture-independent generic code, also
implements a function called SHA256_Compress_Native(). It only defines
it when !USE_HW_SHA2, to not conflict with architecture-optimized
variants... but due to the bug it also defines it when !LITTLE_ENDIAN.
This doesn't make sense because there is nothing that prevents the
sha256-armv8.c code from being compiled in big-endian Aarch64, and this
issue was introduced when someone optimized the sha256 code for x86, as
pointed by Fabrice.

So I believe Fabrice's solution is OK, but of course, upstream will
confirm (or not).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
