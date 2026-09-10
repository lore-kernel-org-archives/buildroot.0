Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34070C79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2A1F40AB6;
	Thu, 10 Sep 2026 19:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrNxF6hwbUPe; Thu, 10 Sep 2026 19:39:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E6F4940AB9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789069143;
	b=NIuI6tXxXCfsxOm9MecVVvj8tlW+GmuHr+zUkp8ikEgdhSCHVeMJdyyVXl08JPoLMtnd
	 4IniuA0DhgxizfWouB1YyC444RSIgsDoILZ1HfcwQzd0B1uobyYMt5e9U6v9Ikvy70KKt
	 PRYpGpM6jOeH7/NLdafDfrthNVPAllLSmQCj25u8BMmwHdw1ko0whvdc0h5rIpg+fjQq5
	 RHwOhy2YcQaIhi1byWobWIDSivHOmwJVAlIsSczNy/HgIosqaq0fBubK+WlgQ01jInBu9
	 lsSPChmF4vxIjI8+AoCzY23i+CJNQBMqk0nOfbkQSwSz47c2YAaV4rNzVtwN46QGqnQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789069143;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z/W2gmq7SBsN2vMcHXXSVauFWBDlDhGwM8hsAET9xXg=;
	b=CVBjs0TdKy79eRCnkMwP/AG6WdDQci3IbYsT7Lz+Z8N+wOpxtxjjb7RguGJPyEevf7Q8
	 n7Sdhf+yHdjfVZe1A5TcZYaPpHIz7HFJEp+0wb+rW4awGdTI8xEtynhf9WlDW6rtbrngs
	 3PonZ4+Va7gIfQaQsxAs8VpQOf/il1866enc0JfMaxO5qbg9akV2ciwTTeQv4a1IjX0fI
	 uBpkbpuCVf/iiGyMbORFd6mOCSIuZpZMwjK+q+cpFVmvNtLTkrvOmtlg0vHy+Vb4yQsP1
	 10HfXzoEF2dgYgGprY24vrzQsNsm+wzi/v0C9qxilD96rsCoHWp23JP9vY4dsyYNCug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789069143;
	bh=Z/W2gmq7SBsN2vMcHXXSVauFWBDlDhGwM8hsAET9xXg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fkqeFQ7A2avH0UGEE+UqFysborxqGWozJ23yRxSA909NFAfXKJum06UrjHsY46WnJ
	 0YSlp0VFFMFUBHM5/5jw9OYwFAsSg42lB9aFGmaSSnC1ect0Kbxy8f8KOrstcRHeYa
	 0RJaK7riELaknczehBRhndK/X4MM4lq29+LVzNgtampi3JHy0I/TGYtTem2qYk+mYR
	 EK5kQxoaoQuGs6FChHAV4lIQAdh1nO28uChqYs95z0pQ1QaAmelp32Q8vSVimJtxEG
	 5OV59ataRADsx6NwuW8SHFfuGiuTGsE+bCjgUE7y6VntHCaUssEpv52yJMrrp9SB+R
	 bzaSr78uyz6hA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6F4940AB9;
	Thu, 10 Sep 2026 19:39:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 301E3769
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DC1880F71
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWXqnFpKKkJS for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:39:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5900E80F6F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789069140;
 b=CWEkLQ+1d/ltH04UrnQG6/LYiGINy8S4DIYkuzQGi3WoCSjULzgPRNUeWjYZXamoi8gt
 a+MNmz6+UhSm/+LPcYWapj16ex9te6zzggRmvDmk1dpHFN/PqkMZ+Xipa+kLX0BDgU9YO
 7fXSvOi24EQl/h8dH75LKbzwgn0bbka02z2oNxSMB16RtWVB/+J45Js2x3kr31O1uiqvC
 8m3bwxw+jeUO5syzhISTc0ii4kr/pMuWdpIWbPfSFo4bD2q1N7RFMxB3rIYWubYWAYpYM
 iexU9zBWDn1ptXeWE8L6KUyTvW3/mGJqUJPnHvRrJYw+/NicenWGF9yT5FcTWcscPBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789069140;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ymW0TtLn8nTb93q2HegJkVIO5POvh7qZVDFF2bnlKfg=;
 b=icnDrKtMHSCSJSHCvtR//dUHdS30jgp6Cq69kvIJq0wTUWkQ48IMWn4tAEhLXJHNz/rR
 Qk0MinIO79RDE26vekbI1YCpsLqio6f1gR8rFAH4b2J89jZpZN+rGY2l3fEcMEIUF+FKx
 u9yrO+aFGNIbtVEA0yT/ZX3qvjdrdMNz8r+5y2AsU5YH65KfcWMJUQRd2bKTyBIBqoA5A
 17mmKoCxwhCcOSmV7arv1fR+KZ5N0JqgHjM4jzYJ50TgFTS7Y2b+AHLdByUm2ESOflqYG
 BdeuNqzkMU1bZ/+vdrhSugv4yJrTuwzN4xobSgb9GORmrvDgJHkY6+q/bP71b9vriKg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5900E80F6F
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:39:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C177F95436; Thu, 10 Sep 2026 19:37:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:38:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d8eb658ce9a086fd5dc2601b10c7f7945d44768
X-Git-Newrev: 636f69ab450e9d1bf48eda22b507a68272c5c9d5
X-Patchwork-Hint: ignore
Message-Id: <20260910193756.C177F95436@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{binutils, gpsd, micropython,
 net-tools, util-linux, x11vnc}: fix CVE patch information
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/636f69ab450e9d1bf48eda22b507a68272c5c9d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Prior to improving check-package to verify that the comment preceding
a <pkg>_IGNORE_CVES entry mentions an existing patch, and that the
patch itself contains a CVE: tag, we fix all problematic cases that
currently exist in Buildroot:

- In the case of binutils: the CVE was only applicable to binutils
  2.43/2.44, and the oldest version now supported is 2.45, so the
  patch doesn't exist anymore in Buildroot
- For x11vnc, fix a typo in the patch name
- For gpsd the patches were dropped in [1] as they are included in the
  version bump
- Similarly for micropython, the patches were dropped in [2] along with
  the version bump
- For util-linux, strip the prefix "package/util-linux/", so that the patch
  is relative to the .mk file and can be found by the new check
- Add missing 'CVE:' tag to net-tools patch 0001

[1] 37ef4f862f package/gpsd: bump version to 3.27.2
[2] 28eeca9a98 package/micropython: bump to version 1.28.0

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/binutils.mk                                        | 3 ---
 package/gpsd/gpsd.mk                                                | 6 ------
 package/micropython/micropython.mk                                  | 3 ---
 .../0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch | 1 +
 package/util-linux/util-linux.mk                                    | 2 +-
 package/x11vnc/x11vnc.mk                                            | 2 +-
 6 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ca1bfb89b3..5c5c8fc466 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -21,9 +21,6 @@ BINUTILS_LICENSE = GPL-3.0+, GPL-2.0+, LGPL-2.1+
 BINUTILS_LICENSE_FILES = COPYING COPYING3 COPYING.LIB
 BINUTILS_CPE_ID_VENDOR = gnu
 
-# 0003-objdump-memleak.patch
-BINUTILS_IGNORE_CVES += CVE-2025-3198
-
 ifeq ($(BINUTILS_FROM_GIT),y)
 BINUTILS_DEPENDENCIES += host-flex host-bison
 HOST_BINUTILS_DEPENDENCIES += host-flex host-bison
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 27a02c1754..7fd8cec8ab 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -14,12 +14,6 @@ GPSD_INSTALL_STAGING = YES
 
 GPSD_DEPENDENCIES = host-scons host-pkgconf
 
-# 0005-drivers-driver_nmea2000.c-Fix-issue-356-skyview-buff.patch
-GPSD_IGNORE_CVES += CVE-2025-67268
-
-# 0006-gpsd-packet.c-Fix-integer-underflow-is-malicious-Nav.patch
-GPSD_IGNORE_CVES += CVE-2025-67269
-
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
 GPSD_CFLAGS = $(TARGET_CFLAGS)
 GPSD_CXXFLAGS = $(TARGET_CXXFLAGS)
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 044714451c..e260b9fde8 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -15,9 +15,6 @@ MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-python3
 MICROPYTHON_CPE_ID_VENDOR = micropython
 
-# 0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch
-MICROPYTHON_IGNORE_CVES += CVE-2024-8947
-
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
 ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
diff --git a/package/net-tools/0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch b/package/net-tools/0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch
index 0a02785f38..1405b5c9e9 100644
--- a/package/net-tools/0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch
+++ b/package/net-tools/0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] CVE-2025-46836: interface.c: Stack-based Buffer Overflow in
 
 Coordinated as GHSA-pfwf-h6m3-63wf
 
+CVE: CVE-2025-46836
 Upstream: https://github.com/ecki/net-tools/commit/7a8f42fb20013a1493d8cae1c43436f85e656f2d
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index cfcd738bb5..b4175024c4 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -37,7 +37,7 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
-# package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
+# 0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
 UTIL_LINUX_IGNORE_CVES += CVE-2026-27456
 
 # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 645ef40643..4ec1813430 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -10,7 +10,7 @@ X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst libvncserver
 X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
 X11VNC_CPE_ID_VALID = YES
-# 0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
+# 0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
 X11VNC_IGNORE_CVES += CVE-2020-29074
 
 # Source coming from github, no configure included
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
