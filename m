Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75198C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 19:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F12B96FA98;
	Fri, 12 Jan 2024 19:20:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F12B96FA98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbEkoSgEvDQE; Fri, 12 Jan 2024 19:20:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED5860E37;
	Fri, 12 Jan 2024 19:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ED5860E37
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41EB01BF489
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 19:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AE29845EB
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 19:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AE29845EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UupQqSXhEbKR for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 19:20:10 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1FD08457B
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 19:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1FD08457B
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-336c5b5c163so4112516f8f.1
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 11:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705087207; x=1705692007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLtQSh3HOkfDchE/h1rF710ttgRy/cvS/WHBKXmoIdE=;
 b=EC9B5k5Zd+3MNI4yIfXXvs5qNecR4gGSxr4I0okWnGF5YPBYChlHR0QfOtJjTUxVvl
 1j2zPNdiq+bgT8eazX/kuyBGeYpmrTRi1UfiP4QI5Ascn51YxTKYS4hWxadQkdlZUVmv
 /AoKr+Pq+oWCRzxXhN+AXE4bRHGSAl8OttFsDVYD00KcLB9lrTe9liuw9n22/XrKkI8C
 ybn8pekn/qyWdca/QZyTVPoC9XjQ4Cp/L1QEADf9XdLakOEB1+dsyypDy2JyWw0tBu5I
 acAE67v5dLg+WGAN3OkeE1Xq6zbrA/LtZnJZoehvF3/mlGynD2NH+Gp+cU+8gs1YyAlR
 mEHw==
X-Gm-Message-State: AOJu0YwIZ1JUddAi/FFQ5gvp43AQpBj9+rXkrUoDBqlK7pAoh/SUro86
 zrqurOEou6+MswAjIlVnUj/p+IxJBo8=
X-Google-Smtp-Source: AGHT+IGhfpxmJKPCuKN1yryin8UmCDkWvU8SbKiKLyomrZlo70TY9GrdNvbG6R5qFHf9u/2wuKV2CA==
X-Received: by 2002:adf:fa0c:0:b0:336:8137:facd with SMTP id
 m12-20020adffa0c000000b003368137facdmr1117227wrr.26.1705087206877; 
 Fri, 12 Jan 2024 11:20:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a14-20020a056000100e00b003371e7113d4sm4651131wrx.24.2024.01.12.11.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 11:20:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 20:20:03 +0100
Message-ID: <20240112192003.1004726-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705087207; x=1705692007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SLtQSh3HOkfDchE/h1rF710ttgRy/cvS/WHBKXmoIdE=;
 b=Ia8CvPxz3alzejG8HWlzyXYl0UWrmVu5cGc9gDExv2WJn29gtJl/sYFF4+tqhjGrKN
 R5BjvDSFJz7QXvO7XQWv+Cq4G/BcFAmh2KTjrUioUvSkJVBIyomYOyaWx8zcDgcNa3ey
 o1jQS6MhP0KYhkSoxjaRqM66dSMqECNA+Ign/mtRXEIRInsPjMmf9QpSoIM/PuUrqlpE
 +1XLrD1mnF8dgo05B+xxYVfPw58BbavxCQnNS93TLYL+QNEMSrLdbQjndNoqKn/mNY8i
 /5FAoN6lZgy63Yxqt4j7xP1r8vFobjHVCxc0cHWbF4oLuRiZi4p/0sGwJ33usEq0Gysa
 NCFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ia8CvPxz
Subject: [Buildroot] [PATCH 1/1] package/libnss: fix musl build
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix following musl build failure raised at least since bump to version
3.84 in commit bcdf2fc0e41832147d3fc398070074be29c159d4:

/home/buildroot/autobuild/instance-3/output-1/host/bin/microblazeel-linux-gcc -shared   -Wl,-z,defs -Wl,-soname -Wl,libfreebl3.so  -Wl,--version-script,Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/freebl.def -Wl,-Bsymbolic -o Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/libfreebl3.so Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowhash_vector.o      -ldl -lc
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-musl/11.2.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowhash_vector.o: in function `loader_GetOriginalPathname':
(.text.loader_GetOriginalPathname+0x1c4): undefined reference to `PR_SetError'

Fixes:
 - http://autobuild.buildroot.org/results/9a51138bb8a65f7f76a01d0e73c451273e6eb49e
 - http://autobuild.buildroot.org/results/d00d22f1bfee5c175f3266ff16124632906463c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...l-genload.c-drop-call-to-PR_SetError.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libnss/0002-lib-freebl-genload.c-drop-call-to-PR_SetError.patch

diff --git a/package/libnss/0002-lib-freebl-genload.c-drop-call-to-PR_SetError.patch b/package/libnss/0002-lib-freebl-genload.c-drop-call-to-PR_SetError.patch
new file mode 100644
index 0000000000..fcbb434727
--- /dev/null
+++ b/package/libnss/0002-lib-freebl-genload.c-drop-call-to-PR_SetError.patch
@@ -0,0 +1,39 @@
+From ac93583db67145467c0698f6adba5ee907d9216b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Jan 2024 20:13:30 +0100
+Subject: [PATCH] lib/freebl/genload.c: drop call to PR_SetError
+
+Drop call to PR_SetError in genload.c as already done in
+lowhash_vector.c to avoid adding a dependency on a function defined in
+nspr and raising the following build failure when FREEBL_NO_DEPEND is
+set to 1 (default on Linux):
+
+/home/buildroot/autobuild/instance-3/output-1/host/bin/microblazeel-linux-gcc -shared   -Wl,-z,defs -Wl,-soname -Wl,libfreebl3.so  -Wl,--version-script,Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/freebl.def -Wl,-Bsymbolic -o Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/libfreebl3.so Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowhash_vector.o      -ldl -lc
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-musl/11.2.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowhash_vector.o: in function `loader_GetOriginalPathname':
+(.text.loader_GetOriginalPathname+0x1c4): undefined reference to `PR_SetError'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d00d22f1bfee5c175f3266ff16124632906463c3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/nss-dev/nss/pull/28
+---
+ lib/freebl/genload.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/lib/freebl/genload.c b/nss/lib/freebl/genload.c
+index 832deb58c..1f145048b 100644
+--- a/nss/lib/freebl/genload.c
++++ b/nss/lib/freebl/genload.c
+@@ -43,7 +43,7 @@ loader_GetOriginalPathname(const char* link)
+     PRUint32 iterations = 0;
+     PRInt32 len = 0, retlen = 0;
+     if (!link) {
+-        PR_SetError(PR_INVALID_ARGUMENT_ERROR, 0);
++        /*PR_SetError(PR_INVALID_ARGUMENT_ERROR, 0); */
+         return NULL;
+     }
+     len = PR_MAX(1024, strlen(link) + 1);
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
