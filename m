Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86551C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81AB84F107;
	Fri, 28 Feb 2025 17:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdutYFVGqWEn; Fri, 28 Feb 2025 17:13:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AFC34FA12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AFC34FA12;
	Fri, 28 Feb 2025 17:13:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09BC3711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B86242EA9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hn9c01q0oCeO for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C286642FCE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C286642FCE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB62285FAE; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 18:48:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fc503c2c47a94281f007ee66284075b039fa75e6
X-Git-Newrev: 9fb56e0367022c2d18531fd2d9882dedfc68f31d
X-Patchwork-Hint: ignore
Message-Id: <20250228163032.BB62285FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/usbutils: select
 libiconv if needed
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4437379561225068530=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4437379561225068530==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9fb56e0367022c2d18531fd2d9882dedfc68f31d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since upstream commit 7c7fed30f7553b551fce3151fe315cf69e602065, which
first appeared in usbutils version 007, iconv is used when available.
Since then, the package has been failing to build when libiconv needs to
be provided by a library external to the C library. This commit fixes
that by selecting BR2_PACKAGE_LIBICONV when libiconv is not provided by
the toolchain.

Fixes:
 http://autobuild.buildroot.net/results/d7d/d7dedb754804242d020d1a0d34dd95c7c1074710//
 http://autobuild.buildroot.net/results/bca/bca14ce4fe05f087e1d8821670ba3165e9820a7f//
 http://autobuild.buildroot.net/results/665/665c064bf28a325a8bc4d9fe16f453be48472e57//
 http://autobuild.buildroot.net/results/b54/b543a3713949571b04dbd9c94f063fa0a186765b//
 http://autobuild.buildroot.net/results/6ea/6ea6cde91c2c6c49f56a08f37fef0c134eda40a0//

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/usbutils/Config.in   | 1 +
 package/usbutils/usbutils.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index a38eb2f2e5..7e7029bbfe 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_USBUTILS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_PACKAGE_HAS_UDEV # needs hwdb
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBUSB
 	help
 	  USB enumeration utilities
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 48301fbb9f..1093981360 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -11,6 +11,11 @@ USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
 USBUTILS_LICENSE = GPL-2.0+ (utils) GPL-2.0 or GPL-3.0 (lsusb.py)
 USBUTILS_LICENSE_FILES = LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+USBUTILS_DEPENDENCIES += libiconv
+USBUTILS_LDFLAGS += -liconv
+endif
+
 # Nice lsusb.py script only if there's python 3.x
 ifeq ($(BR2_PACKAGE_PYTHON3),)
 define USBUTILS_REMOVE_PYTHON

--===============4437379561225068530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4437379561225068530==--
