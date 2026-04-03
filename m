Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBD2E7E345
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 08:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E6D740CE5;
	Fri,  3 Apr 2026 08:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Zfe1Slauh_Q; Fri,  3 Apr 2026 08:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DF3440CE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775205749;
	bh=w379+XbIsaBDNgQERWr3QPhg2kbS5wnNoRERaX0pnB8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ow5/eNziFKE/ASC6JvH2Zh2QjOmIzyqq8e/CREZIBy3OuaWBJnFUsA45ub9rpeX5c
	 pIfAu3ioPBupH5Nu0tgQLg9e/2nAaF2d8EBA9FBkg4/zhMkOKR59GfVrRpJK3qBE1S
	 81FJRGwyvSKKZIq55jL39Os3hnGwtaXiQ3UlcmbsJYOFslOKxVse6Z6YTb3thT9c2H
	 hfasBTLmNCr/JLP0x120zE5Yj8RSdUoVT1+6P9a9+dZeFe5sPrynZEirzlVRdQkxbK
	 aX1WJK71X1JzsJqF1KWNuTYG0TL9Ul6xEYhpn6+ARabcwZlSLkhPJ409KR4ZkwGgwi
	 cZU6TLMraeN+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DF3440CE7;
	Fri,  3 Apr 2026 08:42:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0D852CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 08:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE1CD8132A
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 08:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4aDfyQ3i6Xe for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 08:42:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B80D80F40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B80D80F40
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B80D80F40
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 08:42:24 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43cfbd17589so1304588f8f.0
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 01:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775205743; x=1775810543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9+w1x+PkIWu8g+70ZUMmR18pyahDp04donL3DACjSHM=;
 b=ll8yauXoNZUEibyvvb0Fh3xKDoNYnLQJ3j5IQBKv75yzaKaPM2UmWF/9It4IcOI0kR
 btLfLcQ9FaVYJ1k6YGux8XzXC2Eoq+rANKwB41DNUmcziyetoI8A7g6pqnttp8X/XveW
 IAqAAJOBG/9cJh5woGxUm45Eh8TsOSPQQiD4K54WrygoR6asN3mmgzyge3+BNHxpran+
 UXhQq+3VsU8Xq2uP19Efi7duW9wr3EaCC52Hhizh1ypj7s3EL5dBnUDo3NLiAcsXV06s
 KdcULxxDplNSH2ZZ7PExCUx3AAPeUVy8KnAIaBj92bGbrpfQXtjG3yf5JlT8DTU+DZj+
 mg/w==
X-Gm-Message-State: AOJu0YwZcYysBif93vjOJy/+psULcTMu1Yz2JC2GynWvRkVSHeIKJJsA
 9bhr5wE6VmcKL6RcZxE2tMtkJWNigOEWIpM8gabUO0NERfAi/qW33CuTQQdAsIjCVYPPkTZxan4
 1rR3fT7Q=
X-Gm-Gg: AeBDievBYo83A73EiaO3VSAjPPlIGqpP0s3jETF3Ofbv0brL7fBeLKqQdBLXZkPjyr/
 yie1gtYMYIiaf1TudpXwAYyKXXkz+H/6T6Ac8jSWNWx0qAesXCxfh6SGNDBnTH4KV2g+ImVbMdx
 tqdnofL+S35nECozS0BOYcptfmV0Om/SegJpECn/STsJzSyq70z+zB+qL65e0eY5OROGavONKAz
 em/YA/gsMJj8s48dyeyyz7zPe8s+Pbin4dFSyYqwc7XaTuhmlgROZQFab3Ka3i72RVwDiQ2MOGN
 7B4Dk3s2YiY7BGsSc5TBkUWiZPeTTS4tDjmJu9hM5GW8IBvj9/9hKZ2UqyLFfSEw1mXD3zgCWZz
 p4Be/2Qf/YgM2WnzfPnQUEFGxn+8ROZJfydUr03B1Kt4dQmChU2CkDzwBatb/MuZvtW0QrZec+t
 YNvq1bozxMhfRBLut5
X-Received: by 2002:a05:6000:238a:b0:43b:3bed:f34 with SMTP id
 ffacd0b85a97d-43d292e70a9mr3853352f8f.30.1775205742544; 
 Fri, 03 Apr 2026 01:42:22 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e52a0sm13936040f8f.30.2026.04.03.01.42.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 01:42:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  3 Apr 2026 10:42:21 +0200
Message-ID: <20260403084221.35659-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775205743; x=1775810543; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=9+w1x+PkIWu8g+70ZUMmR18pyahDp04donL3DACjSHM=;
 b=aquE97XwPgpAXYXvWpi0Z9GTXcY5cGIOacFlLZ9vLJqY8zKbx1WSDTQAaiElpqEQBn
 qSU+GzgtB+lxnLc1pv8cEHAeBNhDrZOCPgA5InfF743d6Od/YKrZ96AxljaodJc3lMzP
 eVkkP1WDiTjuBMO82omNY0KWyeJ5jYSbHhS0Wh9mJniW0g2ke7ApdcJa2fwmMRVlFbde
 2pHGuIGKRLylZwjDYBbdlACI5nNg7Z/5R/WpBNJHQTTPQy8nzhGkVLWC4UPokncA+cbd
 oK0p165KZWLfsZY6XEFRXDWRiGeqW0arY14sAO3Xg0ZnxawWLLV2qwCYiY/oIJG9pbVC
 aPFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aquE97Xw
Subject: [Buildroot] [PATCH 1/1] package/nghttp2: patch CVE-2026-27135
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
