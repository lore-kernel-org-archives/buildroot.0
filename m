Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC6EEA7943
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7CB4810B4;
	Wed,  4 Feb 2026 19:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzdOZYKy0tpE; Wed,  4 Feb 2026 19:04:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59870810BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770231895;
	bh=VxcGeJ6/+9WSsskYGCd6lwStLVX+q+PJdYLWE9ShisI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PkxDT+1jz1DYOX+ApSVNSOcj4Q94V7o6WfbrB67eZ8UYYtvzjR25k+D4lYIEOcHaM
	 pRQZpiY5wRtxOne7wDdqNuXvU2Sy40az52j9ccE22Q+OsXzLmbdbIp5vV3ELBbSSGz
	 36OS132ABIw4fKSt4yqtCFtUDLys/QJ+b/R8gT5yLuOfwUwOHN443wVIyBhp+bnYmB
	 cQyeJDKLyjMUi+O8jGicYoD4AVV0Nc1uxc0dOY7YqY+v2TPNmbYVXXg9zjM5IVlU1j
	 LJlVr2zExPvupuMwf6DznApOT0YUKMp+VtcoP92mL9r8z8XAWI8K6JB5verDe+HFSP
	 Dhwwh/l5B1L7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59870810BE;
	Wed,  4 Feb 2026 19:04:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEE99F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF3DD810BE
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLbN6iFnfKLJ for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:04:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C516F810B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C516F810B4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C516F810B4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:04:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 99C02A4C5879;
 Wed,  4 Feb 2026 19:59:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42634)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vni5d-000000004m4-1vSA;
 Wed, 04 Feb 2026 18:59:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  4 Feb 2026 19:59:01 +0100
Message-ID: <20260204185901.1073376-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770231541;
 bh=jiannLgKlwo3YZVJp6RCal+2KciSdxiVNTkY/DQkKsY=;
 h=From:To:Cc:Subject:Date:From;
 b=qPLB7B23HH9m1+CEnPK4UXKIzY0es5zvkB6/xjGw6VHNkPe2Ti0XS7UMxMD5zWKbo
 JI9WZAnMxrnAyAlDXMrFoA+NFgu+Zzbtebu/Q+a6uvfusRpDgQwc+nguZygMcyU7IS
 WagseCqpmqBNkggg6exhGWXJiDYFzJwFs32oKUfEDpoGDx8D7P7c2xxTf3L3zpSMP0
 gzNO1uyFGQ0+Djj7Akb5KbNuMiV55Mp12b2UR0ODIO+/MCVy/QibdvIR/+wee3yYHm
 S4gNVnOOLcY6Cq/tRxtQsO6ezjDrQNah4y4b0CTrZYY4AzgSvYFi6RyJwHOoT1EWZc
 yTy49yuyRv1dA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=qPLB7B23
Subject: [Buildroot] [PATCH 1/1] package/meson: fix build error
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

Buildroot commit eb1f160b7a08537fdfeb0800b9240a497f4237ac bumped meson
to 1.10.0, this release includes upstream commit
https://github.com/mesonbuild/meson/commit/35193dd8e4f2a24ae689eeb8d01a2c3bcca11025

This commit caused build errors
https://github.com/mesonbuild/meson/issues/15497#issuecomment-3812709660
which were fixed by an upstream commit to the master branch:
https://github.com/mesonbuild/meson/commit/c1db93be859b360b64fe20d49a286278b56df64e

This patch adds to upstream fix to buildroot.

Fixes:
https://autobuild.buildroot.net/results/aab/aaba3d6a9d55c3e8030d3e3487bf93074a4deac1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...not-fail-if-only-the-build-machine-u.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch

diff --git a/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch b/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch
new file mode 100644
index 0000000000..22f9ace42e
--- /dev/null
+++ b/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch
@@ -0,0 +1,45 @@
+From c1db93be859b360b64fe20d49a286278b56df64e Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Tue, 3 Feb 2026 12:56:36 +0100
+Subject: [PATCH] ninjabackend: do not fail if only the build machine uses C++
+
+This is caused by the introduction of the cpp_importstd option; while
+target_uses_import_std() tries to protect from the option not existing,
+this does not work if cpp_importstd exists but build.cpp_importstd does
+not, and get_option_for_target() wants to look at the latter.
+
+Just return false on a KeyError for simplicity.
+
+Fixes: #15497
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream: https://github.com/mesonbuild/meson/commit/c1db93be859b360b64fe20d49a286278b56df64e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ mesonbuild/backend/ninjabackend.py | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/mesonbuild/backend/ninjabackend.py b/mesonbuild/backend/ninjabackend.py
+index 42f24d47d..e0aaa39c4 100644
+--- a/mesonbuild/backend/ninjabackend.py
++++ b/mesonbuild/backend/ninjabackend.py
+@@ -3297,11 +3297,11 @@ https://gcc.gnu.org/bugzilla/show_bug.cgi?id=47485'''))
+     def target_uses_import_std(self, target: build.BuildTarget) -> bool:
+         if 'cpp' not in target.compilers:
+             return False
+-        if 'cpp_importstd' not in self.environment.coredata.optstore:
+-            return False
+-        if self.environment.coredata.get_option_for_target(target, 'cpp_importstd') == 'false':
++        try:
++            if self.environment.coredata.get_option_for_target(target, 'cpp_importstd') == 'true':
++                return True
++        except KeyError:
+             return False
+-        return True
+ 
+     def handle_cpp_import_std(self, target: build.BuildTarget, compiler):
+         istd_args = []
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
