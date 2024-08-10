Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC1FC3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 13:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B9A6403CE;
	Sat, 10 Aug 2024 13:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weq3wzesCi2A; Sat, 10 Aug 2024 13:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B75540500
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B75540500;
	Sat, 10 Aug 2024 13:44:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCD7D1BF280
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 13:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C76C740500
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 13:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGDLW9UoELcB for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 13:44:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 406B0403CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 406B0403CE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 406B0403CE
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 13:44:50 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1208FB0051E;
 Sat, 10 Aug 2024 15:44:47 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 15:44:40 +0200
Message-ID: <20240810134440.903175-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723297488;
 bh=qHVIOzjEatjmj0O3XEN/7MyQYF8iNZSHnEdbN5G54ac=;
 h=From:To:Cc:Subject:Date:From;
 b=s1kPQw0qen95ZJ0/+l3xD/7BrQJ9eo2fOJEBCLI8T7Ob55CPe8ZQGM4xuiEfTjQhP
 YwcDIyiS0fe+CTcuS2xqq9pasamLByi2AtgXUb/igUyIDbfJ9aG0VnjyDgnYnD0l7I
 sv68v4pjK4ouez7l19hT6lyet4qBRjMT4kS2fGIy3Qxi/c9V2z8V9kuo8tQ6xMBOWS
 thCPeRcFp84p8sPjvDPbgEWcMrZzWNK7DmNLaHkjWmH1YJt1LL96uFwNSbQ6OPEn23
 Tf65lbx/4wTo2xC7/jxgMvNpvUbeh8OHvgBi+j+bLJ3bZ8KnANo4QS1vbPcbSuTMq6
 EBY1nk2ktVYsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=s1kPQw0q
Subject: [Buildroot] [PATCH 1/1] package/mariadb: fix build with fmt >=
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Note: at the time of this writing, there is a newer mariadb version
10.11.9 available. It introduces new, unrelated build failures in
Buildroot. This patch backports the upstream fix on the current
package version in Buildroot, to be included in the upcoming
Buildroot 2024.08 version.
---
 ...le-failure-fmt-use-incompatible-with.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch

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
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
