Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB9DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 22:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60CB34012B;
	Sun, 30 Jan 2022 22:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tE8ATxb_4ZAa; Sun, 30 Jan 2022 22:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CA974019C;
	Sun, 30 Jan 2022 22:40:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96EB81BF4DA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8360340350
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zknIseK7PRUV for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 22:40:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C54784034F
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 22:40:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77066240002;
 Sun, 30 Jan 2022 22:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643582415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYUejMtjeMjkggpQIDDgynX/Ij5xc/ajJ9Ub4eXle7E=;
 b=VkE+UZqDoTeDw9gdm8P7I+SVgmQQWGyv0nsYACuKMy9eZfPAjBuouYTUrKi1Eo29KMyb4m
 0+Ljk/x42nhW4axkUqvebTlzsRYHivuu6dhr0alYMDLRxrRu7DjKWYIU5ZoKhMXRi5e9sZ
 XwH9gr749vmKh0slWAAH9kx2YlY208H0BOdbDXrQdhmLy0OaEJleE2N43OSK9qJMaQUX/K
 gjehAIeRNiKpvl2idUXULRqdLKwDoCwe9q4q0LFfZNEj51VRzy4zEmz2lC4a/tr56kf80b
 P03gegqcAHT0DUR0qwuLydcU7g80YfALDidLm0ebiBaenHJZLsp30pNr6ARUgw==
Date: Sun, 30 Jan 2022 23:40:14 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220130234014.3cf1a805@windsurf>
In-Reply-To: <20220128124538.31789-2-ps.report@gmx.net>
References: <20220128124538.31789-1-ps.report@gmx.net>
 <20220128124538.31789-2-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 2/3] package/log4cxx: fix boost-fallback
 (only check for boost if really needed)
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jan 2022 13:45:37 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - add patch 0002-boost-fallback-only-check-for-boost-if-really-needed.patch
>   to check for boost if really needed (in case of legacy c++ standard < c++17)
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/8d49ab7cd9952f6a13bdd330e875012d0601f1d2
> 
>   -- Found Boost: .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include (found version "1.78.0") found components: thread chrono missing components: date_time atomic
>   CMake Error at .../build/log4cxx-0.12.0/boost-fallback-compile-tests/CMakeFiles/CMakeTmp/CMakeLists.txt:19 (add_executable):
>     Target "cmTC_aac37" links to target "Boost::date_time" but the target was
>     not found.  Perhaps a find_package() call is missing for an IMPORTED
>     target, or an ALIAS target is missing?
> 
>   CMake Error at .../build/log4cxx-0.12.0/boost-fallback-compile-tests/CMakeFiles/CMakeTmp/CMakeLists.txt:19 (add_executable):
>     Target "cmTC_aac37" links to target "Boost::atomic" but the target was not
>     found.  Perhaps a find_package() call is missing for an IMPORTED target, or
>     an ALIAS target is missing?
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...nly-check-for-boost-if-really-needed.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch

Took me a while to understand what was going on here, but I think I got it:

 * If we have gcc < 7.x, then log4cxx needs boost, and makes sure boost
   is built with the date-time support.

 * If we have gcc >= 7.x, then log4cxx does not need boost, but the
   CMake logic in src/cmake/boost-fallback/boost-fallback.cmake kicks
   in anyway, and tests if date-time is provided, which fails.

So what your patch does is to only conditionally do the Boost checks in
src/cmake/boost-fallback/boost-fallback.cmake if Boost is really needed.

Looks good to me: applied!

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
