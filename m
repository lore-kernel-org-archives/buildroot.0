Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5074C54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 04:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C9D74017A;
	Sun, 24 Mar 2024 04:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0lqUub4qHxGP; Sun, 24 Mar 2024 04:09:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C17040471
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C17040471;
	Sun, 24 Mar 2024 04:09:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2944E1BF2F9
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 04:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23189407E4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 04:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wx7mfpF9PsTx for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 04:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8541407DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8541407DF
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8541407DF
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 04:09:07 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5a46abf093cso2112788eaf.2
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 21:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711253346; x=1711858146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UfzajXudrs1t2rkPWESlcsCBZckT23iT2s25ZhSHXo0=;
 b=f6ZMUPL7PIu+mWsALhdAAC1TQ/yj4BTkXh+pwshSir6p7o336Takv7aSCTUELeCtAY
 +4+pxU8vzWDIWfq9jXIRZ8S7S8MyH66uTG5jl+1tsNZVZYRu+UaRVXevndvMqyMLktXE
 ls5vEcE+L6WHLCYWSt3iuMDpa3kjc04BJfLuEf3i4CJdGlDRy6K5GteHjHse0Ai9Rliq
 H21f7AXz5EGh0+7lpH58gpPfp5APA4YjwrJEewlXrEq+UD8Td1+iMrQiZyXkc29RFGFL
 tmJ4FQffIQFQh9svHUP7OabUwoIA5UNlGOr5ZU3fhyN3cwXy6zpjuasAJ3lsHSMq8kaq
 AVqw==
X-Gm-Message-State: AOJu0YynLaD8sOc6bhHTh4+VQmjcBRL1gDMfPCRaosjqqwh9qtyrAPqy
 WlR1Uv1ivGx+22gH66bFhE1Z9IG0wokFsIGTa24sBU6seqfoCUCfZtOizyHh
X-Google-Smtp-Source: AGHT+IG5NFkNmTj8ZjZCHDzpWTzGFIFZbSyRITSgNUMbJr55r3sJogniuB3oQoKv5c44jPVsRdl0lA==
X-Received: by 2002:a05:6358:d03:b0:17b:f4e9:e31d with SMTP id
 v3-20020a0563580d0300b0017bf4e9e31dmr4594186rwj.26.1711253345710; 
 Sat, 23 Mar 2024 21:09:05 -0700 (PDT)
Received: from localhost.localdomain ([2600:8802:2a05:9000:5be:8083:7ea:b94e])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a17090a930a00b0029c61521eb5sm7910011pjo.43.2024.03.23.21.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 21:09:05 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 21:09:02 -0700
Message-Id: <20240324040902.1388507-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711253346; x=1711858146; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UfzajXudrs1t2rkPWESlcsCBZckT23iT2s25ZhSHXo0=;
 b=K7EgHVynjeWPZw6VaCsz4ilHA0i+qoRvizyBa/JDyamHHvm9MHED2ZoqaPRRNdHmlk
 2shP8JoBlAriQFwGiDfF1UWWhKO07zkAQ6Q0I34R2+y/qZ8JgBN32zcteUaJNW3u5OX9
 QycLD+YRtsYcahXyPQY4+V8F7ZP8DeZQJseI0afoBI38S7N7L9XjdyJcoyZ3eK5OYjsz
 mgDpZ8uVlUTsLhyDOCzm8QxiinB6ucmjmi7hVEPyIzeoXFhVxusWUd/ZtM7TeyRAQ4yu
 LpB2Clw5LN0UJ1dDdichm/I2Fcd2TRdoFuo75vj/156OpPXeHsMNJLnssmW/IoZQi72i
 q9Yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=K7EgHVyn
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.8.0
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog - https://github.com/iproute2/iproute2/compare/v6.7.0...v6.8.0

Drop 0001-Revert-ss-prevent-Process-column-from-being-printed-.patch. See the upstream fix https://github.com/iproute2/iproute2/commit/87d804ca0854b09c07872e9fd6036bf5d3e0cc85.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---

$ cat iproute2.config
BR2_PACKAGE_IPROUTE2=y

$ ./utils/test-pkg -k -c iproute2.config  -p iproute2
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

$ utils/docker-run make check-package
398423 lines processed
0 warnings generated

$ ip -V
ip utility, iproute2-6.8.0

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 ...t-Process-column-from-being-printed-.patch | 45 -------------------
 package/iproute2/iproute2.hash                |  2 +-
 package/iproute2/iproute2.mk                  |  2 +-
 3 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch

diff --git a/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch b/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch
deleted file mode 100644
index 10fa472d64..0000000000
--- a/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From f22c49730c3691c25a1147081363eb35aa9d1048 Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <stephen@networkplumber.org>
-Date: Sat, 13 Jan 2024 08:51:55 -0800
-Subject: [PATCH] Revert "ss: prevent "Process" column from being printed
- unless requested"
-
-This reverts commit 1607bf531fd2f984438d227ea97312df80e7cf56.
-
-This commit is being reverted because it breaks output of tcp info.
-The order of the columns enum is order sensistive.
-
-Bug: https://bugzilla.kernel.org/show_bug.cgi?id=218372
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=f22c49730c3691c25a1147081363eb35aa9d1048
----
- misc/ss.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/misc/ss.c b/misc/ss.c
-index 09dc1f37..9438382b 100644
---- a/misc/ss.c
-+++ b/misc/ss.c
-@@ -100,8 +100,8 @@ enum col_id {
- 	COL_SERV,
- 	COL_RADDR,
- 	COL_RSERV,
--	COL_PROC,
- 	COL_EXT,
-+	COL_PROC,
- 	COL_MAX
- };
-
-@@ -5795,9 +5795,6 @@ int main(int argc, char *argv[])
- 	if (ssfilter_parse(&current_filter.f, argc, argv, filter_fp))
- 		usage();
-
--	if (!show_processes)
--		columns[COL_PROC].disabled = 1;
--
- 	if (!(current_filter.dbs & (current_filter.dbs - 1)))
- 		columns[COL_NETID].disabled = 1;
-
---
-2.43.0
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 0be058e64b..d57a93de7d 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  ff942dd9828d7d1f867f61fe72ce433078c31e5d8e4a78e20f02cb5892e8841d  iproute2-6.7.0.tar.xz
+sha256  03a6cca3d71a908d1f15f7b495be2b8fe851f941458dc4664900d7f45fcf68ce  iproute2-6.8.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 4adb4e3356..3db2ab925d 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.7.0
+IPROUTE2_VERSION = 6.8.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
