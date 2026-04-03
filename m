Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F01EE7E345
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 08:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5630240D14;
	Fri,  3 Apr 2026 08:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gWdlEtjkK7B; Fri,  3 Apr 2026 08:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D70B40D57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775205777;
	bh=w379+XbIsaBDNgQERWr3QPhg2kbS5wnNoRERaX0pnB8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h8XJqi7hihFGlyCXp5xkVGC4N/8uimpJ039RI2yxivXmAetIWj/tgXmSBh8UwSR1y
	 Z0q5UTME7aYzUOHmw+0/VDpN3N0/fh+SP/05mt8aPDDmwoRtEQ9p/B4mM2CLkX+R1v
	 +EjWuTZ2/qDWOIQShirauILlG/sJgQgcPYOkvtzsNEejzD1HJJF2p1U4YaC+QPufqY
	 mDoJbfpMGX8xKQh1KaSXhs3g2/+VxVryYxHh3XK8j88UPmFHX+AobpmEBERtsgpAy0
	 Wrly16K3ifurHGRuNy+jc5cFsjjgowXKhq5Ry1w6BZO+3f/eymTYorkZ41TH9teC3a
	 R/FF0WxyjPM+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D70B40D57;
	Fri,  3 Apr 2026 08:42:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E80B1A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 08:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 444BD40260
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 08:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XGn8tl_RUrs for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 08:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8FC8400A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8FC8400A0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8FC8400A0
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 08:42:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43b983bb07eso919793f8f.0
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 01:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775205771; x=1775810571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9+w1x+PkIWu8g+70ZUMmR18pyahDp04donL3DACjSHM=;
 b=sZj+SSJVg+WBDSWwoel77ewNFaIfbIZ6+vzSpv88xYV2QMbwf7Ku52rp67Iy+ZpIWP
 SHwbc7FKWcW74nL75cLtB7Qf8ovF2OMIaGzxQCphzubhr3xgiJQYnl/hyEHK4tKS6tkj
 JzRdkik7L+gUTZb9BIgEOGRICQ1MxuX3u8ExVBJAsiJoBPM260E9eW6EW70Q24PJ+zW4
 fGKrijradI5cArw61wYJuJtWQ1LVyNGWSyrKyyYazl8okfGJs4IzTR0LmMHy7WAEP4T3
 jS/nKbwy61KB7a25FN/mL0mq0e8CalZCAWzeMBThhw3I85+kdKPrbSyrtgPNufsvZXkI
 eHuQ==
X-Gm-Message-State: AOJu0Yyfap3eSlCyI/LRjLi3Y6VaW3HW5t9JoU6KbjtEcNm0BEie0Syb
 kimxLfIpErFRMqWB+Uh6fYW9EXRbQiY+sQ/Ex+HLqaB/tbAMlZSMQan5y80ktANBfEh1u59HIyG
 e2sTs2wI=
X-Gm-Gg: AeBDies46vDoxvsNSW2XuAZvjZrDlnPJ5JYgoxaDmjqfy+Kon+01Brsr8BwhvTyPZ7A
 yj+JjW5hw4yXS6KCUNBH/hqL/OQk4byh9TAlbUjEPtlDazJCH2dlce3R8IqAN6FZrjxmH4iNRG0
 6l8Cs94PwqE0rkCByrXs0e8B9F/xWg/Dpbrh/c4L70Yry//HUrVN1B5xLAfht8CFil9Ht310rad
 8TXA3YfqzBMAP5d1WAhlEVflyyLGJJ9zH9ef7bqs1IYjpRlDRr3ywWkyGlHdM9I9bwi8SydOCBK
 fVMdtcy/maddswY83d/MGJzpQF2OIinIWJckc8RbsdwVlhYbhxb9aZB3XrG1UHDMU6fr78yOLtO
 G3ZklUm6uSKOSbDLtl5v5KYleP9qLm52PFBZkQuM1jgcPAnqR1NBJU6iT3OAS0uDlWju0s5kC5N
 gmPeglAfVMFfkjcbHa
X-Received: by 2002:a05:6000:1865:b0:43c:fd7a:e757 with SMTP id
 ffacd0b85a97d-43d2930fb0dmr3469404f8f.45.1775205771379; 
 Fri, 03 Apr 2026 01:42:51 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c637asm13945527f8f.14.2026.04.03.01.42.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 01:42:51 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  3 Apr 2026 10:42:50 +0200
Message-ID: <20260403084250.36050-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775205771; x=1775810571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=9+w1x+PkIWu8g+70ZUMmR18pyahDp04donL3DACjSHM=;
 b=M8EEV4qpGTDGlo//gDo27/q6WFSC7lFUiNVCNnInWLTcU6+6z5MABU8liEF/DNhYMB
 3VwkilrFbxO3//zliOjQ/J1H5zoq6zIw+s2PMqgL2zbVtQW/V/2aqFh4Efqq3IrmQjpX
 aLGwumeRPRGMb11Xk4Xfki1aljpfiBxpOwzN0W3JaEcJpP2sgVAQ1diRzI/j7/GSrdId
 2DNvGPrNHeii2+g+TxuMmlQVhrawIzq+kAX5xcpeTUWPtrm5fPAmb0w+1+p3ByXM/s9e
 ++QvyhCEKEVuj7353g8J09gW1UoTdSyx2L9hliUdsurbnfIdy4e87CAWvIaSHswajLjY
 rG/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=M8EEV4qp
Subject: [Buildroot] [2025.02.x, PATCH] package/nghttp2: patch CVE-2026-27135
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

Fixes the following vulnerability:

- CVE-2026-27135:
    nghttp2 is an implementation of the Hypertext Transfer Protocol
    version 2 in C. Prior to version 1.68.1, the nghttp2 library stops
    reading the incoming data when user facing public API
    `nghttp2_session_terminate_session` or
    `nghttp2_session_terminate_session2` is called by the application.
    They might be called internally by the library when it detects the
    situation that is subject to connection error. Due to the missing
    internal state validation, the library keeps reading the rest of the
    data after one of those APIs is called. Then receiving a malformed
    frame that causes FRAME_SIZE_ERROR causes assertion failure. nghttp2
    v1.68.1 adds missing state validation to avoid assertion failure. No
    known workarounds are available.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-27135
  - https://github.com/nghttp2/nghttp2/commit/5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...lidations-to-avoid-assertion-failure.patch | 105 ++++++++++++++++++
 package/nghttp2/nghttp2.mk                    |   3 +
 2 files changed, 108 insertions(+)
 create mode 100644 package/nghttp2/0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch

diff --git a/package/nghttp2/0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch b/package/nghttp2/0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch
new file mode 100644
index 0000000000..ef8b9a5a5d
--- /dev/null
+++ b/package/nghttp2/0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch
@@ -0,0 +1,105 @@
+From 5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1 Mon Sep 17 00:00:00 2001
+From: Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
+Date: Wed, 18 Feb 2026 18:04:30 +0900
+Subject: [PATCH] Fix missing iframe->state validations to avoid assertion
+ failure
+
+CVE: CVE-2026-27135
+Upstream: https://github.com/nghttp2/nghttp2/commit/5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ lib/nghttp2_session.c | 32 ++++++++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
+index bcea547343..0fbcc930b9 100644
+--- a/lib/nghttp2_session.c
++++ b/lib/nghttp2_session.c
+@@ -5573,6 +5573,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           return rv;
+         }
+ 
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
++
+         on_begin_frame_called = 1;
+ 
+         rv = session_process_headers_frame(session);
+@@ -6041,6 +6045,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           if (nghttp2_is_fatal(rv)) {
+             return rv;
+           }
++
++          if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++            return (nghttp2_ssize)inlen;
++          }
+         }
+       }
+ 
+@@ -6293,6 +6301,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           return rv;
+         }
+ 
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
++
+         session_inbound_frame_reset(session);
+ 
+         break;
+@@ -6599,6 +6611,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+         if (nghttp2_is_fatal(rv)) {
+           return rv;
+         }
++
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
+       } else {
+         iframe->state = NGHTTP2_IB_IGN_HEADER_BLOCK;
+       }
+@@ -6775,6 +6791,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+             rv = session->callbacks.on_data_chunk_recv_callback(
+               session, iframe->frame.hd.flags, iframe->frame.hd.stream_id,
+               in - readlen, (size_t)data_readlen, session->user_data);
++            if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++              return (nghttp2_ssize)inlen;
++            }
++
+             if (rv == NGHTTP2_ERR_PAUSE) {
+               return (nghttp2_ssize)(in - first);
+             }
+@@ -6861,6 +6881,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           return rv;
+         }
+ 
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
++
+         if (rv != 0) {
+           busy = 1;
+ 
+@@ -6879,6 +6903,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+         return rv;
+       }
+ 
++      if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++        return (nghttp2_ssize)inlen;
++      }
++
+       session_inbound_frame_reset(session);
+ 
+       break;
+@@ -6907,6 +6935,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+         return rv;
+       }
+ 
++      if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++        return (nghttp2_ssize)inlen;
++      }
++
+       session_inbound_frame_reset(session);
+ 
+       break;
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 98f837e28e..9e051d24ed 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -14,6 +14,9 @@ NGHTTP2_CPE_ID_VENDOR = nghttp2
 NGHTTP2_DEPENDENCIES = host-pkgconf
 NGHTTP2_CONF_OPTS = --enable-lib-only
 
+# 0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch
+NGHTTP2_IGNORE_CVES += CVE-2026-27135
+
 define NGHTTP2_INSTALL_CLEAN_HOOK
 	# Remove fetch-ocsp-response script unused by library
 	$(Q)$(RM) -rf $(TARGET_DIR)/usr/share/nghttp2
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
