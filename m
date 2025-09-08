Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A943CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB5684E7F;
	Mon,  8 Sep 2025 10:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3zmZrW961Ox; Mon,  8 Sep 2025 10:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5117584E48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5117584E48;
	Mon,  8 Sep 2025 10:55:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF037186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C122F84E33
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyM52DN8wvnd for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77B0F84E38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77B0F84E38
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77B0F84E38
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:45 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45de6415102so7659735e9.1
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328943; x=1757933743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z8EfP/ams0xkVHXYk605HkUL1Fc1hlxqogEmb50yZTQ=;
 b=tDKWDbrXibZdPpki9aVmOpSXcSvcQmjbqedDKlfiXuFS7fAlPmOyM1/KOGBJ+8ffBM
 /Q4pGGOD7HTyKN5WahUlMU4Wx4K7x+ptIwvj3MFmTaU/vLLKbtlNZYERjopoOKJa1NAp
 ue0YXBNoEi4gQ5+NFQ67gCl/H5iMItqCCcNUkrxtWslGWRDzBO5fMeSKdzp0qMyq83/F
 uqE69c4Ju0xNefjDcwIDXOeFrh6KxMlS8WqdWU8qXl5NgHiTN2N5I6FTj/CmZjmUYWbo
 gEat2ezfYn+yRuZfeYP6HJ4zfAXtFiUyV1aBi6lvuD5qyehiT6mcyTsomsDn9FF7ppBD
 usIw==
X-Gm-Message-State: AOJu0YywrObtco7HG8KJ4AiwN9EiV5Kj3uvxSk1G6Ajum72YB78YJ8jC
 kXpmrUISvA7HEMRUbrrEjbkoSKqIr97vwSFWcBJbmlAoNCrCoPgatSLCNr5l7XofKpW+qsb35Rn
 Vd3mvEc8=
X-Gm-Gg: ASbGnctdSiMn1nDY26PeDlhaGzkQV5zm1QbBm8Zi43roM5qJY5eHkQ9M8/mJbFb7+8P
 SfLumLXj77CrLwMy5e3eEqOhRxVdupJVW57pv1KUKxunrgNQ6SQcDTE3LRRmreVG2Jh4+ZgqoWr
 9hbFI1w8wD+Z8AC/ixe1MZrN829CLn79EQlCpe3OXCG212gR6pglRrP6EKWeTvNtGvcyYz40N2m
 13uO2JPhcaNuQKo9wK0N8Ki4xA3y1gU0s38HnNvqu5ZDHfs1G5tReMA45TdYv2X6HIGDUiqH+Wv
 20SjbTb6OcIaqRbPtpDrzEJrqwizFgmUenCoXBe+FdM5hKu2So3LOWN+z2jnrwIvkRvhtg28yU/
 kaM7GU3JMnackiYOs5RmA2KDNgMn3W/dam4OowvjidWiaaH6X/yzuPUGNi+iI7UQ265NM5pL9p7
 mh7/nwJAPmLbuUQoIxuRxpyFQA
X-Google-Smtp-Source: AGHT+IFUstRm0d+yEP/sbgIh3l1WTXV6tJqqteT2GWizYKZ6nYg9gw2aoE6//9hg237UhoTxs0PdVQ==
X-Received: by 2002:a5d:5f90:0:b0:3e7:4835:8eeb with SMTP id
 ffacd0b85a97d-3e74835953emr3038650f8f.53.1757328943261; 
 Mon, 08 Sep 2025 03:55:43 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd6891d23sm141043835e9.4.2025.09.08.03.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:55:42 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:55:42 +0200
Message-Id: <20250908105542.681457-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250816091300.3104974-1-thomas.perale@mind.be>
References: <20250816091300.3104974-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328943; x=1757933743; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z8EfP/ams0xkVHXYk605HkUL1Fc1hlxqogEmb50yZTQ=;
 b=BeCHQ5i+bXaJaYTVYOlSRhXj/ffz7EOrMhkTGZ/V/r+x1WWej22PVFFsNRObIic+a+
 Qz0e8p7anNCA0FGdSx4seztdNKeS1s7spGKSug1cOnmG+3E2Sz7oN1LWi6An0D2AkZmU
 Jv9pq8r+ifFln1EmEQtukFVZbZiKWDSbTuNM3FWiYcDyD2o0JVmj4OBRbutPANiMvKnv
 7wFSIKOiXv0llmt3dKX3jhnLqZl7Pt5PVIWRjm9wxNrJcdZxPq1vQbShq5d/B7kQKeqO
 +fMZxKyzG4JSkh9B56gtuWmCYxMDNypJFtrP4FS9ynDATW8AlQAfjPlvH6snCfvBVSm4
 Efng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BeCHQ5i+
Subject: Re: [Buildroot] [PATCH 1/2] package/cpp-httplib: add patch for
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

In reply of:
> Fix the following vulnerability:
> 
> - CVE-2025-46728
> 
>     cpp-httplib is a C++ header-only HTTP/HTTPS server and client library.
>     Prior to version 0.20.1, the library fails to enforce configured size
>     limits on incoming request bodies when `Transfer-Encoding: chunked` is
>     used or when no `Content-Length` header is provided. A remote attacker
>     can send a chunked request without the terminating zero-length chunk,
>     causing uncontrolled memory allocation on the server. This leads to
>     potential exhaustion of system memory and results in a server crash or
>     unresponsiveness. Version 0.20.1 fixes the issue by enforcing limits
>     during parsing. If the limit is exceeded at any point during reading,
>     the connection is terminated immediately. A short-term workaround
>     through a Reverse Proxy is available. If updating the library
>     immediately is not feasible, deploy a reverse proxy (e.g., Nginx,
>     HAProxy) in front of the `cpp-httplib` application. Configure the
>     proxy to enforce maximum request body size limits, thereby stopping
>     excessively large requests before they reach the vulnerable library
>     code.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-46728
>   - https://github.com/yhirose/cpp-httplib/commit/7b752106ac42bd5b907793950d9125a0972c8e8e
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  .../0001-merge-commit-from-fork.patch         | 103 ++++++++++++++++++
>  package/cpp-httplib/cpp-httplib.mk            |   3 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 package/cpp-httplib/0001-merge-commit-from-fork.patch
> 
> diff --git a/package/cpp-httplib/0001-merge-commit-from-fork.patch b/package/cpp-httplib/0001-merge-commit-from-fork.patch
> new file mode 100644
> index 0000000000..180bb22e11
> --- /dev/null
> +++ b/package/cpp-httplib/0001-merge-commit-from-fork.patch
> @@ -0,0 +1,103 @@
> +From 7b752106ac42bd5b907793950d9125a0972c8e8e Mon Sep 17 00:00:00 2001
> +From: Ville Vesilehto <ville@vesilehto.fi>
> +Date: Sat, 3 May 2025 11:39:01 +0300
> +Subject: [PATCH] Merge commit from fork
> +
> +* fix(parser): Limit line length in getline
> +
> +Prevents potential infinite loop and memory exhaustion in
> +stream_line_reader::getline by enforcing max line length.
> +
> +Signed-off-by: Ville Vesilehto <ville@vesilehto.fi>
> +
> +* fix: increase default max line length to 32k
> +
> +LONG_QUERY_VALUE test is set at 25k.
> +
> +Signed-off-by: Ville Vesilehto <ville@vesilehto.fi>
> +
> +* test(client): expect read error with too long query
> +
> +Adds a test case (`TooLongQueryValue`) to verify client behavior
> +when the request URI is excessively long, exceeding
> +`CPPHTTPLIB_MAX_LINE_LENGTH`. In this scenario, the server is
> +expected to reset the connection.
> +
> +Signed-off-by: Ville Vesilehto <ville@vesilehto.fi>
> +
> +CVE: CVE-2025-46728
> +Upstream: https://github.com/yhirose/cpp-httplib/commit/7b752106ac42bd5b907793950d9125a0972c8e8e
> +[thomas: adapt lines numbers to v0.19.0]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + httplib.h    |  9 +++++++++
> + test/test.cc | 15 +++++++++++++++
> + 2 files changed, 24 insertions(+)
> +
> +diff --git a/httplib.h b/httplib.h
> +index cb182c4129..a2aa24f96b 100644
> +--- a/httplib.h
> ++++ b/httplib.h
> +@@ -145,6 +145,10 @@
> + #define CPPHTTPLIB_LISTEN_BACKLOG 5
> + #endif
> + 
> ++#ifndef CPPHTTPLIB_MAX_LINE_LENGTH
> ++#define CPPHTTPLIB_MAX_LINE_LENGTH 32768
> ++#endif
> ++
> + /*
> +  * Headers
> +  */
> +@@ -2998,6 +3002,11 @@ inline bool stream_line_reader::getline() {
> + #endif
> + 
> +   for (size_t i = 0;; i++) {
> ++    if (size() >= CPPHTTPLIB_MAX_LINE_LENGTH) {
> ++      // Treat exceptionally long lines as an error to
> ++      // prevent infinite loops/memory exhaustion
> ++      return false;
> ++    }
> +     char byte;
> +     auto n = strm_.read(&byte, 1);
> + 
> +diff --git a/test/test.cc b/test/test.cc
> +index 4fd9983bd8..7f5cc8a9d0 100644
> +--- a/test/test.cc
> ++++ b/test/test.cc
> +@@ -42,6 +42,9 @@ const int PORT = 1234;
> + const string LONG_QUERY_VALUE = string(25000, '@');
> + const string LONG_QUERY_URL = "/long-query-value?key=" + LONG_QUERY_VALUE;
> + 
> ++const string TOO_LONG_QUERY_VALUE = string(35000, '@');
> ++const string TOO_LONG_QUERY_URL = "/too-long-query-value?key=" + TOO_LONG_QUERY_VALUE;
> ++
> + const std::string JSON_DATA = "{\"hello\":\"world\"}";
> + 
> + const string LARGE_DATA = string(1024 * 1024 * 100, '@'); // 100MB
> +@@ -2839,6 +2842,11 @@ class ServerTest : public ::testing::Test {
> +                EXPECT_EQ(LONG_QUERY_URL, req.target);
> +                EXPECT_EQ(LONG_QUERY_VALUE, req.get_param_value("key"));
> +              })
> ++        .Get("/too-long-query-value",
> ++             [&](const Request &req, Response & /*res*/) {
> ++               EXPECT_EQ(TOO_LONG_QUERY_URL, req.target);
> ++               EXPECT_EQ(TOO_LONG_QUERY_VALUE, req.get_param_value("key"));
> ++             })
> +         .Get("/array-param",
> +              [&](const Request &req, Response & /*res*/) {
> +                EXPECT_EQ(3u, req.get_param_value_count("array"));
> +@@ -3624,6 +3632,13 @@ TEST_F(ServerTest, LongQueryValue) {
> +   EXPECT_EQ(StatusCode::UriTooLong_414, res->status);
> + }
> + 
> ++TEST_F(ServerTest, TooLongQueryValue) {
> ++  auto res = cli_.Get(TOO_LONG_QUERY_URL.c_str());
> ++
> ++  ASSERT_FALSE(res);
> ++  EXPECT_EQ(Error::Read, res.error());
> ++}
> ++
> + TEST_F(ServerTest, TooLongHeader) {
> +   Request req;
> +   req.method = "GET";
> diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
> index 712c3f7293..928cef8a86 100644
> --- a/package/cpp-httplib/cpp-httplib.mk
> +++ b/package/cpp-httplib/cpp-httplib.mk
> @@ -13,6 +13,9 @@ CPP_HTTPLIB_INSTALL_STAGING = YES
>  CPP_HTTPLIB_CONF_OPTS = \
>  	-Dcpp-httplib_test=false
>  
> +# 0001-merge-commit-from-fork.patch
> +CPP_HTTPLIB_IGNORE_CVES += CVE-2025-46728
> +
>  ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
>  CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_compile=true
>  CPP_HTTPLIB_DEPENDENCIES += host-python3
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
