Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E607CEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 19:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40889415D3;
	Sat,  1 Jul 2023 19:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40889415D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cx5_80-PItWt; Sat,  1 Jul 2023 19:02:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE3004173E;
	Sat,  1 Jul 2023 19:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE3004173E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 95FAC1BF329
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 19:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F44960B98
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 19:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F44960B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmwIaPLIspFq for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 19:02:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06CA860B27
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06CA860B27
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 19:02:15 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b6c3921c8bso49672721fa.3
 for <buildroot@buildroot.org>; Sat, 01 Jul 2023 12:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688238134; x=1690830134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rF+pdh9Rj36qNkGHc+2r76Ps/+gBaU5ZXwrSDtsnwQ=;
 b=DqZnC3j5ruprx27/Bj3Erqy/hGcbJOa0dQ1muzZMXwF7rn2XWV45Lr4jFCtnWZKkpO
 IkzjDRoV0gpjrU2JYr0w/GNyWWQckyifFlbsdu+EIDiB3mFLNhKomB7H0Ks941VSOeYc
 BNkoMVQ3c1dxxaxzKtSxb+UkHU7uCs3B/p0Mz9QlVlbhkHxVJ8j7B65BigNEOCWW81uW
 6zR4Q5LOXi6V77sgBEHp4mEKKk5m94F5cbJx3Fiy/oVK4gCDEsiBQpLYb4SQwYmUE0d/
 vESxR6zCW/n9729qarRO+auxHfmNGzLNPAZMlJoj9UQbTwgPWGsBEGqMCZrzVmJg51s1
 o1JA==
X-Gm-Message-State: ABy/qLbScGMxZ1/zlraMHogJ4Vf9P4GT+x4AY5wDfk9vkmcUeLiWWqA3
 inHcXxFk4lMFz5Im+IfEYn7HF70uF+jCF0aeU9SlH51bZ5k=
X-Google-Smtp-Source: APBJJlFoSs0vKX03B5H7jnZAbEVbG/nHnlsdOKsylhVKCMhwsVLS/ejc+goXqu1oAYuFFuewq7/jOecQQuW88DYKvvs=
X-Received: by 2002:a2e:9c87:0:b0:2b6:9909:79bd with SMTP id
 x7-20020a2e9c87000000b002b6990979bdmr4333291lji.24.1688238133387; Sat, 01 Jul
 2023 12:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230630132912.128835-1-titouanchristophe@gmail.com>
In-Reply-To: <20230630132912.128835-1-titouanchristophe@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 1 Jul 2023 21:02:00 +0200
Message-ID: <CAEyMn7Z16w9e=5PHE1nABm2sek1kVwGD8+dW+b_0HrqwVCy9pQ@mail.gmail.com>
To: Titouan Christophe <titouanchristophe@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688238134; x=1690830134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5rF+pdh9Rj36qNkGHc+2r76Ps/+gBaU5ZXwrSDtsnwQ=;
 b=GhmVQshS3xw1h88B6pXKXN8AOZwWnLukef7R/DzD/R0F+KKnq38mW8n1ldq97EEQ/0
 eCMD8povnGSqJbHlglqsjwOqN/VqWvyUd/MttLZRdj1XykdpYIs5ILOI20n3eTEva77Q
 chErToNfIJhJJHgS+fo8O0R/7S2hI4B2oP5OrguhPLyTlLs4/ddCxUwOJJCPxL41OaIv
 tILKcxiJRJsDHBjVUwlaLw/dZtUNpJZWRf/znmn7egFxwEPUR8mNmvoE2YzKPYRjNMi+
 UoXBa3HUjlv0dBPqTLXODRbktcfSHZicTSlGF7BIIHilrX4ovJqLOGRrfBlS/13oOz4C
 YqTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GhmVQshS
Subject: Re: [Buildroot] [PATCH 1/1] package/linuxptp: bump to v4.0
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
Cc: Petr Kulhavy <brain@jikos.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,


Am Fr., 30. Juni 2023 um 15:29 Uhr schrieb Titouan Christophe
<titouanchristophe@gmail.com>:
>
> - Drop patches that have been applied upstream
> - Drop hash that are not available on Soureforge anymore
>
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  ...g.h-drop-clock_nanosleep-replacement.patch | 49 -------------------
>  ...itional-assignment-for-KBUILD_OUTPUT.patch | 43 ----------------
>  package/linuxptp/linuxptp.hash                |  6 +--
>  package/linuxptp/linuxptp.mk                  |  2 +-
>  4 files changed, 2 insertions(+), 98 deletions(-)
>  delete mode 100644 package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
>  delete mode 100644 package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
>
> diff --git a/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch b/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
> deleted file mode 100644
> index 54ef963ae4..0000000000
> --- a/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 947bf03ec3d9eaa0bfc0269eed86b9364e94bc1a Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Sun, 5 Aug 2018 15:25:53 +0200
> -Subject: [PATCH] missing.h: drop clock_nanosleep() replacement
> -
> -Since uClibc-ng commits 68628fe7d463541bf3c33da6b214e63c0cc9feed
> -("librt: declare clock_nanosleep not only for NPTL") and
> -ddbb03e77ac1a48740688814b82f45c97ee81f37 ("librt: clock_nanosleep
> -could be even used without threads"), clock_nanosleep() is always
> -provided by uClibc, regardless of the thread implementation (none,
> -linuxthreads, nptl). These commits will be part of the upcoming 1.0.31
> -release of uClibc-ng.
> -
> -Thanks to this, we can drop the replacement clock_nanosleep()
> -implementation added by linuxptp. Without this, linuxptp fails to
> -build with:
> -
> -missing.h:117:19: error: static declaration of 'clock_nanosleep' follows non-static declaration
> - static inline int clock_nanosleep(clockid_t clock_id, int flags,
> -                   ^~~~~~~~~~~~~~~
> -In file included from clockadj.h:24:0,
> -                 from clockadj.c:24:
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - missing.h | 7 -------
> - 1 file changed, 7 deletions(-)
> -
> -diff --git a/missing.h b/missing.h
> -index 2f7adb9..60f89a3 100644
> ---- a/missing.h
> -+++ b/missing.h
> -@@ -129,13 +129,6 @@ enum {
> -
> - #define TFD_TIMER_ABSTIME (1 << 0)
> -
> --static inline int clock_nanosleep(clockid_t clock_id, int flags,
> --                                const struct timespec *request,
> --                                struct timespec *remain)
> --{
> --      return syscall(__NR_clock_nanosleep, clock_id, flags, request, remain);
> --}
> --
> - static inline int timerfd_create(int clockid, int flags)
> - {
> -       return syscall(__NR_timerfd_create, clockid, flags);
> ---
> -2.14.4
> -
> diff --git a/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch b/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
> deleted file mode 100644
> index 73cd34f744..0000000000
> --- a/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Wed, 23 Nov 2022 08:23:46 +0800
> -Subject: [Linuxptp-devel] [PATCH] makefile: use conditional assignment for KBUILD_OUTPUT
> -
> -Refer [1],from make 4.4, all variables that are marked as export will
> -also be passed to the shell started by the shell function. use "=" will
> -make KBUILD_OUTPUT always empty for shell function, use "?=" to make
> -"export KBUILD_OUTPUT" in enrironment can work.
> -
> -[snip of 4.4 NEWS]
> -* WARNING: Backward-incompatibility!
> -   Previously makefile variables marked as export were not exported to commands
> -   started by the $(shell ...) function.  Now, all exported variables are
> -   exported to $(shell ...).
> -[snip]
> -
> -[1] https://git.savannah.gnu.org/cgit/make.git/tree/NEWS?h=4.4&id=ed493f6c9116cc217b99c2cfa6a95f15803235a2#n74
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> -
> -[Retrieved from mailing list. The patch was not yet accepted and applied:
> -https://www.mail-archive.com/linuxptp-devel@lists.sourceforge.net/msg06151.html]
> -Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> -
> ----
> - makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/makefile b/makefile
> -index 9aed383..ba3fb38 100644
> ---- a/makefile
> -+++ b/makefile
> -@@ -15,7 +15,7 @@
> - # with this program; if not, write to the Free Software Foundation, Inc.,
> - # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -
> --KBUILD_OUTPUT =
> -+KBUILD_OUTPUT ?=
> -
> - DEBUG =
> - CC    = $(CROSS_COMPILE)gcc
> ---
> -2.25.1
> diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
> index a5479b0ebc..edbfb44553 100644
> --- a/package/linuxptp/linuxptp.hash
> +++ b/package/linuxptp/linuxptp.hash
> @@ -1,9 +1,5 @@
> -# From https://sourceforge.net/projects/linuxptp/files/v3.1.1/
> -sha1  f905eabc6fd0f03c6a353f9c4ba188a3bd1b774c  linuxptp-3.1.1.tgz
> -md5  3b79ab5e77c5b5cf06bc1c8350d405bb  linuxptp-3.1.1.tgz
> -
>  # Locally computed:
> -sha256  94d6855f9b7f2d8e9b0ca6d384e3fae6226ce6fc012dbad02608bdef3be1c0d9  linuxptp-3.1.1.tgz
> +sha256  d27d5ef296bb3d285e22e69f75ae023b4b42a2f4655130d6d390d8afcbc3d933  linuxptp-4.0.tgz
>
>  # Hash for license file:
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
> index 048dd0b896..054442d569 100644
> --- a/package/linuxptp/linuxptp.mk
> +++ b/package/linuxptp/linuxptp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -LINUXPTP_VERSION = 3.1.1
> +LINUXPTP_VERSION = 4.0
>  LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
>  LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
>  LINUXPTP_LICENSE = GPL-2.0+
> --
> 2.40.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
