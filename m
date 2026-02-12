Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4FFEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E389261618;
	Fri, 13 Feb 2026 19:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVUqz1bZ1CD3; Fri, 13 Feb 2026 19:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92A5F61612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011480;
	bh=6UTO0imz1D3Amdv1lDAIUXBWqKNX8nQdBGxF18Hitx8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QXXJlk+RFFzkmW4QA+8Dk/1yfWf/cxswh93abIxO4fgcf4scQ10ghsbgemIG9+qzb
	 EYAm9Mu96N5YQ7dQ+mrAgZY/oNk5BQulKlnaQ+E4haKtT5U3AxZ2580lQQv2uqEuLN
	 ZaEZ68fiYdc3HvptOJ3HNoQPZ186mxC34V+wLt/9q8hr5mh60JKg0MY1RdhkWlZuuv
	 jZtGK0b32bErk67/lcSdF5mhDKC5ITSXp+CEp2V8Bn7IY4JVqoIbkJPY39MltYPm2B
	 JrLTOMD3WTap5wvt6f3bjbJlaCYNV/61R2RRvxzrw4eSdOJIvgn5TjRsBc09KzLlAJ
	 3n+8/mi0HK9Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A5F61612;
	Fri, 13 Feb 2026 19:38:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7A7C69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89C74413BF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylUz8Mu3Pztj for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A37C412DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A37C412DD
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F79D83593; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:37:09 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f407daec2ec74565050b7ec560c7e64ce128cc73
X-Git-Newrev: c12b4b1eacacaacd9b12df40b0a8d9ebb7448f9b
X-Patchwork-Hint: ignore
Message-Id: <20260213193702.7F79D83593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/ell: needs MMU
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c12b4b1eacacaacd9b12df40b0a8d9ebb7448f9b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Buildroot commit e834d23cd792ee57ea80f37ce01d9d50756dba1d bumped ell to
version 0.79 that includes upstream commits in version 0.72 which make
use of fork():

https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=9245dfb84d1e0f58dda102704201d78ddfdfca68
https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=e0628c429d50d50b116717f37a5f5c1f66bef6a2

Fixes:
https://autobuild.buildroot.net/results/036/03690fa454ffb1c4c79b182cc3a165555e2c59eb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b27ee684b1aa9e799bad6dee449d2c56739ba48c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bluez5_utils/Config.in | 2 +-
 package/ell/Config.in          | 2 ++
 package/iwd/Config.in          | 2 +-
 package/ofono/Config.in        | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 49bb719102..2fe25466b4 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	bool "bluez-utils"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_MMU # dbus, ell
 	depends on !BR2_STATIC_LIBS # uses dlfcn
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/ell/Config.in b/package/ell/Config.in
index c7c9164816..124a57f7e9 100644
--- a/package/ell/Config.in
+++ b/package/ell/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ELL
 	bool "ell"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	depends on BR2_USE_WCHAR
@@ -9,5 +10,6 @@ config BR2_PACKAGE_ELL
 	  https://01.org/ell
 
 comment "ell needs a toolchain w/ wchar, headers >= 4.12"
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index e4b0ead882..d8fb6a6ea0 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_IWD
 	bool "iwd"
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_MMU # dbus, ell
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index c1d0cae4ef..c6a45625d9 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_OFONO
 	bool "ofono"
 	depends on BR2_USE_WCHAR # gettext, libglib2, ell
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
-	depends on BR2_USE_MMU # dbus, libglib2
+	depends on BR2_USE_MMU # dbus, ell, libglib2
 	depends on !BR2_STATIC_LIBS # dlopen(), ell
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
