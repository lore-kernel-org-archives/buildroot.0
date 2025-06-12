Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0460CC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE80140753;
	Thu, 12 Jun 2025 20:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRF3ZzUVXkD7; Thu, 12 Jun 2025 20:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D4F140784
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D4F140784;
	Thu, 12 Jun 2025 20:32:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 379931E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D9AC60E0E
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHYtqhcEexn1 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:32:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1E1760E0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1E1760E0D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1E1760E0D
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:31:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E4EB91C0F87; Thu, 12 Jun 2025 22:31:57 +0200 (CEST)
Message-ID: <d5688141-6862-4a26-9373-1d7130688a5c@rnout.be>
Date: Thu, 12 Jun 2025 22:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20250612200713.404005-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250612200713.404005-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749760318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gBUbLIosjHBMvsCCaXFT0QurwF5RChuKOOLVaXDWLPg=;
 b=fT8SOpnLrzT7oGxvlm7283bV5rOOHuS9mS8uH0+agE6Otw36DPm42xJ9pFYmBjB37fcOVm
 vSt2dAqNwnLMINRGMgNwbXnLe/csqtxRHQ9dTv2yYBjRn1DdiUN5ZAqJxBgpl0suCfW7Gp
 UkKpcNivH7W2/QDFfBFh2Ujy4dv5+6IzPLSjFyQieGOo75OZ6h3qnyjorpGsDOIcsemdlb
 8fzjUSx6mToXo9jbWY6taE2Z8CYfAwcHtxPxFz4ajJCX3ppiK6jRN5ptOQeDcpJNCdBz4m
 0v5dNyncW5uuW62qC6ycBgiDlBa7bJdcA5v1ImLjkQ2oorp0ZGX8IxolDSGGMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fT8SOpnL
Subject: Re: [Buildroot] [PATCH 1/1] package/jq: security patch for
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/06/2025 22:07, Thomas Perale via buildroot wrote:
> Those security patches have been fetched from the debian patches for
> this package version [1].
> 
> Fixes the following CVEs:
> 
> - CVE-2024-23337: an integer overflow arises when assigning value using
>    an index of 2147483647, the signed integer limit. This causes a denial
>    of service.
> 
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2024-23337
>    - https://github.com/jqlang/jq/commit/de21386681c0df0104a99d9d09db23a9b2a78b1e
> 
> - CVE-2024-53427: decNumberCopy in decNumber.c does not properly
>    consider that NaN is interpreted as numeric, which has a resultant
>    stack-based buffer overflow and out-of-bounds write, as demonstrated
>    by use of --slurp with subtraction, such as a filter of .-. when the
>    input has a certain form of digit string with NaN (e.g., "1 NaN123"
>    immediately followed by many more digits).
> 
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2024-53427
>    - https://github.com/jqlang/jq/commit/a09a4dfd55e6c24d04b35062ccfe4509748b1dd3
> 
> [1] https://udd.debian.org/patches.cgi?src=jq&version=1.7.1-6
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  The bump to 1.8.0 also included the following:

     - CVE-2025-48060: Fix heap buffer overflow in jv_string_vfmt.
     - Fix use of uninitialized value in check_literal.
     - Fix segmentation fault on strftime/1, strflocaltime/1.
     - Fix unhandled overflow in @base64d.

  What about those?

  Regards,
  Arnout

> ---
>   package/jq/0001-CVE-2024-23337.patch | 212 +++++++++++++++++++++++++++
>   package/jq/0002-CVE-2024-53427.patch |  28 ++++
>   package/jq/jq.mk                     |   6 +
>   3 files changed, 246 insertions(+)
>   create mode 100644 package/jq/0001-CVE-2024-23337.patch
>   create mode 100644 package/jq/0002-CVE-2024-53427.patch
> 
> diff --git a/package/jq/0001-CVE-2024-23337.patch b/package/jq/0001-CVE-2024-23337.patch
> new file mode 100644
> index 0000000000..805eac344c
> --- /dev/null
> +++ b/package/jq/0001-CVE-2024-23337.patch
> @@ -0,0 +1,212 @@
> +From: =?utf-8?b?IkNoYW5nWmh1byBDaGVuICjpmbPmmIzlgKwpIg==?=
> + <czchen@debian.org>
> +Date: Sun, 25 May 2025 03:08:51 +0800
> +Subject: Fix signed integer overflow in jvp_array_write and jvp_object_rehash
> +
> +CVE: CVE-2024-23337
> +Upstream: https://sources.debian.org/src/jq/1.7.1-6/debian/patches/CVE-2024-23337.patch/
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +
> +---
> + src/jv.c      | 45 ++++++++++++++++++++++++++++++++++++---------
> + src/jv_aux.c  |  9 +++++----
> + tests/jq.test |  4 ++++
> + 3 files changed, 45 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/jv.c b/src/jv.c
> +index 7f798d8..a8fbe48 100644
> +--- a/src/jv.c
> ++++ b/src/jv.c
> +@@ -997,6 +997,11 @@ jv jv_array_set(jv j, int idx, jv val) {
> +     jv_free(val);
> +     return jv_invalid_with_msg(jv_string("Out of bounds negative array index"));
> +   }
> ++  if (idx > (INT_MAX >> 2) - jvp_array_offset(j)) {
> ++    jv_free(j);
> ++    jv_free(val);
> ++    return jv_invalid_with_msg(jv_string("Array index too large"));
> ++  }
> +   // copy/free of val,j coalesced
> +   jv* slot = jvp_array_write(&j, idx);
> +   jv_free(*slot);
> +@@ -1016,6 +1021,7 @@ jv jv_array_concat(jv a, jv b) {
> +   // FIXME: could be faster
> +   jv_array_foreach(b, i, elem) {
> +     a = jv_array_append(a, elem);
> ++    if (!jv_is_valid(a)) break;
> +   }
> +   jv_free(b);
> +   return a;
> +@@ -1288,6 +1294,7 @@ jv jv_string_indexes(jv j, jv k) {
> +     p = jstr;
> +     while ((p = _jq_memmem(p, (jstr + jlen) - p, idxstr, idxlen)) != NULL) {
> +       a = jv_array_append(a, jv_number(p - jstr));
> ++      if (!jv_is_valid(a)) break;
> +       p++;
> +     }
> +   }
> +@@ -1310,14 +1317,17 @@ jv jv_string_split(jv j, jv sep) {
> +
> +   if (seplen == 0) {
> +     int c;
> +-    while ((jstr = jvp_utf8_next(jstr, jend, &c)))
> ++    while ((jstr = jvp_utf8_next(jstr, jend, &c))) {
> +       a = jv_array_append(a, jv_string_append_codepoint(jv_string(""), c));
> ++      if (!jv_is_valid(a)) break;
> ++    }
> +   } else {
> +     for (p = jstr; p < jend; p = s + seplen) {
> +       s = _jq_memmem(p, jend - p, sepstr, seplen);
> +       if (s == NULL)
> +         s = jend;
> +       a = jv_array_append(a, jv_string_sized(p, s - p));
> ++      if (!jv_is_valid(a)) break;
> +       // Add an empty string to denote that j ends on a sep
> +       if (s + seplen == jend && seplen != 0)
> +         a = jv_array_append(a, jv_string(""));
> +@@ -1335,8 +1345,10 @@ jv jv_string_explode(jv j) {
> +   const char* end = i + len;
> +   jv a = jv_array_sized(len);
> +   int c;
> +-  while ((i = jvp_utf8_next(i, end, &c)))
> ++  while ((i = jvp_utf8_next(i, end, &c))) {
> +     a = jv_array_append(a, jv_number(c));
> ++    if (!jv_is_valid(a)) break;
> ++  }
> +   jv_free(j);
> +   return a;
> + }
> +@@ -1610,10 +1622,13 @@ static void jvp_object_free(jv o) {
> +   }
> + }
> +
> +-static jv jvp_object_rehash(jv object) {
> ++static int jvp_object_rehash(jv *objectp) {
> ++  jv object = *objectp;
> +   assert(JVP_HAS_KIND(object, JV_KIND_OBJECT));
> +   assert(jvp_refcnt_unshared(object.u.ptr));
> +   int size = jvp_object_size(object);
> ++  if (size > INT_MAX >> 2)
> ++    return 0;
> +   jv new_object = jvp_object_new(size * 2);
> +   for (int i=0; i<size; i++) {
> +     struct object_slot* slot = jvp_object_get_slot(object, i);
> +@@ -1626,7 +1641,8 @@ static jv jvp_object_rehash(jv object) {
> +   }
> +   // references are transported, just drop the old table
> +   jv_mem_free(jvp_object_ptr(object));
> +-  return new_object;
> ++  *objectp = new_object;
> ++  return 1;
> + }
> +
> + static jv jvp_object_unshare(jv object) {
> +@@ -1655,27 +1671,32 @@ static jv jvp_object_unshare(jv object) {
> +   return new_object;
> + }
> +
> +-static jv* jvp_object_write(jv* object, jv key) {
> ++static int jvp_object_write(jv* object, jv key, jv **valpp) {
> +   *object = jvp_object_unshare(*object);
> +   int* bucket = jvp_object_find_bucket(*object, key);
> +   struct object_slot* slot = jvp_object_find_slot(*object, key, bucket);
> +   if (slot) {
> +     // already has the key
> +     jvp_string_free(key);
> +-    return &slot->value;
> ++    *valpp = &slot->value;
> ++    return 1;
> +   }
> +   slot = jvp_object_add_slot(*object, key, bucket);
> +   if (slot) {
> +     slot->value = jv_invalid();
> +   } else {
> +-    *object = jvp_object_rehash(*object);
> ++    if (!jvp_object_rehash(object)) {
> ++      *valpp = NULL;
> ++      return 0;
> ++    }
> +     bucket = jvp_object_find_bucket(*object, key);
> +     assert(!jvp_object_find_slot(*object, key, bucket));
> +     slot = jvp_object_add_slot(*object, key, bucket);
> +     assert(slot);
> +     slot->value = jv_invalid();
> +   }
> +-  return &slot->value;
> ++  *valpp = &slot->value;
> ++  return 1;
> + }
> +
> + static int jvp_object_delete(jv* object, jv key) {
> +@@ -1775,7 +1796,11 @@ jv jv_object_set(jv object, jv key, jv value) {
> +   assert(JVP_HAS_KIND(object, JV_KIND_OBJECT));
> +   assert(JVP_HAS_KIND(key, JV_KIND_STRING));
> +   // copy/free of object, key, value coalesced
> +-  jv* slot = jvp_object_write(&object, key);
> ++  jv* slot;
> ++  if (!jvp_object_write(&object, key, &slot)) {
> ++    jv_free(object);
> ++    return jv_invalid_with_msg(jv_string("Object too big"));
> ++  }
> +   jv_free(*slot);
> +   *slot = value;
> +   return object;
> +@@ -1800,6 +1825,7 @@ jv jv_object_merge(jv a, jv b) {
> +   assert(JVP_HAS_KIND(a, JV_KIND_OBJECT));
> +   jv_object_foreach(b, k, v) {
> +     a = jv_object_set(a, k, v);
> ++    if (!jv_is_valid(a)) break;
> +   }
> +   jv_free(b);
> +   return a;
> +@@ -1819,6 +1845,7 @@ jv jv_object_merge_recursive(jv a, jv b) {
> +       jv_free(elem);
> +       a = jv_object_set(a, k, v);
> +     }
> ++    if (!jv_is_valid(a)) break;
> +   }
> +   jv_free(b);
> +   return a;
> +diff --git a/src/jv_aux.c b/src/jv_aux.c
> +index 6004799..bbe1c0d 100644
> +--- a/src/jv_aux.c
> ++++ b/src/jv_aux.c
> +@@ -193,18 +193,19 @@ jv jv_set(jv t, jv k, jv v) {
> +         if (slice_len < insert_len) {
> +           // array is growing
> +           int shift = insert_len - slice_len;
> +-          for (int i = array_len - 1; i >= end; i--) {
> ++          for (int i = array_len - 1; i >= end && jv_is_valid(t); i--) {
> +             t = jv_array_set(t, i + shift, jv_array_get(jv_copy(t), i));
> +           }
> +         } else if (slice_len > insert_len) {
> +           // array is shrinking
> +           int shift = slice_len - insert_len;
> +-          for (int i = end; i < array_len; i++) {
> ++          for (int i = end; i < array_len && jv_is_valid(t); i++) {
> +             t = jv_array_set(t, i - shift, jv_array_get(jv_copy(t), i));
> +           }
> +-          t = jv_array_slice(t, 0, array_len - shift);
> ++          if (jv_is_valid(t))
> ++            t = jv_array_slice(t, 0, array_len - shift);
> +         }
> +-        for (int i=0; i < insert_len; i++) {
> ++        for (int i = 0; i < insert_len && jv_is_valid(t); i++) {
> +           t = jv_array_set(t, start + i, jv_array_get(jv_copy(v), i));
> +         }
> +         jv_free(v);
> +diff --git a/tests/jq.test b/tests/jq.test
> +index 7036df2..944f9da 100644
> +--- a/tests/jq.test
> ++++ b/tests/jq.test
> +@@ -198,6 +198,10 @@ null
> + [0,1,2]
> + [0,5,2]
> +
> ++try (.[999999999] = 0) catch .
> ++null
> ++"Array index too large"
> ++
> + #
> + # Multiple outputs, iteration
> + #
> diff --git a/package/jq/0002-CVE-2024-53427.patch b/package/jq/0002-CVE-2024-53427.patch
> new file mode 100644
> index 0000000000..a8e8512ad1
> --- /dev/null
> +++ b/package/jq/0002-CVE-2024-53427.patch
> @@ -0,0 +1,28 @@
> +From: =?utf-8?b?IkNoYW5nWmh1byBDaGVuICjpmbPmmIzlgKwpIg==?=
> + <czchen@debian.org>
> +Date: Sat, 12 Apr 2025 15:58:51 +0800
> +Subject: Reject NaN with payload while parsing JSON
> +
> +CVE: CVE-2024-53427
> +Upstream: https://sources.debian.org/src/jq/1.7.1-6/debian/patches/CVE-2024-53427.patch/
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/jv.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/jv.c b/src/jv.c
> +index e23d8ec..7f798d8 100644
> +--- a/src/jv.c
> ++++ b/src/jv.c
> +@@ -586,6 +586,11 @@ static jv jvp_literal_number_new(const char * literal) {
> +   n->num_double = NAN;
> +
> +   if (ctx->status & DEC_Conversion_syntax) {
> ++    // Reject NaN with payload.
> ++    if (n->num_decimal.digits > 1 || *n->num_decimal.lsu != 0) {
> ++      jv_mem_free(n);
> ++      return JV_INVALID;
> ++    }
> +     jv_mem_free(n);
> +     return JV_INVALID;
> +   }
> diff --git a/package/jq/jq.mk b/package/jq/jq.mk
> index ba27e22f7f..dbd69f0b16 100644
> --- a/package/jq/jq.mk
> +++ b/package/jq/jq.mk
> @@ -11,6 +11,12 @@ JQ_LICENSE_FILES = COPYING
>   JQ_CPE_ID_VALID = YES
>   JQ_INSTALL_STAGING = YES
>   
> +# 0001-CVE-2024-23337.patch
> +JQ_IGNORE_CVES += CVE-2024-23337
> +
> +# 0002-CVE-2024-53427.patch
> +JQ_IGNORE_CVES += CVE-2024-53427
> +
>   # uses c99 specific features
>   JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
>   HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
