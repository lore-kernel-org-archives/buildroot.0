Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0620DC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 07:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B69841727;
	Fri, 16 May 2025 07:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4Z7jNbEtVki; Fri, 16 May 2025 07:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C88E941751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C88E941751;
	Fri, 16 May 2025 07:05:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 941EB1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78A8B41751
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNf69PV6kdbz for <buildroot@buildroot.org>;
 Fri, 16 May 2025 07:05:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.52;
 helo=mail-wm1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBA6841727
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA6841727
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBA6841727
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:05:26 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so18950555e9.1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 00:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747379124; x=1747983924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qxIQ/fhs4yabtalJA6As+5PnB34D5US9G2ESpwQSx4c=;
 b=ZKFTO1IBcpl7QsVximAZMP77Kb9WfUhuARSj7RcBhK4zgMIj11kcaOT86L6IwEIlWz
 ldEqME2tNT3CGRox6SixtmHLApFcvYbiSo4xgHdFak1TAyA+3TzY+zINuapbzGUO1xjr
 j+uSirvGi0d0ovhlVIeoiU3nRnQXKhrfqX+by9/+6WpVJFzXk2MjNh4gSY5dN3MQqcP4
 UC73qtYrnOSjmxc0f7ICSeuX61bYs6N0nSMO8Bs571RPnHD+IgEr+HEQ9IaW/inwpWYa
 co8l1vYFVrlOPwub4ppI8G+JhGeeMb1ETXYGjZRh0uUDKbEJ5C53d2q16U+GKKKZBaDv
 4LVw==
X-Gm-Message-State: AOJu0YwT63Fg9Kn0UODKmXbIf8pgT0yJeEtaixDoJErTcKa2mo7aISah
 5Zy/oQwjXNGEc5qB8INE6+zaMJAKtknluVRXENXeUYKG48vh/wvfX0G6M8b5RQ==
X-Gm-Gg: ASbGncvDBtcPnh3tH39wZln/Vs24D6vEXCNbO5E78D+UWJWnr4dRB0FS5aVz9HezK0S
 q5hBql74s4EPliZJkoIVbEwFPs1h8vAp0IE5YjrTyS6UJ0fdr4W5DiqJdCRNl89fXmkpaQXB87u
 rZU/eLhUccfEAtsDKaeyRLgxURtOoJZeU9eXturqc+eVMr0Jl9YG2LRPKlFbkIZuEIWwVsvjJ53
 E/cAGUFEjTmsZp8AY7FRUOC6c3QyLgtGHG7cCjsmYP1iuuQeCQ4w1qMyfHJ4QI2I54JC1nQb48r
 XhxukO/fWIFC7G0xnfME+di/I8zrNxrLV1CNgUVI5eNcQErCQj5tzYWHm6x6Ru7WRd2/Dw==
X-Google-Smtp-Source: AGHT+IE8/kao6RwtzIyDwlQHNSfD6PwJ/LoZyyVKMOENWcuzSl4UQFYWkTkdOFdUpE0yTaIbQz9heg==
X-Received: by 2002:a05:600c:45c3:b0:43e:a7c9:8d2b with SMTP id
 5b1f17b1804b1-442fd664965mr20950255e9.24.1747379124001; 
 Fri, 16 May 2025 00:05:24 -0700 (PDT)
Received: from thomas-Precision-7670.home ([87.66.230.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd50b9b2sm23035905e9.12.2025.05.16.00.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 00:05:23 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri, 16 May 2025 09:05:20 +0200
Message-ID: <20250516070520.3454317-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] pkg-cmake: force check_language(CXX) to be
 false
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the code snippet below, which typically is used to check if
C++ support can be enabled.

If we manually set CMAKE_CXX_COMPILER to /bin/false, then cmake
will assume that it's fine, without having a real check. Otherwise,
it will do a test run but somehow it falls back to /bin/c++, even
when cross-compiling. Fix that by setting CXX to /bin/false.

```cmake
include(CheckLanguage)
check_language(CXX)

if(CMAKE_CXX_COMPILER)
    enable_language(CXX)
endif()
```

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/pkg-cmake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index c7032312fb..ba287d244a 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -102,6 +102,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
+	$$(if $$(BR2_INSTALL_LIBSTDCPP),,CXX=/bin/false) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-G$$($$(PKG)_GENERATOR) \
 		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
