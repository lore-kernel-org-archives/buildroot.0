Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C75CC4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 12:01:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8A0A60F41
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 12:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8A0A60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98B5B83466;
	Tue, 10 Aug 2021 12:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cf3JriZvvrgB; Tue, 10 Aug 2021 12:01:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E428834E8;
	Tue, 10 Aug 2021 12:01:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8855D1BF344
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 12:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7805F60682
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 12:01:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6etw6t8bl9Q for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 12:01:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78F79607F7
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 12:01:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k29so13119524wrd.7
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 05:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ng0mfoZmNTqSxgpqPDKsWIuWrz9pVRJLKvwJY4rZpQk=;
 b=puzqlxPkgPgGs8mZur3Nvrxz4LxZ/qyYeM71+gexjsUnx8HLPjtYHoPqXn/1jcX3wa
 v+hjGgZYTCZA4Xze03lmV/cWuduzbem2667F4H3og2zjcMLZO4eUdU/roOIY7X0Q0XgC
 9DJRRbg4B9FVtzdjZ2djlGuaFfoAC3XjMQNaKTFSD1BYrJEMIintQfKu6M5CVqAzlY2q
 lv0OuvFlvTJjK89b74MAmhX9cqh7CQctr+6dshyqxd8uoFacegOsWW5t3QhQLJJJbg4c
 TaU8VwccFCa6yexXHccITgaEM9PEJWWMPrU+thIYYSW1+lGGWmovjCGeM00rUE20ShM9
 mJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ng0mfoZmNTqSxgpqPDKsWIuWrz9pVRJLKvwJY4rZpQk=;
 b=EVdR9lg3pbwWL98kUkBabWHa2Nq6E2/CJyMcJNoR6JpN216UNIjiMNk9t6yrYgUSPM
 KnjpFoBOQYx9j2OmrNN6nefph83954jYibV2fgAwsJzZ/xCGdet78AMPARhRbQrlFUNv
 sEnDtGkQCAenVo+Tb4kSbjrFDtxnqUBJ22X3nbcXs8Cg2u4haGTNn87Pp/Un13LcKz9o
 rcY3pGwu1vQZ0onel4D6hy8+rveXGRhz/btaiGwpV0yxIntzgSdPTzAqOrU6OynMeLuH
 YRSXdCJkslOFwTl+0z1/v8wenRUtWedYtMOL49hdxcpGzyl12dZwQNK+EnfSsNQkyqjw
 dWsQ==
X-Gm-Message-State: AOAM5305MoDzCmMMN7LLG7YAlzCDk/pjsjGv6tVtmGdTnTIqaW8NPmsi
 n1qJG+gzFVO4ZSvrz53+C2rjOPtgKu6pNw==
X-Google-Smtp-Source: ABdhPJxO6AYvIwQV0v76SrTeAB18azPsfkQyMm3OrcKEKob4PoOvzZfLIqr0T2rrYcSLO4Uj9k4hRQ==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr1173284wrt.226.1628596906212; 
 Tue, 10 Aug 2021 05:01:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id t1sm22545887wrm.42.2021.08.10.05.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 05:01:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 14:01:34 +0200
Message-Id: <20210810120134.3972324-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: fix locale independent
 on musl
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix locale indepdendent which is enabled on musl since version 1.11.0
and
https://github.com/google/flatbuffers/commit/5f32f948102e65eaeea461b44f3b43f96c7a7a5a
resulting in the following build failure on snort3 since bump to version
3.1.6 in commit	e66f2fd310374779d415fa683813cc5f5ccf6be9:

In file included from /tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/flexbuffers.h:24,
                 from /tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/idl.h:26,
                 from /tmp/instance-0/output-1/build/snort3-3.1.6.0/src/network_inspectors/perf_monitor/fbs_formatter.cc:29:
/tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/util.h: In function 'void flatbuffers::strtoval_impl(int64_t*, const char*, char**, int)':
/tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/util.h:258:12: error: 'strtoll_l' was not declared in this scope; did you mean 'strcoll_l'?
  258 |     *val = __strtoll_impl(str, endptr, base);
      |            ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/68045b83e94f8caa337b1af7ed5f493ac1a55c47

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...flatbuffers-base.h-fix-build-on-musl.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch

diff --git a/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch b/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
new file mode 100644
index 0000000000..b4bc0e12de
--- /dev/null
+++ b/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
@@ -0,0 +1,51 @@
+From 0315cef04a5a8a953072691faa48af9acb6009bd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 10 Aug 2021 13:39:58 +0200
+Subject: [PATCH] include/flatbuffers/base.h: fix build on musl
+
+Build of applications using flatbuffers such as snort3 are broken on
+musl since version 1.11.0 and
+https://github.com/google/flatbuffers/commit/5f32f948102e65eaeea461b44f3b43f96c7a7a5a
+because strtoll_l (and strtoull_l) are not available on musl.
+flatbuffers checks for the availability of strtoull_l in CMakeLists.txt
+so flatbuffers builds successfully but for applications using
+flatbuffers, the result of this check is not available and
+FLATBUFFERS_LOCALE_INDEPENDENT is set to 1 resulting in the following
+build failure:
+
+In file included from /tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/flexbuffers.h:24,
+                 from /tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/idl.h:26,
+                 from /tmp/instance-0/output-1/build/snort3-3.1.6.0/src/network_inspectors/perf_monitor/fbs_formatter.cc:29:
+/tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/util.h: In function 'void flatbuffers::strtoval_impl(int64_t*, const char*, char**, int)':
+/tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/util.h:258:12: error: 'strtoll_l' was not declared in this scope; did you mean 'strcoll_l'?
+  258 |     *val = __strtoll_impl(str, endptr, base);
+      |            ^~~~~~~~~~~~~~
+
+Fix this failure by checking if __GNUC__ is defined before setting
+FLATBUFFERS_LOCALE_INDEPENDENT to 1.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/68045b83e94f8caa337b1af7ed5f493ac1a55c47
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/google/flatbuffers/pull/6773]
+---
+ include/flatbuffers/base.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/flatbuffers/base.h b/include/flatbuffers/base.h
+index de7898dc..101c7598 100644
+--- a/include/flatbuffers/base.h
++++ b/include/flatbuffers/base.h
+@@ -266,7 +266,7 @@ namespace flatbuffers {
+ #ifndef FLATBUFFERS_LOCALE_INDEPENDENT
+   // Enable locale independent functions {strtof_l, strtod_l,strtoll_l, strtoull_l}.
+   #if ((defined(_MSC_VER) && _MSC_VER >= 1800)            || \
+-       (defined(_XOPEN_VERSION) && (_XOPEN_VERSION>=700)) && (!defined(__ANDROID_API__) || (defined(__ANDROID_API__) && (__ANDROID_API__>=21))))
++       (defined(__GLIBC__) && defined(_XOPEN_VERSION) && (_XOPEN_VERSION>=700)) && (!defined(__ANDROID_API__) || (defined(__ANDROID_API__) && (__ANDROID_API__>=21))))
+     #define FLATBUFFERS_LOCALE_INDEPENDENT 1
+   #else
+     #define FLATBUFFERS_LOCALE_INDEPENDENT 0
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
