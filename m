Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EE9CD6E5D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 20:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6A1980F11;
	Tue,  2 Jun 2026 20:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PiCXmyh8kWZc; Tue,  2 Jun 2026 20:52:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5541F8318C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780433525;
	bh=ZpZqC76RdiWLyewsF4c+noAEkLEalngN68Fj4zGyWLA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Cc8SXwhTqP/mgMw8sXfFzA6PAX6/v4Q27BYpIwR1U9Bq8mejeap4+F7X1RUQKL3bT
	 6sdXyzrAkDXCczMgJH/gtSir50QsY/0ksKGM8AH1GOAPB/Poj6y34VKSKAjpYUQtmN
	 E7xDJ9znUD7o6NtQEEEJr3MOmYBfz7DnmMe6LOyH5fTC6sW2rfwxYExhe38rzNCsFo
	 TLoEA99lcxV5mGxx714PnkVgDhyC3e897cnnq+CCx96NRT6gw5YnAugPNoXk0e714t
	 MBa36xBPwUUrPth/Ok5yy7Of63QasG/CZnZ6Z4F6JYyQRh0pcatyooHaVV2NCOiHtx
	 7OdUONYHuLGew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5541F8318C;
	Tue,  2 Jun 2026 20:52:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE2F6187
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF9478318C
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKL9z3UyRk96 for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 20:52:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39F7380F11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39F7380F11
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39F7380F11
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:52:00 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49068493267so69319395e9.1
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 13:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780433518; x=1781038318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lnuU01KsmsteH8SPJtFdYjNUPoIbdJbUFapy0Gm/B2w=;
 b=p0hI1tVUiduZooSQZThRlUIUi8udXTwT6kedjhGOwDv3zzShGtG1a2Rj31ImLZ1nuv
 d8iNRctCQSU8/ufM7xvHgFBgBt4uxfHl98j2nlW8uJ1V8q2Jmp0la3yJD3Wg3FNsrmVu
 TA5lnSROnnxEneqkDpXNqhDH1L8CWDCQIC4XCLInuMyYqhDVEbYFz6oK1T2lHLTYZtU1
 3jrkROyliegNQ9GWeydwY0yKytcO+cTIyKqYpVxv44++QYEaSVYhQd+1NCH4hloHj0vX
 Pg7ELhRYfFrUKkMzUTsk4gVygos7JxZxGgQmN70/0B0Q5misoLSn6nv/sDMKBiQ4cVWH
 V+6A==
X-Gm-Message-State: AOJu0Yxz6ViYlD+bHBtIVQPx7IBEZkVI36Vass/2IaH+e1pBW+yvmtYo
 P6QurOt6U05KJfNe0a2/+lFGqibFAJQxnmEX6+7trOybpxUASNU1KVSf29KCA2jShDPJwikdovA
 4pN4s
X-Gm-Gg: Acq92OE5WKkFnvD9mltCraHSMa+zzFJ2ouuqDw1g6gmilfK0gfCRqoibqQSvqsbOoLH
 5nhEBmMagNWZthjX/SoFvOvZ1VyzaQaxH31x11AkmBax20y7QQEhFFBZlmBwag8PORjni744P9r
 IA02AfF01Ivm5F6MUXyH5X83NqC5hD1IihY2dOMp2av5VxsmJKXCWpoGqRI5mH/EhaoOWTBXyDE
 P3zVf8qVg7kPoH6RHbQ/uImnfAursgJP36HxyNd+uZa6m0Xhajrg1Qh1+qcyHtQSn1vXYuqMu/s
 i3xJVvVv9iEWEQaPXw2DUPHQBE0UfZalAn0ysiwdpQAevPknBEB12GcSaFYWfuwjwlJ86JAXArn
 boEVOe/uSsfxoEG0t7q8wnNoC4Z18EmKVTJWl6cEeuN8smSs4AAtqmnRpKpGnJKVNZQW9XlZNlE
 vbPDw1Iyl44zC5Zd2WF9cQJxQJROJT8yTmgfK14OW9UaKDo5opixywpx7meg==
X-Received: by 2002:a05:600c:444c:b0:490:b2c9:e284 with SMTP id
 5b1f17b1804b1-490b60e3cc1mr5695085e9.30.1780433518543; 
 Tue, 02 Jun 2026 13:51:58 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dc412sm2305563f8f.4.2026.06.02.13.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 13:51:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 22:51:57 +0200
Message-ID: <20260602205157.124479-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780433518; x=1781038318; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lnuU01KsmsteH8SPJtFdYjNUPoIbdJbUFapy0Gm/B2w=;
 b=fip42ZrV5osiAqSKRtKHo65eNVng839lyHmzOyHmXcIKxJCF+gmou6YFSx3F0ikOvF
 rKg7ZG0pPGI0vlKrgqDatdvZyobGY0IirDjCHDMclXyugVgV7atq0tCZl1Cv5PBbygI3
 bex5BgYCaXVNbPDcKZC8QGiOIMxO7xC09OL1JO8LH6ciiBjigp4ryWp+QSe69eD7dK+x
 FLbXOGAp+53pIBKDm45qpIbCNWmlUE2CehHi3V7IrQPrXFCMDDtnRJSIP+HZlugGO3Tq
 1tf6SE9Puz3tSa8+zIuHYohHNQORTy0PhjofRnPLeLXyGu2AgcGJdGrMDaWYmtHO0B71
 Ck0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fip42ZrV
Subject: [Buildroot] [PATCH] package/capnproto: patch CVE-2026-322{39,40}
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
Cc: Koen Martens <gmc@sonologic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- CVE-2026-32239:
    Cap'n Proto is a data interchange format and capability-based RPC
    system. Prior to 1.4.0, a negative Content-Length value was converted
    to unsigned, treating it as an impossibly large length instead. In
    theory, this bug could enable HTTP request/response smuggling. This
    vulnerability is fixed in 1.4.0.

For more information, see:
 - https://github.com/capnproto/capnproto/security/advisories/GHSA-qjx3-pp3m-9jpm
 - https://www.cve.org/CVERecord?id=CVE-2026-32239

- CVE-2026-32240:
    Cap'n Proto is a data interchange format and capability-based RPC
    system. Prior to 1.4.0, when using Transfer-Encoding: chunked, if a
    chunk's size parsed to a value of 2^64 or larger, it would be
    truncated to a 64-bit integer. In theory, this bug could enable HTTP
    request/response smuggling. This vulnerability is fixed in 1.4.0.

For more information, see:
 - https://github.com/capnproto/capnproto/security/advisories/GHSA-vpcq-mx5v-32wm
 - https://www.cve.org/CVERecord?id=CVE-2026-32240

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...http-body-size-integer-overflow-bugs.patch | 161 ++++++++++++++++++
 package/capnproto/capnproto.mk                |   4 +
 2 files changed, 165 insertions(+)
 create mode 100644 package/capnproto/0001-fix-http-body-size-integer-overflow-bugs.patch

diff --git a/package/capnproto/0001-fix-http-body-size-integer-overflow-bugs.patch b/package/capnproto/0001-fix-http-body-size-integer-overflow-bugs.patch
new file mode 100644
index 0000000000..2389be01be
--- /dev/null
+++ b/package/capnproto/0001-fix-http-body-size-integer-overflow-bugs.patch
@@ -0,0 +1,161 @@
+From 6e5ee24ad92687a56a26ae596da45dc6c2f902c0 Mon Sep 17 00:00:00 2001
+From: Kenton Varda <kenton@cloudflare.com>
+Date: Tue, 10 Mar 2026 18:16:14 -0500
+Subject: [PATCH] Fix HTTP body size integer overflow bugs.
+
+The KJ-HTTP library was discovered to have two bugs related to integer overflows while handling message body sizes:
+1. A negative `Content-Length` value was converted to unsigned, treating it as an impossibly large length instead.
+2. When using `Transfer-Encoding: chunked`, if a chunk's size parsed to a value of 2^64 or larger, it would be truncated to a 64-bit integer.
+
+In theory, these bugs could enable HTTP request/response smuggling, although it would require integration with a proxy that has bugs of its own.
+
+For more details, see (in a future commit): security-advisories/2026-03-10-1-http-size-validation.md
+
+CVE: CVE-2026-32239
+CVE: CVE-2026-32240
+Upstream: https://github.com/capnproto/capnproto/commit/2744b3c012b4aa3c31cefb61ec656829fa5c0e36
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ c++/src/kj/compat/http-test.c++ | 64 +++++++++++++++++++++++++++++++++
+ c++/src/kj/compat/http.c++      | 28 +++++++++++----
+ 2 files changed, 86 insertions(+), 6 deletions(-)
+ 
+diff --git a/c++/src/kj/compat/http-test.c++ b/c++/src/kj/compat/http-test.c++
+index f10ff8d156..daf08992f0 100644
+--- a/c++/src/kj/compat/http-test.c++
++++ b/c++/src/kj/compat/http-test.c++
+@@ -2659,6 +2659,70 @@ KJ_TEST("HttpServer invalid method") {
+   KJ_EXPECT(expectedResponse == response, expectedResponse, response);
+ }
+ 
++KJ_TEST("HttpServer rejects negative Content-Length") {
++  KJ_HTTP_TEST_SETUP_IO;
++  kj::TimerImpl timer(kj::origin<kj::TimePoint>());
++  auto pipe = KJ_HTTP_TEST_CREATE_2PIPE;
++
++  HttpHeaderTable table;
++  BrokenHttpService service;
++  HttpServer server(timer, table, service, {
++    .canceledUploadGraceBytes = 1024 * 1024,
++  });
++
++  auto listenTask = server.listenHttp(kj::mv(pipe.ends[0]));
++
++  auto msg =
++      "POST / HTTP/1.1\r\n"
++      "Content-Length: -1\r\n"
++      "\r\n"
++      "foo"_kj.asBytes();
++
++  auto writePromise = pipe.ends[1]->write(msg.begin(), msg.size());
++  auto response = pipe.ends[1]->readAllText().wait(waitScope);
++
++  // The server should reject the negative Content-Length. The KJ_FAIL_REQUIRE in getEntityBody()
++  // gets caught by the server loop and turned into a 500 error.
++  KJ_EXPECT(response.startsWith("HTTP/1.1 500 Internal Server Error"), response);
++
++  KJ_EXPECT(writePromise.poll(waitScope));
++  writePromise.catch_([](kj::Exception&&) {}).wait(waitScope);
++}
++
++KJ_TEST("HttpServer rejects chunked body with overflowing chunk size") {
++  KJ_HTTP_TEST_SETUP_IO;
++  kj::TimerImpl timer(kj::origin<kj::TimePoint>());
++  auto pipe = KJ_HTTP_TEST_CREATE_2PIPE;
++
++  HttpHeaderTable table;
++  BrokenHttpService service;
++  HttpServer server(timer, table, service, {
++    .canceledUploadGraceBytes = 1024 * 1024,
++  });
++
++  auto listenTask = server.listenHttp(kj::mv(pipe.ends[0]));
++
++  // 17 hex digits: 0x10000000000000000 = 2^64, which overflows uint64_t.
++  auto msg =
++      "POST / HTTP/1.1\r\n"
++      "Transfer-Encoding: chunked\r\n"
++      "\r\n"
++      "10000000000000000\r\n"
++      "x\r\n"
++      "0\r\n"
++      "\r\n"_kj.asBytes();
++
++  auto writePromise = pipe.ends[1]->write(msg.begin(), msg.size());
++  auto response = pipe.ends[1]->readAllText().wait(waitScope);
++
++  // The chunk size overflow causes a KJ_REQUIRE failure during body reading, which the server
++  // catches and turns into a 500 error.
++  KJ_EXPECT(response.startsWith("HTTP/1.1 500 Internal Server Error"), response);
++
++  KJ_EXPECT(writePromise.poll(waitScope));
++  writePromise.catch_([](kj::Exception&&) {}).wait(waitScope);
++}
++
+ // Ensure that HttpServerSettings can continue to be constexpr.
+ KJ_UNUSED static constexpr HttpServerSettings STATIC_CONSTEXPR_SETTINGS {};
+ 
+diff --git a/c++/src/kj/compat/http.c++ b/c++/src/kj/compat/http.c++
+index 6976335e9c..6dc1e48613 100644
+--- a/c++/src/kj/compat/http.c++
++++ b/c++/src/kj/compat/http.c++
+@@ -1246,16 +1246,20 @@ public:
+ 
+       uint64_t value = 0;
+       for (char c: text) {
++        uint64_t digit;
+         if ('0' <= c && c <= '9') {
+-          value = value * 16 + (c - '0');
++          digit = c - '0';
+         } else if ('a' <= c && c <= 'f') {
+-          value = value * 16 + (c - 'a' + 10);
++          digit = c - 'a' + 10;
+         } else if ('A' <= c && c <= 'F') {
+-          value = value * 16 + (c - 'A' + 10);
++          digit = c - 'A' + 10;
+         } else {
+           KJ_FAIL_REQUIRE("invalid HTTP chunk size", text, text.asBytes()) { break; }
+           return value;
+         }
++        KJ_REQUIRE(value <= (uint64_t(kj::maxValue) >> 4),
++            "HTTP chunk size overflow", text, text.asBytes()) { break; }
++        value = value * 16 + digit;
+       }
+ 
+       return value;
+@@ -1742,7 +1746,15 @@ kj::Own<kj::AsyncInputStream> HttpInputStreamImpl::getEntityBody(
+       // Body elided.
+       kj::Maybe<uint64_t> length;
+       KJ_IF_MAYBE(cl, headers.get(HttpHeaderId::CONTENT_LENGTH)) {
+-        length = strtoull(cl->cStr(), nullptr, 10);
++        // Validate that the Content-Length is a non-negative integer. Note that strtoull() accepts
++        // leading '-' signs and silently converts negative values to large unsigned values, so we
++        // must explicitly check for a leading digit.
++        char* end;
++        uint64_t parsedValue = strtoull(cl->cStr(), &end, 10);
++        if ((*cl)[0] >= '0' && (*cl)[0] <= '9' && end > cl->begin() && *end == '\0') {
++          length = parsedValue;
++        }
++        // If invalid, we just leave `length` as nullptr, since the body is elided anyway.
+       } else if (headers.get(HttpHeaderId::TRANSFER_ENCODING) == nullptr) {
+         // HACK: Neither Content-Length nor Transfer-Encoding header in response to HEAD request.
+         //   Propagate this fact with a 0 expected body length.
+@@ -1786,12 +1798,16 @@ kj::Own<kj::AsyncInputStream> HttpInputStreamImpl::getEntityBody(
+     //   "Content-Length: 5, 5, 5". Hopefully no one actually does that...
+     char* end;
+     uint64_t length = strtoull(cl->cStr(), &end, 10);
+-    if (end > cl->begin() && *end == '\0') {
++    // Note that strtoull() accepts leading '-' signs and silently converts negative values to
++    // large unsigned values, so we must explicitly check for a leading digit.
++    if ((*cl)[0] >= '0' && (*cl)[0] <= '9' && end > cl->begin() && *end == '\0') {
+       // #5
+       return kj::heap<HttpFixedLengthEntityReader>(*this, length);
+     } else {
+       // #4 (bad content-length)
+-      KJ_FAIL_REQUIRE("invalid Content-Length header value", *cl);
++      KJ_FAIL_REQUIRE("invalid Content-Length header value", *cl) { break; }
++      // To pass the -fno-exceptions test (but KJ-HTTP is really not safe to use in that mode).
++      return kj::heap<HttpNullEntityReader>(*this, uint64_t(0));
+     }
+   }
+ 
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 7424a1420f..f51e037532 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -10,6 +10,10 @@ CAPNPROTO_LICENSE = MIT
 CAPNPROTO_LICENSE_FILES = LICENSE
 CAPNPROTO_CPE_ID_VENDOR = capnproto
 CAPNPROTO_INSTALL_STAGING = YES
+
+# 0001-fix-http-body-size-integer-overflow-bugs.patch
+CAPNPROTO_IGNORE_CVES += CVE-2026-32239 CVE-2026-32240
+
 # Fetched from Github with no configure script
 CAPNPROTO_AUTORECONF = YES
 CAPNPROTO_CONF_OPTS = --with-external-capnp
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
