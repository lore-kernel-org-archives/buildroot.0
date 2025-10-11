Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB0FCCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 09:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6037B810D2;
	Sat, 11 Oct 2025 09:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfWQ1gdgEmYS; Sat, 11 Oct 2025 09:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18572810C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18572810C3;
	Sat, 11 Oct 2025 09:58:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08F3212B
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE10660625
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvIJXbxX3r5Y for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 09:58:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0237560624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0237560624
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0237560624
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:58:52 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-b5507d3ccd8so2322039a12.0
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 02:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760176732; x=1760781532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dGV0Hxt+yr0pJcQ+HgZK8SCj7LSngNYubFpDCd+tNtw=;
 b=kk+pAIFjypJZdqobKfM0yBoM/jYOiwvBirZ3fRXmneFKTW8fggt3E04DOxmBK4Zmgw
 Q6YMY3yAH1XiINfk7Ej3UJORCe9j1nkhvNcRkLwczR5LcWWXi+eob7NyHBGARftI+PLf
 UOnJ+2cWP1E/OXPqM/2gfO3dpuxMiPbip7vnnkXF0uW42zky5V59pI7+gXaQHbtq9tow
 bMmZTJ6re1GsbgDybDsdyM70QWq5GE+YnAv/Un8DlMmdQ57beuh8W8/BA6qswfyRXTzW
 oyrRZx326aD+iK5ftBxcAkCxq8VSvlMgFmSSeaAc7xqHgD4vsxK1JV6afwedomqokcdZ
 r/2g==
X-Gm-Message-State: AOJu0YzYqiowaHxcUgcIwp/7tWTl7o/paBfx4zCB/+Lns1NdfpDRF6K8
 BeWsNkxMfs8BNmJwlDTaJ0ybuJZXcFRQN1lE8faGlZikRsmFTuh0VaLb60o4BHZ5
X-Gm-Gg: ASbGnctRlPv1ufmxiQOPErmJLwJFU2CM4afklBv4IYiLJYKCUjWGlvUOmwr1JunPfS2
 t+lt8iYMOVjgj+w0Mbvs/JRI6W4XxkHIp6kMbnsBCneCFll25zfJ8iuBOwPUURmBDjo2VKq87M/
 gGHU2ysLazYCc4WJEwJlINvomSTiufsj02Z594yL1FffPFr5IyeMcXfN/3zZ6HD0dgbediMYBd/
 sZseM3IwVBlG88Lq7oDMIunPAJ5fzpVxY+CeEwxhuay70grI1NF/0osN9nbJDhtscugV/ZSiw3+
 sA617dRDwI7kXDYjk4vb4Ttr0UpSUzc6KJQCGwPeZNhqOmEwbs7uGgZeD1/MgPUOYYo1tZIXa63
 WFAwqoasUTOt3LIfbJeHxbCCXGCddpkgQ8J+E6axYw8GNeXMddiu+KWbHwWIAHUvQnV5a/4/c6+
 CVCwii0blTU0LjXlmRnUn5IC0rr+1rIfubQwtmmvWmqYUSH/6ctbtTCGcuSaiyD8PRLds=
X-Google-Smtp-Source: AGHT+IESu6y+7yHb1378as2cn0DFBfGhXAxuPO6oRBSDcC1h8pGUs72r2ns8NJ1W4bFFUpFZ/FJrdA==
X-Received: by 2002:a05:6a20:394b:b0:2ac:7567:c069 with SMTP id
 adf61e73a8af0-32da8138f47mr22010949637.17.1760176731973; 
 Sat, 11 Oct 2025 02:58:51 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992d9992ddsm5471230b3a.80.2025.10.11.02.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 02:58:51 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat, 11 Oct 2025 02:58:48 -0700
Message-Id: <20251011095848.555858-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760176732; x=1760781532; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dGV0Hxt+yr0pJcQ+HgZK8SCj7LSngNYubFpDCd+tNtw=;
 b=aIIvEetfl2zZoOuojNh/tEkKIV5cxei1uLiVPUGd3QUe271BwqwD3dgDm8HdplUX+d
 kt6QlpZtasFZhg4fvuBl8QaBwrawmWho3dEEGAaakoPsZbaklu8WhukmqvKjSmeziigd
 7uVquf6cDntu/qdTnk5v97XDbT5VLRlaTbxwbFQnH95YGiyrYdkl+43+1/DjIqSXILDe
 ZMfXDp/Mp0cPkXgMdRrvP/IheXXvIuxz43UXMHlMDoR/NhldtDqYlZLq5r3WT/jmchgP
 4iyqrFBUYPJZXjycoRVANzj0mIw9vlSpRtNGRpdjM4adT9gxERZoV3an3ibuxl+bCWiC
 BXVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aIIvEetf
Subject: [Buildroot] [PATCH 1/1] package/ltrace: bump version to 0.8.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://gitlab.com/cespedes/ltrace/-/blob/0.8.1/NEWS
https://gitlab.com/cespedes/ltrace/-/blob/ltrace-0.8.0/NEWS

- Drop the upstreamed 0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
  https://gitlab.com/cespedes/ltrace/-/commit/10177832689ae3411d7dad39ac66b2ceaf4e46f2
- Switch site to gitlab

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...ac-fix-autoreconf-with-autoconf-2.70.patch | 35 -------------------
 package/ltrace/ltrace.hash                    |  2 +-
 package/ltrace/ltrace.mk                      |  7 ++--
 4 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 127e20ca0f..0f6a5b0b19 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -663,7 +663,6 @@ package/lockfile-progs/0001-sus3v-legacy.patch lib_patch.Sob lib_patch.Upstream
 package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch lib_patch.Upstream
 package/ltrace/0001-arm-plt.patch lib_patch.Upstream
 package/ltrace/0002-sparc-add-missing-library.h-include.patch lib_patch.Upstream
-package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch lib_patch.Upstream
 package/lttng-babeltrace/0001-tests-lib-Makefile.am-remove-unneeded-static-flag.patch lib_patch.Upstream
 package/lttng-babeltrace/0002-configure.ac-fix-popt-static-build.patch lib_patch.Upstream
 package/lttng-libust/0001-configure.ac-add-disable-tests.patch lib_patch.Upstream
diff --git a/package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch b/package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
deleted file mode 100644
index efe993ec88..0000000000
--- a/package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b8d5d086489ff20339e221323a60c140a9820e67 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 9 Oct 2021 09:39:52 +0200
-Subject: [PATCH] configure.ac: fix autoreconf with autoconf >= 2.70
-
-Drop AC_CONFIG_AUX_DIR to avoid the following build failure with
-autoconf >= 2.70:
-
-autoreconf: error: cannot create config/autoconf: No such file or directory
-
-Fixes:
- - http://autobuild.buildroot.org/results/433599039d6e1ee301465f9867e169c121a0646f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent as upstream is unmaintained:
-https://gitlab.com/cespedes/ltrace/-/issues/8]
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index b9c39fa..486589b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -28,7 +28,6 @@ AC_INIT([ltrace],[0.7.91],[ltrace-devel@lists.alioth.debian.org],
- AC_CONFIG_HEADERS([config.h])
- AC_CONFIG_SRCDIR(libltrace.c)
- AC_CONFIG_MACRO_DIR([config/m4])
--AC_CONFIG_AUX_DIR([config/autoconf])
- AC_CANONICAL_BUILD
- AC_CANONICAL_HOST
- 
--- 
-2.33.0
-
diff --git a/package/ltrace/ltrace.hash b/package/ltrace/ltrace.hash
index a677ed3511..cb505b46c3 100644
--- a/package/ltrace/ltrace.hash
+++ b/package/ltrace/ltrace.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4aecf69e4a33331aed1e50ce4907e73a98cbccc4835febc3473863474304d547  ltrace-82c66409c7a93ca6ad2e4563ef030dfb7e6df4d4.tar.gz
+sha256  11c85a1353fcf2b5438b19d0ccc2d376c96656ce6f11cf9537e3a92b84392c58  ltrace-0.8.1.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index b3bd90daaa..61d1a13809 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -4,11 +4,8 @@
 #
 ################################################################################
 
-# This github version has some extra fixes on top of https://ltrace.org/
-# in particular the following commit to avoid a crash:
-#   192e0a6 void struct members are now ignored
-LTRACE_VERSION = 82c66409c7a93ca6ad2e4563ef030dfb7e6df4d4
-LTRACE_SITE = $(call github,dkogan,ltrace,$(LTRACE_VERSION))
+LTRACE_VERSION = 0.8.1
+LTRACE_SITE = $(call gitlab,cespedes,ltrace,$(LTRACE_VERSION))
 LTRACE_DEPENDENCIES = elfutils
 LTRACE_CONF_OPTS = --disable-werror
 LTRACE_LICENSE = GPL-2.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
