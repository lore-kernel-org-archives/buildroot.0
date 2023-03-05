Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861D2C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EF524109F;
	Sun,  5 Mar 2023 17:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EF524109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gObANaEid3Jr; Sun,  5 Mar 2023 17:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94889410A3;
	Sun,  5 Mar 2023 17:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94889410A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D84B1BF865
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52910400F3
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52910400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4pOa-S3KHKls for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25D9E401D8
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25D9E401D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2362386330; Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:38:20 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: b4b32468cb0477f35af782e9c195daf42accff77
X-Git-Newrev: 3f28ad6e0b8c952988855ef8acc2975c634386fc
X-Patchwork-Hint: ignore
Message-Id: <20230305173948.2362386330@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/gerbera: fix
 build with fmt >= 9.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f28ad6e0b8c952988855ef8acc2975c634386fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix the following build failure with fmt >= 9.0.0 raised since commit
5c83dc5451fb59ffa5cd40d30c4c532dd25e8333:

/tmp/instance-5/output-1/build/gerbera-1.10.0/src/database/sql_database.cc:1688:26:   required from here
/tmp/instance-5/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/fmt/format.h:3973:36: error: passing 'const fmt::v9::formatter<fmt::v9::join_view<__gnu_cxx::__normal_iterator<const ColumnUpdate*, std::vector<ColumnUpdate> >, __gnu_cxx::__normal_iterator<const ColumnUpdate*, std::vector<ColumnUpdate> >, char>, char, void>::formatter_type' {aka 'const fmt::v9::formatter<ColumnUpdate>'} as 'this' argument discards qualifiers [-fpermissive]
 3973 |       out = value_formatter_.format(map(*it), ctx);
      |             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/56c46fa7e922360d2c4b4093f8a030cc83726799

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9b911c8e8fe52914c1578b846914d7399450067b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gerbera/0001-Fix-build-with-fmt-9-0.patch | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/gerbera/0001-Fix-build-with-fmt-9-0.patch b/package/gerbera/0001-Fix-build-with-fmt-9-0.patch
new file mode 100644
index 0000000000..63ae8382a3
--- /dev/null
+++ b/package/gerbera/0001-Fix-build-with-fmt-9-0.patch
@@ -0,0 +1,36 @@
+From d7b8fafbc94405c20753fed569abd8878cccde89 Mon Sep 17 00:00:00 2001
+From: Felix Yan <felixonmars@archlinux.org>
+Date: Fri, 19 Aug 2022 15:22:10 +0300
+Subject: [PATCH] Fix build with fmt 9.0
+
+Fixes #2681
+
+[Retrieved from:
+https://github.com/gerbera/gerbera/commit/d7b8fafbc94405c20753fed569abd8878cccde89]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/database/sql_format.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/database/sql_format.h b/src/database/sql_format.h
+index 32dc00efa..e4e1909a8 100644
+--- a/src/database/sql_format.h
++++ b/src/database/sql_format.h
+@@ -42,7 +42,7 @@ struct SQLIdentifier {
+ template <>
+ struct fmt::formatter<SQLIdentifier> : formatter<std::string_view> {
+     template <typename FormatContext>
+-    auto format(const SQLIdentifier& tn, FormatContext& ctx) -> decltype(ctx.out())
++    auto format(const SQLIdentifier& tn, FormatContext& ctx) const -> decltype(ctx.out())
+     {
+         return format_to(ctx.out(), "{}{}{}", tn.quote_begin, tn.name, tn.quote_end);
+     }
+@@ -61,7 +61,7 @@ struct ColumnUpdate {
+ template <>
+ struct fmt::formatter<ColumnUpdate> : formatter<std::string_view> {
+     template <typename FormatContext>
+-    auto format(const ColumnUpdate& a, FormatContext& ctx) -> decltype(ctx.out())
++    auto format(const ColumnUpdate& a, FormatContext& ctx) const -> decltype(ctx.out())
+     {
+         return format_to(ctx.out(), "{} = {}", a.column, a.value);
+     }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
