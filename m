Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ED1C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 14:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AC82404BE;
	Sat, 20 Jul 2024 14:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqK8H0w8wyTE; Sat, 20 Jul 2024 14:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68D2F404A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68D2F404A4;
	Sat, 20 Jul 2024 14:26:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0A131BF325
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 14:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C38F81AF3
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 14:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36Ijls3d6YIj for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 14:26:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C5D681A5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C5D681A5F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C5D681A5F
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 14:26:34 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so22169425e9.2
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 07:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721485592; x=1722090392;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TTnibJzSysQq1754iDMbu91GdmIn9fztd77PQ/0EXKU=;
 b=riM6/0RLvFITR469k5rNUHIn5bOoDy9PE0WhNzxDzvB2EsjU8T10Fj+C06BSCV8x4z
 tngG+0lX9hL4JbxbVh0eopurfcGidUdLPJgduq7FsNrjjNTmNz3k08niVr8e/Gw1U7fR
 A/Ma3KRLBq+8j4cQlwDWP8lAeNtiYi0uzUnmKYG1ap0zlpdxwVRJB+/5AVce2uvrckF6
 a2tV3+rbKWoBFr4CR1BIJyFrQVJ+5IkpPSzgQz7kZLkrdRnH8yzuyAr85Ymq75ek6U9I
 xBmFSfas4Y5jIKT8b061wrXAZSn09sn4m6Lf/PhWTXMRoBNzhB+vdO4NHyZMzG96QvkC
 a1rA==
X-Gm-Message-State: AOJu0Yzyefwj+rF2b6reGqcVz0VtIe/oePFeXQvuGz9X5ZZxmCaJz+Zt
 vh3wnv/ag/X9X0t6WRIRWFkYmAO7A0REVM1QWeaKzFhZcTSfex+GA1K85w==
X-Google-Smtp-Source: AGHT+IFa+BwhpnN9VLjgcmCDg7yx66XFpQGqzNRZchhFVKj+QCVs9EtM8ze0Am0qbpblCnMXorE3mA==
X-Received: by 2002:a05:600c:46d0:b0:426:593c:9359 with SMTP id
 5b1f17b1804b1-427dc56b60bmr15597355e9.32.1721485592059; 
 Sat, 20 Jul 2024 07:26:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d68fa394sm58937965e9.3.2024.07.20.07.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 07:26:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 16:26:29 +0200
Message-ID: <20240720142629.747083-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721485592; x=1722090392; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TTnibJzSysQq1754iDMbu91GdmIn9fztd77PQ/0EXKU=;
 b=iIa8g6ZhVbyVNqtlLQbrFaZwVDaMHgHmLbJtBkgB/uXKLom20VOyhCFyCRIazl/BNU
 y0q0jN1X0Y241bipYrEtihc6IOwMUC2j+4HF5uVgpDlWJMMs+CePypLuPsEkzRYYag7u
 Ks2HX/wbHA+P0bln7QJ5VPjQKO7hh+46TItDTPV9dbmQZuplWmwA1l0dw6YPEJiNyH9b
 d7uXiqrBVntnvXuX2vXyKXf51990Xz8YqzcTab/Nv8HsjhNYej0G7coGGq3rAZc/KYB1
 VFtaBt952M/x2EG0JSLm96zsyR62IUtDSVtQ2dxLL5so7MRRXeml2hZGHr4JHVRHPRR0
 NLBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iIa8g6Zh
Subject: [Buildroot] [PATCH 1/1] package/autossh: fix build with gcc >= 14
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Include stdio.h to avoid that __progname check wrongly returned that
the function is unavailable with gcc >= 14 which enables
-Werror=implicit-function-declaration
(https://gcc.gnu.org/gcc-14/porting_to.html):

configure:5231: checking if libc defines __progname
configure:5249: /home/autobuild/autobuild/instance-7/output-1/host/bin/sh4-buildroot-linux-musl-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c  >&5
conftest.c: In function 'main':
conftest.c:73:27: error: implicit declaration of function 'printf' [-Wimplicit-function-declaration]
   73 |  extern char *__progname; printf("%s", __progname);
      |                           ^~~~~~
conftest.c:1:1: note: include '<stdio.h>' or provide a declaration of 'printf'
    1 | /* confdefs.h */
conftest.c:73:27: warning: incompatible implicit declaration of built-in function 'printf' [-Wbuiltin-declaration-mismatch]
   73 |  extern char *__progname; printf("%s", __progname);
      |                           ^~~~~~
conftest.c:73:27: note: include '<stdio.h>' or provide a declaration of 'printf'

resulting in the following static build failure:

/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/sh4-buildroot-linux-musl/14.1.0/../../../../sh4-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-7/output-1/host/sh4-buildroot-linux-musl/sysroot/lib/libc.a(libc.o):(.bss.__progname+0x0): multiple definition of `__progname'; autossh.o:(.bss+0x120): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/5d80a8096d0f5529cbd86903a74f3bab3d230f4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ....ac-fix-__progname-check-with-gcc-14.patch | 52 +++++++++++++++++++
 package/autossh/autossh.mk                    |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 package/autossh/0001-configure.ac-fix-__progname-check-with-gcc-14.patch

diff --git a/package/autossh/0001-configure.ac-fix-__progname-check-with-gcc-14.patch b/package/autossh/0001-configure.ac-fix-__progname-check-with-gcc-14.patch
new file mode 100644
index 0000000000..a517328110
--- /dev/null
+++ b/package/autossh/0001-configure.ac-fix-__progname-check-with-gcc-14.patch
@@ -0,0 +1,52 @@
+From 3a74eff481f37975e04f00db4923b1c16f93497d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 20 Jul 2024 16:06:37 +0200
+Subject: [PATCH] configure.ac: fix __progname check with gcc >= 14
+
+Include stdio.h to avoid that __progname check wrongly returns that
+the function is unavailable with gcc >= 14 which enables
+-Werror=implicit-function-declaration
+(https://gcc.gnu.org/gcc-14/porting_to.html):
+
+configure:5231: checking if libc defines __progname
+configure:5249: /home/autobuild/autobuild/instance-7/output-1/host/bin/sh4-buildroot-linux-musl-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c  >&5
+conftest.c: In function 'main':
+conftest.c:73:27: error: implicit declaration of function 'printf' [-Wimplicit-function-declaration]
+   73 |  extern char *__progname; printf("%s", __progname);
+      |                           ^~~~~~
+conftest.c:1:1: note: include '<stdio.h>' or provide a declaration of 'printf'
+    1 | /* confdefs.h */
+conftest.c:73:27: warning: incompatible implicit declaration of built-in function 'printf' [-Wbuiltin-declaration-mismatch]
+   73 |  extern char *__progname; printf("%s", __progname);
+      |                           ^~~~~~
+conftest.c:73:27: note: include '<stdio.h>' or provide a declaration of 'printf'
+
+resulting in the following static build failure:
+
+/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/sh4-buildroot-linux-musl/14.1.0/../../../../sh4-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-7/output-1/host/sh4-buildroot-linux-musl/sysroot/lib/libc.a(libc.o):(.bss.__progname+0x0): multiple definition of `__progname'; autossh.o:(.bss+0x120): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5d80a8096d0f5529cbd86903a74f3bab3d230f4a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/Autossh/autossh/pull/9
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4bb9380..dadb523 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -132,7 +132,7 @@ AC_CHECK_LIB(socket, connect)
+ # ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ AC_CACHE_CHECK([if libc defines __progname], ac_cv_libc_defines___progname, [
+-	AC_TRY_LINK([],
++	AC_TRY_LINK([ #include <stdio.h> ],
+ 		[ extern char *__progname; printf("%s", __progname); ],
+ 		[ ac_cv_libc_defines___progname="yes" ],
+ 		[ ac_cv_libc_defines___progname="no" ]
+-- 
+2.43.0
+
diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
index 899e5cdb52..fbb525bcca 100644
--- a/package/autossh/autossh.mk
+++ b/package/autossh/autossh.mk
@@ -10,6 +10,7 @@ AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
 AUTOSSH_LICENSE = Modified BSD
 AUTOSSH_LICENSE_FILES = autossh.c
 # Fix AC_ARG_WITH code generation for --with-ssh
+# 0001-configure.ac-fix-__progname-check-with-gcc-14.patch
 AUTOSSH_AUTORECONF = YES
 
 AUTOSSH_CONF_OPTS = --with-ssh=/usr/bin/ssh
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
