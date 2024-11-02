Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D8FE67810
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 20:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A00A42420;
	Sat,  2 Nov 2024 20:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RX-Ht5gO4fxl; Sat,  2 Nov 2024 20:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E867F42437
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E867F42437;
	Sat,  2 Nov 2024 20:59:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF43C112A
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 20:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CFD7413AD
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 20:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94VS7x4bwDqS for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 20:59:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5725640980
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5725640980
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 20:59:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41DA5851A2; Sat,  2 Nov 2024 20:59:25 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Nov 2024 21:52:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9542e2904f8db68c5288ad6bdd8b0b1b209d214f
X-Git-Newrev: 11ae90b0011abe3ad01d9953c7d41d444e689f5c
X-Patchwork-Hint: ignore
Message-Id: <20241102205925.41DA5851A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: allowing building even
 on non-Y2038 compliant systems
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11ae90b0011abe3ad01d9953c7d41d444e689f5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of util-linux to version 2.40.2 in Buildroot commit
f14929c657a7b1794dcd39ac469d2ad826465d98 ("package/util-linux: update
to 2.40.2"), the build will fail on systems that are not Y2038,
such as uClibc configurations.

In order to preserve the previous behavior, pass --disable-year2038.
See the gnulib documentation for details [0]. Contrary to what the
option name might suggest, it doesn't really disable Y2038 support,
but only the check that the system is Y2038 compliant. So even with
--disable-year2038, if the system is Y2038 compliant (uses a 64-bit
arch, uses the musl C library, or uses the glibc C library with
BR2_TIME_BITS_64=y), util-linux tools will be Y2038 compliant.

"--disable-year2038" is already used to build tar package since [1].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992338 (TestIso9660SyslinuxInternal)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992337 (TestIso9660SyslinuxExternalCompress)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992335 (TestIso9660SyslinuxExternal)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992259 (TestSysLinuxX86LegacyBios)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992257 (TestSysLinuxX86EFI)

[0] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html
[1] 7f1088f9cae9f191740423a0084bb31f94af2e75

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/util-linux/util-linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index c3737a8d12..7a143290eb 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -42,9 +42,13 @@ UTIL_LINUX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs) \
 	$(TARGET_NLS_DEPENDENCIES)
+# --disable-year2038: tells the configure script to not abort if the
+# system is not Y2038 compliant. util-linux will support year2038 if
+# the system is compliant even with this option passed
 UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
-	--disable-makeinstall-chown
+	--disable-makeinstall-chown \
+	--disable-year2038
 
 UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
