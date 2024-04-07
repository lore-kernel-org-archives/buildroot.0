Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3E9CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 09:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C5A481B60;
	Sun,  7 Apr 2024 09:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lraI4nv09Pf; Sun,  7 Apr 2024 09:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 386A281EC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 386A281EC9;
	Sun,  7 Apr 2024 09:49:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FD881BF296
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A3EF606C7
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ineMGWERUzBX for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 09:49:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 75B0C6069A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75B0C6069A
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75B0C6069A
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 09:49:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3454fbdd88aso909446f8f.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 02:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712483378; x=1713088178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IsBh3cYjYgOU1+bov/tXl1OKFWJ3+KRVO/3IM4WJlZo=;
 b=JF4LVJ8ovRN6a1mXBivCSXWZPWy1P/kspOSFFx6D1CoZUUm46uAAopUduc31rdYLRl
 V/T8bkryy4s6o3H0kvAdmZn1YliNzgAuXZb+3a/teC3NRrMC0t65QmqF93LhPtXwPXg8
 qyEX+TMCmEa25lzCrQFr/JRnYV3t0DsrSD9G8tYrUiJn4mwO9ydHhh2wBK7/RF0Tkqkg
 RiT9qWLNeRO0DjAal/Ix6uY4F3aFWDu+/FpkN2aoB9fHTIhXynzlG+xL/zf9ThTCnq7/
 4vgok7KnylGokW2kTSPMtB+UIsQyYWlBbNqyiy++EMM6d6BQjbFQiUVcZVbyH2ygSVm5
 HwOA==
X-Gm-Message-State: AOJu0YyKzdUq1V+JkXAKBEo6Kg3obZcH8hEFHWnE658bR9FutRgMgwl2
 NBp2M76sbNx3hxUFqwqZaJ08f6TMqQQ2y8Kf48a2PI4/zEROBnTGMhyTksCi
X-Google-Smtp-Source: AGHT+IHURyCTW2gVNq1udMH0LtwHFfXxJeLUxddcoe66hVcn1DqiEFASPiDokqqKUTzRbW3orxIyUg==
X-Received: by 2002:a5d:634c:0:b0:343:f662:1916 with SMTP id
 b12-20020a5d634c000000b00343f6621916mr4464390wrw.17.1712483377567; 
 Sun, 07 Apr 2024 02:49:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i14-20020a5d558e000000b003434b41c83fsm6319128wrv.81.2024.04.07.02.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 02:49:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 11:49:35 +0200
Message-ID: <20240407094935.562389-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712483378; x=1713088178; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IsBh3cYjYgOU1+bov/tXl1OKFWJ3+KRVO/3IM4WJlZo=;
 b=JqOgncVHhNobhEgdg1OJRyHRaay7dPzh+wjNQTkZ1T+11+VwUqplzX9T57CtZ2pKbt
 xUfPs1dipQzsCNhaZR+o694+SMtn/D4AyiF80y2KKmzr0fMLVZhffvVEfq2U0tCeqY8c
 yOrsZa+FzgsCB8y7FrCjKbzNYTjKxBuLoolNQ/zx2IJPObnp+w4pA35U6k8PZu4c1545
 Fuas3BnENaBQw1H3NvbmMoB3wjoOQCR3pjT2QIpz+BT7WV6olOJX9MtKQh2Uo3QrvCA3
 yTOOghx5Ru4sKfDO/FjZ22gh9TqhRwQrypWau67hhZckWZZ2jQgP25gLh/9ZJqNM1D8m
 +6CA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JqOgncVH
Subject: [Buildroot] [PATCH 1/1] package/libcli: add libxcrypt optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Steve James <ste@junkomatic.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/12.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/3a5cc2a90d58f39a6c9f27ad87e0d54e705f0c84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcli/Config.in | 1 +
 package/libcli/libcli.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/libcli/Config.in b/package/libcli/Config.in
index b2829cad3f..a5a8872d41 100644
--- a/package/libcli/Config.in
+++ b/package/libcli/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCLI
 	bool "libcli"
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Libcli provides a shared library for including a Cisco-like
 	  command-line interface into other software. It's a telnet
diff --git a/package/libcli/libcli.mk b/package/libcli/libcli.mk
index a18daa911c..f3f68f780a 100644
--- a/package/libcli/libcli.mk
+++ b/package/libcli/libcli.mk
@@ -26,6 +26,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 LIBCLI_MAKE_ARGS += DYNAMIC_LIB=
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+LIBCLI_DEPENDENCIES += libxcrypt
+endif
+
 define LIBCLI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		$(LIBCLI_MAKE_ARGS)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
