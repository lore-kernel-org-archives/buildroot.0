Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A02C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E565608C3;
	Wed, 14 Aug 2024 21:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdJbdLXc7ZzN; Wed, 14 Aug 2024 21:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2313C608CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2313C608CD;
	Wed, 14 Aug 2024 21:48:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 214C81BF4DB
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F412608CD
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXL6ViEOOKPP for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:48:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 685D2608C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 685D2608C3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 685D2608C3
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:48:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66178FF808;
 Wed, 14 Aug 2024 21:48:32 +0000 (UTC)
Date: Wed, 14 Aug 2024 23:48:31 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240814234831.075a917b@windsurf>
In-Reply-To: <20240812214014.2434246-1-ju.o@free.fr>
References: <20240812214014.2434246-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723672112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXhVc7QLcsaequwt7vjrVCZEL3zcdTj9ZOdFpCjro0o=;
 b=fyzsSQ8+Uwhv/NsqFo8FjBm4mOfdAA+/e1g/QHDvwA24vQRNW2vJnrYgdBh6yVP9BoBdMK
 X6OTlvrHJGaVe97Du11Pw3f53maIaXhQrMUAaEuuoDRmJ+g6ydLhmdfh7v/0WGEV040yLu
 USuYje1ysuheV3hQngyroVo7fweKNfoh0+/BazTCx+wxsATUqeAdTlXW0hqF1gsZ2ODZ5Y
 nTdczUQ30CAc1XleV3QWg0Ja0UixUnINpe8kih1zA8xSbcI0/h4zYZodQ2adM/RQ8FDheT
 zqsqMdFOM4hwDx+ePclSMfGtK/4SYBnYaZT968xz++PJQgMS1hY6SFxkOGIW7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fyzsSQ8+
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libgpg-error: needs MMU
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Aug 2024 23:40:14 +0200
Julien Olivain <ju.o@free.fr> wrote:

> libgpg-error imported code using fork() in commit [1] and enabled it
> soon after in [2]. Those commits were first included in libgpg-error
> version 1.28.
> 
> For reference, the libgpg-error Buildroot package was updated to that
> version in commit [3].
> 
> When Buildroot configuration has no MMU support (e.g. BR2_USE_MMU is
> not set), libgpg-error fails to build with error:
> 
>     /build/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./.libs/libgpg-error.a(libgpg_error_la-spawn-posix.o): in function '_gpgrt_process_spawn':
>     spawn-posix.c:(.text+0x630): undefined reference to 'fork'
> 
> This issue can be observed with the command:
> 
>     utils/test-pkg -a -p libgpg-error
> 
> It will show few build failures:
> 
>     ...
>        bootlin-armv7m-uclibc [ 6/41]: FAILED
>     ...
>     bootlin-m68k-5208-uclibc [ 8/41]: FAILED
>     ...
> 
> This commit fixes the issue by adding the dependency on BR2_USE_MMU
> in BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS. Doing so will
> automatically propagates this dependency to all packages using
> libgpg-error (and thus, already depending on this _ARCH_SUPPORTS).
> 
> Fixes:
> http://autobuild.buildroot.org/results/dbc82ba08e6a30c2f558c8c36ad7eeb0e3cab090/
> http://autobuild.buildroot.org/results/074a803de0f48cd86b9135cca50f136cccf1bcea/
> http://autobuild.buildroot.org/results/4c1966a71020af31c1dc1b0a13a3928c84e75874/
> ...and many others.
> 
> [1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=8f41cc23b12485404203be5881aaaadb78696b4d
> [2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=1865c0ba1769b407a3c504f1ab0a4278704a9fc1
> [3] https://gitlab.com/buildroot.org/buildroot/-/commit/692d191c8b0b3c86022e6a6ba3bd2d8f53b39f03
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2: Suggested by Thomas:
> - Moved the BR2_USE_MMU dependency in _ARCH_SUPPORTS
> - Removed all package updates, since they are now unneeded
> ---
>  package/libgpg-error/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
