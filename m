Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6EACA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 09:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD1EC61549;
	Sat, 16 Aug 2025 09:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ke2aK0bA_a0u; Sat, 16 Aug 2025 09:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0EEF6151A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0EEF6151A;
	Sat, 16 Aug 2025 09:13:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D091961
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 09:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A79B40C5D
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 09:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8awVkBbAGq1S for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 09:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7135C40B0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7135C40B0A
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7135C40B0A
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 09:13:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b0bde14so12871595e9.2
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 02:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755335581; x=1755940381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SigRscIJXFZ/HBl8Hz+vvkbdLKeAsYgAtOPV08TQ6Yc=;
 b=k0HPqzykfg3MN699bm3j15YJ8gVwH9czvWEmQx4cDXncb5aG+AIXttVKmYIusby1uH
 Ug7hmYxoNsmrgxRavchwZybpiicF9vf0h8rR3RKqakBiV6XKHZ4hhbwQxQDLB06T1DJd
 gcS6w6poB9Rma3GFQFjykqknNa+5EhNwLKECs1fej7fGO5Buvh9BrGqAwIfgF/oCoyH+
 x6LQ2YdLKbd7kTVEVyIsUZUok3dL7AACamDJfzdoMFexUyM6KxKhiXNJ7eyJ+4d/HQvX
 gZM/wksXzrF94QueKVljHnqJy3WUJ9/Kfe7K5ISAyX/1SnVkp3NmePnUNjOpmJpw7HV9
 NnMQ==
X-Gm-Message-State: AOJu0YzsAVqlHNwRv5i+//g5wkgKp/5CmQLLCv+R0mNdk13gsGX2W8qE
 cODG6wWDbVZHnYb3H4zo5mJ+ETsOzyRraivtr4CLYthyhO3VTikSKQtuCsF9CV8ogHHgvWYohlI
 F37SG8BE=
X-Gm-Gg: ASbGncvzRu8KtLhiz65VjbKDZRB899v902F/0/ugHWZUVwvfKcos328pUeGaAf8Dbb1
 kHNO6HveIelhlJOWaWmv5Shr9bwgohTH8bngurHREvrj1KKMPEFuuQXqFc9wk1WHWqhG2jHKe5i
 jqTHSlVBaj3lQH2Gt3uv6Dp2XN/1A9O/19p3hsee7yhjbtZPkp/yCbTMbfwyrwqdrb2rpFDni5h
 UMQmKs9J0gAbEZvE7Seas80drvzsOYfxAHGlQt2WMF4U6EMCPXvfCsrN179UqBN32DzmZvsUyPK
 Ywt7Og7IH1SrJ6eSYeCK0g56S4LIcJfYrfiGJeM/5DQyfCJCDIsPNRq9UTuRKqZR8H6I0glg7eO
 wWjG6eoMBPqxoJ7bJw1lg3GTL
X-Google-Smtp-Source: AGHT+IHyZXX03KClZw2krefhKDwDomD2p/BgGxF82AMwOB9fHGBdrSPSQkGrhb2eVfpfmDDoXK1nLg==
X-Received: by 2002:a05:600c:1c96:b0:442:c993:6f94 with SMTP id
 5b1f17b1804b1-45a217f4228mr46201195e9.12.1755335580906; 
 Sat, 16 Aug 2025 02:13:00 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb64758463sm5028530f8f.4.2025.08.16.02.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 02:13:00 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Sat, 16 Aug 2025 11:12:59 +0200
Message-ID: <20250816091300.3104974-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755335581; x=1755940381; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SigRscIJXFZ/HBl8Hz+vvkbdLKeAsYgAtOPV08TQ6Yc=;
 b=GU0jMvSNI0KQAHI0N2ENU/Zq6eNkY3iQ3wfG+zeKk9rUWbfqstwBUcmj39W/gSf33b
 LGuqHLg/iiCbt8Y0QXQljEHpclQM4od/CH7aa/aTG/VC16zFFEcTXg2biuOVwEYFMQ5w
 MfDW7Q7/lbrNfJ7rzh4hPgKOTvNzJEDwAHgzZYgA2PBOgprV6jiFJ+6xySCwqB5W8cqe
 vOKVXcrariVM59Q6IiqDP6xBO17wLz24ST0CwyiKyWrqQ2mihqkhmyx9XlFgzS9C/1OB
 TLlMyFnLoJpW9p21cV1pLFuRplpFApF1b2Vn3SItcV7+E3R3Djb/8sLYHG6JfJqLssnf
 Vs1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GU0jMvSN
Subject: [Buildroot] [PATCH 1/2] package/cpp-httplib: add patch for
 CVE-2025-46728
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 .../0001-merge-commit-from-fork.patch         | 103 ++++++++++++++++++
 package/cpp-httplib/cpp-httplib.mk            |   3 +
 2 files changed, 106 insertions(+)
 create mode 100644 package/cpp-httplib/0001-merge-commit-from-fork.patch

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
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
