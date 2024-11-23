Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5389AC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 052E542591;
	Fri, 28 Feb 2025 16:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aV6WxUV2Rs3T; Fri, 28 Feb 2025 16:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBFB242D2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBFB242D2C;
	Fri, 28 Feb 2025 16:32:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1309B711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22D8A4198B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDV8wYRcvCoB for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C08A418F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C08A418F7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 584248769C; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Nov 2024 10:51:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4b271906a74ab773ff276cf5d6d90209c4d32cab
X-Git-Newrev: fa20df5d75914cf99df8c968681fb74a688c0129
X-Patchwork-Hint: ignore
Message-Id: <20250228162930.584248769C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/util-linux-libs:
 allowing building even on non-Y2038 compliant systems
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa20df5d75914cf99df8c968681fb74a688c0129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the bump of util-linux to version 2.40.2 in Buildroot commit
f14929c657a7b1794dcd39ac469d2ad826465d98 ("package/util-linux: update
to 2.40.2"), the build will fail on systems that are not Y2038,
such as uClibc configurations.

In order to preserve the previous behavior, pass --disable-year2038.
See the gnulib documentation for details [1]. Contrary to what the
option name might suggest, it doesn't really disable Y2038 support,
but only the check that the system is Y2038 compliant. So even with
--disable-year2038, if the system is Y2038 compliant (uses a 64-bit
arch, uses the musl C library, or uses the glibc C library with
BR2_TIME_BITS_64=y), util-linux tools will be Y2038 compliant.

"--disable-year2038" was already added to util-linux in commit
11ae90b00 "package/util-linux: allowing building even on non-Y2038
compliant systems".

Fixes:
https://autobuild.buildroot.org/results/630fc287deb1cf5a684f274058b918a5d7aef989

[1] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html

Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 0337e7e13a..9340d5ae4f 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -26,9 +26,13 @@ UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(TARGET_NLS_DEPENDENCIES)
+# --disable-year2038: tells the configure script to not abort if the
+# system is not Y2038 compliant. util-linux-libs will support year2038
+# if the system is compliant even with this option passed
 UTIL_LINUX_LIBS_CONF_OPTS += \
 	--disable-rpath \
-	--disable-makeinstall-chown
+	--disable-makeinstall-chown \
+	--disable-year2038
 
 UTIL_LINUX_LIBS_LINK_LIBS = $(TARGET_NLS_LIBS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
