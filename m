Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD684CAC597
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 06:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91B6A60B15;
	Thu, 18 Sep 2025 06:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtTzgIybVqjF; Thu, 18 Sep 2025 06:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A65BE60D71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A65BE60D71;
	Thu, 18 Sep 2025 06:51:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 624E5AF1
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 06:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5351060D71
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 06:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvlNyH-vv7v5 for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 06:51:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D75060B15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D75060B15
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D75060B15
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 06:51:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3d3ff4a4d6fso322174f8f.0
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 23:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758178278; x=1758783078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xvMUZSm5bpbJix7pWCoPLmG23f4dVKE+xsbrQEotaM0=;
 b=gTNALR3gE4QxhnuBeU0XpQC9WdUw7eB0sB4rMBJwFPrTTYOEkuuFulvUbaudVHkaYO
 GUzAUXNV2HMtXSXaacP6DXlnE54ZXgfrw5e4ZMUASP4HjFuXkFe9+GGLjAp5Iw1s1YUk
 NQJ+CF3twmOjRrGNN4bEFRZyz5xZ4f0ap5maHblQ1RUzH5ZUGM4W/MCP+Aj34m3zSvb6
 c01jzbq0el8CYys3grVnE5Dm+KL9DydIa5pSMhm9WbI+G54ru5UyRAYDyDJOpYASxDnA
 uK8nOip/P9m//oeYmIIO090ctbs6AZercvcEsYqsQlKAJkIR7LkR5J4Cn8RiFZhpGl9j
 pPjw==
X-Gm-Message-State: AOJu0YzXfcQ/92plA99hLQHEpiwf9HgzAezJtZvGRG6Y7AP5LWnGILGJ
 K7ajRu+jnAsUwiqvn10Gy0k3+R6Why2j9Mlb08taxOe3OK/gLGUwmnbr1CJ9jKXC9qfRZ7vbmCP
 OWeUR540=
X-Gm-Gg: ASbGncvDuH7YHA5SPvqf50+C/t/clEt+VD2plJffAa77B6DuTWIM5mvkiKkkDNj7R/g
 9Z1I57oaiVd4bJzB9x0RoeHawuohw9Rd1T+6/e8jgj5MVDM0fFKPDIXD3jA4tOG8qro6Yn30QZz
 Wf0gIoPDNtbQYAJ102o9X/uv7Fa0DSdAwGEPOOY39Mcartx60lLP6DMFpIzr5vUsgBYbl2rr+Qy
 264bBF5AXDN7oFse9Ho8p++vgisz4rt/zF/QdGQyaeMaewarJs4J+ZSlCbELNL9q3yyZcSTLsgA
 49yfcpi9p1IyMU0k6ZxabYyMiFT72KoSmj47ZQO/OuQ2gnkZEYNNOQ/99ZoFsj766GU8F/pJnFp
 qy0P5fipGGoSef5HIH/eyH//6JogQxszbWg==
X-Google-Smtp-Source: AGHT+IFZmKTMbN1MUCjxpg8OpK98qdIgpHA9iRmfNNy+kySPKsVgUu0PH9ZaetxF+2IZocKlojB/SA==
X-Received: by 2002:a05:6000:2203:b0:3de:5aff:3498 with SMTP id
 ffacd0b85a97d-3ecdf9c1cebmr4834085f8f.14.1758178277529; 
 Wed, 17 Sep 2025 23:51:17 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee07412111sm2287264f8f.28.2025.09.17.23.51.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 23:51:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 08:51:15 +0200
Message-ID: <20250918065115.65994-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758178278; x=1758783078; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=xvMUZSm5bpbJix7pWCoPLmG23f4dVKE+xsbrQEotaM0=;
 b=Gvry51WkM52smzPdou5lYcEIg4fa1iScbHzdDl5jrp2bTGa8ZV6Tiqzgz/LA/GWIID
 mRc330Z7XxukDpGUBGXdN2CRNHEPovsxoMvYRGX54dC/HFkXhqUNKlgvzg0gX7VCnPIC
 XXJZUR4ffASq0objYtLQITZHOexJULM3ue6FDy9FdUnvFeuChqIUItCvnpbT6wliC2oH
 JubFEfqSRO2enkPEdZ9rfHUwrOr19Hu6YrylnXhSqYazzKJNxGA/kXkRFg7R1Lo3HA7+
 /yN+YJjeLqeTAcKoBiXa2GauIcJYLrmiKYd0ndh6wcOlk314jCkQmR426AOR8vNdlJmJ
 Pp/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Gvry51Wk
Subject: [Buildroot] [PATCH] package/civetweb: add patch for CVE-2025-55763
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

This fixes the following vulnerability:

- CVE-2025-55763

Buffer Overflow in the URI parser of CivetWeb 1.14 through 1.16 (latest)
allows a remote attacker to achieve remote code execution via a crafted
HTTP request. This vulnerability is triggered during request processing
and may allow an attacker to corrupt heap memory, potentially leading to
denial of service or arbitrary code execution.

For more information, see:
  - https://nvd.nist.gov//vuln/detail/CVE-2025-55763
  - https://github.com/civetweb/civetweb/commit/76e222bcb77ba8452e5da4e82ae6cecd499c25e0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...w-in-directory-URI-slash-redirection.patch | 56 +++++++++++++++++++
 package/civetweb/civetweb.mk                  |  3 +
 2 files changed, 59 insertions(+)
 create mode 100644 package/civetweb/0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch

diff --git a/package/civetweb/0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch b/package/civetweb/0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
new file mode 100644
index 0000000000..399fafb4bd
--- /dev/null
+++ b/package/civetweb/0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
@@ -0,0 +1,56 @@
+From 76e222bcb77ba8452e5da4e82ae6cecd499c25e0 Mon Sep 17 00:00:00 2001
+From: krispybyte <krispybyte@proton.me>
+Date: Sat, 21 Jun 2025 23:33:50 +0300
+Subject: [PATCH] Fix heap overflow in directory URI slash redirection
+
+CVE: CVE-2025-55763
+Upstream: https://github.com/civetweb/civetweb/commit/76e222bcb77ba8452e5da4e82ae6cecd499c25e0
+[thomas: fix offset]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/civetweb.c | 23 ++++++++++++++++++-----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/src/civetweb.c b/src/civetweb.c
+index bbc9aa8be..e969c939f 100644
+--- a/src/civetweb.c
++++ b/src/civetweb.c
+@@ -15242,7 +15242,6 @@ handle_request(struct mg_connection *conn)
+ 	/* 12. Directory uris should end with a slash */
+ 	if (file.stat.is_directory && ((uri_len = (int)strlen(ri->local_uri)) > 0)
+ 	    && (ri->local_uri[uri_len - 1] != '/')) {
+-
+ 		/* Path + server root */
+ 		size_t buflen = UTF8_PATH_MAX * 2 + 2;
+ 		char *new_path;
+@@ -15254,12 +15254,26 @@ handle_request(struct mg_connection *conn)
+ 			mg_send_http_error(conn, 500, "out or memory");
+ 		} else {
+ 			mg_get_request_link(conn, new_path, buflen - 1);
+-			strcat(new_path, "/");
++
++			size_t len = strlen(new_path);
++			if (len + 1 < buflen) {
++				new_path[len] = '/';
++				new_path[len + 1] = '\0';
++				len += 1;
++			}
++
+ 			if (ri->query_string) {
+-				/* Append ? and query string */
+-				strcat(new_path, "?");
+-				strcat(new_path, ri->query_string);
++				if (len + 1 < buflen) {
++					new_path[len] = '?';
++					new_path[len + 1] = '\0';
++					len += 1;
++				}
++
++				/* Append with size of space left for query string + null terminator */
++				size_t max_append = buflen - len - 1;
++				strncat(new_path, ri->query_string, max_append);
+ 			}
++
+ 			mg_send_http_redirect(conn, new_path, 301);
+ 			mg_free(new_path);
+ 		}
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 629c1b59b2..af221e9133 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -10,6 +10,9 @@ CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
 CIVETWEB_CPE_ID_VALID = YES
 
+# 0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
+CIVETWEB_IGNORE_CVES += CVE-2025-55763
+
 CIVETWEB_CONF_OPTS = TARGET_OS=LINUX WITH_IPV6=1 \
 	$(if $(BR2_INSTALL_LIBSTDCPP),WITH_CPP=1)
 CIVETWEB_COPT = -DHAVE_POSIX_FALLOCATE=0
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
