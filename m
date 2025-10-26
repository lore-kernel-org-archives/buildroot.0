Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60BDCCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 15:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FAFA40D3E;
	Sun, 26 Oct 2025 15:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPx7poceNmmt; Sun, 26 Oct 2025 15:24:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB9FA40D36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB9FA40D36;
	Sun, 26 Oct 2025 15:24:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD5D125B
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5259404A6
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXLbnnDoUzzl for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 15:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 931E240084
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 931E240084
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:24:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DC5B87912; Sun, 26 Oct 2025 15:24:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 16:23:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5440d2a5baa157269e28d65753f7f5f0b66ba9ca
X-Git-Newrev: 6ad92d4a5dc6b5f0d8de072622dabe2e804bf8e4
X-Patchwork-Hint: ignore
Message-Id: <20251026152447.8DC5B87912@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdbi-drivers: fix build with gcc
 >= 14.x
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ad92d4a5dc6b5f0d8de072622dabe2e804bf8e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/d30/d3068de2f477d68823c4b7e537f120edf03338bb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../libdbi-drivers/0001-libdbi-drivers-c99.patch   | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/libdbi-drivers/0001-libdbi-drivers-c99.patch b/package/libdbi-drivers/0001-libdbi-drivers-c99.patch
new file mode 100644
index 0000000000..46b43c8653
--- /dev/null
+++ b/package/libdbi-drivers/0001-libdbi-drivers-c99.patch
@@ -0,0 +1,45 @@
+Fix type errors in the cgreen with constraints facility.
+
+Upstream: https://sourceforge.net/p/libdbi-drivers/bugs/28/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: rebased for git tree used by buildroot]
+
+diff --git a/tests/cgreen/src/constraint.c b/tests/cgreen/src/constraint.c
+index c19c0ddd41a7bfa7..95673dd3e222a3cf 100644
+--- a/tests/cgreen/src/constraint.c
++++ b/tests/cgreen/src/constraint.c
+@@ -22,8 +22,7 @@ static double unbox_double(intptr_t box);
+ static double as_double(intptr_t box);
+ 
+ static int compare_using_matcher(Constraint *constraint, intptr_t actual);
+-static void test_with_matcher(Constraint *constraint, const char *function, const char* matcher_name, intptr_t actual, const char *test_file, int test_line, TestReporter *reporter);
+-
++static void test_with_matcher(Constraint *constraint, const char *function, intptr_t matcher_function, const char *test_file, int test_line, TestReporter *reporter);
+ 
+ void destroy_constraint(void *abstract) {
+     Constraint *constraint = (Constraint *)abstract;
+@@ -164,11 +163,11 @@
+ }
+ 
+ static int compare_using_matcher(Constraint *constraint, intptr_t actual) {
+-	int (*matches)(const void*) = (void *)(intptr_t)constraint->expected;
+-    return matches((void *)actual);
++	int (*matches)(const void*) = (int (*)(const void*)) constraint->expected;
++    return matches((const void *)actual);
+ }
+ 
+-static void test_with_matcher(Constraint *constraint, const char *function, const char* matcher_name, intptr_t matcher_function, const char *test_file, int test_line, TestReporter *reporter) {
++static void test_with_matcher(Constraint *constraint, const char *function, intptr_t matcher_function, const char *test_file, int test_line, TestReporter *reporter) {
+     (*reporter->assert_true)(
+             reporter,
+             test_file,
+@@ -176,7 +175,7 @@ static void test_with_matcher(Constraint *constraint, const char *function, cons
+             (*constraint->compare)(constraint, matcher_function),
+             "Wanted parameter [%s] to match [%s] in function [%s]",
+             constraint->parameter,
+-            matcher_name,
++            constraint->name,
+             function);
+ }
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
