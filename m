Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA581CCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 12:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A94E281188;
	Sat, 25 Oct 2025 12:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id am_E0Gt83D41; Sat, 25 Oct 2025 12:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2C5A81189
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2C5A81189;
	Sat, 25 Oct 2025 12:07:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA70C43F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 12:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBFE281189
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 12:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFp09O1paRTz for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 12:07:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F06881188
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F06881188
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F06881188
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 12:07:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf49.dip0.t-ipconnect.de [79.214.207.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 03596A4C46DC;
 Sat, 25 Oct 2025 14:07:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36920)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vCd3A-000000002jv-35Kn;
 Sat, 25 Oct 2025 12:07:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 14:07:12 +0200
Message-ID: <20251025120712.3262343-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761394033;
 bh=DtiZA7NOxoSG3WVlJzF8PsyzzSzczAoqZtEjgTYEH0s=;
 h=From:To:Cc:Subject:Date:From;
 b=TBtNQQ8lP3y3QBpxMtMK6Mn6G2ucKRrAZKpALc0uEUtiMex70IP29jD5WUNyI3l9t
 L+KTjgxaiQFLwqOeHffH01H9VM6dVYEDGBy8KXvhT786Ra6Ji2uAHV2UpKysUpWpKQ
 kJB4teozwQkdCA2QZOZSatbAF6UyNORbwyRFE0AHYR15lEghIpz08SrTIGzW5kjm+j
 Ui1uKkBPoWTBmQBUZBxsc4saR0gOhZQ36BIpgfQRCWrau7p3dooZPAiBjNFTr3u4VD
 sw/dtAPuh1fSDPSxs7KTJdcrAZX1menEVzADTJqsDgbOifQEqkJHWb8AAxW1hCLSl1
 3ez8j9u5w61NQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=TBtNQQ8l
Subject: [Buildroot] [PATCH 1/1] package/libdbi-drivers: fix build with gcc
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.net/results/d30/d3068de2f477d68823c4b7e537f120edf03338bb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-libdbi-drivers-c99.patch             | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/libdbi-drivers/0001-libdbi-drivers-c99.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
