Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADC8C282D1
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 08:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6358381029;
	Sun,  9 Mar 2025 08:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJBkBIZ1AWcJ; Sun,  9 Mar 2025 08:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E64781027
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E64781027;
	Sun,  9 Mar 2025 08:07:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1378EDC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 08:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6A4F408B2
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 08:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDs0opZbvvI4 for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 08:07:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29DE0408AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29DE0408AE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29DE0408AE
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 08:07:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c397.dip0.t-ipconnect.de [79.214.195.151])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1B460A4C21BE
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 09:07:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40928)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1trBhJ-00000000650-2Ce6
 for buildroot@buildroot.org; Sun, 09 Mar 2025 08:07:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Mar 2025 09:07:45 +0100
Message-Id: <20250309080745.24384-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1741507667;
 bh=BHcczg8c6NpIQs5zmLotaU14CJZpCtmldmfE6AqvAx8=;
 h=From:To:Subject:Date:From;
 b=DrnM6tO058uUMSf4IUMoWIdjIvMsrS34WIFkMfV0Dn8ggexannManC06ax9KE2Its
 Tq0fOyp35+TBVWwctiJZe/CRIxZlMJxjw4a6IW9WQiyDGvd6Q3249BEqV/xqTw0V67
 /I64gLrGHBN92c33BBKzhgdjSb6wLJgOq+fYvyXMhoZwoBdxjg52r21NjuPHx7zAub
 IMq1OQBh0/sQAZTfyBC2J4zbJ15shrav55UuS6Vk86kwI7FC0PKv9mW6f5l6nzb0SZ
 zRXTE4dU6Dnd7aXq+/zJUT0Z7cWRGuIhQ33TQFRyQbzr4MATfrVfYv06T+DMgtlhIY
 bOcdZSPM5BaPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=DrnM6tO0
Subject: [Buildroot] [PATCH/next 1/1] package/libcec: Fix reproducible builds
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

Buildroot commit dcae760d1147e865b7a7073aa7e1190c3e43f4da bumped libcec
to version 7.0.0 in -next branch. Due to upstream changes[1] included in
this version bump our old method for reproducible builds got broken, the
git version shown was extracted from the buildroot tree:

Quoting configure logs:

- unpatched package
-- lib info: git revision: 2025.02-rc1+129-a291649~dirty, compiled on 2025-03-09 07:43:36 by buildroot@localhost on Linux Linux (Linux), features: P8_USB, DRM, P8_detect

- adding "SOURCE_DATE_EPOCH=1" to _CONF_ENV following [1]
-- lib info: git revision: 2025.02-rc1+129-a291649~dirty, compiled on 1970-01-01 00:00:01 on Linux Linux (Linux), features: P8_USB, DRM, P8_detect

- DISABLE_BUILDINFO=ON
-- lib info: , features: P8_USB, DRM, P8_detect

[1] https://github.com/Pulse-Eight/libcec/commit/1cd2d1be8ca1d0baa0a4a184fd94a87895f28ce6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcec/0001-all-remove_git_info.patch | 31 +++++++++++++++++++
 package/libcec/libcec.mk                      |  6 ++--
 2 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 package/libcec/0001-all-remove_git_info.patch

diff --git a/package/libcec/0001-all-remove_git_info.patch b/package/libcec/0001-all-remove_git_info.patch
new file mode 100644
index 0000000000..67e3ac438a
--- /dev/null
+++ b/package/libcec/0001-all-remove_git_info.patch
@@ -0,0 +1,31 @@
+Add configure option DISABLE_BUILDINFO to disable most build infos.
+
+Fixes reproducible builds.
+
+Upstream: not applicable
+
+Downloaded from Kodi PR 26469 which updates an older Kodi-specific
+patch to disable git infos in libcec:
+https://github.com/xbmc/xbmc/pull/26469/files#diff-82014966bf69059c76c52a9a150c8763fef575a9395d820baafb047dbf57cfaa
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/src/libcec/cmake/SetBuildInfo.cmake
++++ b/src/libcec/cmake/SetBuildInfo.cmake
+@@ -12,7 +12,7 @@
+ else()
+   # not Windows
+   set(LIB_INFO "")
+-
++if(NOT DISABLE_BUILDINFO)
+   # add git revision to compile info
+   find_program(HAVE_GIT_BIN git /bin /usr/bin /usr/local/bin)
+   if(HAVE_GIT_BIN)
+@@ -69,6 +69,6 @@
+ 
+     set(LIB_INFO "${LIB_INFO} on ${BUILD_SYSNAME} ${BUILD_SYSVER} (${BUILD_SYSARCH})")
+   endif()
+-
+ endif()
++endif()
+ 
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index a45f074c30..5ac5d106c6 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -38,9 +38,7 @@ LIBCEC_DEPENDENCIES += xlib_libXrandr
 endif
 
 # Disable information about how libCEC is compiled.
-LIBCEC_CONF_OPTS += -DHAVE_GIT_BIN="" \
-	-DHAVE_WHOAMI_BIN="" \
-	-DHAVE_HOSTNAME_BIN="" \
-	-DHAVE_UNAME_BIN=""
+LIBCEC_CONF_OPTS += \
+	-DDISABLE_BUILDINFO=ON
 
 $(eval $(cmake-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
