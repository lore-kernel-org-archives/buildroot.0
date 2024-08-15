Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C11C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 12:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33D544023C;
	Thu, 15 Aug 2024 12:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pji225FnqOhC; Thu, 15 Aug 2024 12:42:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA45F40245
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA45F40245;
	Thu, 15 Aug 2024 12:42:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4841BF574
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28EF960A70
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnqPFwx32ddO for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 12:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 132686063D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 132686063D
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 12:42:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 084D785E68; Thu, 15 Aug 2024 12:42:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 14:35:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 273160552d6540aea5d3bb1065ca296614f43c44
X-Git-Newrev: 48e7affffa06bbe23a1cd190d0a765956cf179b0
X-Patchwork-Hint: ignore
Message-Id: <20240815124220.084D785E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: fix build with fmt >=
 11.0.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=48e7affffa06bbe23a1cd190d0a765956cf179b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MariaDB is failing to build since commit 6b86f076c3 "package/fmt: bump
to version 11.0.1" with output:

    /buildroot/output/build/aarch64-buildroot-linux-gnu/sysroot/usr/include/fmt/base.h:1402:29: error: passing 'const fmt::v11::formatter<String>' as 'this' argument discards qualifiers [-fpermissive]
     1402 |     ctx.advance_to(cf.format(*static_cast<qualified_type*>(arg), ctx));
          |                    ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This commit is fixing the issue by adding an upstream patch, rebased
on the package version.

Fixes:
http://autobuild.buildroot.org/results/3106928a2d6b32acfb075a2840cf549a81784270/
and many others.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...compile-failure-fmt-use-incompatible-with.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch b/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
new file mode 100644
index 0000000000..b6c8807f44
--- /dev/null
+++ b/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
@@ -0,0 +1,35 @@
+From 69935c10b95fc7f7a2e1c3ed02831958e1a9b6a4 Mon Sep 17 00:00:00 2001
+From: Daniel Black <daniel@mariadb.org>
+Date: Wed, 22 May 2024 17:43:17 +1000
+Subject: [PATCH] MDEV-34206 compile failure: fmt use incompatible with
+ libfmt-10.2.[2]+
+
+Upstream libfmt commit https://github.com/fmtlib/fmt/commit/d70729215fba1d54862e407b626abf86ddf409bf
+now requires the format function to be const.
+
+Adjust the function prototype so it is const and can compile.a
+
+Signed-off-by: Daniel Black <daniel@mariadb.org>
+[Julien: add SoB line with the original patch author name]
+Upstream: https://github.com/MariaDB/server/commit/4375245d5d9f01cabb6e3fd6c637535e724eae38
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ sql/item_strfunc.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sql/item_strfunc.cc b/sql/item_strfunc.cc
+index 4bbf36ec1cf..2ad8a9b3ce5 100644
+--- a/sql/item_strfunc.cc
++++ b/sql/item_strfunc.cc
+@@ -1392,7 +1392,7 @@ bool Item_func_sformat::fix_length_and_dec(THD *thd)
+ namespace fmt {
+   template <> struct formatter<String>: formatter<string_view> {
+     template <typename FormatContext>
+-    auto format(String c, FormatContext& ctx) -> decltype(ctx.out()) {
++    auto format(String c, FormatContext& ctx) const -> decltype(ctx.out()) {
+       string_view name = { c.ptr(), c.length() };
+       return formatter<string_view>::format(name, ctx);
+     };
+-- 
+2.46.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
