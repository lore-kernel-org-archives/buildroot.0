Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27806C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 22:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA2EE81327;
	Sat, 14 May 2022 22:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0r6Ye_Z24uT; Sat, 14 May 2022 22:16:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB1A9812D2;
	Sat, 14 May 2022 22:16:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C13C1BF5F5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6671760B54
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYArCr86WXvN for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 22:16:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3F14606EC
 for <buildroot@buildroot.org>; Sat, 14 May 2022 22:16:46 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id s14so8111704ild.6
 for <buildroot@buildroot.org>; Sat, 14 May 2022 15:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kOFotD7mGrYhaVM3dWXxtpemrfU48CnKqI3cy4dXZ3I=;
 b=SIjr8m9cF7Yhm29zICTRIB5D4dx6eghFjcGDx5jsoDJpeZTTOOK0a39Bz2a1rcojea
 4JLQXjdwwWKM4IyY7mJ7kZWY9oqhb+pbHgAcpjo/qQjO0Muhi/RMvqsqPwlSSwHbHhnd
 R8ilJofmVTedE7A0uIdIVEMjCDcPgnzhDaaKgmSOrkQXIl/gMN6tNZa3KKemJ3EVgjqI
 ZABaLZGvDhZkn+yqVfc7HPc00znsfrdgyqG9AgaYvtiQPWcKhRcO49vkuGy9D66d7GRr
 7cqdPOQOzyrCElJQVojEoCL4Ml+kDb7TaPJ2Fx6Ty3sla77JzUA+aCpUYMpHr670Tuay
 s8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kOFotD7mGrYhaVM3dWXxtpemrfU48CnKqI3cy4dXZ3I=;
 b=5txgvPX+oHOx9uCNm56Q4/TJSKHmVn2zH0WD9jKgM5TpcYnTUO+HhJClfaAOQ81lc+
 abKQiNEDVToyBVHmjI4ODwBLTpaWqjMKZdxNy3koV6Fy7lKC4AyONEAQvdjSK+4Es+Ak
 Hf8Tqbh72yHDwEAXvkC+TZAW2RCsJtZqGUhqr71s1y9P5K8bGhC09agA3rzaogbpzDO9
 pkJR6CScjVf0qctUVIf9bzqxYZAWqsqbEeMhsf6HOZyIt4tr50fK/8tJO4bfYyFIb6Bj
 xhN88tZzQ1MvCtkXWD/l13p+tHB9pXGmUm4qdOyDScDUFla+ewM6WFyrZGRK/BhOIM4B
 bqOA==
X-Gm-Message-State: AOAM5333zB7k+VcW5SYV9WKTzMs36SdMonyRHSYfJmG89KjS8SsAvh3G
 OPSfTVCGye4q8vcVXTPS99EEZ8Fsqbw=
X-Google-Smtp-Source: ABdhPJzumxXujk2gkueawtwkCbAFejxOJgFz0AKSnpjzB59hmPOGBKcIHjwqlzJxJtUv2/Pt1FGp9Q==
X-Received: by 2002:a05:6e02:1d0a:b0:2cd:fdde:a28e with SMTP id
 i10-20020a056e021d0a00b002cdfddea28emr5711247ila.228.1652566605488; 
 Sat, 14 May 2022 15:16:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d8043000000b0065a47e16f50sm1577319ior.34.2022.05.14.15.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 15:16:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 16:16:23 -0600
Message-Id: <20220514221623.3147598-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/grpc: propagate reverse dependencies
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It appears some grpc reverse dependencies aren't propagated properly.

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_GRPC
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=y] && !BR2_STATIC_LIBS [=n] && (BR2_TOOLCHAIN_HAS_SYNC_4 [=y] || BR2_TOOLCHAIN_HAS_ATOMIC [=y]) && BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_FALCOSECURITY_LIBS [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y] && BR2_LINUX_KERNEL [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_USES_GLIBC [=y] && BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 [=y]

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/collectd/Config.in           | 7 +++----
 package/falcosecurity-libs/Config.in | 4 +++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index dc6ecd2b72..e471872896 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -683,16 +683,15 @@ config BR2_PACKAGE_COLLECTD_GRPC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
 	depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # grpc -> libabseil-cpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc -> libabseil-cpp
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 	select BR2_PACKAGE_GRPC
 	help
 	  Send/receive values using the gRPC protocol.
 
-comment "grpc needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
+comment "grpc needs a toolchain w/ C++, gcc >= 5, host gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
-		|| !BR2_HOST_GCC_AT_LEAST_4_9
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 
diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index e0b5a3d134..157bc8ef6d 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_FALCOSECURITY_LIBS
 	bool
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # jq, protobuf, tbb
 	depends on !BR2_STATIC_LIBS # protobuf, tbb
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
 	depends on BR2_TOOLCHAIN_USES_GLIBC # tbb
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	select BR2_PACKAGE_C_ARES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
