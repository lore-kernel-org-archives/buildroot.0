Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6360C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 12:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 294356072C;
	Fri, 17 May 2024 12:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gz3gI_8uA9jk; Fri, 17 May 2024 12:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE9196070E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE9196070E;
	Fri, 17 May 2024 12:02:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 968581BF990
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 12:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A4C403EA
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 12:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00f49HE8-62L for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 12:02:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA96F400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA96F400AC
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA96F400AC
 for <buildroot@buildroot.org>; Fri, 17 May 2024 12:02:01 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a59b097b202so353920266b.0
 for <buildroot@buildroot.org>; Fri, 17 May 2024 05:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715947319; x=1716552119;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1OqbTOAG9Rh8TDYQAvZfBJnJ381uegdfE+ywhf+OOtU=;
 b=cp+50Bi2qfcf67tTQCn5EXm9CNgzZNhpH5UWDdkVqskPH4ZNlbzL2bymbR3xEdDZNz
 U3jpYVWoa8IHqSzRyTyPp/AZs+VL7kbzbYKR2qFn/DWrIvF17R5552DK2ygPmmtRVcrK
 Gd/OJAr9odctRq3yK/6reoGxeHLkR222ffi111ai/ISP4qLR4PUfoDF+kMkWhE57ebgJ
 yh5cOKf0ShUm4HGuClOQVvAphVvpcSV9An4+iQ3InRN0muyzzP+gVrpT75fcC7V4go+9
 /KryFRZ0iFgLNvaY9xPoHI+aQdSyeFVEQ/RY/TarqOAzBg/IjVIzjm4uM6MzTfL346kB
 5MQg==
X-Gm-Message-State: AOJu0YzPW51BftU7dJ2QpBPmZmhtaIiKYiRgulavbBwlncuBsr556t/H
 0oo2mbNUwKR9NlKelotTDJM9z0TmogQcO9Qb3Vj+D9tCzVKto4rNqhwg0w==
X-Google-Smtp-Source: AGHT+IEHCC6Uyi0kbWq6ipcKW/GHCBWr5eS4lKiLqwFckKQGwFYwpy3+trrPvO51GkGQ1JCDu6Mrtg==
X-Received: by 2002:a17:906:f10f:b0:a59:ae57:1658 with SMTP id
 a640c23a62f3a-a5a2d55aebdmr1397311566b.30.1715947319216; 
 Fri, 17 May 2024 05:01:59 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d48dsm1107913866b.5.2024.05.17.05.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 05:01:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 14:00:57 +0200
Message-Id: <20240517120057.3736694-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1715947319; x=1716552119; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1OqbTOAG9Rh8TDYQAvZfBJnJ381uegdfE+ywhf+OOtU=;
 b=YlWge0wvE08DxL/F1x1YsE8+s6CmLmmYkNXpBoIxj2BcofbxOZ3nOJX274twxvb8fN
 CdhQ1PKbdE/sPJ/GmP9MvziPJP/SWEP9tAZJqwCFLgY/8NvKWedKyKyoGdcCKeDhMW9A
 SYuWBmgQyibZXfen3KDY5GHEiCkFdH+KUM1CV5Fm7pGiLSEdnu8gmVz4RMVVPrqaBlr0
 OARt0YaafhJ7kSmVWw0RQCl/8d40+xPRkD/rZes902jG6wt64Oo4q1nQ/9XB7+OWrrvb
 iU9f0zEps/5uXhVvK8EcfX+tUs5KOmWutbaybXbYK83OY8YCzGmafvon7gvHHEG4Pv90
 PDjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YlWge0wv
Subject: [Buildroot] [PATCH] package/ntp: fix build with GCC 14.x
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Fix pthread_detach() detection that is broken when building
with GCC 14.x.

The patch is taken from a Gentoo repository:

https://gitweb.gentoo.org/repo/gentoo.git/diff/net-misc/ntp/files/ntp-4.2.8_p15-configure-clang16.patch?id=56ef5ce33891feec34cd0c39a0a774a81a587dc7

Bonus: refresh the 0002-ntp-syscalls-fallback.patch file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ntp/0002-ntp-syscalls-fallback.patch  |  9 ++++---
 .../ntp/0003-fix-pthread-detach-check.patch   | 27 +++++++++++++++++++
 2 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 package/ntp/0003-fix-pthread-detach-check.patch

diff --git a/package/ntp/0002-ntp-syscalls-fallback.patch b/package/ntp/0002-ntp-syscalls-fallback.patch
index 535fc93dfd..46704b9d3f 100644
--- a/package/ntp/0002-ntp-syscalls-fallback.patch
+++ b/package/ntp/0002-ntp-syscalls-fallback.patch
@@ -8,10 +8,11 @@ Signed-off-by: James Knight <james.knight@rockwellcollins.com>
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -1523,11 +1523,11 @@ AC_CACHE_CHECK(
+Index: ntp-4.2.8p17/configure.ac
+===================================================================
+--- ntp-4.2.8p17.orig/configure.ac
++++ ntp-4.2.8p17/configure.ac
+@@ -1472,11 +1472,11 @@ AC_CACHE_CHECK(
      [ntp_cv_var_ntp_syscalls],
      [
  	ntp_cv_var_ntp_syscalls=no
diff --git a/package/ntp/0003-fix-pthread-detach-check.patch b/package/ntp/0003-fix-pthread-detach-check.patch
new file mode 100644
index 0000000000..c61b6cc736
--- /dev/null
+++ b/package/ntp/0003-fix-pthread-detach-check.patch
@@ -0,0 +1,27 @@
+fix pthread_detach check
+
+Refrence:
+ https://gitweb.gentoo.org/repo/gentoo.git/diff/net-misc/ntp/files/ntp-4.2.8_p15-configure-clang16.patch?id=56ef5ce33891feec34cd0c39a0a774a81a587dc7
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ sntp/m4/openldap-thread-check.m4 |    6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+Index: ntp-4.2.8p17/sntp/m4/openldap-thread-check.m4
+===================================================================
+--- ntp-4.2.8p17.orig/sntp/m4/openldap-thread-check.m4
++++ ntp-4.2.8p17/sntp/m4/openldap-thread-check.m4
+@@ -262,10 +262,8 @@ pthread_rwlock_t rwlock;
+ 				dnl save the flags
+ 				AC_LINK_IFELSE([AC_LANG_PROGRAM([[
+ #include <pthread.h>
+-#ifndef NULL
+-#define NULL (void*)0
+-#endif
+-]], [[pthread_detach(NULL);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
++pthread_t thread;
++]], [[pthread_detach(thread);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
+ 			])
+ 
+ 			if test $ol_cv_func_pthread_detach = no ; then
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
