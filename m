Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF3DC43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 21:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41EE460F60;
	Mon, 29 Jun 2026 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rpf4F0O3XArl; Mon, 29 Jun 2026 21:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55A3D60F77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782766810;
	bh=8sB+eYlKHBJ27W8IQc7h+GBSou/z6aQj1OEModL2GYE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=LEH34AOsdIRaR9Cb5IDb1qHBGzga5jM9OkROGuIVyQdWxdftSGlIngHsbVUs2ge3y
	 V+O/MwcZIwrRbwsG1uKsrE3LmROAaVWQJRR0HNRfokDb/+jbccCzftI1HUkf9hJYPH
	 9K/q2KNkeHIWv5+bxlkBq81JqGsvLfQp1p4Qfhz8Nu94OKKoAXAWiKZRAzFgd8buZp
	 K3NKJVbpK/Nfa+WUs3h2Jn92+KDRcK05OXP6931tK0pgFusnE4ar5y68UV3dcHX5bl
	 ZCWLrhclnwDqKVKPHptY41ScvQEsxPih4kY5fsioIR2mJS4phN6epYMGDENey5yUEZ
	 BnUVR6NWNB80w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55A3D60F77;
	Mon, 29 Jun 2026 21:00:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27FF7149
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D5604104E
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYbyvlwXTJCI for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 21:00:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 243704104A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 243704104A
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 243704104A
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:00:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-474560436c3so959752f8f.0
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 14:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782766805; x=1783371605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dC8CNv6C8sfSjGB6u1DyRZnbte4mNEvEQ7ihivls9i0=;
 b=c56d9rS4CWFkxKk8zBOSqYgx+yS8BmU2Le2B7IHOuE6rMnt6sYfpQxOkvF0c6dEzZU
 D+NyCHA+EFCzZihCUArddMLCC/lPwWj71bK7ENlg0qOUCovBRAdIVkfuAvxSppyoI+AY
 WEqPac3ktHaH0D4ec/E8O8s9EZ6uy7ggPZnWtMUR1MNNKPPpk05gl5LZHoIOrTHJjzg/
 pO3cn1jUFy5whNbCi01qqkuouXM+u0taQI1xQ3rz8cJQX8F4/vwftnqF30KVxYDsRrJ+
 nQvWFUOw8+p8PGMqzatsg8rWQcXJnmiCQX1i6hueNPz26w+8ppITDCOIsis7TdJdj83P
 F19Q==
X-Gm-Message-State: AOJu0YwwNvypjFkLzOpVY2/1Fl8akKaXYiWc6B1Levx+e7z/Hqs9qDyP
 TaivrQjuGlDGtF5hhM7sYn0tUEMXoRI8qy5G17KPbNFo6qaIk9xxX6avSMRcRCemXlEf/O7NQk3
 sITF5
X-Gm-Gg: AfdE7ckbFoXnoOVq5ekE0HuR1zJKyfrbjR8Cni7EekrJC+pobwvE31P04rkhe3wK1r6
 AGXnDrq3EWZ+Mu+yp2v1fdiNGhsnLjzPQGoPl39B12MqZfEmFcGmyxgRXyMUk+GCpQSXKwHfZ0o
 mkUJLvOghoOARGfaPLUMwxoW7sNSfH324FuFLF6IqDN3fMURXYali/gmXqTJYs0v7uHCKrd3p7e
 fG/5AzMoWieDTZovMjIla+cwTXayYVIaWgL5OOqm/qUOmQK5+nY8AGhcbQsptmpr7zJJtKK3U6u
 qMBIvyA9IN/97EHJRIpajIZqTCnLq3fwHqfeZvlFQezWSDGzcs6uFRvM67D62QZtrl8gDcxXYm7
 /Gw5i0+fbhXMD3p9TeX+K2WwxNWEyI5qGw06xMIB39ztUs4j6P5qpM4fhf0PGbRgbxfD6/JxZi8
 X93JVB
X-Received: by 2002:a05:600c:1d09:b0:493:a535:5527 with SMTP id
 5b1f17b1804b1-493b82ac8d4mr15974305e9.21.1782766805019; 
 Mon, 29 Jun 2026 14:00:05 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8cd88e8sm15289115e9.7.2026.06.29.14.00.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 14:00:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 29 Jun 2026 23:00:03 +0200
Message-ID: <20260629210003.623732-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629210003.623732-1-thomas.perale@mind.be>
References: <20260629210003.623732-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782766805; x=1783371605; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dC8CNv6C8sfSjGB6u1DyRZnbte4mNEvEQ7ihivls9i0=;
 b=bS3F0ak/TkKiKXj8awnYJJpFqZvgZozeSti2gfXhYKvZ8ldvaqWAkAETV/4KKGGVbg
 8T5vmIfjbikRJDiPJnREpsEWJInjB4HC99QlarX3vVJj36ZMSYmWRllEzq8u9Ce8uR55
 n/LKxuGyojwykcsE3MzFLg8/fGTtFpR2yQZ4GjtbmyaL44phgMIVuja9mbnvcxM3rfNs
 v5vUG7Vmfrnk21bKg9dWtBqFQgOT6cMH2mfl0KXbzLu+Fkzs/zeHews+8XTUOvu3eyn3
 928nPxRTB95P1XhTMK9y1Y4LUr/dQpj/aos4NbLfNq4tM4uaN9vut/VzVQlA7k92g7ww
 qWMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bS3F0ak/
Subject: [Buildroot] [PATCH 2/2] package/libssh2: backport upstream patch
 for CVE-2026-55200
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

- CVE-2026-55200:
    libssh2 through 1.11.1, fixed in commit 7acf3df contains an out-of-
    bounds write vulnerability in ssh2_transport_read() that fails to
    enforce upper bounds on packet_length field. Remote attackers can send
    crafted SSH packets with excessively large packet_length values to
    corrupt heap memory and achieve remote code execution.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-55200
  - https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...al-boundary-checks-for-packet-length.patch | 36 +++++++++++++++++++
 package/libssh2/libssh2.mk                    |  3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch

diff --git a/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch b/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch
new file mode 100644
index 0000000000..ef54771afc
--- /dev/null
+++ b/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch
@@ -0,0 +1,36 @@
+From 97acf3dfda80c91c3a8c9f2372546301d4a1a7a8 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 12 Jun 2026 15:57:44 -0700
+Subject: [PATCH] transport.c: Additional boundary checks for packet length
+ (#2052)
+
+Add additional bounds checking on packet length to prevent OOB write.
+
+Credit: [TristanInSec](https://github.com/TristanInSec)
+
+CVE: CVE-2026-55200
+Upstream: https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8
+[thomas: backport to 1.11.1, change ntohu32 call]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/transport.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index 869fc5a4fa..7925ad33d1 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -645,8 +645,12 @@ int ssh2_transport_read(LIBSSH2_SESSION *session)
+                 total_num = 4;
+ 
+                 p->packet_length = _libssh2_ntohu32(block);
+-                if(p->packet_length < 1)
++                if(p->packet_length < 1) {
+                     return LIBSSH2_ERROR_DECRYPT;
++                }
++                else if(p->packet_length > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
++                }
+ 
+                 /* total_num may include size field, however due to existing
+                  * logic it needs to be removed after the entire packet is read
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index c85129a7cd..0ccf5effb3 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -19,6 +19,9 @@ LIBSSH2_IGNORE_CVES += CVE-2026-7598
 # 0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
 LIBSSH2_IGNORE_CVES += CVE-2026-55199
 
+# 0003-transport-c-Additional-boundary-checks-for-packet-length.patch
+LIBSSH2_IGNORE_CVES += CVE-2026-55200
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
