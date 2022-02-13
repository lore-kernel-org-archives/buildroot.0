Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EADEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBC698148B;
	Sun, 13 Feb 2022 15:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ITcMnhjRSFe7; Sun, 13 Feb 2022 15:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEFA2813FE;
	Sun, 13 Feb 2022 15:29:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B81A1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00E65814B4
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWnlFui6Jgvn for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:26:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF617813FE
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 539E482983; Sun, 13 Feb 2022 15:18:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 16:21:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46beca0656505e9a9d4d5d17d22f40550ac487c6
X-Git-Newrev: c16618959a1097b1d8bc580a29c2fdd96c96e91d
X-Patchwork-Hint: ignore
Message-Id: <20220213151835.539E482983@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: fix build with fmt > 8.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c16618959a1097b1d8bc580a29c2fdd96c96e91d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of fmt to version
8.1.1 in commit ec7fd50d08690a383fec40748ac9b78c3f764316:

/home/peko/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/fmt/core.h:1728:7: error: static assertion failed: Cannot format an argument. To make type T formattable provide a formatter<T> specialization: https://fmt.dev/latest/api.html#udt
       formattable,
       ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/009db44f83c3b02025c910ce4f190bd709c5ab49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gerbera/0001-Fix-for-fmt-8-0.patch | 44 ++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/gerbera/0001-Fix-for-fmt-8-0.patch b/package/gerbera/0001-Fix-for-fmt-8-0.patch
new file mode 100644
index 0000000000..c4419209a5
--- /dev/null
+++ b/package/gerbera/0001-Fix-for-fmt-8-0.patch
@@ -0,0 +1,44 @@
+From 82d84ac5e62c23e717198fc7b2ef190ff95e70d1 Mon Sep 17 00:00:00 2001
+From: kyak <bas@bmail.ru>
+Date: Wed, 12 Jan 2022 19:41:37 +0300
+Subject: [PATCH] Fix for fmt > 8.0
+
+[Retrieved from:
+https://github.com/gerbera/gerbera/commit/82d84ac5e62c23e717198fc7b2ef190ff95e70d1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/util/logger.h | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/src/util/logger.h b/src/util/logger.h
+index 58696e52f..ba64afa79 100644
+--- a/src/util/logger.h
++++ b/src/util/logger.h
+@@ -32,7 +32,9 @@
+ #ifndef __LOGGER_H__
+ #define __LOGGER_H__
+ 
++#include <fmt/format.h>
+ #include <spdlog/spdlog.h>
++#include <type_traits>
+ 
+ #define log_debug SPDLOG_DEBUG
+ #define log_info SPDLOG_INFO
+@@ -40,4 +42,17 @@
+ #define log_error SPDLOG_ERROR
+ #define log_js SPDLOG_INFO
+ 
++#if FMT_VERSION >= 80100
++template <typename T>
++struct fmt::formatter<T, std::enable_if_t<std::is_enum_v<T>, char>>
++    : formatter<std::underlying_type_t<T>> {
++    template <typename FormatContext>
++    auto format(const T& value, FormatContext& ctx) -> decltype(ctx.out())
++    {
++        return fmt::formatter<std::underlying_type_t<T>>::format(
++            static_cast<std::underlying_type_t<T>>(value), ctx);
++    }
++};
++#endif
++
+ #endif // __LOGGER_H__
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
