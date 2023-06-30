Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3DCEB64D7
	for <buildroot@archiver.kernel.org>; Fri, 30 Jun 2023 13:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A275681FB7;
	Fri, 30 Jun 2023 13:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A275681FB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivYh4sc07mrV; Fri, 30 Jun 2023 13:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFBD881F43;
	Fri, 30 Jun 2023 13:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFBD881F43
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C96741BF341
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 13:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B029A81F43
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 13:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B029A81F43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7G1RxVJdBJLE for <buildroot@lists.busybox.net>;
 Fri, 30 Jun 2023 13:29:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8715181F32
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8715181F32
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 13:29:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-313df030ccaso2113533f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 06:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688131790; x=1690723790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K711G+Ni/Z33QErd3cPU0AI5onw6WLjnt55370p2Ras=;
 b=Zz3HuNDVJaS+CDfxYBj4Rln3+Zqt2lzHqb4FLiSzrRAmI9eC1ALVNmHEQSjxPZctKQ
 QV1BaV/AcijadYi4Bz8d/Sq3Su3zcePTR3ILWkwpnyFzSjpTEWIF+k/S4f69joe5606C
 c5auCUO1ZLa8RUnSCHEFzWCBZbniXaJ93mGV1wMWDHWbj6LXfhlB25wtFWspIXo3U8MR
 NZVI+Tlk747QBi52j/6RM75nefn7ekB1ZShZTyejGiDMbno0ZhqobvHc0m+4mMS3Yck7
 4+IPMrNy4uzBbOc+1FcsfjJ9f5ojQDTRBILuONaAH/TtPwr6pZi0q2IprFlfDi1+MBBL
 ITHQ==
X-Gm-Message-State: ABy/qLZd6uSdZbuXUrb0vmUQUqOF9l033nEBerOXKP0aza6qnEqlIexu
 vB31PDmDu6bbKt/KKCdh/YiFxnHfHmA=
X-Google-Smtp-Source: APBJJlFj21Vt3zwwWerwsd1tHqiJsPjUp8lCufnIHOxW6oJHiNAhdt7HwzNICalGl2OnTnpERoz8NA==
X-Received: by 2002:adf:fbcf:0:b0:313:ec5d:95b5 with SMTP id
 d15-20020adffbcf000000b00313ec5d95b5mr1893478wrs.60.1688131790180; 
 Fri, 30 Jun 2023 06:29:50 -0700 (PDT)
Received: from smartron.praguecc.cz ([193.85.242.128])
 by smtp.gmail.com with ESMTPSA id
 r15-20020adfe68f000000b003111025ec67sm18247786wrm.25.2023.06.30.06.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 06:29:49 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jun 2023 15:29:12 +0200
Message-Id: <20230630132912.128835-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688131790; x=1690723790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K711G+Ni/Z33QErd3cPU0AI5onw6WLjnt55370p2Ras=;
 b=AKPz5YYLsAgsJCGX745x2cInmIzi7F6gG6hIORnXQlq0FYE1QSNpDQlBqaNqNrjQ21
 dJJ/vkmZM9vvQ/qu3sqj8Pr+WeCmnS7J9xkaEyMr4oOSQshGBHX8dSJuXm1fI0sUwOJg
 lMUbN4ygpAFuKsZoEyMeckCf3gSBkY+jD7u6sC9pWohLvHnkm7TU/JGeDqdKjWBlY48l
 9hUB20xplcf6kLyhAAb1zZdJwQbM106SXXtHkF76JogDj6AZocw2VYxiNZ2zpI6/1g2M
 JcOAiDcgVrF0GWNRslM6aJc2ObqT6Ba6/vVay+zsk0X9PESHZA7k779eYSd3kFISkIPA
 Umww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AKPz5YYL
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: bump to v4.0
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Petr Kulhavy <brain@jikos.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches that have been applied upstream
- Drop hash that are not available on Soureforge anymore

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 ...g.h-drop-clock_nanosleep-replacement.patch | 49 -------------------
 ...itional-assignment-for-KBUILD_OUTPUT.patch | 43 ----------------
 package/linuxptp/linuxptp.hash                |  6 +--
 package/linuxptp/linuxptp.mk                  |  2 +-
 4 files changed, 2 insertions(+), 98 deletions(-)
 delete mode 100644 package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
 delete mode 100644 package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch

diff --git a/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch b/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
deleted file mode 100644
index 54ef963ae4..0000000000
--- a/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 947bf03ec3d9eaa0bfc0269eed86b9364e94bc1a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 5 Aug 2018 15:25:53 +0200
-Subject: [PATCH] missing.h: drop clock_nanosleep() replacement
-
-Since uClibc-ng commits 68628fe7d463541bf3c33da6b214e63c0cc9feed
-("librt: declare clock_nanosleep not only for NPTL") and
-ddbb03e77ac1a48740688814b82f45c97ee81f37 ("librt: clock_nanosleep
-could be even used without threads"), clock_nanosleep() is always
-provided by uClibc, regardless of the thread implementation (none,
-linuxthreads, nptl). These commits will be part of the upcoming 1.0.31
-release of uClibc-ng.
-
-Thanks to this, we can drop the replacement clock_nanosleep()
-implementation added by linuxptp. Without this, linuxptp fails to
-build with:
-
-missing.h:117:19: error: static declaration of 'clock_nanosleep' follows non-static declaration
- static inline int clock_nanosleep(clockid_t clock_id, int flags,
-                   ^~~~~~~~~~~~~~~
-In file included from clockadj.h:24:0,
-                 from clockadj.c:24:
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- missing.h | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/missing.h b/missing.h
-index 2f7adb9..60f89a3 100644
---- a/missing.h
-+++ b/missing.h
-@@ -129,13 +129,6 @@ enum {
- 
- #define TFD_TIMER_ABSTIME (1 << 0)
- 
--static inline int clock_nanosleep(clockid_t clock_id, int flags,
--				  const struct timespec *request,
--				  struct timespec *remain)
--{
--	return syscall(__NR_clock_nanosleep, clock_id, flags, request, remain);
--}
--
- static inline int timerfd_create(int clockid, int flags)
- {
- 	return syscall(__NR_timerfd_create, clockid, flags);
--- 
-2.14.4
-
diff --git a/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch b/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
deleted file mode 100644
index 73cd34f744..0000000000
--- a/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 23 Nov 2022 08:23:46 +0800
-Subject: [Linuxptp-devel] [PATCH] makefile: use conditional assignment for KBUILD_OUTPUT
-
-Refer [1],from make 4.4, all variables that are marked as export will
-also be passed to the shell started by the shell function. use "=" will
-make KBUILD_OUTPUT always empty for shell function, use "?=" to make
-"export KBUILD_OUTPUT" in enrironment can work.
-
-[snip of 4.4 NEWS]
-* WARNING: Backward-incompatibility!
-   Previously makefile variables marked as export were not exported to commands
-   started by the $(shell ...) function.  Now, all exported variables are
-   exported to $(shell ...).
-[snip]
-
-[1] https://git.savannah.gnu.org/cgit/make.git/tree/NEWS?h=4.4&id=ed493f6c9116cc217b99c2cfa6a95f15803235a2#n74
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-[Retrieved from mailing list. The patch was not yet accepted and applied:
-https://www.mail-archive.com/linuxptp-devel@lists.sourceforge.net/msg06151.html]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
-
----
- makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/makefile b/makefile
-index 9aed383..ba3fb38 100644
---- a/makefile
-+++ b/makefile
-@@ -15,7 +15,7 @@
- # with this program; if not, write to the Free Software Foundation, Inc.,
- # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- 
--KBUILD_OUTPUT =
-+KBUILD_OUTPUT ?=
- 
- DEBUG	=
- CC	= $(CROSS_COMPILE)gcc
--- 
-2.25.1
diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index a5479b0ebc..edbfb44553 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,9 +1,5 @@
-# From https://sourceforge.net/projects/linuxptp/files/v3.1.1/
-sha1  f905eabc6fd0f03c6a353f9c4ba188a3bd1b774c  linuxptp-3.1.1.tgz
-md5  3b79ab5e77c5b5cf06bc1c8350d405bb  linuxptp-3.1.1.tgz
-
 # Locally computed:
-sha256  94d6855f9b7f2d8e9b0ca6d384e3fae6226ce6fc012dbad02608bdef3be1c0d9  linuxptp-3.1.1.tgz
+sha256  d27d5ef296bb3d285e22e69f75ae023b4b42a2f4655130d6d390d8afcbc3d933  linuxptp-4.0.tgz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index 048dd0b896..054442d569 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 3.1.1
+LINUXPTP_VERSION = 4.0
 LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
