Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF26CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25403611B6;
	Tue, 16 Sep 2025 20:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_iBlMa0mNLv; Tue, 16 Sep 2025 20:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CDE6611B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CDE6611B7;
	Tue, 16 Sep 2025 20:44:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D052199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43CB3400F9
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7dI_33z160o for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ABD941D68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ABD941D68
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 494A184C96; Tue, 16 Sep 2025 20:44:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:42:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3224b90bacbc6666c09afabbed1666d35e933454
X-Git-Newrev: 89882782411608e1fc8f9072324a4276b9b4699e
X-Patchwork-Hint: ignore
Message-Id: <20250916204447.494A184C96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpp-httplib: remove stale patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=89882782411608e1fc8f9072324a4276b9b4699e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Running the command:

    make cpp-httplib-patch

fails with error:

    Applying 0001-merge-commit-from-fork.patch using patch:
    patching file httplib.h
    Reversed (or previously applied) patch detected!  Skipping patch.
    2 out of 2 hunks ignored -- saving rejects to file httplib.h.rej
    patching file test/test.cc
    Hunk #1 FAILED at 42.
    Hunk #2 FAILED at 2839.
    Hunk #3 FAILED at 3624.
    3 out of 3 hunks FAILED -- saving rejects to file test/test.cc.rej

Commit [1] "package/cpp-httplib: add patch for CVE-2025-46728"
introduced a package patch in the branch next while Buildroot was in
RC cycle. Just after, commit [2] "package/cpp-httplib: bump to
v0.25.0", also in branch next, removed this package patch.

This commit [1] was cherry-picked in [3] in the branch master, to
apply only the security fix for the 2025.08 release.

The merge commit [4] kept the cpp-httplib package patch
"0001-merge-commit-from-fork.patch".

This commit fixes the issue by removing this stale patch.

Fixes:
https://autobuild.buildroot.org/results/5b9843089ade428997035e49817208ce9c09a10e

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/aea7c89396f20570b5ce32c4a235f7011ad0bd01
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/519d03657c6a247f739003a3590c93948e6a48d8
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/fd313c4cebc8c0a8db2ff9641b48e2d8a993c245
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/0af159ae2b0363a90b8c5432cd4cb9bfd3476c5a

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../cpp-httplib/0001-merge-commit-from-fork.patch  | 103 ---------------------
 1 file changed, 103 deletions(-)

diff --git a/package/cpp-httplib/0001-merge-commit-from-fork.patch b/package/cpp-httplib/0001-merge-commit-from-fork.patch
deleted file mode 100644
index 180bb22e11..0000000000
--- a/package/cpp-httplib/0001-merge-commit-from-fork.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 7b752106ac42bd5b907793950d9125a0972c8e8e Mon Sep 17 00:00:00 2001
-From: Ville Vesilehto <ville@vesilehto.fi>
-Date: Sat, 3 May 2025 11:39:01 +0300
-Subject: [PATCH] Merge commit from fork
-
-* fix(parser): Limit line length in getline
-
-Prevents potential infinite loop and memory exhaustion in
-stream_line_reader::getline by enforcing max line length.
-
-Signed-off-by: Ville Vesilehto <ville@vesilehto.fi>
-
-* fix: increase default max line length to 32k
-
-LONG_QUERY_VALUE test is set at 25k.
-
-Signed-off-by: Ville Vesilehto <ville@vesilehto.fi>
-
-* test(client): expect read error with too long query
-
-Adds a test case (`TooLongQueryValue`) to verify client behavior
-when the request URI is excessively long, exceeding
-`CPPHTTPLIB_MAX_LINE_LENGTH`. In this scenario, the server is
-expected to reset the connection.
-
-Signed-off-by: Ville Vesilehto <ville@vesilehto.fi>
-
-CVE: CVE-2025-46728
-Upstream: https://github.com/yhirose/cpp-httplib/commit/7b752106ac42bd5b907793950d9125a0972c8e8e
-[thomas: adapt lines numbers to v0.19.0]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- httplib.h    |  9 +++++++++
- test/test.cc | 15 +++++++++++++++
- 2 files changed, 24 insertions(+)
-
-diff --git a/httplib.h b/httplib.h
-index cb182c4129..a2aa24f96b 100644
---- a/httplib.h
-+++ b/httplib.h
-@@ -145,6 +145,10 @@
- #define CPPHTTPLIB_LISTEN_BACKLOG 5
- #endif
- 
-+#ifndef CPPHTTPLIB_MAX_LINE_LENGTH
-+#define CPPHTTPLIB_MAX_LINE_LENGTH 32768
-+#endif
-+
- /*
-  * Headers
-  */
-@@ -2998,6 +3002,11 @@ inline bool stream_line_reader::getline() {
- #endif
- 
-   for (size_t i = 0;; i++) {
-+    if (size() >= CPPHTTPLIB_MAX_LINE_LENGTH) {
-+      // Treat exceptionally long lines as an error to
-+      // prevent infinite loops/memory exhaustion
-+      return false;
-+    }
-     char byte;
-     auto n = strm_.read(&byte, 1);
- 
-diff --git a/test/test.cc b/test/test.cc
-index 4fd9983bd8..7f5cc8a9d0 100644
---- a/test/test.cc
-+++ b/test/test.cc
-@@ -42,6 +42,9 @@ const int PORT = 1234;
- const string LONG_QUERY_VALUE = string(25000, '@');
- const string LONG_QUERY_URL = "/long-query-value?key=" + LONG_QUERY_VALUE;
- 
-+const string TOO_LONG_QUERY_VALUE = string(35000, '@');
-+const string TOO_LONG_QUERY_URL = "/too-long-query-value?key=" + TOO_LONG_QUERY_VALUE;
-+
- const std::string JSON_DATA = "{\"hello\":\"world\"}";
- 
- const string LARGE_DATA = string(1024 * 1024 * 100, '@'); // 100MB
-@@ -2839,6 +2842,11 @@ class ServerTest : public ::testing::Test {
-                EXPECT_EQ(LONG_QUERY_URL, req.target);
-                EXPECT_EQ(LONG_QUERY_VALUE, req.get_param_value("key"));
-              })
-+        .Get("/too-long-query-value",
-+             [&](const Request &req, Response & /*res*/) {
-+               EXPECT_EQ(TOO_LONG_QUERY_URL, req.target);
-+               EXPECT_EQ(TOO_LONG_QUERY_VALUE, req.get_param_value("key"));
-+             })
-         .Get("/array-param",
-              [&](const Request &req, Response & /*res*/) {
-                EXPECT_EQ(3u, req.get_param_value_count("array"));
-@@ -3624,6 +3632,13 @@ TEST_F(ServerTest, LongQueryValue) {
-   EXPECT_EQ(StatusCode::UriTooLong_414, res->status);
- }
- 
-+TEST_F(ServerTest, TooLongQueryValue) {
-+  auto res = cli_.Get(TOO_LONG_QUERY_URL.c_str());
-+
-+  ASSERT_FALSE(res);
-+  EXPECT_EQ(Error::Read, res.error());
-+}
-+
- TEST_F(ServerTest, TooLongHeader) {
-   Request req;
-   req.method = "GET";
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
