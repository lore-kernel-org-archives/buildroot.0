Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03C0CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74C4461CA1;
	Mon,  8 Sep 2025 10:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-zLt2QDNcnF; Mon,  8 Sep 2025 10:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5358C61C94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5358C61C94;
	Mon,  8 Sep 2025 10:39:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FC321D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A96242B43
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIOxwsMXEzOd for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F13E42B9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F13E42B9E
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D6A083A93; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 17:20:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3a5940bc46389bf386002108439395cb35ea3f0a
X-Git-Newrev: cd32013c57363a44ee266426eda6f3d0ee789c48
X-Patchwork-Hint: ignore
Message-Id: <20250908103908.6D6A083A93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cpp-httplib: add
 patch for CVE-2025-46728
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cd32013c57363a44ee266426eda6f3d0ee789c48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fix the following vulnerability:

- CVE-2025-46728

    cpp-httplib is a C++ header-only HTTP/HTTPS server and client library.
    Prior to version 0.20.1, the library fails to enforce configured size
    limits on incoming request bodies when `Transfer-Encoding: chunked` is
    used or when no `Content-Length` header is provided. A remote attacker
    can send a chunked request without the terminating zero-length chunk,
    causing uncontrolled memory allocation on the server. This leads to
    potential exhaustion of system memory and results in a server crash or
    unresponsiveness. Version 0.20.1 fixes the issue by enforcing limits
    during parsing. If the limit is exceeded at any point during reading,
    the connection is terminated immediately. A short-term workaround
    through a Reverse Proxy is available. If updating the library
    immediately is not feasible, deploy a reverse proxy (e.g., Nginx,
    HAProxy) in front of the `cpp-httplib` application. Configure the
    proxy to enforce maximum request body size limits, thereby stopping
    excessively large requests before they reach the vulnerable library
    code.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-46728
  - https://github.com/yhirose/cpp-httplib/commit/7b752106ac42bd5b907793950d9125a0972c8e8e

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
(cherry picked from commit aea7c89396f20570b5ce32c4a235f7011ad0bd01)
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fd313c4cebc8c0a8db2ff9641b48e2d8a993c245)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../cpp-httplib/0001-merge-commit-from-fork.patch  | 103 +++++++++++++++++++++
 package/cpp-httplib/cpp-httplib.mk                 |   3 +
 2 files changed, 106 insertions(+)

diff --git a/package/cpp-httplib/0001-merge-commit-from-fork.patch b/package/cpp-httplib/0001-merge-commit-from-fork.patch
new file mode 100644
index 0000000000..180bb22e11
--- /dev/null
+++ b/package/cpp-httplib/0001-merge-commit-from-fork.patch
@@ -0,0 +1,103 @@
+From 7b752106ac42bd5b907793950d9125a0972c8e8e Mon Sep 17 00:00:00 2001
+From: Ville Vesilehto <ville@vesilehto.fi>
+Date: Sat, 3 May 2025 11:39:01 +0300
+Subject: [PATCH] Merge commit from fork
+
+* fix(parser): Limit line length in getline
+
+Prevents potential infinite loop and memory exhaustion in
+stream_line_reader::getline by enforcing max line length.
+
+Signed-off-by: Ville Vesilehto <ville@vesilehto.fi>
+
+* fix: increase default max line length to 32k
+
+LONG_QUERY_VALUE test is set at 25k.
+
+Signed-off-by: Ville Vesilehto <ville@vesilehto.fi>
+
+* test(client): expect read error with too long query
+
+Adds a test case (`TooLongQueryValue`) to verify client behavior
+when the request URI is excessively long, exceeding
+`CPPHTTPLIB_MAX_LINE_LENGTH`. In this scenario, the server is
+expected to reset the connection.
+
+Signed-off-by: Ville Vesilehto <ville@vesilehto.fi>
+
+CVE: CVE-2025-46728
+Upstream: https://github.com/yhirose/cpp-httplib/commit/7b752106ac42bd5b907793950d9125a0972c8e8e
+[thomas: adapt lines numbers to v0.19.0]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ httplib.h    |  9 +++++++++
+ test/test.cc | 15 +++++++++++++++
+ 2 files changed, 24 insertions(+)
+
+diff --git a/httplib.h b/httplib.h
+index cb182c4129..a2aa24f96b 100644
+--- a/httplib.h
++++ b/httplib.h
+@@ -145,6 +145,10 @@
+ #define CPPHTTPLIB_LISTEN_BACKLOG 5
+ #endif
+ 
++#ifndef CPPHTTPLIB_MAX_LINE_LENGTH
++#define CPPHTTPLIB_MAX_LINE_LENGTH 32768
++#endif
++
+ /*
+  * Headers
+  */
+@@ -2998,6 +3002,11 @@ inline bool stream_line_reader::getline() {
+ #endif
+ 
+   for (size_t i = 0;; i++) {
++    if (size() >= CPPHTTPLIB_MAX_LINE_LENGTH) {
++      // Treat exceptionally long lines as an error to
++      // prevent infinite loops/memory exhaustion
++      return false;
++    }
+     char byte;
+     auto n = strm_.read(&byte, 1);
+ 
+diff --git a/test/test.cc b/test/test.cc
+index 4fd9983bd8..7f5cc8a9d0 100644
+--- a/test/test.cc
++++ b/test/test.cc
+@@ -42,6 +42,9 @@ const int PORT = 1234;
+ const string LONG_QUERY_VALUE = string(25000, '@');
+ const string LONG_QUERY_URL = "/long-query-value?key=" + LONG_QUERY_VALUE;
+ 
++const string TOO_LONG_QUERY_VALUE = string(35000, '@');
++const string TOO_LONG_QUERY_URL = "/too-long-query-value?key=" + TOO_LONG_QUERY_VALUE;
++
+ const std::string JSON_DATA = "{\"hello\":\"world\"}";
+ 
+ const string LARGE_DATA = string(1024 * 1024 * 100, '@'); // 100MB
+@@ -2839,6 +2842,11 @@ class ServerTest : public ::testing::Test {
+                EXPECT_EQ(LONG_QUERY_URL, req.target);
+                EXPECT_EQ(LONG_QUERY_VALUE, req.get_param_value("key"));
+              })
++        .Get("/too-long-query-value",
++             [&](const Request &req, Response & /*res*/) {
++               EXPECT_EQ(TOO_LONG_QUERY_URL, req.target);
++               EXPECT_EQ(TOO_LONG_QUERY_VALUE, req.get_param_value("key"));
++             })
+         .Get("/array-param",
+              [&](const Request &req, Response & /*res*/) {
+                EXPECT_EQ(3u, req.get_param_value_count("array"));
+@@ -3624,6 +3632,13 @@ TEST_F(ServerTest, LongQueryValue) {
+   EXPECT_EQ(StatusCode::UriTooLong_414, res->status);
+ }
+ 
++TEST_F(ServerTest, TooLongQueryValue) {
++  auto res = cli_.Get(TOO_LONG_QUERY_URL.c_str());
++
++  ASSERT_FALSE(res);
++  EXPECT_EQ(Error::Read, res.error());
++}
++
+ TEST_F(ServerTest, TooLongHeader) {
+   Request req;
+   req.method = "GET";
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 712c3f7293..928cef8a86 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -13,6 +13,9 @@ CPP_HTTPLIB_INSTALL_STAGING = YES
 CPP_HTTPLIB_CONF_OPTS = \
 	-Dcpp-httplib_test=false
 
+# 0001-merge-commit-from-fork.patch
+CPP_HTTPLIB_IGNORE_CVES += CVE-2025-46728
+
 ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
 CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_compile=true
 CPP_HTTPLIB_DEPENDENCIES += host-python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
