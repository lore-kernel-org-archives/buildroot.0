Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C873C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B1558134D;
	Fri, 18 Sep 2026 19:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTq4F8CXjw_H; Fri, 18 Sep 2026 19:54:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 541538133D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789761288;
	b=Z8UCbSX7gxqT+fsqYcebdfMCqICUn5c9OHEi5D+yuXeg7xZJAq1qvD+iWt9Vp95dAwYO
	 JOTpti1NuXbBOXvco1dCeM1ikbKJPDe8EY4VVOCPLTEHpHdIA1ZBrBoiUT1gHdSafXXFq
	 mvvXbaCFSkOTdgA8gGHFVIpQLjkzktKkapOTTJTK4p0FqxI0ZPSSjlBHmTsKwW5I0vIWD
	 0rsBJAycxCSFUA8ANY5zOaEJuJqlT+9gPv9VZspTbpHgUCbof0XMZZBAfPTuAk+T3QoNO
	 zkInjwzlmFBL829FQA6dD1HSbI3t+lSIZAHvlk6+9JsTP1PAe/NSwe48h5bvnChC+bw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789761288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2w7SSwwLHgmaYUXSp5MMllfvzpuRCzIEYhrpm3oATKI=;
	b=h9vBuGIj4wlbu+7pSyiKjZ9EogJer0GTkG4Z/aM61SQOKj13FcZY1PvnZZSkjjCaQKv8
	 x8S04Jtnxb7qYgFDMVe9kR2/dlBfQKKvp9gyhtfaeT0ZfNWxxZF5wqUmuhygVnRRamvzO
	 1rTUE+Y3x7zrahKN6fR8EZYO25Jia94AnLTSz2luLzHx2SWwb4tdBJCPWxAvBB3Cu8QrS
	 259QhUcqac17dgma8+YkHEDO14j5C9zG2T0sJwQcmL0IQrdEz13Ha3ARoYYZBaCEwLY5J
	 bqKRkX/Egl0N7fQ8O34a3TafJE0wTD7r9yBOO89JF2DV7e6SiedUXIMvBndaicEyZqg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789761288;
	bh=2w7SSwwLHgmaYUXSp5MMllfvzpuRCzIEYhrpm3oATKI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PlzmMyA2B/VUsQmrLjav3iu9wZBKA6DAnJFNyc4OXSLI18LA2YFCsDFur1q0yukZO
	 Emg1KqsfFvR23h5xZ997f8iEuvB5WVk8/uoe0ZQwuAZDJ7Y2tW+FI+2wVHAJYITuHL
	 FcJOH/U2pUZNfa17T97Jzbyut5yeP5Ecet+JnrfcAQU9E8ljo2F2ezhgDcVQEaYOF1
	 EMtaahLKvIqs9nZUwj4zxTRTbm4ytIuk8z9XeCkWlhDy6K4mFupIEvMjs/umaVo7xr
	 sWNdnt6ONi9tWG0LhiFUfgemI8d1db5vxNZFT/4SjeDQFeE9EOLez8/aragl2S08kg
	 7WReczm6MqNlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 541538133D;
	Fri, 18 Sep 2026 19:54:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E49143A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 344AC40CA9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cvu3Z7QWWbRE for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6588E40CA5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789761281;
 b=Z9/4EKBVO9jcOD4cr0zEXpJDJG6BHws0/yI/sLEbPL+414d+rWxY9KU5uHjE4lxbZZAR
 +KwLeveqKRZXp5+AZwNMilkl0akzZ3iFSInzcLkDM/vFLTUk/X7AVHfkLonjL4Zgw/ciF
 c1ZU2ajRElZ/8K51sxzG0ofvfujsg7bMFOkUyIdUA6Z6yCG6h2uVOTx5jy8wfOqf3Dgf3
 Sp7s/rlTyY3XJ5/IG73m5BNXPU1XYdHCU+6NN3CmrIO21wW+ACw8Rm8JpFtBSHs89AWyh
 d4mxqmYVlVUfJoxUh4TUp8UUCDw1M8dJZr+Kj894mEPEeLnbEZvE1rlhR+339M0G0qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789761281;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=B+RgIKz9q+e6NiSp/VjsmrZs1OkIyb3uV9koPmT43C4=;
 b=GqZbH/5BuGGKAQjseojtwSMX6ZkTKcFNlmzKENZiKnINMbMWub+esbCY/pOuPH7n/MPj
 VLsfz/MiL3bBSGmkahV60Z2SdeAq+D263orTR189iobjxDsuBx3XmnlxIXR3TT+/UyyRW
 0RMGIsl2+pjPdLHm0X2iO0TE4cl9WlYFmhVGfRBLSytZfapqiyQQiS08lyR9B0oOS29To
 myhZPMSC4PpWX0XKoII5fs99Cf+js1Vd8XpIQIgtPTPx0JBi37uMI8Z4o+2YKruXrQRAn
 SZa2tmCWDAxEF/BxdKMxEBEX09gpjjLbFbuBeUhCHGS2XtRV6EhEQZ859HAIbrUnPPA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6588E40CA5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD665976A4; Fri, 18 Sep 2026 19:53:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:52:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83aefd8099ab70122620f7bd74c266c678604f36
X-Git-Newrev: 591e6b9981169bbefde7b5e486b0e83f16a26808
X-Patchwork-Hint: ignore
Message-Id: <20260918195333.DD665976A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{,
 lib}apparmor: bump to version 4.1.8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/591e6b9981169bbefde7b5e486b0e83f16a26808
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.8
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.7
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.6
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.5
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.4
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.3
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.2

Switched tarballs to bz2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apparmor/apparmor.hash       | 4 ++--
 package/apparmor/apparmor.mk         | 4 ++--
 package/libapparmor/libapparmor.hash | 4 ++--
 package/libapparmor/libapparmor.mk   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index ef7dd81aaf..e32b52d51f 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.1
-sha256  f125aae32964e4e84443fec005f37f37abd5164f30620239c42864655a1b0281  apparmor-v4.1.1.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.8
+sha256  e5b61bdda754ce55091d390094bdc9eaa7e5c60ae24e75cea18f51c288afa65d  apparmor-v4.1.8.tar.bz2
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index febd1d5eb0..ba63344bd2 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -6,8 +6,8 @@
 
 # When updating the version here, please also update the libapparmor package
 APPARMOR_VERSION_MAJOR = 4.1
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).1
-APPARMOR_SOURCE = apparmor-v$(APPARMOR_VERSION).tar.gz
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).8
+APPARMOR_SOURCE = apparmor-v$(APPARMOR_VERSION).tar.bz2
 APPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(APPARMOR_VERSION)
 APPARMOR_DL_SUBDIR = apparmor
 APPARMOR_LICENSE = GPL-2.0
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index d0603c0a3a..0d113e0d93 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.1
-sha256  f125aae32964e4e84443fec005f37f37abd5164f30620239c42864655a1b0281  apparmor-v4.1.1.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.8
+sha256  e5b61bdda754ce55091d390094bdc9eaa7e5c60ae24e75cea18f51c288afa65d  apparmor-v4.1.8.tar.bz2
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 64442fcc16..e4ae9c1a19 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -6,8 +6,8 @@
 
 # When updating the version here, please also update the apparmor package
 LIBAPPARMOR_VERSION_MAJOR = 4.1
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).1
-LIBAPPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).8
+LIBAPPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.bz2
 LIBAPPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_VERSION)
 LIBAPPARMOR_LICENSE = LGPL-2.1
 LIBAPPARMOR_LICENSE_FILES = LICENSE libraries/libapparmor/COPYING.LGPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
