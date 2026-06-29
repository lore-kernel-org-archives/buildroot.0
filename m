Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97125C43327
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 21:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35C974104A;
	Mon, 29 Jun 2026 21:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJA98uWE3VLr; Mon, 29 Jun 2026 21:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E81D4104E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782766808;
	bh=ho9W+hKamIFdNIKsIyQ8t7EKG8+cBM47icYx1aP0rJo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fy6uFtixmb8E+bG45vxkWOZnH+2sJd8lvWyZwIsG4dkEAsek0fqicYZkY2QUNfioC
	 bILpnTFwHpCc1NnA9ZGHcqT/UNcDLbMMNzVJ4P+VO0CeJnlPFoYVGsZjIVzkVbtf5o
	 KFuPerOuF4Dtf3RF15sdJsxmzWf6/DX+6COdCUL695V84Jf0o2LXGLdej2kTw7+4NZ
	 MEyRq+INK5V1L/CWu2c//d/ebgE5efr1zjGD3Y99PQzH0mDs1RDoMrxvNjzNvIs+1w
	 cbB7pPgnoA30ZZzFV4csUVcyjLxI7wD0++ALFHYQx8BFp5BTpk7TpsarL9725/WOAd
	 RhQa4UoWeoFYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E81D4104E;
	Mon, 29 Jun 2026 21:00:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D7C8149
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E8C582037
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-XahWSuAFhk for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 21:00:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42B4480B4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42B4480B4C
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42B4480B4C
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:00:06 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-493a7bd27c2so15404135e9.3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 14:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782766804; x=1783371604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6HLMCeBY0evMR17OtOGw2TWmNuioPpRSnMDCOPxrwXM=;
 b=s87M9olbWPYt22YqpMJHGRRrtfo4SGYZ50ed55U3CyWKTVnyIffgeemuh6Uu1RQj3e
 rQYKaZLwoWvmbMFOorDZsh8kKL6Aykv9aWM7nvI6AwNwieZsSnRMwLYWTW1Npsd4JXMN
 Kyg5aOLThPLUTGCwbzrnjuuHWPsu6EO7644SbobFK6ESsRh3xeyamKxYQh47ffmqC1Zk
 q1CRNCTLuQKshbDp67cPJN1C5+Xg4GGAVrMZwWXi5+pN3wDtck8+Zo1+gMURrNNh8XqI
 yBD7NDwGx/horC+J2xWg6F4mFrUzyfJXmF56s6qKiJp0azvA6dCijj+ctVy2pC8i0ZJt
 aDKg==
X-Gm-Message-State: AOJu0YyOBUbAvQdNb5RFNCgichDJLqmgAZrV6gUqp2MTUnOf350sL4In
 6+0bXKYsR1mM+zM2bUDbdEK09cvKcDIpm86zfVMxkXkEnZuZ90xpXLXTuA06rr87Gyl7vKTv+pq
 9KPJj
X-Gm-Gg: AfdE7clCfto0KD+rzAHiW9lHNz9ClOx+pTjHNbHE54L1T5Vll/SDhA8mexyeAuRt+AX
 RRJ12LkTLWC5t1/h1kJjF3VzxCI28OYSd57G0ICWh82jQ8SJ5g+SWzP5M7BjTDuqPOsf4kt2xHK
 inrZU6RXId/o1FQTVr7GO7UKxLfSAmpWh+S9FG2zGOlc8m8shafHroFy2BywJHMLGkOTiwUtIsx
 Uxj8fh9kbNWWt8XMruFEszMLGUxjTNlX4b6If2P7P8urwt0FPj9VVVwlZUz+OQrZGQgZO0mvmqE
 9yxFV/ZNx5wiD4TZNXmxkm7YNF33UBdyr2yxEZHpIo850Ti3lSgVwn2MKwskBHJaeI5ZOx4YpR/
 IKB3NdEQPQ9tlkUewKFYlgjyUIaMKsuwczld52OvaaRHQyuEJu6rXn40oiGYFvYV47aklrzLw1T
 WbS/W0VRLmKfev660=
X-Received: by 2002:a05:600c:698d:b0:493:b8d9:f28b with SMTP id
 5b1f17b1804b1-493b8d9f306mr11410675e9.23.1782766804217; 
 Mon, 29 Jun 2026 14:00:04 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8cd88e8sm15289115e9.7.2026.06.29.14.00.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 14:00:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 29 Jun 2026 23:00:02 +0200
Message-ID: <20260629210003.623732-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782766804; x=1783371604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=6HLMCeBY0evMR17OtOGw2TWmNuioPpRSnMDCOPxrwXM=;
 b=VbWMoDDDa7g9wkpQOKvhZARIodRF2DCxBL9aTUdoojh43thJ/Qy1iobakJ7T5UVSPw
 mw/XtyQ12thBXjrtBBYsxtyf4DjuzkEaysgNuFX2YyYWIYw5NQC9v9sBBSokyqzLg7ES
 LNj6Ih025ihVyrkMcaVbU2CNNGJKVQ+ctLknIGeu8Sj+Rn6ykEzBkRYLE2ETrPjjzbbF
 D5uHG8alkyrqfXjOTOvkQe9uE3a54kdeklfaMH8jXKjPskEyPgDi2oMpYn0HFA2/sIjA
 X1XTpa73IMfk0dd3xzXHfSQjZC28USGQfWQEO1zMG6BovGgMuh6WkeUWoDx3GawOjojK
 Mu3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VbWMoDDD
Subject: [Buildroot] [PATCH 1/2] package/libssh2: add upstream patch for
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
