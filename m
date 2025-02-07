Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1133DC02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 20:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE84E606E8;
	Fri,  7 Feb 2025 20:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2XQqXrbYC5L; Fri,  7 Feb 2025 20:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7160606E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7160606E9;
	Fri,  7 Feb 2025 20:15:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC0DF1B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 20:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A95C44144F
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 20:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_bZDNcjBWSG for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 20:14:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A70F640BD3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A70F640BD3
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 20:14:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9ABCA87279; Fri,  7 Feb 2025 20:14:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 21:05:01 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: f81379d65f71d89cf91569accc8437f7c235986d
X-Git-Newrev: 373e2c22e2e1b0abde19de0a0642a128ea6d67fe
X-Patchwork-Hint: ignore
Message-Id: <20250207201458.9ABCA87279@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/usbutils: select
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
Content-Type: multipart/mixed; boundary="===============1021538405528301282=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1021538405528301282==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=373e2c22e2e1b0abde19de0a0642a128ea6d67fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

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
(cherry picked from commit 9fb56e0367022c2d18531fd2d9882dedfc68f31d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============1021538405528301282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1021538405528301282==--
