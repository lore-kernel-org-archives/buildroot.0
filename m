Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2839CC64ED6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE154405B9;
	Thu, 23 Feb 2023 22:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE154405B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QibixfTZrFCG; Thu, 23 Feb 2023 22:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8753405EF;
	Thu, 23 Feb 2023 22:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8753405EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94B8B1BF97F
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B44181E30
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B44181E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiHuAC_fc__b for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:46:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96EBD81E2A
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96EBD81E2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84BF9869F8; Thu, 23 Feb 2023 22:46:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 23:45:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26254066439596b88783b80a3a87f67570c0b0b5
X-Git-Newrev: 9b911c8e8fe52914c1578b846914d7399450067b
X-Patchwork-Hint: ignore
Message-Id: <20230223224636.84BF9869F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: fix build with fmt >=
 9.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b911c8e8fe52914c1578b846914d7399450067b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
