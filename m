Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25126CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC839410B2;
	Thu,  9 Oct 2025 14:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9H1v1WFI_tZI; Thu,  9 Oct 2025 14:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB62B410C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB62B410C6;
	Thu,  9 Oct 2025 14:55:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF8A721B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0BFE612CD
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsJxnfTzk7W3 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D944612F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D944612F7
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D944612F7
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e52279279so7476645e9.3
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021690; x=1760626490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nUFrZNNGEzOT0pcFDwBcB38GbTOcEoEpt5GNMluvtZI=;
 b=TMhLIAhXW3Gf/ALVUg3n1U76EKC7XHrVIPG0NmykAf3TlREr1Y/4WwIBXeiwaTTcEY
 nqg2akWbXYe24W8+ZSs1glNr3NtxG2jDVQXaxI4BN6D3nZvdlGqpzqPEnYitDnuoIEMb
 hCMoLKQ/U6Zh0+TAiX1LIZNS8pTQXkW2cNiZhz3Cw4cNWvEH4QAi9clE2GIKFVUubWqJ
 NrWo6RuWOw4QXf3JZYo3oc+93nA3hWt4ScIuyptucVTtSsKiaH/WnxjxL/9YY/HFwj2S
 AL8t5BmAA+VXnNvRXEAKCaE8Gwy4RkS58oQDY74ba26qW/rtA+WBOHRYVc6V7BIRnZtR
 BrHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwUPs62KppqamdjoSgVjrkytrsQ0wGVEijHfMUzi4hjTOEPaNw9Cnu5tAxMdtRfPuzZ+ehbpoHKq4=@buildroot.org
X-Gm-Message-State: AOJu0YyaYW9PHI3aIect8tSnck+tuY1RpjzDK1akf+3qBxgOzWwIbgrr
 XpwTeShzoHViZCJie7J2jfMzZiqombiF0W8zpbXAnmtS/YXVi4NVaI5NKLW6xM+wBSFHRqh/wUv
 LRbPz
X-Gm-Gg: ASbGncu/qjpnGORSy/mpqsJeZf8v7tydKXlvBFMHjEfx8QDtwa2Qn4hHEYLV9SfYvXd
 PmQT2/YlRkf9/ib89nYcxtOoVWXsIVmW8N6jE2snPAhJzKxVK2Mg/ZeCXfyN3mlVEenvIH7VrEw
 qy4FSPH+Y+0WLRQwNY86YWuHRHOVum55X2YQZpAREkHmadvK3ax7N1NW9YY80HXvdJTyHZXbetb
 1XjaeW+zISuDhsHafZFbVpPD6SXx2ZdxwiGsukaEfWHBOPUzG9yxX3vtaCe9FzLVhTGcVvIIm5+
 a+fYLCJPYubCyrgD/MPzMOpLL0fJq/wZ52Yglr0X6dsuyw9wMCnjn2/wLtjRJjqfMerNdrvC4Z8
 daInsaUsGeZ3ag/CRnGJFFdssIi71M6yN5279LIPLABZkoQPQw/g=
X-Google-Smtp-Source: AGHT+IGc63WO1q7Np9kZ26hSKQxIT3kr6KIOBv07sBntVw5fjGXD7Xgfshf3XW4aWAuqxr+ZybmwfQ==
X-Received: by 2002:a05:600c:8b38:b0:45c:4470:271c with SMTP id
 5b1f17b1804b1-46fa9af3682mr58107335e9.18.1760021690362; 
 Thu, 09 Oct 2025 07:54:50 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e980dsm38443533f8f.36.2025.10.09.07.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:50 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:49 +0200
Message-ID: <20251009145449.482731-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003125400.75799-1-titouan.christophe@mind.be>
References: <20251003125400.75799-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021690; x=1760626490; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nUFrZNNGEzOT0pcFDwBcB38GbTOcEoEpt5GNMluvtZI=;
 b=R2pMWv9crTB5lPZskrjkm9zg9wyZvSQRc8R2ldHlKGA3fvTQrspDY+YUuKjoxcSHZE
 hea4oy+EaGUZqi4Bh8FOuTZ9eT8rNp2RVSKqfwOPwhMbyQBiTGCEQkgw1XHDEpAFciVo
 ua0taD6FhNy8+CGKcQbH4GUF5BnM/M/rlA9R+qBqYIxESVskHJQsKVDuHO51tY/z2cIl
 CikKoOiYu4DvtJcP71lG9HQ6gm2uAj5r4Xd5iMnc2+rkknabvVIMSf/Ynu2PAWz/PKJC
 nPYGlWKaWN0rioYt6d6KDBHog/jKb3PjaXjZyGDAwgYUTG3hhr61z2z2kH6AvOjVgPJZ
 WARw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=R2pMWv9c
Subject: Re: [Buildroot] [PATCH] package/raptor: add patches for
 CVE-2024-57822, CVE-2024-57823
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
> This fixes the following vulnerabilities:
> - CVE-2024-57822:
>     In Raptor RDF Syntax Library through 2.0.16, there is a heap-based
>     buffer over-read when parsing triples with the nquads parser in
>     raptor_ntriples_parse_term_internal().
>     https://www.cve.org/CVERecord?id=CVE-2024-57822
> 
> - CVE-2024-57823:
>     In Raptor RDF Syntax Library through 2.0.16, there is an integer
>     underflow when normalizing a URI with the turtle parser in
>     raptor_uri_normalize_path().
>     https://www.cve.org/CVERecord?id=CVE-2024-57823
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  ...ad-buffer-overflow-in-ntriples-bnode.patch | 30 +++++++++++++
>  ...derflow-in-raptor_uri_normalize_path.patch | 43 +++++++++++++++++++
>  package/raptor/raptor.mk                      |  5 +++
>  3 files changed, 78 insertions(+)
>  create mode 100644 package/raptor/0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch
>  create mode 100644 package/raptor/0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch
> 
> diff --git a/package/raptor/0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch b/package/raptor/0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch
> new file mode 100644
> index 0000000000..1242c7289c
> --- /dev/null
> +++ b/package/raptor/0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch
> @@ -0,0 +1,30 @@
> +From ece2c79df43091686a538b8231cf387d84bfa60e Mon Sep 17 00:00:00 2001
> +From: Dave Beckett <dave@dajobe.org>
> +Date: Fri, 7 Feb 2025 11:38:34 -0800
> +Subject: [PATCH] Fix Github issue 70 B) Heap read buffer overflow in ntriples
> + bnode
> +
> +(raptor_ntriples_parse_term_internal): Only allow looking at the last
> +character of a bnode ID only if bnode length >0
> +
> +CVE: CVE-2024-57822
> +Upstream: https://github.com/dajobe/raptor/commit/ece2c79df43091686a538b8231cf387d84bfa60e
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + src/raptor_ntriples.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/raptor_ntriples.c b/src/raptor_ntriples.c
> +index 3276e790..ecc4247c 100644
> +--- a/src/raptor_ntriples.c
> ++++ b/src/raptor_ntriples.c
> +@@ -212,7 +212,7 @@ raptor_ntriples_parse_term_internal(raptor_world* world,
> +             locator->column--;
> +             locator->byte--;
> +           }
> +-          if(term_class == RAPTOR_TERM_CLASS_BNODEID && dest[-1] == '.') {
> ++          if(term_class == RAPTOR_TERM_CLASS_BNODEID && position > 0 && dest[-1] == '.') {
> +             /* If bnode id ended on '.' move back one */
> +             dest--;
> + 
> diff --git a/package/raptor/0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch b/package/raptor/0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch
> new file mode 100644
> index 0000000000..55e8ab3f11
> --- /dev/null
> +++ b/package/raptor/0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch
> @@ -0,0 +1,43 @@
> +From da7a79976bd0314c23cce55d22495e7d29301c44 Mon Sep 17 00:00:00 2001
> +From: Dave Beckett <dave@dajobe.org>
> +Date: Thu, 6 Feb 2025 21:12:37 -0800
> +Subject: [PATCH] Fix Github issue 70 A) Integer Underflow in
> + raptor_uri_normalize_path()
> +
> +(raptor_uri_normalize_path): Return empty buffer if path gets to 0
> +length
> +
> +CVE: CVE-2024-57823
> +Upstream: https://github.com/dajobe/raptor/commit/da7a79976bd0314c23cce55d22495e7d29301c44
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + src/raptor_rfc2396.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/src/raptor_rfc2396.c b/src/raptor_rfc2396.c
> +index 8cc364f4..f8ec5798 100644
> +--- a/src/raptor_rfc2396.c
> ++++ b/src/raptor_rfc2396.c
> +@@ -351,6 +351,10 @@ raptor_uri_normalize_path(unsigned char* path_buffer, size_t path_len)
> +           *dest++ = *s++;
> +         *dest = '\0';
> +         path_len -= len;
> ++        if(path_len <= 0) {
> ++          *path_buffer = '\0';
> ++          return 0;
> ++        }
> + 
> +         if(p && p < prev) {
> +           /* We know the previous prev path component and we didn't do
> +@@ -390,6 +394,10 @@ raptor_uri_normalize_path(unsigned char* path_buffer, size_t path_len)
> +     /* Remove <component>/.. at the end of the path */
> +     *prev = '\0';
> +     path_len -= (s-prev);
> ++    if(path_len <= 0) {
> ++      *path_buffer = '\0';
> ++      return 0;
> ++    }
> +   }
> + 
> + 
> diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
> index ec7643ce3d..1b850400f8 100644
> --- a/package/raptor/raptor.mk
> +++ b/package/raptor/raptor.mk
> @@ -14,6 +14,11 @@ RAPTOR_CPE_ID_VENDOR = librdf
>  RAPTOR_CPE_ID_PRODUCT = raptor_rdf_syntax_library
>  RAPTOR_INSTALL_STAGING = YES
>  
> +# 0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch
> +RAPTOR_IGNORE_CVES += CVE-2024-57822
> +# 0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch
> +RAPTOR_IGNORE_CVES += CVE-2024-57823
> +
>  # Flag is added to make sure the patch is applied for the configure.ac of raptor.
>  RAPTOR_AUTORECONF = YES
>  
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
