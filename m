Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66870C43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 19:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E98ED60762;
	Tue, 30 Jun 2026 19:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3tF6KRJqARW; Tue, 30 Jun 2026 19:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79563606EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782848528;
	bh=ho9W+hKamIFdNIKsIyQ8t7EKG8+cBM47icYx1aP0rJo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ebLJkT8/bPxCrHpFDcvDXRqWFP7Ssj55XFmh7qT3KvlW9KwYf71ijlpp+CjmEMXCd
	 r8gRE9WS7kNmtOBCVQcJsJYL8rI4ihiFde9bgKWswvBvOkk1tHVtxH0MoBAlC9Sx8x
	 ns7inCMDnYxGRG1bgORRr8wl4QBqllUqD0zNNn9j+HwuA25oBBA5lirBFliiTG7R1o
	 Ki6V4VnJdr7WdsUECaCSn6KoUEv12/ju7P48pM8+Xl8B5SSD6v5AfMbC60PCta6BMR
	 fMyW97qiWyMs/Vz/PfreI39jrGuqjXXC0Zi+ktiFI2m/MjoeC1z+QKugQfPf5NxreG
	 VgC9ZvJ8WxKMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79563606EF;
	Tue, 30 Jun 2026 19:42:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FF4E1338
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 19:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B0AE40061
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 19:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rfLmfwUtv4X for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 19:42:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B64AE4005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B64AE4005B
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B64AE4005B
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 19:42:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-493b68b4643so11768225e9.0
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 12:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782848522; x=1783453322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6HLMCeBY0evMR17OtOGw2TWmNuioPpRSnMDCOPxrwXM=;
 b=TRE72jz5Y2HL+feG4RzcFflaybn8h6iquLK63wqoZivjK0qf3a3PxlUODK/8NzXW8o
 Q6V2RjOc5JinS6ympEAkbTcb9ZjeWE17vMXOS7CbwiSN7CoJa9Zq0Z/JINlTaMutyFpK
 TPyjdOl45ohabj+yP5ja/N279HyivQYdsy2aBWEFePzp5yY71jfGcDqhyrvtyM5tOWMd
 enDVVCZDTKbWMOz5Nhcojbvuln1s9INvo3cRG7YTEb0sPNnx7/Gray9CuR+SUN6UkrJy
 7LvRr/2FOjl4ncVvu5/jpCEiVKAXs63vmYwSruQlg9PHvitKgM+2W4XZlBGIPa75LnGQ
 da7g==
X-Gm-Message-State: AOJu0YzF5pV89w76MYIjvDfGY1Sa1+5BJXBH498ufe7lzK+IbogFZY8C
 OV1W7eyM/ApL1v9QZlFC0/xKAZqH0+MdR73ZHkYBBud82lROSicIBQgEvvt4HbioELucZVUEiy1
 j84zS
X-Gm-Gg: AfdE7cmHY0QBJnwpuoVm/7pcyQ0s3d+ABKfIynQXAuSLv4PbbdXIecsEXX9diCz5LZS
 g1gabQBtkaZELOKw0OX184BMrG9spDwnms62hm0IFnZwcsrL1Y2UG///TpisPVVX8RkV3tqovMp
 2F3oKoakgBku8GjjFbGqRC11dEWDgryWE/Ta1zR7ueYhoAUYOGdyYMQ6tjswXTZnox5B9EwZZuF
 BfCNIMBk8wPGOgodfw+xmARiNP1jpCXIyGYs6v+793TfEMJabNk0cemCViRDYt6ZQC630zOVwAg
 O/piGpM9BAq5S8eUhICzEyW8ja23AYXhBTEG3KWXaaVh0ccwCPZH9vrrUACrs7a8UyL24q6YalC
 vG+ygvYCAUagZSVzJg6igj3sxzFKsHtR+fjVPZG+0BKHXmxDHCEKPkwaInmzCJggdZPBn2+8s42
 9N4NH82V/oxmhBNlw=
X-Received: by 2002:a05:600c:c3c1:20b0:492:6447:7a7f with SMTP id
 5b1f17b1804b1-493b827fd66mr56254575e9.6.1782848521920; 
 Tue, 30 Jun 2026 12:42:01 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4bfd47sm23100805e9.2.2026.06.30.12.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 12:42:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 30 Jun 2026 21:41:59 +0200
Message-ID: <20260630194200.250234-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782848522; x=1783453322; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6HLMCeBY0evMR17OtOGw2TWmNuioPpRSnMDCOPxrwXM=;
 b=Z2+raGf88ICkvzudYLvcRk4BEnyCKNKL6wyud0xGIeqgjShL1yyfFwqHLqBp6rwuNs
 XmIIbiqF/lhlGtXcOICmpP0K3su4RSDb//DzCYVu+tLmgWuY9plvBzjIr3rVlXkK3OtQ
 l3vnfO+lkbfG726R84fQ5dfIrT6csqVdzdMxMmRNz1zHY4zG9OUJYWML+WRUxUCggFJN
 NjTooGQeaSyEcot65nX+L3+4wEQkZeKRSG2Fr1ybkJsMtIh/eD7QaTJ9FYRByQtbSrkH
 nZhTKJ71wJaVL1sYmt9Vt2i3tG2j6kCELuoyr5UBENKiG2XH2Itb3Txe0K0cuxw7C2H1
 EXDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Z2+raGf8
Subject: [Buildroot] [PATCH v2 1/2] package/libssh2: add upstream patch for
 CVE-2026-55199
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

- CVE-2026-55199:
    libssh2 through 1.11.1, fixed in commit 1762685, contains a pre-
    authentication denial of service vulnerability in the SSH_MSG_EXT_INFO
    handler in src/packet.c that allows a malicious SSH server to cause a
    client CPU exhaustion loop by sending a crafted extension count value.
    A malicious server can set nr_extensions to 0xFFFFFFFF during key
    exchange, causing the client to spin in a tight CPU loop for over 60
    seconds because return values from _libssh2_get_string() are unchecked
    and the session timeout does not apply to CPU-bound loops.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-55199
  - https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadcee1cd84a4

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...et-string-return-in-EXT-INFO-handler.patch | 43 +++++++++++++++++++
 package/libssh2/libssh2.mk                    |  3 ++
 2 files changed, 46 insertions(+)
 create mode 100644 package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch

diff --git a/package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch b/package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
new file mode 100644
index 0000000000..c7319a6b51
--- /dev/null
+++ b/package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
@@ -0,0 +1,43 @@
+From 17626857d20b3c9a1addfa45979dadcee1cd84a4 Mon Sep 17 00:00:00 2001
+From: TristanInSec <tristan.mtn@gmail.com>
+Date: Wed, 15 Apr 2026 14:51:08 -0400
+Subject: [PATCH] packet: check `_libssh2_get_string()` return in `EXT_INFO`
+ handler
+
+The `SSH_MSG_EXT_INFO` handler discards the return values from
+`_libssh2_get_string()` when parsing extension name/value pairs. When
+the buffer is exhausted before all claimed extensions are parsed,
+the loop continues with no-op iterations until `nr_extensions` reaches
+zero.
+
+The `nr_extensions >= 1024` cap limits the worst case, but the loop
+should still break on parse failure for correctness and consistency
+with other parsers in this file (e.g. `SSH_MSG_CHANNEL_OPEN`,
+`SSH_MSG_KEXINIT`) that check `_libssh2_get_string()` return values.
+
+Closes #1864
+
+CVE: CVE-2026-55199
+Upstream: https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadcee1cd84a4
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/packet.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/packet.c b/src/packet.c
+index ae86365d2a..8a7a0d2690 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -868,8 +868,10 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+ 
+                     nr_extensions -= 1;
+ 
+-                    _libssh2_get_string(&buf, &name, &name_len);
+-                    _libssh2_get_string(&buf, &value, &value_len);
++                    if(_libssh2_get_string(&buf, &name, &name_len))
++                        break;
++                    if(_libssh2_get_string(&buf, &value, &value_len))
++                        break;
+ 
+                     if(name && value) {
+                         _libssh2_debug((session,
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 1843d25051..c85129a7cd 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -16,6 +16,9 @@ LIBSSH2_CONF_OPTS = --disable-examples-build --disable-rpath
 # 0001-username-len-bound-checking.patch
 LIBSSH2_IGNORE_CVES += CVE-2026-7598
 
+# 0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
+LIBSSH2_IGNORE_CVES += CVE-2026-55199
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
