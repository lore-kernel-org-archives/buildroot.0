Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A1BCAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED975416C0;
	Thu, 25 Sep 2025 20:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0GuaiswcPej; Thu, 25 Sep 2025 20:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 091E1416C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 091E1416C5;
	Thu, 25 Sep 2025 20:17:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16C6B177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1460741275
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdaf7sDyN7vZ for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 01FB940066
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01FB940066
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01FB940066
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so574481f8f.1
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831415; x=1759436215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BjFYy7RNkIRLfoF1wzwAcSMPuG1LZ9K+NqXH/ku/V1I=;
 b=B66SteyPMW/x570qKuRWIYrePOt8nbYvmW8Pm3QmnZQeL85v7X0lpnJBI+RcT4L5f6
 XCZnS54gzoEFQ5IXwTMk3RXNmtf1/dxjt5oq2M0shTru6QB3SxI1FoH4KK7lX8sKuz/f
 SMN+LN4arGTNmpzNqUE1UzfA4ZQVsTjL68HgOkTDeaQ4beei6bDoaB23OlXU6V8arszV
 by594yV3JW29T2qSP/JjBsc77C4ScVR2T/q/7Nf7AF1ZtWhyKgz7YgEw2iWSfR90H/M6
 zaVjHbkDAbElxU8m9w/m9SNDBgsZnLW1nnwIPF5CK0ACzFD4UJdyWfPsPdcd7jzUrPE3
 YwlA==
X-Gm-Message-State: AOJu0YzPgoC61xRZhR6zrx/uWbpLmPa0cQk/yI2tC87UyviVK1QEGj16
 NLC+RZEc8XqDMotg/6eRqhj21C3lpnZRPOFfQ6P12Fn6ktCS7HhqY421YQ7W16xkkuo=
X-Gm-Gg: ASbGncsuqqhmuf5rAkIcvcEqyW+vmmXWrpn/zx8lCJvJP4fGiMRXrQ8NlSKwA02mwzD
 Jr83q6kpczEebAMmaNQlOc5qqk/agWfY/my3FzWVn9Fc1tIGc5U0INkUs8aEu5ooxJFiRRjUmtc
 kWgG3IZU6fG8WY/w9eUfiZ5Um60YIl6GsyIQhLwpB9EYyay+XAx/4WcTwRhrChIBIeO+pBgtux5
 +aDy1ryhWUZu76aiCQAZqL7sFL06+Nq+GgHS8mqxQE063zSCXVwz+s30+Tqf2VZeaBWwxhAmygE
 Eygk0UzS+syqk07Ny5QtZH/vF33Eh99+wRoaagzlhuoP9XGKTNIKXhKISBDCc9O/U8WHdNJZn1U
 CWnzB2XQ5WyTs4Jo=
X-Google-Smtp-Source: AGHT+IEYtWkQWTXejivKxtwYWKfltOzvl0fpX3juCYb1ArF9NTwjGTEodY4jkkDKDnxC9a+KGvhgJw==
X-Received: by 2002:a05:6000:2484:b0:3e9:978e:48fd with SMTP id
 ffacd0b85a97d-40e46ad011dmr4606471f8f.23.1758831414958; 
 Thu, 25 Sep 2025 13:16:54 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33bef4b4sm45475815e9.20.2025.09.25.13.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:54 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:54 +0200
Message-ID: <20250925201654.43953-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918065115.65994-1-thomas.perale@mind.be>
References: <20250918065115.65994-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831415; x=1759436215; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjFYy7RNkIRLfoF1wzwAcSMPuG1LZ9K+NqXH/ku/V1I=;
 b=LOX7/7/9h7OVhXtd3WKzToqTbVEKsNhXT0soW7aIPC6ROQyA7XlfMkl4hDuj5GdfKJ
 2hRBOC7el5Fvx7l82sls4ekHN/VEWmWSJA34kOD9TxAPKltTQchaCw8meNaUrvO/wNcu
 XkSZxEzWykRCdCRYrpaMNnIAPgeBnAK+NV4aJqEl+9dEMTRcXGIhMdXltSx2PaagsSbj
 L1jpgZ6aH4EIlGExguW1AoR2igOmk4k9rmMq4yiA83Wo9Sv+5W5AGEAxfeTaXxyd3iRm
 7aQQWHUyjWs8JnIXMC7EqtTMJ33X+mhXmZCte5eVrmYgfarvdHmF5aujfDCCgf2UIp72
 QwDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LOX7/7/9
Subject: Re: [Buildroot] [PATCH] package/civetweb: add patch for
 CVE-2025-55763
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
> This fixes the following vulnerability:
> 
> - CVE-2025-55763
> 
> Buffer Overflow in the URI parser of CivetWeb 1.14 through 1.16 (latest)
> allows a remote attacker to achieve remote code execution via a crafted
> HTTP request. This vulnerability is triggered during request processing
> and may allow an attacker to corrupt heap memory, potentially leading to
> denial of service or arbitrary code execution.
> 
> For more information, see:
>   - https://nvd.nist.gov//vuln/detail/CVE-2025-55763
>   - https://github.com/civetweb/civetweb/commit/76e222bcb77ba8452e5da4e82ae6cecd499c25e0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  ...w-in-directory-URI-slash-redirection.patch | 56 +++++++++++++++++++
>  package/civetweb/civetweb.mk                  |  3 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 package/civetweb/0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
> 
> diff --git a/package/civetweb/0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch b/package/civetweb/0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
> new file mode 100644
> index 0000000000..399fafb4bd
> --- /dev/null
> +++ b/package/civetweb/0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
> @@ -0,0 +1,56 @@
> +From 76e222bcb77ba8452e5da4e82ae6cecd499c25e0 Mon Sep 17 00:00:00 2001
> +From: krispybyte <krispybyte@proton.me>
> +Date: Sat, 21 Jun 2025 23:33:50 +0300
> +Subject: [PATCH] Fix heap overflow in directory URI slash redirection
> +
> +CVE: CVE-2025-55763
> +Upstream: https://github.com/civetweb/civetweb/commit/76e222bcb77ba8452e5da4e82ae6cecd499c25e0
> +[thomas: fix offset]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/civetweb.c | 23 ++++++++++++++++++-----
> + 1 file changed, 18 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/civetweb.c b/src/civetweb.c
> +index bbc9aa8be..e969c939f 100644
> +--- a/src/civetweb.c
> ++++ b/src/civetweb.c
> +@@ -15242,7 +15242,6 @@ handle_request(struct mg_connection *conn)
> + 	/* 12. Directory uris should end with a slash */
> + 	if (file.stat.is_directory && ((uri_len = (int)strlen(ri->local_uri)) > 0)
> + 	    && (ri->local_uri[uri_len - 1] != '/')) {
> +-
> + 		/* Path + server root */
> + 		size_t buflen = UTF8_PATH_MAX * 2 + 2;
> + 		char *new_path;
> +@@ -15254,12 +15254,26 @@ handle_request(struct mg_connection *conn)
> + 			mg_send_http_error(conn, 500, "out or memory");
> + 		} else {
> + 			mg_get_request_link(conn, new_path, buflen - 1);
> +-			strcat(new_path, "/");
> ++
> ++			size_t len = strlen(new_path);
> ++			if (len + 1 < buflen) {
> ++				new_path[len] = '/';
> ++				new_path[len + 1] = '\0';
> ++				len += 1;
> ++			}
> ++
> + 			if (ri->query_string) {
> +-				/* Append ? and query string */
> +-				strcat(new_path, "?");
> +-				strcat(new_path, ri->query_string);
> ++				if (len + 1 < buflen) {
> ++					new_path[len] = '?';
> ++					new_path[len + 1] = '\0';
> ++					len += 1;
> ++				}
> ++
> ++				/* Append with size of space left for query string + null terminator */
> ++				size_t max_append = buflen - len - 1;
> ++				strncat(new_path, ri->query_string, max_append);
> + 			}
> ++
> + 			mg_send_http_redirect(conn, new_path, 301);
> + 			mg_free(new_path);
> + 		}
> diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
> index 629c1b59b2..af221e9133 100644
> --- a/package/civetweb/civetweb.mk
> +++ b/package/civetweb/civetweb.mk
> @@ -10,6 +10,9 @@ CIVETWEB_LICENSE = MIT
>  CIVETWEB_LICENSE_FILES = LICENSE.md
>  CIVETWEB_CPE_ID_VALID = YES
>  
> +# 0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
> +CIVETWEB_IGNORE_CVES += CVE-2025-55763
> +
>  CIVETWEB_CONF_OPTS = TARGET_OS=LINUX WITH_IPV6=1 \
>  	$(if $(BR2_INSTALL_LIBSTDCPP),WITH_CPP=1)
>  CIVETWEB_COPT = -DHAVE_POSIX_FALLOCATE=0
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
