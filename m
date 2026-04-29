Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11751FF8867
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 14:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5E556158D;
	Wed, 29 Apr 2026 14:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V7SvY8efhNmZ; Wed, 29 Apr 2026 14:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9821A60FB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777472100;
	bh=pmasoNNS7WvpZdlcd/qnc8LN/DCGnH2lRbmEz4r9fP4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AtInnc3x09Q0DD6q5vQpmozTSEvsu4PANqQIxClDt1+eZYOtrJrRd2jkQWEPMI8+e
	 zunQKCoVt1g/P1HNxiczuL3dBdqnjFnt4qc7ZU1pH3LuGgHLAcqIQFYWme3GWf/GDI
	 TIRmKJ/YFSUHFRQEdpwMvpWFiA3hjFZtpWsPObla/5eSyVQiLtmQbggRPqufnnAAB3
	 GgM2UjesTtwVeiJx8ZNS9UfeEce2cMmy18TP25dF+tCKHvSqm4UKj146zR3ibX5wEk
	 xkUcALly8Zxa/ab8ALXVXTyZDx6cZhhJX6a1Ox/ugfnlIQYlVTl/weWgRTQBlIj230
	 x08X+BMfX7JSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9821A60FB2;
	Wed, 29 Apr 2026 14:15:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34C8223D
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 14:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2624381416
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 14:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMtroKaeTfb4 for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 14:14:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFA308120D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFA308120D
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFA308120D
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 14:14:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so6059975e9.1
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 07:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777472093; x=1778076893;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fTsu0SSTQskFh7ruVWS0jesOcgTzM7bwVjaJtaMIPM4=;
 b=RHg+RF4LTl8PCc0x9CCvpB9OlyBtf04qjV8ZB7vhbNCVi0+ZclBqPbmTgGP6jRVFRo
 R4MSZjfP/zI6Y+g5MJaG0LYlu8TkWvbPuEEE2RGJcP0J2IW0y3t3JFlXbvQsWD0UMNqo
 7b8ZpuNR9oeW4eF7pWVQzl0B6Jr9r2IjoT5GXeffa/B+FcRmJfPFIMaqD2p36U//jbGf
 ZoQM6D51NPlqJvAPNLRz4PUQo7P9Uj45o6PZSm33/BU+UkbvnvzbhwfkdnUfXWjSpb4K
 Ds2wsFjIJiTRPZg0GQ2XN+kak+YMr6FnpUr5vkfvwwNWl6FVU1NCIVjm2HoeROD6ioJu
 7NsA==
X-Gm-Message-State: AOJu0YylfC1E2TamkdY1uKW8ANNNN0XOcEEqfC/qfjmlYTYEgAJtNOAc
 gVgV7s4GBYSm4ZCMs052pvR3RnQS3kMMEZmDDtyrkYu2z2Z1nNOpNVSGMJxckKVWJoCbh1AU+gW
 e5uJsRcs=
X-Gm-Gg: AeBDievTH1BNrHEuzh/W46XSMUgpQAgDTIYofrT789BH5nBbYazm0lRcDDMaHiTW7fz
 jKDFoKyeOlx4LqJGZGby2piUSyJp9xrGnx40MNVxbpwgHXQbdzuZ48MewT8bam6wYTH9YzWxWVO
 0Qqy82LT7468Q6H/VmtXQDtLiQW5QXqbmbaNSACXuEllc7ubgKU+esrJkSRjqy7T8Pon1bAgeyr
 s4QOH5T8TaUWkf3H5+usCTAdKjLtYaJbhBmYoNDUMbJiyEhucOfIVGUaQ401Id17bLoxOkEldtZ
 BZ0nzb1GKuHWLuhC7PQPp1XgqCZ6Sjnuhtywl+Jw192WkNQnMFKUy1wIqJo1NQEbZ+KJ0HeFJje
 21vac0trqTVhWHLk7Ty1/sv2qXOA53mR6vj8Km7tD+bLNMWknDfhONsnMORhseVpNJGzuAZ76Ko
 Ttsiv984Snhd90wU2tImuLtkwJOm/R/d9hIxTstT+MbMRE8T4wWBNpk22TBktF0vfvQTQu5T9Ry
 PQO
X-Received: by 2002:a05:600c:3e86:b0:48a:53cb:8604 with SMTP id
 5b1f17b1804b1-48a7c1bcc18mr59495775e9.14.1777472093297; 
 Wed, 29 Apr 2026 07:14:53 -0700 (PDT)
Received: from dragon (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a7c57b5fcsm59207875e9.5.2026.04.29.07.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 07:14:52 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
	thomas.perale@mind.be
Date: Wed, 29 Apr 2026 16:11:29 +0200
Message-ID: <20260429141129.248078-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777472093; x=1778076893; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fTsu0SSTQskFh7ruVWS0jesOcgTzM7bwVjaJtaMIPM4=;
 b=cBIvyJ6l7HLLEUlHxMNTs2DTxVOrDY7zMHb6rzWx346kFhxFWPuTOqjNZMZ4lHaLG/
 MPvSFgNDIuQ/dlHnGEn2ZAeUmgOj5gVFqMr/U7m8fE0fjjXjK/CQoPSOZQpr4o79WQE4
 iPagGXK20MditJwCwZRE9S/4qaVgmzCz2oJSqni8lDCWi+2LUb9mXp1onqTLm/YL7Tni
 FCmfTrcMCeQ2eaGcmDeumF6CYNyBsjIFkC6GGAjoGHWgPVeP6wbXlBwg/GsxiZMdwYpg
 l4lYQjm4OrX1gTY6DKGase7us4igC6Q5KsG2FS6h0dvAEBmmafRQKwQYgX6j1xCAzlWQ
 Qpsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cBIvyJ6l
Subject: [Buildroot] [PATCH for 2025.02.x] package/libspdm: add patches for
 security issues fixed in libspdm 3.8.2
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

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...ulnerability-in-GET_CSR-parsing-code.patch | 65 +++++++++++++++++++
 ...ibspdm_rsp_measurement_extension_log.patch | 29 +++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 package/libspdm/0002-Fix-security-vulnerability-in-GET_CSR-parsing-code.patch
 create mode 100644 package/libspdm/0003-Update-libspdm_rsp_measurement_extension_log.patch

diff --git a/package/libspdm/0002-Fix-security-vulnerability-in-GET_CSR-parsing-code.patch b/package/libspdm/0002-Fix-security-vulnerability-in-GET_CSR-parsing-code.patch
new file mode 100644
index 0000000000..6d10f33564
--- /dev/null
+++ b/package/libspdm/0002-Fix-security-vulnerability-in-GET_CSR-parsing-code.patch
@@ -0,0 +1,65 @@
+From 704bc9916ccd8c034f912f13b75fd890a19eb3f3 Mon Sep 17 00:00:00 2001
+From: Steven Bellock <sbellock@nvidia.com>
+Date: Tue, 27 Jan 2026 12:02:37 -0800
+Subject: [PATCH] Fix security vulnerability in GET_CSR parsing code
+
+Signed-off-by: Steven Bellock <sbellock@nvidia.com>
+Co-Authored-By: Nicholas Carlini <nicholas@carlini.com>
+
+Fixes: https://github.com/DMTF/libspdm/security/advisories/GHSA-j54w-759w-xj3m
+Upstream: https://github.com/DMTF/libspdm/commit/704bc9916ccd8c034f912f13b75fd890a19eb3f3
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ os_stub/cryptlib_mbedtls/pk/x509.c | 25 +++++++++++++------------
+ 1 file changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/os_stub/cryptlib_mbedtls/pk/x509.c b/os_stub/cryptlib_mbedtls/pk/x509.c
+index 65eff62bfd5..1b5d60d4f92 100644
+--- a/os_stub/cryptlib_mbedtls/pk/x509.c
++++ b/os_stub/cryptlib_mbedtls/pk/x509.c
+@@ -1768,6 +1768,19 @@ static bool libspdm_convert_subject_to_string(uint8_t *ptr, size_t obj_len,
+                 (libspdm_consttime_is_mem_equal(cur->oid, internal_p, obj_len))) {
+                 /*Concat subject string*/
+ 
++                /*move to string*/
++                internal_p += obj_len;
++                ret = libspdm_asn1_get_tag(&internal_p, end, &obj_len, cur->default_tag);
++                if (!ret) {
++                    return false;
++                }
++
++                /*check total space needed: name + '=' + value + ',' + '\0'*/
++                if (buff_len < (int32_t)(cur->name_len + 1 + obj_len + 1 + 1)) {
++                    LIBSPDM_DEBUG((LIBSPDM_DEBUG_INFO,"the buffer is too small"));
++                    return false;
++                }
++
+                 /*for example: CN=*/
+                 libspdm_copy_mem(buffer, buff_len, cur->name, cur->name_len);
+                 buff_len = (int32_t)(buff_len - cur->name_len);
+@@ -1776,13 +1789,6 @@ static bool libspdm_convert_subject_to_string(uint8_t *ptr, size_t obj_len,
+                 buff_len--;
+                 buffer++;
+ 
+-                /*move to string*/
+-                internal_p += obj_len;
+-                ret = libspdm_asn1_get_tag(&internal_p, end, &obj_len, cur->default_tag);
+-                if (!ret) {
+-                    return false;
+-                }
+-
+                 /*for example: AU,*/
+                 libspdm_copy_mem(buffer, buff_len, internal_p, obj_len);
+                 buff_len = (int32_t)(buff_len - obj_len);
+@@ -1790,11 +1796,6 @@ static bool libspdm_convert_subject_to_string(uint8_t *ptr, size_t obj_len,
+                 *buffer = ',';
+                 buff_len--;
+                 buffer++;
+-
+-                if (buff_len < 0) {
+-                    LIBSPDM_DEBUG((LIBSPDM_DEBUG_INFO,"the buffer is too small"));
+-                    return false;
+-                }
+                 break;
+             }
+         }
diff --git a/package/libspdm/0003-Update-libspdm_rsp_measurement_extension_log.patch b/package/libspdm/0003-Update-libspdm_rsp_measurement_extension_log.patch
new file mode 100644
index 0000000000..c1a0f7eefc
--- /dev/null
+++ b/package/libspdm/0003-Update-libspdm_rsp_measurement_extension_log.patch
@@ -0,0 +1,29 @@
+From f55cf6d48ec69b4ac60a63903e9c6a2cb0fd155d Mon Sep 17 00:00:00 2001
+From: Steven Bellock <sbellock@nvidia.com>
+Date: Fri, 3 Apr 2026 11:00:07 -0700
+Subject: [PATCH] Update libspdm_rsp_measurement_extension_log.c
+
+Fix #3584 in 3.8.
+
+Signed-off-by: Steven Bellock <sbellock@nvidia.com>
+
+Fixes: https://github.com/DMTF/libspdm/security/advisories/GHSA-m4wc-xmvg-369f
+Upstream: https://github.com/DMTF/libspdm/commit/f55cf6d48ec69b4ac60a63903e9c6a2cb0fd155d
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ .../spdm_responder_lib/libspdm_rsp_measurement_extension_log.c  | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/library/spdm_responder_lib/libspdm_rsp_measurement_extension_log.c b/library/spdm_responder_lib/libspdm_rsp_measurement_extension_log.c
+index 6dcb3a54bac..c5f2efa8c88 100644
+--- a/library/spdm_responder_lib/libspdm_rsp_measurement_extension_log.c
++++ b/library/spdm_responder_lib/libspdm_rsp_measurement_extension_log.c
+@@ -125,7 +125,7 @@ libspdm_return_t libspdm_get_response_measurement_extension_log(libspdm_context_
+                                                response_size, response);
+     }
+ 
+-    if ((uint64_t)(offset + length) > spdm_mel_len) {
++    if (((uint64_t)offset + length) > spdm_mel_len) {
+         length = (uint32_t)(spdm_mel_len - offset);
+     }
+     remainder_length = spdm_mel_len - (length + offset);
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
