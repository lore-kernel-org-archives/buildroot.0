Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F7EC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 17:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F3C94154E;
	Sun,  3 Dec 2023 17:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F3C94154E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wD38OrHbixt; Sun,  3 Dec 2023 17:42:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D0E2410DF;
	Sun,  3 Dec 2023 17:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D0E2410DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4411BF580
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 17:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D5854047D
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 17:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D5854047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yu7-NAQIIBVG for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 17:42:10 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABDA440467
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 17:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABDA440467
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c09dfd82aso5905655e9.0
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 09:42:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701625327; x=1702230127;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=clSc0X9LjV4KeQ6r4CdL1kHx0nJ1k67L3sk/p/qGSdE=;
 b=KnB159mzroASaC5ZmBxrk1Trv+CUJ8vW+7XquAljZ1y1VPo8oz5jsCMc3TEq5kB6xh
 TVsYxeqYz4dwfZ36SpjIpz16cgGtUPpu+YlRJeBzn9K01Jzzno6eQ+VPv6bV+/9mpUjd
 TOXj9FCYS4bDthPeFdyvXwigtJE/MAZgc7ecnjd6EVm+LhK498S2ZSzIPAk381VNv5ae
 UuQ4nC1DxRdoNWr6GDwz3xkIB0oRXcyj6N8D3RgLY56F1VI8TzgZ37zxTxarPcE6SOBS
 98xKvFcK6PqihsIlWAqtyIGv0sE0FwuhtAX+/EexvKiLK89+Q/T5gbTWDf4J5NFKl/UW
 q1xA==
X-Gm-Message-State: AOJu0YxYXWAEyHs7zPyc8cKO2tIQyMDk9QfWgp1RcR5rJGPh2uSY9SDX
 NtFE4YVLpLgg9niM6P9b13dq0hzMgXI=
X-Google-Smtp-Source: AGHT+IFRRQ7A8pIleoIDvLZvRsVbOnQXkwDsVrjlHzQmZBDBdn/ERpWk7WoqTw8PJRJcQyYLmzFSOA==
X-Received: by 2002:a05:600c:8607:b0:40b:5e59:ccd3 with SMTP id
 ha7-20020a05600c860700b0040b5e59ccd3mr1763147wmb.180.1701625326474; 
 Sun, 03 Dec 2023 09:42:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fm24-20020a05600c0c1800b0040b3e26872dsm16303098wmb.8.2023.12.03.09.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 09:42:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 18:42:04 +0100
Message-ID: <20231203174204.6577-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701625327; x=1702230127; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=clSc0X9LjV4KeQ6r4CdL1kHx0nJ1k67L3sk/p/qGSdE=;
 b=e7NrWcRbfAoPuwSiy2Il7sl4WN31127ZknkQYdVYZ8p1Af6RUO0Bo02lJdwz+CxdQR
 /1Gmrbb9K5iHKqjwa9mkX3W2paGyCP2xdxCGAibo0sFPNQ8Ukcjzk0IN+Veh6fFTqFZ8
 5uGtCXb40eXdAbwdqCkv3n6M8CE83A6HEbUQL8fePL0v6RD7HrfIHypPF86XMJ31lNRO
 i2FYCZ8LLd9wuYAbrO+kIlgYHvLR7xPF7ORDOxN4zch1aS3U5JDsi+CSSF9D5GpUUBYB
 fLhPtQPv9xSFmsI5G3B4S1JxbxgxiWAA/RskGRuzPb9Uve01i2Lvt1ig6pHN42NceMl/
 /E/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e7NrWcRb
Subject: [Buildroot] [PATCH 1/1] package/libmemcached: fix static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure raised since bump to version
1.1.4 in commit 7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

CMake Error at /home/autobuild/autobuild/instance-13/output-1/build/libmemcached-1.1.4/src/bin/cmake_install.cmake:60 (file):
  file RPATH_CHANGE could not write new RPATH:

    $ORIGIN/../lib

  to the file:

    /home/autobuild/autobuild/instance-13/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/bin/memcapable

  No valid ELF RPATH or RUNPATH entry exists in the file;
Call Stack (most recent call first):
  /home/autobuild/autobuild/instance-13/output-1/build/libmemcached-1.1.4/src/cmake_install.cmake:52 (include)
  /home/autobuild/autobuild/instance-13/output-1/build/libmemcached-1.1.4/cmake_install.cmake:52 (include)

Fixes:
 - http://autobuild.buildroot.org/results/778ff517d465896f54a3cd5316a66c54f66fd4cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmemcached/libmemcached.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index 63df8f5c20..b72f127a1d 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -18,7 +18,8 @@ LIBMEMCACHED_CPE_ID_VENDOR = awesome
 # unexpected build failures with packages that use libmemcached (e.g. c-icap)
 LIBMEMCACHED_CONF_OPTS += \
 	-DCMAKE_BUILD_TYPE=Release \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
+	-DCMAKE_SKIP_RPATH=ON
 
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBMEMCACHED_DEPENDENCIES += libevent
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
