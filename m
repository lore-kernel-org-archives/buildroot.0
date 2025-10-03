Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D345CCAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 12:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D9A280AD6;
	Fri,  3 Oct 2025 12:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQnMs9MyY-3J; Fri,  3 Oct 2025 12:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AF4480AF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AF4480AF3;
	Fri,  3 Oct 2025 12:54:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 66EB8226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D8E48228C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0zwaP0vRFdh for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 12:54:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 322BF80AF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 322BF80AF0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 322BF80AF0
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:54:09 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-63163a6556bso4801054a12.1
 for <buildroot@buildroot.org>; Fri, 03 Oct 2025 05:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759496048; x=1760100848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XTtsczWXauKz14ebSkEGDKxsGg3x1v0ubR1VgvsvVR0=;
 b=c1TBjN+E0PsLQHx7NgzbH1qGKJ5xF5KvEjxOn+SFBn6lB4SbbwvHgx+1OV42RigaUU
 8CiVHLUuhSRub283hbaGmI6gtyqXti4YH0wsC+m39M2r6a+Xq0Pqpf13cs5EzxMMMFFS
 SjFIzaBxuIg4o40b5yYzzPpRW57YtHxdOq5RtCbWeLZkGBkIIZu5IsPau9RmesG5cHVD
 nN1Do9Xz275s7TxIBAQ2BvC4d6ThFycfgU8iFqG/7OjyJbw6l7I+Klc5gyIUTvgXgOIa
 Dy68BDV8d9PGMCMEaJRTyzuM84PYYP0f5WgRAzQUolTUC3ZQRbImhae1EdI6wAJ1LnbB
 Z4aQ==
X-Gm-Message-State: AOJu0YxISETZuP/6GRopFiU5HGkYHdk8v/9ouPKyQVhkQS0NH8qNF+Xs
 9kyxpjlWbjqYKz7eqyHnrs4KsWTuAy9NIZw7fwwlOnJDBdh5DuzmyhYnbWUZsxKl+gvpRCULa9Y
 NyIWo
X-Gm-Gg: ASbGnctzxyGlIRp3Jm1Cx6cCTKt+I5jJLWZDGhyesz/PW/NchIoM9HMqXDYgfoKjCSF
 Gr48BmvGV8dh1sZSU6VSRi/EAtZQIvLTkt3Yzw/WFGcsCpXRZuCtmsRrF4KOC1y78rJs/Q3W/38
 0h4fSIXNwD6saYjn4O3VXGLb6Lq2Oy6032Dw9F2URnFlCFUY6e0T9gcAiQv8NoMGx5AtMYVes2i
 7PHWAigJjnowSOtT8WSTLb+/gM4UZJHb5RiwzqJCmSGmJfJax81750t6iJrczfuWaTedE4jnemd
 gym5G1JYXoAFFSqOatmt3GRA0YgfBBlTBBTc/NegRs+9qR61d1C6dQbY9f3FxPJ77x94K2BQD+U
 ME9n289aRL5aryBMGbCS9mIIo36kPEKPWSYgI5SDG/z/KCtMZp1C50vTFkXJoWeT366uf5VI=
X-Google-Smtp-Source: AGHT+IFycnj49pOInKoLPV9i7Hw7AZS19UluwtR6qhWpEqbcbkv0u9DTO7muOw3Kim4wY7colP+Z1Q==
X-Received: by 2002:a17:907:26c9:b0:b30:b2e4:af3f with SMTP id
 a640c23a62f3a-b49c1a70eebmr341690866b.14.1759496047538; 
 Fri, 03 Oct 2025 05:54:07 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63788110530sm4030658a12.38.2025.10.03.05.54.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 05:54:07 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  3 Oct 2025 14:54:00 +0200
Message-ID: <20251003125400.75799-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759496048; x=1760100848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=XTtsczWXauKz14ebSkEGDKxsGg3x1v0ubR1VgvsvVR0=;
 b=Q3YvftNxOinIoGdkiS0qvXpSjbWLrpTvUTS6AZ1J3MZAhgBSWFFQI4a+S8KqVHTJ8A
 Zi6Wg9QH1HZFT5EY5vfGcsFL1kOseQktZnxGYRDGZweb4tR/scoTjknJ/FhfLr8gnyFP
 FflXknMrw3v4UoZrzZ0WnuqXSrjVhLrkg3AKPZ+wrCp3A3+csJxqMqckcnrXi0+LV8RK
 y8IFPmv1gJZ0AorukTAVSk89nKYJwrhPFEsTueebXOL1uuNlIri3jEKBjtqOze76e/yC
 0y1h7BrL6S+SR79Az1Yd+7qvdMgIFCa+n0kd5jAel4WASG2TZPDMVzscXJZQ1mCKFF/a
 3v/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Q3YvftNx
Subject: [Buildroot] [PATCH] package/raptor: add patches for CVE-2024-57822,
 CVE-2024-57823
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerabilities:
- CVE-2024-57822:
    In Raptor RDF Syntax Library through 2.0.16, there is a heap-based
    buffer over-read when parsing triples with the nquads parser in
    raptor_ntriples_parse_term_internal().
    https://www.cve.org/CVERecord?id=CVE-2024-57822

- CVE-2024-57823:
    In Raptor RDF Syntax Library through 2.0.16, there is an integer
    underflow when normalizing a URI with the turtle parser in
    raptor_uri_normalize_path().
    https://www.cve.org/CVERecord?id=CVE-2024-57823

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...ad-buffer-overflow-in-ntriples-bnode.patch | 30 +++++++++++++
 ...derflow-in-raptor_uri_normalize_path.patch | 43 +++++++++++++++++++
 package/raptor/raptor.mk                      |  5 +++
 3 files changed, 78 insertions(+)
 create mode 100644 package/raptor/0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch
 create mode 100644 package/raptor/0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch

diff --git a/package/raptor/0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch b/package/raptor/0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch
new file mode 100644
index 0000000000..1242c7289c
--- /dev/null
+++ b/package/raptor/0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch
@@ -0,0 +1,30 @@
+From ece2c79df43091686a538b8231cf387d84bfa60e Mon Sep 17 00:00:00 2001
+From: Dave Beckett <dave@dajobe.org>
+Date: Fri, 7 Feb 2025 11:38:34 -0800
+Subject: [PATCH] Fix Github issue 70 B) Heap read buffer overflow in ntriples
+ bnode
+
+(raptor_ntriples_parse_term_internal): Only allow looking at the last
+character of a bnode ID only if bnode length >0
+
+CVE: CVE-2024-57822
+Upstream: https://github.com/dajobe/raptor/commit/ece2c79df43091686a538b8231cf387d84bfa60e
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/raptor_ntriples.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/raptor_ntriples.c b/src/raptor_ntriples.c
+index 3276e790..ecc4247c 100644
+--- a/src/raptor_ntriples.c
++++ b/src/raptor_ntriples.c
+@@ -212,7 +212,7 @@ raptor_ntriples_parse_term_internal(raptor_world* world,
+             locator->column--;
+             locator->byte--;
+           }
+-          if(term_class == RAPTOR_TERM_CLASS_BNODEID && dest[-1] == '.') {
++          if(term_class == RAPTOR_TERM_CLASS_BNODEID && position > 0 && dest[-1] == '.') {
+             /* If bnode id ended on '.' move back one */
+             dest--;
+ 
diff --git a/package/raptor/0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch b/package/raptor/0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch
new file mode 100644
index 0000000000..55e8ab3f11
--- /dev/null
+++ b/package/raptor/0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch
@@ -0,0 +1,43 @@
+From da7a79976bd0314c23cce55d22495e7d29301c44 Mon Sep 17 00:00:00 2001
+From: Dave Beckett <dave@dajobe.org>
+Date: Thu, 6 Feb 2025 21:12:37 -0800
+Subject: [PATCH] Fix Github issue 70 A) Integer Underflow in
+ raptor_uri_normalize_path()
+
+(raptor_uri_normalize_path): Return empty buffer if path gets to 0
+length
+
+CVE: CVE-2024-57823
+Upstream: https://github.com/dajobe/raptor/commit/da7a79976bd0314c23cce55d22495e7d29301c44
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/raptor_rfc2396.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/raptor_rfc2396.c b/src/raptor_rfc2396.c
+index 8cc364f4..f8ec5798 100644
+--- a/src/raptor_rfc2396.c
++++ b/src/raptor_rfc2396.c
+@@ -351,6 +351,10 @@ raptor_uri_normalize_path(unsigned char* path_buffer, size_t path_len)
+           *dest++ = *s++;
+         *dest = '\0';
+         path_len -= len;
++        if(path_len <= 0) {
++          *path_buffer = '\0';
++          return 0;
++        }
+ 
+         if(p && p < prev) {
+           /* We know the previous prev path component and we didn't do
+@@ -390,6 +394,10 @@ raptor_uri_normalize_path(unsigned char* path_buffer, size_t path_len)
+     /* Remove <component>/.. at the end of the path */
+     *prev = '\0';
+     path_len -= (s-prev);
++    if(path_len <= 0) {
++      *path_buffer = '\0';
++      return 0;
++    }
+   }
+ 
+ 
diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
index ec7643ce3d..1b850400f8 100644
--- a/package/raptor/raptor.mk
+++ b/package/raptor/raptor.mk
@@ -14,6 +14,11 @@ RAPTOR_CPE_ID_VENDOR = librdf
 RAPTOR_CPE_ID_PRODUCT = raptor_rdf_syntax_library
 RAPTOR_INSTALL_STAGING = YES
 
+# 0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch
+RAPTOR_IGNORE_CVES += CVE-2024-57822
+# 0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch
+RAPTOR_IGNORE_CVES += CVE-2024-57823
+
 # Flag is added to make sure the patch is applied for the configure.ac of raptor.
 RAPTOR_AUTORECONF = YES
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
