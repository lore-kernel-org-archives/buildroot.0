Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC50C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 829BB80C95;
	Thu, 12 Jun 2025 20:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8U61cRne89u; Thu, 12 Jun 2025 20:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2943580C5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2943580C5E;
	Thu, 12 Jun 2025 20:07:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69D2C183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BBB080C4A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFb4p9Abb2Qa for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 995AB80BFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 995AB80BFA
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 995AB80BFA
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:07:48 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-450cf214200so12089335e9.1
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 13:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749758866; x=1750363666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DAFGTkKY2NC5faxN6Q3c6oq1Swq46hvomdyUc2YAT8I=;
 b=V+9HPmXt4vAxMKq+Hg2D0ZVmixY07MgNlWKwQlROGQ/pT5P9KtK4yErMRlcs4u6T1v
 DS9IjHRyRT8MZ1Qy3pirKtgD3G+Gaqu14VnZG3z8P+QQ0+5iPrqj4BiUaH/fgQIAaW3h
 IFmQzvw4LhAjl6dMWTynZi3EKuyrmNS4AWMUevpInadhDPXxsduK0n471NsPsZ4SiPOj
 klGE++2oJcjrPZ1uex08oO4tnbVUKNpYwLRaakA73nfXZg/4uMJPO0R7RrTCES5y6TCf
 ivDGhycA5cjS4lDE5cwfeSL1cczHlO5AYF2gnK2Gg+0OX7P76PepSTdtisyurTzOaD92
 RFTA==
X-Gm-Message-State: AOJu0Yzoh1fb/72suFBWdEDV8IAqf61jI1zBsgYq3AXeQ09zfbe3soB7
 1eo+mpKHVkCs+Vt0iAwmkw2DCQUa5MsC8lDMAANGe0FfAi7jbHLlypqXpN0q7+f9nZV2Wv8AiDn
 Jt4d1
X-Gm-Gg: ASbGncswgwaznT949L+OXDKUt0O0Vm/2jmlf6k5pERKREdJ+tTRekgPUSdKVfjTI13W
 gUzWPz/O1OjX5GUexZCf+oh+Ge/HsOktrfq7nvCrh3vQWY7JkpF3YCfOlmCRppYbNjtU92y6L73
 kRzPFy9X6QaqEzaEHCLkeVYs/WmzYvq2X868hENkYaJJU1MiaLft8iJz+OhvMiu8jyKO3/J4Cu+
 bqkIQ126WcMn9DXKdKKoJxdrGViPWCqs8CH52o9xkl4wtCozFfz/WKK/b+greUP1IT3TZ7Cup3S
 LEeVpqacy8BWz60jyBUaI51+NRz6wy3FgK161Tzel9RtdtGSH5XslkoH0s7ALxYJgPsAY+z7jd/
 H
X-Google-Smtp-Source: AGHT+IGtla5A9Z+vs0dDet+8vFvZCfeUR1282Z1Rp3a4dFZsggcVZQOhRo5+i5wrTJFoq+gnoe9sDA==
X-Received: by 2002:a05:600c:3b86:b0:450:d3c6:84d8 with SMTP id
 5b1f17b1804b1-45334ae2763mr4021415e9.14.1749758865981; 
 Thu, 12 Jun 2025 13:07:45 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b4e4f1sm233708f8f.87.2025.06.12.13.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 13:07:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 22:07:13 +0200
Message-ID: <20250612200713.404005-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1749758866; x=1750363666; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DAFGTkKY2NC5faxN6Q3c6oq1Swq46hvomdyUc2YAT8I=;
 b=iEvWqJnBKyVlkyX8c+ZhnZjq7LnX593XmSB+IHtbpKxuv5VKXZbrlo2okihwPiSRcD
 GiBBXdGyaxOm8hTW3ABAp6HdNUyeG3J9jecGsRcgsTi3uWlUFU/Jo3fva7kazeczveuH
 UnLiRyLky+WjQPSgFOXgSsBSWhMURUZvBmcj3wq1o0JboIBLPr2jlTBlmz89jFeOvfq8
 GxH0T3R/Kjiee3VDjsoNlPBLK0MLPvgOcRy3VTp5Ee2yUtYiqvP0Znkyrp2aVP/9xnMy
 YyZBjX1RWLDlP8MzPonlgPFeLgw+KYs1vZNmgSkkRz1fz0XjL6c3yIBfaD7ufgV7EXqv
 ngJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=iEvWqJnB
Subject: [Buildroot] [PATCH 1/1] package/jq: security patch for
 CVE-2024-{23337, 53427}
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Those security patches have been fetched from the debian patches for
this package version [1].

Fixes the following CVEs:

- CVE-2024-23337: an integer overflow arises when assigning value using
  an index of 2147483647, the signed integer limit. This causes a denial
  of service.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2024-23337
  - https://github.com/jqlang/jq/commit/de21386681c0df0104a99d9d09db23a9b2a78b1e

- CVE-2024-53427: decNumberCopy in decNumber.c does not properly
  consider that NaN is interpreted as numeric, which has a resultant
  stack-based buffer overflow and out-of-bounds write, as demonstrated
  by use of --slurp with subtraction, such as a filter of .-. when the
  input has a certain form of digit string with NaN (e.g., "1 NaN123"
  immediately followed by many more digits).

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2024-53427
  - https://github.com/jqlang/jq/commit/a09a4dfd55e6c24d04b35062ccfe4509748b1dd3

[1] https://udd.debian.org/patches.cgi?src=jq&version=1.7.1-6

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jq/0001-CVE-2024-23337.patch | 212 +++++++++++++++++++++++++++
 package/jq/0002-CVE-2024-53427.patch |  28 ++++
 package/jq/jq.mk                     |   6 +
 3 files changed, 246 insertions(+)
 create mode 100644 package/jq/0001-CVE-2024-23337.patch
 create mode 100644 package/jq/0002-CVE-2024-53427.patch

diff --git a/package/jq/0001-CVE-2024-23337.patch b/package/jq/0001-CVE-2024-23337.patch
new file mode 100644
index 0000000000..805eac344c
--- /dev/null
+++ b/package/jq/0001-CVE-2024-23337.patch
@@ -0,0 +1,212 @@
+From: =?utf-8?b?IkNoYW5nWmh1byBDaGVuICjpmbPmmIzlgKwpIg==?=
+ <czchen@debian.org>
+Date: Sun, 25 May 2025 03:08:51 +0800
+Subject: Fix signed integer overflow in jvp_array_write and jvp_object_rehash
+
+CVE: CVE-2024-23337
+Upstream: https://sources.debian.org/src/jq/1.7.1-6/debian/patches/CVE-2024-23337.patch/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+---
+ src/jv.c      | 45 ++++++++++++++++++++++++++++++++++++---------
+ src/jv_aux.c  |  9 +++++----
+ tests/jq.test |  4 ++++
+ 3 files changed, 45 insertions(+), 13 deletions(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index 7f798d8..a8fbe48 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -997,6 +997,11 @@ jv jv_array_set(jv j, int idx, jv val) {
+     jv_free(val);
+     return jv_invalid_with_msg(jv_string("Out of bounds negative array index"));
+   }
++  if (idx > (INT_MAX >> 2) - jvp_array_offset(j)) {
++    jv_free(j);
++    jv_free(val);
++    return jv_invalid_with_msg(jv_string("Array index too large"));
++  }
+   // copy/free of val,j coalesced
+   jv* slot = jvp_array_write(&j, idx);
+   jv_free(*slot);
+@@ -1016,6 +1021,7 @@ jv jv_array_concat(jv a, jv b) {
+   // FIXME: could be faster
+   jv_array_foreach(b, i, elem) {
+     a = jv_array_append(a, elem);
++    if (!jv_is_valid(a)) break;
+   }
+   jv_free(b);
+   return a;
+@@ -1288,6 +1294,7 @@ jv jv_string_indexes(jv j, jv k) {
+     p = jstr;
+     while ((p = _jq_memmem(p, (jstr + jlen) - p, idxstr, idxlen)) != NULL) {
+       a = jv_array_append(a, jv_number(p - jstr));
++      if (!jv_is_valid(a)) break;
+       p++;
+     }
+   }
+@@ -1310,14 +1317,17 @@ jv jv_string_split(jv j, jv sep) {
+ 
+   if (seplen == 0) {
+     int c;
+-    while ((jstr = jvp_utf8_next(jstr, jend, &c)))
++    while ((jstr = jvp_utf8_next(jstr, jend, &c))) {
+       a = jv_array_append(a, jv_string_append_codepoint(jv_string(""), c));
++      if (!jv_is_valid(a)) break;
++    }
+   } else {
+     for (p = jstr; p < jend; p = s + seplen) {
+       s = _jq_memmem(p, jend - p, sepstr, seplen);
+       if (s == NULL)
+         s = jend;
+       a = jv_array_append(a, jv_string_sized(p, s - p));
++      if (!jv_is_valid(a)) break;
+       // Add an empty string to denote that j ends on a sep
+       if (s + seplen == jend && seplen != 0)
+         a = jv_array_append(a, jv_string(""));
+@@ -1335,8 +1345,10 @@ jv jv_string_explode(jv j) {
+   const char* end = i + len;
+   jv a = jv_array_sized(len);
+   int c;
+-  while ((i = jvp_utf8_next(i, end, &c)))
++  while ((i = jvp_utf8_next(i, end, &c))) {
+     a = jv_array_append(a, jv_number(c));
++    if (!jv_is_valid(a)) break;
++  }
+   jv_free(j);
+   return a;
+ }
+@@ -1610,10 +1622,13 @@ static void jvp_object_free(jv o) {
+   }
+ }
+ 
+-static jv jvp_object_rehash(jv object) {
++static int jvp_object_rehash(jv *objectp) {
++  jv object = *objectp;
+   assert(JVP_HAS_KIND(object, JV_KIND_OBJECT));
+   assert(jvp_refcnt_unshared(object.u.ptr));
+   int size = jvp_object_size(object);
++  if (size > INT_MAX >> 2)
++    return 0;
+   jv new_object = jvp_object_new(size * 2);
+   for (int i=0; i<size; i++) {
+     struct object_slot* slot = jvp_object_get_slot(object, i);
+@@ -1626,7 +1641,8 @@ static jv jvp_object_rehash(jv object) {
+   }
+   // references are transported, just drop the old table
+   jv_mem_free(jvp_object_ptr(object));
+-  return new_object;
++  *objectp = new_object;
++  return 1;
+ }
+ 
+ static jv jvp_object_unshare(jv object) {
+@@ -1655,27 +1671,32 @@ static jv jvp_object_unshare(jv object) {
+   return new_object;
+ }
+ 
+-static jv* jvp_object_write(jv* object, jv key) {
++static int jvp_object_write(jv* object, jv key, jv **valpp) {
+   *object = jvp_object_unshare(*object);
+   int* bucket = jvp_object_find_bucket(*object, key);
+   struct object_slot* slot = jvp_object_find_slot(*object, key, bucket);
+   if (slot) {
+     // already has the key
+     jvp_string_free(key);
+-    return &slot->value;
++    *valpp = &slot->value;
++    return 1;
+   }
+   slot = jvp_object_add_slot(*object, key, bucket);
+   if (slot) {
+     slot->value = jv_invalid();
+   } else {
+-    *object = jvp_object_rehash(*object);
++    if (!jvp_object_rehash(object)) {
++      *valpp = NULL;
++      return 0;
++    }
+     bucket = jvp_object_find_bucket(*object, key);
+     assert(!jvp_object_find_slot(*object, key, bucket));
+     slot = jvp_object_add_slot(*object, key, bucket);
+     assert(slot);
+     slot->value = jv_invalid();
+   }
+-  return &slot->value;
++  *valpp = &slot->value;
++  return 1;
+ }
+ 
+ static int jvp_object_delete(jv* object, jv key) {
+@@ -1775,7 +1796,11 @@ jv jv_object_set(jv object, jv key, jv value) {
+   assert(JVP_HAS_KIND(object, JV_KIND_OBJECT));
+   assert(JVP_HAS_KIND(key, JV_KIND_STRING));
+   // copy/free of object, key, value coalesced
+-  jv* slot = jvp_object_write(&object, key);
++  jv* slot;
++  if (!jvp_object_write(&object, key, &slot)) {
++    jv_free(object);
++    return jv_invalid_with_msg(jv_string("Object too big"));
++  }
+   jv_free(*slot);
+   *slot = value;
+   return object;
+@@ -1800,6 +1825,7 @@ jv jv_object_merge(jv a, jv b) {
+   assert(JVP_HAS_KIND(a, JV_KIND_OBJECT));
+   jv_object_foreach(b, k, v) {
+     a = jv_object_set(a, k, v);
++    if (!jv_is_valid(a)) break;
+   }
+   jv_free(b);
+   return a;
+@@ -1819,6 +1845,7 @@ jv jv_object_merge_recursive(jv a, jv b) {
+       jv_free(elem);
+       a = jv_object_set(a, k, v);
+     }
++    if (!jv_is_valid(a)) break;
+   }
+   jv_free(b);
+   return a;
+diff --git a/src/jv_aux.c b/src/jv_aux.c
+index 6004799..bbe1c0d 100644
+--- a/src/jv_aux.c
++++ b/src/jv_aux.c
+@@ -193,18 +193,19 @@ jv jv_set(jv t, jv k, jv v) {
+         if (slice_len < insert_len) {
+           // array is growing
+           int shift = insert_len - slice_len;
+-          for (int i = array_len - 1; i >= end; i--) {
++          for (int i = array_len - 1; i >= end && jv_is_valid(t); i--) {
+             t = jv_array_set(t, i + shift, jv_array_get(jv_copy(t), i));
+           }
+         } else if (slice_len > insert_len) {
+           // array is shrinking
+           int shift = slice_len - insert_len;
+-          for (int i = end; i < array_len; i++) {
++          for (int i = end; i < array_len && jv_is_valid(t); i++) {
+             t = jv_array_set(t, i - shift, jv_array_get(jv_copy(t), i));
+           }
+-          t = jv_array_slice(t, 0, array_len - shift);
++          if (jv_is_valid(t))
++            t = jv_array_slice(t, 0, array_len - shift);
+         }
+-        for (int i=0; i < insert_len; i++) {
++        for (int i = 0; i < insert_len && jv_is_valid(t); i++) {
+           t = jv_array_set(t, start + i, jv_array_get(jv_copy(v), i));
+         }
+         jv_free(v);
+diff --git a/tests/jq.test b/tests/jq.test
+index 7036df2..944f9da 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -198,6 +198,10 @@ null
+ [0,1,2]
+ [0,5,2]
+ 
++try (.[999999999] = 0) catch .
++null
++"Array index too large"
++
+ #
+ # Multiple outputs, iteration
+ #
diff --git a/package/jq/0002-CVE-2024-53427.patch b/package/jq/0002-CVE-2024-53427.patch
new file mode 100644
index 0000000000..a8e8512ad1
--- /dev/null
+++ b/package/jq/0002-CVE-2024-53427.patch
@@ -0,0 +1,28 @@
+From: =?utf-8?b?IkNoYW5nWmh1byBDaGVuICjpmbPmmIzlgKwpIg==?=
+ <czchen@debian.org>
+Date: Sat, 12 Apr 2025 15:58:51 +0800
+Subject: Reject NaN with payload while parsing JSON
+
+CVE: CVE-2024-53427
+Upstream: https://sources.debian.org/src/jq/1.7.1-6/debian/patches/CVE-2024-53427.patch/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/jv.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/jv.c b/src/jv.c
+index e23d8ec..7f798d8 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -586,6 +586,11 @@ static jv jvp_literal_number_new(const char * literal) {
+   n->num_double = NAN;
+ 
+   if (ctx->status & DEC_Conversion_syntax) {
++    // Reject NaN with payload.
++    if (n->num_decimal.digits > 1 || *n->num_decimal.lsu != 0) {
++      jv_mem_free(n);
++      return JV_INVALID;
++    }
+     jv_mem_free(n);
+     return JV_INVALID;
+   }
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index ba27e22f7f..dbd69f0b16 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -11,6 +11,12 @@ JQ_LICENSE_FILES = COPYING
 JQ_CPE_ID_VALID = YES
 JQ_INSTALL_STAGING = YES
 
+# 0001-CVE-2024-23337.patch
+JQ_IGNORE_CVES += CVE-2024-23337
+
+# 0002-CVE-2024-53427.patch
+JQ_IGNORE_CVES += CVE-2024-53427
+
 # uses c99 specific features
 JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99"
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
