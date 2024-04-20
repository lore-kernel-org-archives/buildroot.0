Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19832C4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 18:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8837F80C04;
	Sat, 20 Apr 2024 18:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hC0Ksevl34C; Sat, 20 Apr 2024 18:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8667D80C35
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8667D80C35;
	Sat, 20 Apr 2024 18:59:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 346711BF3C5
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CAF04023B
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GncYmlq2kkPu for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 18:59:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.53;
 helo=mail-wm1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB2F640010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB2F640010
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB2F640010
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 18:58:59 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4196c62bb4eso11256115e9.2
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 11:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639536; x=1714244336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nAUi+WGkJHujr4eh06vdnUozH8B2TJ4BU1YI62DzNFU=;
 b=WCi9egi6/I1b+FlCZ9gOnuPmzfOo7bGTLWjntg61JUQeD+5XFpJFe+sDcnqvWVaUAq
 QjlgAPc7iuzCQ93Z39S1kG5JxdDVpEeFFFsBndBl/OQZW0akQZU77StkRZoXPtqlHsUw
 WbCWFp9/uShgdaPOoQujiakaiL6G1j8/23F090Zr9G7OVLe8IRh+FnWd4ntanS3gr12p
 eGPkniZlgazutBEP6yZ+2LyAbDWpwt9jxct1NLwrYXPvON7MDYFnF89enKlcdTppxSj0
 tgPtg/CJBreLtfLcl6CBLsOcanpgxi9Ncb6YbMluKfMYIlx/koTG4wIVLWX4kr9kQe5K
 O7NA==
X-Gm-Message-State: AOJu0Yzyv+AO+sYAlJUbvaJNT6JjZZ0vUsMcvSvZsxYpa/Cb53w9Yuvx
 VHZPb2ayW7u1j+PL0LfPAUz2fi779AVzuYVVC2tY+AqKyM4oZ9r+rEe49VGT
X-Google-Smtp-Source: AGHT+IGpnoogT/IkwlttCXaAGtSMUDDgE9ijwnIxvapUSnpneTD6DbJzauOOU3PG1SN6lYAnJxciPQ==
X-Received: by 2002:a5d:6ace:0:b0:343:78a6:ff with SMTP id
 u14-20020a5d6ace000000b0034378a600ffmr4006818wrw.48.1713639536337; 
 Sat, 20 Apr 2024 11:58:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:2033:ef69:f14:1bd2])
 by smtp.gmail.com with ESMTPSA id
 cs7-20020a056000088700b00346cdf48262sm7573981wrb.2.2024.04.20.11.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:58:55 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 20:58:46 +0200
Message-Id: <20240420185853.4134260-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 1/8] package/libsoup3: fix reference to atomic
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Aleksander Morgado <aleksander@aleksander.es>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gthread-posix.c:(.text+0x137c): undefined reference to `__atomic_compare_exchange_4'
collect2: error: ld returned 1 exit status

Fixes:
 - http://autobuild.buildroot.net/results/4fb9f4c49777dde3abc30bb9f324816d3ed87567

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libsoup3/libsoup3.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index 10caa5bea4..99eee466b3 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -30,6 +30,11 @@ LIBSOUP3_CONF_OPTS = \
 	-Dtests=false \
 	-Dtls_check=false
 
+# Uses __atomic_compare_exchange_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBSOUP3_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_BROTLI),y)
 LIBSOUP3_CONF_OPTS += -Dbrotli=enabled
 LIBSOUP3_DEPENDENCIES += brotli
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
