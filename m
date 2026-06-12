Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F1ACD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B015161371;
	Fri, 12 Jun 2026 11:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTjXT0l33dL9; Fri, 12 Jun 2026 11:38:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF5BB61313
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264299;
	bh=+GMDtKGA7FLEcRdYRaR+FkrfxBh4rrKS3J/9EO145GU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=risJPuC4wUE4N4KjGgdEnbzHXYe8BAb7JALqrs/ALPFjhvOZS0eqHdidWpPrpDsG1
	 8jAeNyBVbzu7BsPp+Tm+HGO8W4ASffo6DTIaEF1yOfAgWPFd8avJtg/6sxmBJXXUWo
	 tdtL4cN1aO7jpFCJteWKWzY8qbtW2PtBS1j+nffoX08SmpQuvytRKJvoMgP2akqN3B
	 vfpvxaGC0uc5+4wfrbgI90whW79gXk+iyS/DlYTeGGf7T8o7gmU5Yu5D2E3ySfGg1y
	 6zg8Wvky1VO6Hit7wrtwopUthi98DD85g7gKxTLZlJ5/Brmljfj8KpbdXpd1mEWyir
	 nPiz2eyMEG2ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF5BB61313;
	Fri, 12 Jun 2026 11:38:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A399237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 948CB61339
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVARP_lX86fr for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E5336110D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E5336110D
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E5336110D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso8010025e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264283; x=1781869083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3SzoLUa2pq3mkdiQzESxaXfgjeBDcuTN0bqGfMSql0o=;
 b=lKTrz/gJtiBpGYWOj0Fsqfv6aaMcQHUvU349ifzvT6q6Qc1X50vEeRcJilqOWmWJ59
 tX+WLE/hlQp8dGl0us2nkkQeUYD4mQg8cps7ypTvIYoqtjUDbeo0tlS1e8+sAZ4bYy1o
 IkPsT2Ofwd7KPZSwPjSrYixmE5jcrbwIrQfB5zy0r47I/ttdCAjlruJmwx/S8LzDisY8
 +PrgdE3oJ2yxCzrIQvWKABo/GUf1jCzGBUvrw/r2K30T4keY1pdCnP/woMM2uiIx8/1Q
 FOqDL27jsx38IVbmD4aj30HTN9tgPlnHOL2fpqYY4wsjfu4MLd3wVpWHsNYVfeDfsuLi
 jsXg==
X-Gm-Message-State: AOJu0YxyFs4E01d3TTdxA1eTasq9GZtAHSekc9yl1arH0v6k+fVLvfCv
 RXmeuBPEI8riUbQdd0b9+597vgt1rJiz8Lh9UjVk3fHX6AqEOy6AsL/e3eRoPCvLVXo=
X-Gm-Gg: Acq92OEkQK1P1B+Rr2Ra+jcLU5YHVgVRYxsQLeBzCdwJc/wGBy4Pqj4qXzxO7x5ms+i
 UlWI4o/sadt67ofq3OzLEcyfTDz9VnW8Nn8kY7zzSVdAbtZS7xeJMUkTI+vlOeluJvayEG82y4f
 QK8RQ9RwqW61sd+2KcaAt0z0GOdvTVgKu9L9G4FdB1fg6uGyh4C2mqQVHtBa2bMCezmC+FobXHq
 N19kTTrfyGNQirwcs/kNMxCOMXrY/v92cVeRcQR+KPB9HYqR0fzhWEdLxcmNYsj17/vCZ9ccGIb
 cB0RhuXslbjzSa2Wnpk7j/hfUdEbBMWU/X7vIL4NrYgVJ2M7blobPDCBTvKAqUgCJ9jrAXiHSjE
 LMtP+hLjHPGBw/9GPY/xwG3CcYFWGMdBit61a4GLFb5QJO/BmVK2KFxW2ztn/5jDbFKecSzhGZv
 21GO02w9wP0vCwc1M=
X-Received: by 2002:a05:600c:2214:b0:488:d6eb:e63c with SMTP id
 5b1f17b1804b1-490ec4d46ecmr22039315e9.15.1781264282857; 
 Fri, 12 Jun 2026 04:38:02 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea95c512sm34418015e9.2.2026.06.12.04.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:02 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:01 +0200
Message-ID: <20260612113801.252737-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602205157.124479-1-thomas.perale@mind.be>
References: <20260602205157.124479-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264283; x=1781869083; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SzoLUa2pq3mkdiQzESxaXfgjeBDcuTN0bqGfMSql0o=;
 b=L0sIoiWb1ENQT5JBdUALv3w44QcYxEEwj5xx6EnL3apiDIFvPWwD3KS6hWcJJRs04f
 AoYPMa1H3uSEQsQTjxt+1MpbjMrZDbHSmHSDuTrPuhCzjgD6041xn3qhRpJ89PFK92MO
 r60v0c8WVaToMoq81zE5lLWr1pfskNa8c8XZvGspvo6FqDzRzZXVAAXqaF+EwU8yqc45
 74Lj//pBIG2ZjWDbbok5iFsKHBS0eLlFA5Xcj8U3y4l1wUx/ZNFH1gBZevs92pK0dRym
 b7/mXzK6lRvqAx7IGvEdBe8ax3Dfv7QuCp/l5EIUIhnskGe8OGSwvhmmgXamPYzh/Buw
 v6uA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L0sIoiWb
Subject: Re: [Buildroot] [PATCH] package/capnproto: patch CVE-2026-322{39,
 40}
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

In reply of:
> - CVE-2026-32239:
>     Cap'n Proto is a data interchange format and capability-based RPC
>     system. Prior to 1.4.0, a negative Content-Length value was converted
>     to unsigned, treating it as an impossibly large length instead. In
>     theory, this bug could enable HTTP request/response smuggling. This
>     vulnerability is fixed in 1.4.0.
> 
> For more information, see:
>  - https://github.com/capnproto/capnproto/security/advisories/GHSA-qjx3-pp3m-9jpm
>  - https://www.cve.org/CVERecord?id=CVE-2026-32239
> 
> - CVE-2026-32240:
>     Cap'n Proto is a data interchange format and capability-based RPC
>     system. Prior to 1.4.0, when using Transfer-Encoding: chunked, if a
>     chunk's size parsed to a value of 2^64 or larger, it would be
>     truncated to a 64-bit integer. In theory, this bug could enable HTTP
>     request/response smuggling. This vulnerability is fixed in 1.4.0.
> 
> For more information, see:
>  - https://github.com/capnproto/capnproto/security/advisories/GHSA-vpcq-mx5v-32wm
>  - https://www.cve.org/CVERecord?id=CVE-2026-32240
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...http-body-size-integer-overflow-bugs.patch | 161 ++++++++++++++++++
>  package/capnproto/capnproto.mk                |   4 +
>  2 files changed, 165 insertions(+)
>  create mode 100644 package/capnproto/0001-fix-http-body-size-integer-overflow-bugs.patch
> 
> diff --git a/package/capnproto/0001-fix-http-body-size-integer-overflow-bugs.patch b/package/capnproto/0001-fix-http-body-size-integer-overflow-bugs.patch
> new file mode 100644
> index 0000000000..2389be01be
> --- /dev/null
> +++ b/package/capnproto/0001-fix-http-body-size-integer-overflow-bugs.patch
> @@ -0,0 +1,161 @@
> +From 6e5ee24ad92687a56a26ae596da45dc6c2f902c0 Mon Sep 17 00:00:00 2001
> +From: Kenton Varda <kenton@cloudflare.com>
> +Date: Tue, 10 Mar 2026 18:16:14 -0500
> +Subject: [PATCH] Fix HTTP body size integer overflow bugs.
> +
> +The KJ-HTTP library was discovered to have two bugs related to integer overflows while handling message body sizes:
> +1. A negative `Content-Length` value was converted to unsigned, treating it as an impossibly large length instead.
> +2. When using `Transfer-Encoding: chunked`, if a chunk's size parsed to a value of 2^64 or larger, it would be truncated to a 64-bit integer.
> +
> +In theory, these bugs could enable HTTP request/response smuggling, although it would require integration with a proxy that has bugs of its own.
> +
> +For more details, see (in a future commit): security-advisories/2026-03-10-1-http-size-validation.md
> +
> +CVE: CVE-2026-32239
> +CVE: CVE-2026-32240
> +Upstream: https://github.com/capnproto/capnproto/commit/2744b3c012b4aa3c31cefb61ec656829fa5c0e36
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + c++/src/kj/compat/http-test.c++ | 64 +++++++++++++++++++++++++++++++++
> + c++/src/kj/compat/http.c++      | 28 +++++++++++----
> + 2 files changed, 86 insertions(+), 6 deletions(-)
> + 
> +diff --git a/c++/src/kj/compat/http-test.c++ b/c++/src/kj/compat/http-test.c++
> +index f10ff8d156..daf08992f0 100644
> +--- a/c++/src/kj/compat/http-test.c++
> ++++ b/c++/src/kj/compat/http-test.c++
> +@@ -2659,6 +2659,70 @@ KJ_TEST("HttpServer invalid method") {
> +   KJ_EXPECT(expectedResponse == response, expectedResponse, response);
> + }
> + 
> ++KJ_TEST("HttpServer rejects negative Content-Length") {
> ++  KJ_HTTP_TEST_SETUP_IO;
> ++  kj::TimerImpl timer(kj::origin<kj::TimePoint>());
> ++  auto pipe = KJ_HTTP_TEST_CREATE_2PIPE;
> ++
> ++  HttpHeaderTable table;
> ++  BrokenHttpService service;
> ++  HttpServer server(timer, table, service, {
> ++    .canceledUploadGraceBytes = 1024 * 1024,
> ++  });
> ++
> ++  auto listenTask = server.listenHttp(kj::mv(pipe.ends[0]));
> ++
> ++  auto msg =
> ++      "POST / HTTP/1.1\r\n"
> ++      "Content-Length: -1\r\n"
> ++      "\r\n"
> ++      "foo"_kj.asBytes();
> ++
> ++  auto writePromise = pipe.ends[1]->write(msg.begin(), msg.size());
> ++  auto response = pipe.ends[1]->readAllText().wait(waitScope);
> ++
> ++  // The server should reject the negative Content-Length. The KJ_FAIL_REQUIRE in getEntityBody()
> ++  // gets caught by the server loop and turned into a 500 error.
> ++  KJ_EXPECT(response.startsWith("HTTP/1.1 500 Internal Server Error"), response);
> ++
> ++  KJ_EXPECT(writePromise.poll(waitScope));
> ++  writePromise.catch_([](kj::Exception&&) {}).wait(waitScope);
> ++}
> ++
> ++KJ_TEST("HttpServer rejects chunked body with overflowing chunk size") {
> ++  KJ_HTTP_TEST_SETUP_IO;
> ++  kj::TimerImpl timer(kj::origin<kj::TimePoint>());
> ++  auto pipe = KJ_HTTP_TEST_CREATE_2PIPE;
> ++
> ++  HttpHeaderTable table;
> ++  BrokenHttpService service;
> ++  HttpServer server(timer, table, service, {
> ++    .canceledUploadGraceBytes = 1024 * 1024,
> ++  });
> ++
> ++  auto listenTask = server.listenHttp(kj::mv(pipe.ends[0]));
> ++
> ++  // 17 hex digits: 0x10000000000000000 = 2^64, which overflows uint64_t.
> ++  auto msg =
> ++      "POST / HTTP/1.1\r\n"
> ++      "Transfer-Encoding: chunked\r\n"
> ++      "\r\n"
> ++      "10000000000000000\r\n"
> ++      "x\r\n"
> ++      "0\r\n"
> ++      "\r\n"_kj.asBytes();
> ++
> ++  auto writePromise = pipe.ends[1]->write(msg.begin(), msg.size());
> ++  auto response = pipe.ends[1]->readAllText().wait(waitScope);
> ++
> ++  // The chunk size overflow causes a KJ_REQUIRE failure during body reading, which the server
> ++  // catches and turns into a 500 error.
> ++  KJ_EXPECT(response.startsWith("HTTP/1.1 500 Internal Server Error"), response);
> ++
> ++  KJ_EXPECT(writePromise.poll(waitScope));
> ++  writePromise.catch_([](kj::Exception&&) {}).wait(waitScope);
> ++}
> ++
> + // Ensure that HttpServerSettings can continue to be constexpr.
> + KJ_UNUSED static constexpr HttpServerSettings STATIC_CONSTEXPR_SETTINGS {};
> + 
> +diff --git a/c++/src/kj/compat/http.c++ b/c++/src/kj/compat/http.c++
> +index 6976335e9c..6dc1e48613 100644
> +--- a/c++/src/kj/compat/http.c++
> ++++ b/c++/src/kj/compat/http.c++
> +@@ -1246,16 +1246,20 @@ public:
> + 
> +       uint64_t value = 0;
> +       for (char c: text) {
> ++        uint64_t digit;
> +         if ('0' <= c && c <= '9') {
> +-          value = value * 16 + (c - '0');
> ++          digit = c - '0';
> +         } else if ('a' <= c && c <= 'f') {
> +-          value = value * 16 + (c - 'a' + 10);
> ++          digit = c - 'a' + 10;
> +         } else if ('A' <= c && c <= 'F') {
> +-          value = value * 16 + (c - 'A' + 10);
> ++          digit = c - 'A' + 10;
> +         } else {
> +           KJ_FAIL_REQUIRE("invalid HTTP chunk size", text, text.asBytes()) { break; }
> +           return value;
> +         }
> ++        KJ_REQUIRE(value <= (uint64_t(kj::maxValue) >> 4),
> ++            "HTTP chunk size overflow", text, text.asBytes()) { break; }
> ++        value = value * 16 + digit;
> +       }
> + 
> +       return value;
> +@@ -1742,7 +1746,15 @@ kj::Own<kj::AsyncInputStream> HttpInputStreamImpl::getEntityBody(
> +       // Body elided.
> +       kj::Maybe<uint64_t> length;
> +       KJ_IF_MAYBE(cl, headers.get(HttpHeaderId::CONTENT_LENGTH)) {
> +-        length = strtoull(cl->cStr(), nullptr, 10);
> ++        // Validate that the Content-Length is a non-negative integer. Note that strtoull() accepts
> ++        // leading '-' signs and silently converts negative values to large unsigned values, so we
> ++        // must explicitly check for a leading digit.
> ++        char* end;
> ++        uint64_t parsedValue = strtoull(cl->cStr(), &end, 10);
> ++        if ((*cl)[0] >= '0' && (*cl)[0] <= '9' && end > cl->begin() && *end == '\0') {
> ++          length = parsedValue;
> ++        }
> ++        // If invalid, we just leave `length` as nullptr, since the body is elided anyway.
> +       } else if (headers.get(HttpHeaderId::TRANSFER_ENCODING) == nullptr) {
> +         // HACK: Neither Content-Length nor Transfer-Encoding header in response to HEAD request.
> +         //   Propagate this fact with a 0 expected body length.
> +@@ -1786,12 +1798,16 @@ kj::Own<kj::AsyncInputStream> HttpInputStreamImpl::getEntityBody(
> +     //   "Content-Length: 5, 5, 5". Hopefully no one actually does that...
> +     char* end;
> +     uint64_t length = strtoull(cl->cStr(), &end, 10);
> +-    if (end > cl->begin() && *end == '\0') {
> ++    // Note that strtoull() accepts leading '-' signs and silently converts negative values to
> ++    // large unsigned values, so we must explicitly check for a leading digit.
> ++    if ((*cl)[0] >= '0' && (*cl)[0] <= '9' && end > cl->begin() && *end == '\0') {
> +       // #5
> +       return kj::heap<HttpFixedLengthEntityReader>(*this, length);
> +     } else {
> +       // #4 (bad content-length)
> +-      KJ_FAIL_REQUIRE("invalid Content-Length header value", *cl);
> ++      KJ_FAIL_REQUIRE("invalid Content-Length header value", *cl) { break; }
> ++      // To pass the -fno-exceptions test (but KJ-HTTP is really not safe to use in that mode).
> ++      return kj::heap<HttpNullEntityReader>(*this, uint64_t(0));
> +     }
> +   }
> + 
> diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
> index 7424a1420f..f51e037532 100644
> --- a/package/capnproto/capnproto.mk
> +++ b/package/capnproto/capnproto.mk
> @@ -10,6 +10,10 @@ CAPNPROTO_LICENSE = MIT
>  CAPNPROTO_LICENSE_FILES = LICENSE
>  CAPNPROTO_CPE_ID_VENDOR = capnproto
>  CAPNPROTO_INSTALL_STAGING = YES
> +
> +# 0001-fix-http-body-size-integer-overflow-bugs.patch
> +CAPNPROTO_IGNORE_CVES += CVE-2026-32239 CVE-2026-32240
> +
>  # Fetched from Github with no configure script
>  CAPNPROTO_AUTORECONF = YES
>  CAPNPROTO_CONF_OPTS = --with-external-capnp
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
