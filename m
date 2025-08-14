Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CB4CA0EE6
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FF0E80E46;
	Thu, 14 Aug 2025 20:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wLhCOGGqfmG; Thu, 14 Aug 2025 20:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B148E80E48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B148E80E48;
	Thu, 14 Aug 2025 20:32:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77610228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 697624034C
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKy-VXjBhYtm for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2B85E402F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B85E402F3
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B85E402F3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b9dc5cd4cbso1008979f8f.1
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203515; x=1755808315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XIRx1JmZJTl0WelGAY34f3vi7P1Bwst4ecPH3mTfJmU=;
 b=a8HHrJHvg0q3hqZrOf1sjsFmM+yImTvIY4VftW8UXHxHUKeE/3ksSlArBGF/R3gpkP
 Vxd1ByEUg3qTuAiKJvZDZUNI/YZfPw6qxXqUHEIteKgIu+nE0aB/n1ZusaY/zalMA4dy
 9x9ewGWnNbl+4GVX5wF/dhD6a9Q1lRmxZnhXN9Bi2tJ6GJiAhmFTARb2zbEEw41osWmM
 xnS6n6U5kTxjLT56UaKOr4ldLU8ATQhscQXfv/SFwAeHOTclZxjHeYtqiF063JXlP0Nf
 DFrIpvAHRLOekpH0ByS8RDLXJiDcgPaS38vwIoIt25Ypw3mAqvoW8s9kkeuK+jsJHmTv
 AmpQ==
X-Gm-Message-State: AOJu0Yxvm9WtHy7LvHjW/bOS4oGYPz2LnrUZDXWrkB7JmfMLY8gMogg8
 R956QHdU/8xdqvqMtW41FYhUnhTR8ZX4FF4q4dsYe61I/5n+z07xaxUYVjwmtVEJXQE5paktZgR
 KYYMPzyk=
X-Gm-Gg: ASbGncvC3jmeAgouO9oxldZ7pT67g5j4B9J8rlCVINdzq+zL/qIyl0vysZkDehuECT/
 gw6zL7zUbvWuZ1R4zGzmHnL5RGPRX8QfYSx2cH9PPw903Xm/MbN1A/0gwvW9GoIWuLJ3XfiVWM4
 W7pa1SLB7VxbhDEa+BJZ9EY6qmYhXjr0wu9XIh08rNm2E6bLx/pQuJHLFRwa+odQ798BhqYoJon
 QlblyhXUNzp6/lu/CQHVVNcQE2uWK2AqcoJg6J+fxtue3/DmcMItrBLPeifRsTIR7zPd+PIMQGS
 LJIUZsk5ultkfWw5D4UNu8AS2hZmCBoNkSX5olAqoOrjZx2OVwn3sC1mGhlqk1mau2M+83hLAI6
 7NiLiSbRSb4cWgg==
X-Google-Smtp-Source: AGHT+IFgqGr/oMDKsY/lBLOvsM6sHyiBcXi60Q2DmnUEvKVVrAKYjbDK7yGnZ14TCsyh3rkyCQUwmw==
X-Received: by 2002:a05:6000:2c0d:b0:3b9:7c00:b6a9 with SMTP id
 ffacd0b85a97d-3bb26110c1emr69630f8f.28.1755203515213; 
 Thu, 14 Aug 2025 13:31:55 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1b7ed5edsm20750125e9.3.2025.08.14.13.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:54 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:54 +0200
Message-ID: <20250814203154.2815940-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801142308.1786567-1-thomas.perale@mind.be>
References: <20250801142308.1786567-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203515; x=1755808315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XIRx1JmZJTl0WelGAY34f3vi7P1Bwst4ecPH3mTfJmU=;
 b=U33I5nCmv1mIrwdNvfrjt61oga1Pq+1XGnynB/GpeNHB9dyHv74a7kuAiOhFvQpa5a
 A8YHGDdRWotdJ29mH+07NKNovzBb2rSj+eqPQ7wmbyywxnLUyEEUFm/uNe8fm8E+ybIW
 wjViY2PxZlWIa6zM8j1sVsZtVQHPj2Vwi7iB/3WNeCX4oH8HdgnuHVFBd0gyb3ad3FFs
 tC5oGauVR1Fk/UMyr71jl+pGHzBmKbY3K4JQtHw4zYalFXFC4mU3baIeOs8z/nAOkPUa
 GE0vW3gP6E6HFwXaNyAQ5VTSva4fXq+GU1M0WbSAA28aSUfI+VBVTqMnqd243t8Bhx9N
 WM0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U33I5nCm
Subject: Re: [Buildroot] [PATCH] package/libzenoh-pico: fix build w/
 RUNTIME_DEBUG
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
> On the autobuilder the following build error would appear for the
> libzenoh-pico package when the option BR2_ENABLE_RUNTIME_DEBUG is
> enabled:
> 
> ```
> [  1%] Building C object CMakeFiles/zenohpico_shared.dir/src/api/encoding.c.o
> In function '_z_encoding_convert_into_string',
>     inlined from 'z_encoding_to_string' at /workdir/instance-0/output-1/build/libzenoh-pico-1.2.1/src/api/encoding.c:261:5:
> /workdir/instance-0/output-1/build/libzenoh-pico-1.2.1/src/api/encoding.c:203:15: error: 'strncat' output truncated before terminating nul copying 1 byte from a string of the same length [-Werror=stringop-truncation]
>   203 |         (void)strncat(value, &sep, 1);
>       |               ^~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> ```
> 
> This error can be reproduced with:
> 
> ```
> cat >.config <<EOF
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_LIBZENOH_PICO=y
> BR2_ENABLE_RUNTIME_DEBUG=y
> EOF
> make olddefconfig
> make libzenoh-pico
> ```
> 
> This patch include the upstream commit [1] that fixes this issue.
> 
> [1] https://github.com/eclipse-zenoh/zenoh-pico/commit/60e635cbb1dc6be8eda559a913d4689845f0d62e
> 
> Fixes: https://autobuild.buildroot.org/results/0c4/0c4644b17646d3ec482f0a4cf02d6fde19db2c99
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  .../0002-fix-compilation-issues.patch         | 199 ++++++++++++++++++
>  1 file changed, 199 insertions(+)
>  create mode 100644 package/libzenoh-pico/0002-fix-compilation-issues.patch
> 
> diff --git a/package/libzenoh-pico/0002-fix-compilation-issues.patch b/package/libzenoh-pico/0002-fix-compilation-issues.patch
> new file mode 100644
> index 0000000000..f9ff5bf506
> --- /dev/null
> +++ b/package/libzenoh-pico/0002-fix-compilation-issues.patch
> @@ -0,0 +1,199 @@
> +From 584e3d2cf8e879e5ad042f742a3d8656d7d98ed7 Mon Sep 17 00:00:00 2001
> +From: Jean-Roland Gosse <jean.roland.gosse@gmail.com>
> +Date: Thu, 10 Jul 2025 14:37:00 +0200
> +Subject: [PATCH] Fix compilation issues (#986)
> +
> +* fix: compilation issues
> +
> +* fix: stringop-overflow
> +
> +* doc: add comment to _z_str_append function
> +
> +Upstream: https://github.com/eclipse-zenoh/zenoh-pico/commit/60e635cbb1dc6be8eda559a913d4689845f0d62e
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + include/zenoh-pico/utils/string.h | 8 ++++++++
> + src/api/encoding.c                | 4 ++--
> + src/protocol/codec/declarations.c | 4 ++++
> + src/protocol/codec/transport.c    | 3 ++-
> + src/protocol/config.c             | 8 +++-----
> + src/session/rx.c                  | 3 +++
> + src/transport/multicast/rx.c      | 4 ++++
> + src/transport/unicast/rx.c        | 4 ++++
> + 8 files changed, 30 insertions(+), 8 deletions(-)
> +
> +diff --git a/include/zenoh-pico/utils/string.h b/include/zenoh-pico/utils/string.h
> +index e4ffd69d..2f56cb79 100644
> +--- a/include/zenoh-pico/utils/string.h
> ++++ b/include/zenoh-pico/utils/string.h
> +@@ -18,6 +18,7 @@
> + #include <stdbool.h>
> + #include <stddef.h>
> + #include <stdint.h>
> ++#include <string.h>
> + 
> + #ifdef __cplusplus
> + extern "C" {
> +@@ -63,6 +64,13 @@ size_t _z_strcnt(char const *haystack_start, const char *harstack_end, const cha
> + 
> + size_t _z_str_startswith(const char *s, const char *needle);
> + 
> ++// Must be used on a null terminated string with str[strlen(str) + 1] being valid memory.
> ++static inline void _z_str_append(char *str, const char c) {
> ++    size_t len = strlen(str);
> ++    str[len] = c;
> ++    str[len + 1] = '\0';
> ++}
> ++
> + #ifdef __cplusplus
> + }
> + #endif
> +diff --git a/src/api/encoding.c b/src/api/encoding.c
> +index b4ff4cb1..16a5b9ff 100644
> +--- a/src/api/encoding.c
> ++++ b/src/api/encoding.c
> +@@ -19,6 +19,7 @@
> + #include <string.h>
> + 
> + #include "zenoh-pico.h"
> ++#include "zenoh-pico/utils/string.h"
> + 
> + #if Z_FEATURE_ENCODING_VALUES == 1
> + #define ENCODING_SCHEMA_SEPARATOR ';'
> +@@ -196,11 +197,10 @@ static z_result_t _z_encoding_convert_into_string(const z_loaned_encoding_t *enc
> +         return _Z_ERR_SYSTEM_OUT_OF_MEMORY;
> +     }
> +     // Copy prefix
> +-    char sep = ENCODING_SCHEMA_SEPARATOR;
> +     (void)strncpy(value, prefix, prefix_len);
> +     // Copy schema and separator
> +     if (has_schema) {
> +-        (void)strncat(value, &sep, 1);
> ++        _z_str_append(value, ENCODING_SCHEMA_SEPARATOR);
> +         (void)strncat(value, _z_string_data(&encoding->schema), _z_string_len(&encoding->schema));
> +     }
> +     // Fill container
> +diff --git a/src/protocol/codec/declarations.c b/src/protocol/codec/declarations.c
> +index 905aad39..2146537e 100644
> +--- a/src/protocol/codec/declarations.c
> ++++ b/src/protocol/codec/declarations.c
> +@@ -163,6 +163,10 @@ z_result_t _z_declaration_encode(_z_wbuf_t *wbf, const _z_declaration_t *decl) {
> +         case _Z_DECL_FINAL: {
> +             ret = _z_decl_final_encode(wbf);
> +         } break;
> ++
> ++        default:
> ++            ret = _Z_ERR_MESSAGE_SERIALIZATION_FAILED;
> ++            break;
> +     }
> +     return ret;
> + }
> +diff --git a/src/protocol/codec/transport.c b/src/protocol/codec/transport.c
> +index 894fb41d..51830cd1 100644
> +--- a/src/protocol/codec/transport.c
> ++++ b/src/protocol/codec/transport.c
> +@@ -217,11 +217,12 @@ z_result_t _z_init_encode(_z_wbuf_t *wbf, uint8_t header, const _z_t_msg_init_t
> + }
> + 
> + z_result_t _z_init_decode_ext(_z_msg_ext_t *extension, void *ctx) {
> ++    _ZP_UNUSED(ctx);
> +     z_result_t ret = _Z_RES_OK;
> +-    _z_t_msg_init_t *msg = (_z_t_msg_init_t *)ctx;
> +     if (false) {
> + #if Z_FEATURE_FRAGMENTATION == 1
> +     } else if (_Z_EXT_FULL_ID(extension->_header) == _Z_MSG_EXT_ID_INIT_PATCH) {
> ++        _z_t_msg_init_t *msg = (_z_t_msg_init_t *)ctx;
> +         msg->_patch = (uint8_t)extension->_body._zint._val;
> + #endif
> +     } else if (_Z_MSG_EXT_IS_MANDATORY(extension->_header)) {
> +diff --git a/src/protocol/config.c b/src/protocol/config.c
> +index 1cfcff9c..245e7c3d 100644
> +--- a/src/protocol/config.c
> ++++ b/src/protocol/config.c
> +@@ -21,6 +21,7 @@
> + 
> + #include "zenoh-pico/collections/string.h"
> + #include "zenoh-pico/utils/pointers.h"
> ++#include "zenoh-pico/utils/string.h"
> + 
> + z_result_t _z_config_init(_z_config_t *ps) {
> +     _z_str_intmap_init(ps);
> +@@ -142,15 +143,12 @@ size_t _z_str_intmap_strlen(const _z_str_intmap_t *s, uint8_t argc, _z_str_intma
> + void _z_str_intmap_onto_str(char *dst, size_t dst_len, const _z_str_intmap_t *s, uint8_t argc,
> +                             _z_str_intmapping_t argv[]) {
> +     size_t len = dst_len;
> +-    const char lsep = INT_STR_MAP_LIST_SEPARATOR;
> +-    const char ksep = INT_STR_MAP_KEYVALUE_SEPARATOR;
> +-
> +     dst[0] = '\0';
> +     for (size_t i = 0; i < argc; i++) {
> +         char *v = _z_str_intmap_get(s, argv[i]._key);
> +         if (v != NULL) {
> +             if (len > (size_t)0) {
> +-                (void)strncat(dst, &lsep, 1);  // List separator
> ++                _z_str_append(dst, INT_STR_MAP_LIST_SEPARATOR);  // List separator
> +                 len = len - (size_t)1;
> +             }
> + 
> +@@ -159,7 +157,7 @@ void _z_str_intmap_onto_str(char *dst, size_t dst_len, const _z_str_intmap_t *s,
> +                 len = len - strlen(argv[i]._str);
> +             }
> +             if (len > (size_t)0) {
> +-                (void)strncat(dst, &ksep, 1);  // KeyValue separator
> ++                _z_str_append(dst, INT_STR_MAP_KEYVALUE_SEPARATOR);  // KeyValue separator
> +                 len = len - (size_t)1;
> +             }
> +             if (len > (size_t)0) {
> +diff --git a/src/session/rx.c b/src/session/rx.c
> +index d85f9d38..8556ce1d 100644
> +--- a/src/session/rx.c
> ++++ b/src/session/rx.c
> +@@ -93,6 +93,8 @@ static z_result_t _z_handle_declare(_z_session_t *zn, _z_n_msg_declare_t *decl,
> + 
> + static z_result_t _z_handle_request(_z_session_rc_t *zsrc, _z_session_t *zn, _z_n_msg_request_t *req,
> +                                     z_reliability_t reliability) {
> ++    _ZP_UNUSED(reliability);
> ++    _ZP_UNUSED(zsrc);
> +     switch (req->_tag) {
> +         case _Z_REQUEST_QUERY:
> + #if Z_FEATURE_QUERYABLE == 1
> +@@ -158,6 +160,7 @@ static z_result_t _z_handle_response(_z_session_t *zn, _z_n_msg_response_t *resp
> +     }
> + #else
> +     _z_n_msg_response_clear(resp);
> ++    _ZP_UNUSED(zn);
> + #endif
> +     return _Z_RES_OK;
> + }
> +diff --git a/src/transport/multicast/rx.c b/src/transport/multicast/rx.c
> +index 121406d0..47269b1a 100644
> +--- a/src/transport/multicast/rx.c
> ++++ b/src/transport/multicast/rx.c
> +@@ -294,6 +294,10 @@ static z_result_t _z_multicast_handle_fragment_inner(_z_transport_multicast_t *z
> +         *dbuf_state = _Z_DBUF_STATE_NULL;
> +     }
> + #else
> ++    _ZP_UNUSED(ztm);
> ++    _ZP_UNUSED(header);
> ++    _ZP_UNUSED(msg);
> ++    _ZP_UNUSED(entry);
> +     _Z_INFO("Fragment dropped because fragmentation feature is deactivated");
> + #endif
> +     return ret;
> +diff --git a/src/transport/unicast/rx.c b/src/transport/unicast/rx.c
> +index c5ccf932..43e1b4c8 100644
> +--- a/src/transport/unicast/rx.c
> ++++ b/src/transport/unicast/rx.c
> +@@ -248,6 +248,10 @@ static z_result_t _z_unicast_handle_fragment_inner(_z_transport_unicast_t *ztu,
> +         *dbuf_state = _Z_DBUF_STATE_NULL;
> +     }
> + #else
> ++    _ZP_UNUSED(ztu);
> ++    _ZP_UNUSED(header);
> ++    _ZP_UNUSED(msg);
> ++    _ZP_UNUSED(peer);
> +     _Z_INFO("Fragment dropped because fragmentation feature is deactivated");
> + #endif
> +     return ret;
> +-- 
> +2.50.1
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
