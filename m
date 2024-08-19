Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4CBC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 22:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A3506083E;
	Mon, 19 Aug 2024 22:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSzPHK_7DBZi; Mon, 19 Aug 2024 22:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79D836085F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79D836085F;
	Mon, 19 Aug 2024 22:46:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF2E11BF3C8
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D907080DDD
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4ECOJFJsdrD for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 22:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB14C80DCE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB14C80DCE
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 22:45:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C65BA86127; Mon, 19 Aug 2024 22:45:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 00:43:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 535116dd022c462fd95282ce8524a6feb1e7749c
X-Git-Newrev: c06d8be7e324ff3ec69db9b2fdca5305dbc54bf3
X-Patchwork-Hint: ignore
Message-Id: <20240819224559.C65BA86127@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: now needs target and host
 gcc >= 8
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7020997811875842116=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7020997811875842116==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c06d8be7e324ff3ec69db9b2fdca5305dbc54bf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of systemd from 254.13 to 256.4, systemd no longer
builds with gcc <= 7:

../src/basic/mountpoint-util.c: In function ‘fstype_is_api_vfs’:
../src/basic/macro.h:385:79: error: expected ‘}’ before ‘__VA_OPT__’
         for (typeof(entry) _va_sentinel_[1] = {}, _entries_[] = { __VA_ARGS__ __VA_OPT__(,) _va_sentinel_[0] }, *_current_ = _entries_; \
                                                                               ^

This first error is due to upstream commit
dc571cccd75db7be49b2aada64baf92e3a498c39 ("macro: terminate the
temporary VA_ARGS_FOREACH() array with a sentinel"), which was made to
support GCC 14.x. If we revert this commit, then this particular issue
goes away with GCC 7.x, but then it fails with another fairly similar
issue elsewhere:

../src/shared/varlink-idl.h:110:41: error: implicit declaration of function ‘__VA_OPT__’; did you mean ‘__TA_IBIT__’? [-Werror=implicit-function-dec
laration]
                 .fields = { __VA_ARGS__ __VA_OPT__(,) {}},              \
                                         ^

This code was added by upstream commit
e50b2a93d66eff9b41999d38b8ed5eb647e2d74c ("varlink: add
IDL/introspection logic").

Upstream commit dc571cccd75db7be49b2aada64baf92e3a498c39 first
appeared in v256, while e50b2a93d66eff9b41999d38b8ed5eb647e2d74c first
appeared in v255.

Considering systemd usual policies with the support of "old" things,
it's fairly unlikely that they will care about building with older gcc
versions. They even document in
https://github.com/systemd/systemd/blob/main/README that they need gcc
>= 8.4, so let's follow that.

Fixes:

  http://autobuild.buildroot.net/results/53c1a79c391e3cc7c230017853ba935202c8d20d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/Config.in      |  4 ++--
 package/systemd/Config.in.host |  2 +-
 system/Config.in               | 10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 113a8093c4..345f08590e 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -23,8 +23,8 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
diff --git a/package/systemd/Config.in.host b/package/systemd/Config.in.host
index 8e00bcf5c1..fdbebaee7a 100644
--- a/package/systemd/Config.in.host
+++ b/package/systemd/Config.in.host
@@ -1,4 +1,4 @@
 # Select this if you need host systemd tools (e.g. systemctl)
 config BR2_PACKAGE_HOST_SYSTEMD
 	bool
-	depends on BR2_HOST_GCC_AT_LEAST_5
+	depends on BR2_HOST_GCC_AT_LEAST_8
diff --git a/system/Config.in b/system/Config.in
index bc0c6eb6bc..318c538ef1 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -126,20 +126,20 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	depends on BR2_HOST_GCC_AT_LEAST_5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and target gcc >= 5"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and target gcc >= 8"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
-		!BR2_HOST_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!BR2_HOST_GCC_AT_LEAST_8
 
 comment "systemd highly recommends Linux >= 4.15"
 	depends on BR2_INIT_SYSTEMD

--===============7020997811875842116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7020997811875842116==--
