Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127CFEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 22:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9412F416C3;
	Wed, 12 Jul 2023 22:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9412F416C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UP-X1eceHaNE; Wed, 12 Jul 2023 22:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C657740BA1;
	Wed, 12 Jul 2023 22:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C657740BA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4551BF3A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 22:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03875611FA
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 22:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03875611FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cbSIDY2hdJjB for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 22:01:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E380260E78
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E380260E78
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 22:01:25 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a36b30aa7bso49281b6e.3
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 15:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199285; x=1691791285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XStAikKUQRn3n83hLihjldE2cNqq93YcDk13y7Tpb9Y=;
 b=j3vsRGcIuozBSexgrIj+QJ5PodPQs3LzTWVC0+xBZ7+8ZFiwHRaMm6HZIMqI05j1N+
 RRrNieKzr64tNvFAeU74l9E8pPAQ4tsAxfRsMI3FVuOpnZyWXS1/nA+QVRF6OwWVNGiv
 pIjjV1tjMhodzLCuRq4Ks7xEdUpJpuCD2A018vOjdBlAlVfz0FcX7SFFD4wSjUpGZ9vh
 E6uD4zydwIyCa0ES97+5PsCwf5Mm+8+HKS4J5Q7dd2xpWEs/cIel0ctA+0YL3hJPMneZ
 9QSeNoobLQV5izDo5dmCTOV+zY8rZ/zRUVKmuHkgo4hnFzwS5bxf0mwQhEzGvn05z9B/
 HktA==
X-Gm-Message-State: ABy/qLb/MigiCWk2/qe+f63KY0ms4NexMZFt3HVJn1ymbvdSi3HQuDUB
 IQfvI2pMgGZdQLxAGSx2KCE3O0GBQuE=
X-Google-Smtp-Source: APBJJlFrqNCUwm8zow88al/SNPi8bi2iBkt98n7q2Yo/rJDLZHU/kYA/Yb4duSI6DwoZZV29hb/GhQ==
X-Received: by 2002:a05:6808:1a90:b0:3a1:cd90:2c40 with SMTP id
 bm16-20020a0568081a9000b003a1cd902c40mr15150296oib.26.1689199284670; 
 Wed, 12 Jul 2023 15:01:24 -0700 (PDT)
Received: from casantos.remote.csb ([187.113.213.17])
 by smtp.gmail.com with ESMTPSA id
 l11-20020aca190b000000b003a3702dffe8sm2331929oii.45.2023.07.12.15.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:01:24 -0700 (PDT)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 19:01:19 -0300
Message-Id: <20230712220119.1531498-1-unixmania@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689199285; x=1691791285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XStAikKUQRn3n83hLihjldE2cNqq93YcDk13y7Tpb9Y=;
 b=XC0DNfABxOcwMnXEtW2EC0uRDVyBXRRxHCr3Palxf3bCw1At4M7tvBbb5XlRMld+sv
 vol+MIIu+/rIIY9TkhjhZEbNo0K+Bs+8IERVIlv/UqfpsRxhqB6Jz3pMnJAycDY2Gs5U
 aSF6MeNWsS7gy1ozpBkYBKhKkNMdr+6CuJdfAnV+T4etmjgiL23WdmtjkvG7cFBGdTzj
 Y8epN1B+0syBxcgp3UEzB6+KvPPdmeMuRra0IMVmuZYAO40dj8Oym4iGrWKgqv15DY/5
 bOmpvPF3BLEIf/CLg2FwEyMT8jc1Br8w1tEeCppinzpwEVh1P2R4JXhkkdY/N4Pqs1BH
 xH6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XC0DNfAB
Subject: [Buildroot] [PATCH] package/qemu: add option to enable tracing
 (default no)
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
Cc: Carlos Santos <unixmania@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Carlos Santos <unixmania@gmail.com>

Tracing is a development feature for debugging, profiling, and observing
QEMU execution. It does not make sense to enable it by default, so add a
config to enable the "log" tracing backend (the default one). Options to
select other backends may be added in the future.

Also pull a patch already reviewed upstream to install the trace events
file only if necessary:

    https://patchwork.kernel.org/project/qemu-devel/patch/20230408010410.281263-1-casantos@redhat.com/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 ...-trace-events-file-only-if-necessary.patch | 29 +++++++++++++++++++
 package/qemu/Config.in                        |  9 ++++++
 package/qemu/qemu.mk                          |  6 ++++
 3 files changed, 44 insertions(+)
 create mode 100644 package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch

diff --git a/package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch b/package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch
new file mode 100644
index 0000000000..0db9a6b647
--- /dev/null
+++ b/package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch
@@ -0,0 +1,29 @@
+From 5c43da1e4983cc3c209b325a5228b6149e0a0ccf Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@redhat.com>
+Date: Fri, 24 Mar 2023 21:40:22 -0300
+Subject: [PATCH] tracing: install trace events file only if necessary
+
+It is not useful when configuring with --enable-trace-backends=nop.
+
+Signed-off-by: Carlos Santos <casantos@redhat.com>
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ trace/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/trace/meson.build b/trace/meson.build
+index 8e80be895c..30b1d942eb 100644
+--- a/trace/meson.build
++++ b/trace/meson.build
+@@ -64,7 +64,7 @@ trace_events_all = custom_target('trace-events-all',
+                                  input: trace_events_files,
+                                  command: [ 'cat', '@INPUT@' ],
+                                  capture: true,
+-                                 install: true,
++                                 install: get_option('trace_backends') != [ 'nop' ],
+                                  install_dir: qemu_datadir)
+ 
+ if 'ust' in get_option('trace_backends')
+-- 
+2.31.1
+
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 6fb34a0dae..8d53ced300 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -106,6 +106,15 @@ config BR2_PACKAGE_QEMU_FDT
 	  Say 'y' here to have QEMU capable of constructing Device
 	  Trees, and passing them to the VMs.
 
+config BR2_PACKAGE_QEMU_TRACING
+	bool "Enable tracing"
+	help
+	  Say 'y' to enable the "log" tracing infrastructure in QEMU,
+	  used for debugging, profiling, and observing execution. For
+	  detailed documentation, see
+
+	  https://www.qemu.org/docs/master/devel/tracing.html
+
 endif # BR2_PACKAGE_QEMU_SYSTEM
 
 comment "systems emulation needs a toolchain w/ dynamic library"
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c530896fa8..a020dd5226 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -159,6 +159,12 @@ else
 QEMU_OPTS += --disable-fdt
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_TRACING),y)
+QEMU_OPTS += --enable-trace-backends=log
+else
+QEMU_OPTS += --enable-trace-backends=nop
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_TOOLS),y)
 QEMU_OPTS += --enable-tools
 else
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
