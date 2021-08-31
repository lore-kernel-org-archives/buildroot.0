Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330B4C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 08:41:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB4AC60E98
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 08:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB4AC60E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E3C240534;
	Tue, 31 Aug 2021 08:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WAfDlRlCNrQd; Tue, 31 Aug 2021 08:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21F204053B;
	Tue, 31 Aug 2021 08:40:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58C581BF82B
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 08:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48FC160BB8
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 08:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RqHyWqAK0q3z for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 08:40:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6066608D9
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 08:40:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:21dc:f44c:9f53:e2a2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 33002780331;
 Tue, 31 Aug 2021 10:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630399247;
 bh=rCWRVz/OxVppU60t8st16bUE0ECIKZXSuZ0wLSWX9I8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ewXIhSWvHxWFOaSt6lmSN6mdXqw4MjYp3F/Pb0qrCcSKrwFp/XkLjZNZIaSU/cWic
 7BdbvaQwtFVuRd4P/c3BaOc3cfnurB5zHl7NtIVY+Jc6GW1P9aHrsIqcaLNbAnS7bn
 OwtD25oMJUzR6lYQ/qPRIVINOR51PETbvOYDb812iyynbOJyqhkNBjaIBDcYRWjZQA
 K6XlMph89/4iaOgpjlrZ8IG/BR/SoaX9tkKpps7uPNRqAwo0SVHOuB9SU8a8kXNsmv
 0YdarawYlYJ3Y4wrOUuMwko6tvtKl0VQokDApv0pJOexta0FC1OVr7JR+LQkVPqcby
 uyqgmmLpvlDaQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 31 Aug 2021 10:40:42 +0200
Date: Tue, 31 Aug 2021 10:40:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210831084042.GL1053080@scaer>
References: <20210830160558.3606436-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210830160558.3606436-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/linux-pam: find libxcrypt through pkg-config
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-30 18:05 +0200, Fabrice Fontaine spake thusly:
> Find libxcryt through pkg-config to avoid the following build failure:
> 
> /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: .libs/passverify.o: in function `.L30':
> passverify.c:(.text+0x368): undefined reference to `crypt_checksalt'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/20b14e222b35c2d1269960075832b784ba81aa1a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Update patch (merged upstream)
> 
>  ...o-search-libcrypt-through-pkg-config.patch | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch
> 
> diff --git a/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch b/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch
> new file mode 100644
> index 0000000000..09b86902bb
> --- /dev/null
> +++ b/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch
> @@ -0,0 +1,55 @@
> +From 49e3ffcbe267691dfbf24c91417aa296e7412146 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 29 Aug 2021 21:15:57 +0200
> +Subject: [PATCH] configure.ac: also search libcrypt through pkg-config
> +
> +libxcrypt provides a libcrypt.pc file so use it if available as this
> +will allow to retrieve the library path (e.g.
> +-L/home/buildroot/output/host//riscv64-buildroot-linux-musl/sysroot/usr/lib)
> +which is useful when cross-compiling and will avoid the following build
> +failure on buildroot:
> +
> +/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: .libs/passverify.o: in function `.L30':
> +passverify.c:(.text+0x368): undefined reference to `crypt_checksalt'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/20b14e222b35c2d1269960075832b784ba81aa1a
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/linux-pam/linux-pam/commit/49e3ffcbe267691dfbf24c91417aa296e7412146]
> +---
> + configure.ac | 13 ++++++++++---
> + 1 file changed, 10 insertions(+), 3 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index d464884c..c06bc7dd 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -363,8 +363,14 @@ AC_CHECK_HEADERS(crypt.h)
> + 
> + BACKUP_LIBS=$LIBS
> + LIBCRYPT=""
> +-AC_SEARCH_LIBS([crypt_gensalt_rn],[crypt])
> +-case "$ac_cv_search_crypt_gensalt_rn" in
> ++PKG_CHECK_MODULES([CRYPT], [libcrypt], [
> ++  CFLAGS="$CFLAGS $CRYPT_CFLAGS"
> ++  CPPFLAGS="$CPPFLAGS $CRYPT_CFLAGS"
> ++  LIBS="$LIBS $CRYPT_LIBS"
> ++  LIBCRYPT="$CRYPT_LIBS"
> ++], [
> ++  AC_SEARCH_LIBS([crypt_gensalt_rn],[crypt])
> ++  case "$ac_cv_search_crypt_gensalt_rn" in
> + 	-l*) LIBCRYPT="$ac_cv_search_crypt_gensalt_rn" ;;
> + 	no) AC_SEARCH_LIBS([crypt_r],[crypt])
> + 		case "$ac_cv_search_crypt_r" in
> +@@ -374,7 +380,8 @@ case "$ac_cv_search_crypt_gensalt_rn" in
> + 			-l*) LIBCRYPT="$ac_cv_search_crypt" ;;
> + 		esac ;;
> + 	esac ;;
> +-esac
> ++  esac
> ++])
> + AC_CHECK_FUNCS([crypt_r])
> + LIBS=$BACKUP_LIBS
> + AC_SUBST(LIBCRYPT)
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
