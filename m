Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C702C79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 13:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C814E40730;
	Sat, 12 Sep 2026 13:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G68LewtaYy-g; Sat, 12 Sep 2026 13:27:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DB5AA40723
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789219675;
	b=mLpcLl7xPLOt24u2BKed9J4UJOYMg5SOur7Vfz/ZKh8fcYUjzgA9p5Dd6p8bmU12WEXU
	 nozomEFO0w11ZnawQtsuBNCP6+3tbKeiyBosVZKUJ7DfdZwje6KRwYFURM/DJiVJrueOM
	 QP4O4sv2R8Ys4mKL0xlMW1vtQbTfBlKGlRA9yzJRCTSzcLYQTuXAKTQakLhxEYZ031H/1
	 ZUTDLbKq6iE5e3m3ZmJrh42bsFrSJ/NtuXRlH4MQ5M1SKclOJ5Eq5QJ/1qe6+iyl5Y3CJ
	 ZhYn3iq1rQHajhtCfEAFsEHp4YdLXMn1xs9EGbTd1LUqvaBfjFdkQya7jlBkdiLnDtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789219675;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6lJEk1LCtxhaVL5rGDWtGWNCYs5kepSSLFi6uFAdGAI=;
	b=WLHK0b3ur3+A7FXBnsuoJtlLkfo8azutEyNODg03c8yDJRaYXgpWZDh5jYnx6y5VzIh8
	 vn8u+0spNFn5rDuZlrfX5LyfsLcT1zv968wEd68q7fcDbw4p8Xw3EBslsjt9TFVQo1+hK
	 hEYKyDiCwZrE4A4fJ3BHxm8ngq96SdemiDrIuk3RHavg/pfVsekrTqnkZMUN49NEEvcPN
	 ttdnxPYj56izSrmLMYXFPEFkjsof4xOmlyg9f6QpvnxG4yLUIQv+a0TsGnmLCf6Nrfhvi
	 NN07oQ0LHSXyPQKglOPUJwXRxpgWa9H25n/8CMn/B9ECMS56rVFxCPp276zMCNFy/Zw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789219674;
	bh=6lJEk1LCtxhaVL5rGDWtGWNCYs5kepSSLFi6uFAdGAI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X534+AGqdZycRBlTwt5tITYATr//imwXUgmaR1wyrX5rYcQPbeQGn6kH1z3lQ8PQi
	 pfgGwFq0P1Lz42a6DCXQjU/zgj9OezYGajfhXPmWSAl2l/jU5mrRDj7rNUye1BJu5+
	 cdjLRnwQLPx4QR+8Ljc4SeY74f25J/HIjLcAMwrriZk1gSkOriQhfHy2Hm1bScMESV
	 0B9SvBTIr2bKnr6Gih/u7EryETCjuoGWQOg90u5ZdPLVG+SldiXFeiZnE/K3UVO0Z8
	 4SLB7Y2fkMLzWPXEJ+966yjkO2yPhQSAPPdNx2hb1aIYk+BO7cOGs62S4Wa2/Z68bM
	 dCaznI0QBVmhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB5AA40723;
	Sat, 12 Sep 2026 13:27:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 818AC701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6746540723
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmKWXcCqlmkW for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 13:27:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 522CC40624
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789219672;
 b=fyDyNEWfKM2zOBNdvlhGkHEy8XUE7VlIUpO7BskEBpvPEjXl68kLmuoVqgnmV0Y/XaCh
 ocHta+7SRA+4GxtXGwbJ2Q5cYRdALJfp2FAMSF4tKxNnpchWUkQY+wfOnVr1wgloyDaIU
 b91ESi7gZenAkcMx4GeLU+spfyASnTBH6JdBMmRirKrQPd7qOWWhO8vA1iypAtt+mRhf2
 R0roUiYlwYJYmqL7CKQu25JZDDsDy48HK5PTXgruG4NTGoNRbnfAZK9vHVnAnv6SFacQ6
 YJCaDEZmgpcL1uxXtLl1sS8Fh2z/FTztQVUU6uHx8MDz3Q7mde/Ek6Z1TE6apwer2Og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789219672;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9eQoy2Crkct7cCk4YQ2s+MtVh9lF8DvNcNz2QZDpr4k=;
 b=CyfyJ/dteeVA1sqBnJPmivDcwx+9S+O/6n6PrLC0Ghcp+qQSP6nv12DC5pQXuLy0YQk8
 jssVwVOSRw80084np1qWMW1fZ398f72W5VCCjxFu3RKz/hal4HbPnSVW4nZNX87Ty/27G
 sa9FhDrqKugeFZVS2AVoS0Xwr0ka9wpNsCKDkDw8VuDOCtVF9xeggVV05Z6jHetXNhVRI
 JSLLmH1wbj3440kJumScXfyZ8zAH8Ptv+crhxvxHxDgAW9V+Of/7hTWpuA4gPutVlwweA
 4MLVZoBK/PjIOuVd3BLvCrBU4d4wXYZbautlg7TWP1st2cBZYBKnX+5k+vJirts4yJQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 522CC40624
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:27:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4DFA956C9; Sat, 12 Sep 2026 13:26:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 15:18:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 667c8bda321cbeaca9004ffb88a6282a0909e9b6
X-Git-Newrev: ceaf9e557df142bdf771ffdc102ee5a00443bd2b
X-Patchwork-Hint: ignore
Message-Id: <20260912132647.E4DFA956C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcdio: bump version to 2.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ceaf9e557df142bdf771ffdc102ee5a00443bd2b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libcdio/libcdio/releases/tag/2.4.0

Disable the configure detection of help2man to fix a build error on
Fedora 44 hosts:
https://lists.buildroot.org/pipermail/buildroot/2026-September/809202.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcdio/libcdio.hash | 4 ++--
 package/libcdio/libcdio.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
index 4c15b53e38..821f949b98 100644
--- a/package/libcdio/libcdio.hash
+++ b/package/libcdio/libcdio.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libcdio/libcdio/releases/tag/2.3.0
-sha256  53e83d284667535a767fd2d31edad1a6701591960459df373a10f1f21e80a7ed  libcdio-2.3.0.tar.bz2
+# From https://github.com/libcdio/libcdio/releases/tag/2.4.0
+sha256  8e6a305f81e45a78b41ce696d34497cc208d97075469d7304c11a6d44bf006ac  libcdio-2.4.0.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index d5238e3aca..fca52e4f52 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBCDIO_VERSION = 2.3.0
+LIBCDIO_VERSION = 2.4.0
 LIBCDIO_SOURCE = libcdio-$(LIBCDIO_VERSION).tar.bz2
 LIBCDIO_SITE = https://github.com/libcdio/libcdio/releases/download/$(LIBCDIO_VERSION)
 LIBCDIO_INSTALL_STAGING = YES
 LIBCDIO_LICENSE = GPL-3.0+
 LIBCDIO_LICENSE_FILES = COPYING
 LIBCDIO_CPE_ID_VENDOR = gnu
+LIBCDIO_CONF_ENV = ac_cv_path_HELP2MAN=""
 LIBCDIO_CONF_OPTS = --disable-example-progs --disable-cddb
 LIBCDIO_DEPENDENCIES = host-pkgconf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
