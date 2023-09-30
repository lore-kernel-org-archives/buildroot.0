Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48969E748A1
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D93EA42139;
	Sat, 30 Sep 2023 19:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D93EA42139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrWyxiBx3R8S; Sat, 30 Sep 2023 19:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD8EF42179;
	Sat, 30 Sep 2023 19:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD8EF42179
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA53C1BF48D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C101141E45
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C101141E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HAcgDw_ZKMW for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:27:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AF3042179
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF3042179
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D77583CB6; Sat, 30 Sep 2023 19:27:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 21:27:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a6e9d2f3fbc1da8b55bc89c5bd9dc0978b0d83c
X-Git-Newrev: 6ea2a27f9047696ce1c463ad55fb4a78df136954
X-Patchwork-Hint: ignore
Message-Id: <20230930192724.7D77583CB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libunwind: add libucontext support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ea2a27f9047696ce1c463ad55fb4a78df136954
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can expand the list of supported musl architectures by
letting libucontext provide required context API's.

Use the following table to determine which architectures require
libucontext for BR2_PACKAGE_LIBUNWIND_MUSL_CONTEXT_REQUIRED:
https://github.com/libunwind/libunwind/tree/v1.6.2#libc-requirements

Enable BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS if we have
BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS or if context is not required
by checking for !BR2_PACKAGE_LIBUNWIND_MUSL_CONTEXT_REQUIRED.

Select BR2_PACKAGE_LIBUCONTEXT when selecting BR2_PACKAGE_LIBUNWIND
if we have BR2_PACKAGE_LIBUNWIND_MUSL_CONTEXT_REQUIRED.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libunwind/Config.in    | 19 ++++++++++++++++++-
 package/libunwind/libunwind.mk |  4 ++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index dfd0df30fa..08f7f879c9 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -1,3 +1,17 @@
+config BR2_PACKAGE_LIBUNWIND_MUSL_CONTEXT_REQUIRED
+	bool
+	default y
+	depends on !BR2_ARM_CPU_HAS_ARM
+	depends on !BR2_aarch64
+	depends on !BR2_aarch64_be
+	depends on !BR2_mips
+	depends on !BR2_mipsel
+	depends on !BR2_mips64
+	depends on !BR2_mips64el
+	depends on !BR2_riscv
+	depends on !BR2_x86_64
+	depends on BR2_TOOLCHAIN_USES_MUSL
+
 # libunwind is only available for a certain subset of the
 # architectures (as visible in the list of architectures supported
 # with the glibc C library below).
@@ -17,7 +31,8 @@ config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 		(BR2_ARM_CPU_HAS_ARM || BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_x86_64)
 	default y if BR2_TOOLCHAIN_USES_MUSL && \
-		(BR2_ARM_CPU_HAS_ARM || BR2_aarch64 || BR2_x86_64)
+		(!BR2_PACKAGE_LIBUNWIND_MUSL_CONTEXT_REQUIRED || \
+		 BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
 
 config BR2_PACKAGE_LIBUNWIND
 	bool "libunwind"
@@ -27,6 +42,8 @@ config BR2_PACKAGE_LIBUNWIND
 	# forcefully links against libgcc_s, only available in dynamic
 	# linking configurations
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBUCONTEXT if BR2_TOOLCHAIN_USES_MUSL && \
+		BR2_PACKAGE_LIBUNWIND_MUSL_CONTEXT_REQUIRED
 	help
 	  C API to determine the call-chain of a program.
 
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 9cd587d0a3..afc17f7b25 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -16,4 +16,8 @@ LIBUNWIND_CONF_OPTS = \
 	--disable-tests \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cxx-exceptions,--disable-cxx-exceptions)
 
+ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
+LIBUNWIND_DEPENDENCIES += libucontext
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
