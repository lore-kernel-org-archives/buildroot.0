Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FDAC7EE3A
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 07:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB46E608C9;
	Thu, 29 Aug 2024 07:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLvKqnmxHkdz; Thu, 29 Aug 2024 07:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF78260E06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF78260E06;
	Thu, 29 Aug 2024 07:50:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C33C51BF422
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 07:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDB8360E06
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 07:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tz3EJZVhnPM1 for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 07:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=fede.evol@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A198608C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A198608C9
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A198608C9
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3718706cf8aso221787f8f.3
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 00:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724917819; x=1725522619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZsdDG4VESllPuu2FepJj89ZUnAzLXl2ruEynjq7lJc=;
 b=axSK78LEf6Z/FLCM9tGv7drabuiK5fdRxc8U+f8AGwh0pECP6+Ltm5gu9ec3rVGdoX
 t4eUxKOZqp34r6f3kDWKPDJjhkSwc6juoyCWhJTGmws5Q71RZv6PVgku8yETbWyWBhYQ
 /kflXLlO5+LJmwGNBLocS/XlsLpHmGaJ3DPLg9gu+M4ZJsQ2s+EivgyuRgdjlKc5XQ/B
 feYLxNo9CwYTgVdR8nYvW2gDw4rJuaJ4+fnkQGztlSLo6OKXU0R7f8dKQ5GOQbMQGMmr
 cWtkMkwW5NM6m0KM+VddordwzG6ieMdeLurUgJFFa9smQYtf1j1n3UluAf2hAmG3Igih
 I0RA==
X-Gm-Message-State: AOJu0YzeWoMtsbh2oRbRI6iZss2LcFSvcZvwmAIXhNDGwxm9ixr9aYma
 atmK7rAYDVL6u5dIm4M8LTaumPaSz2WFpng3aOi4JFxHDlod9mrGhUkuqA==
X-Google-Smtp-Source: AGHT+IHi6E9KjdLhTuWz1XZAAP26cgYzL1hcUklnBVzKNmdVY1g1JlnQqZKbWQVh/eoxAcQbmLQBzQ==
X-Received: by 2002:a05:6000:144a:b0:371:8af5:4742 with SMTP id
 ffacd0b85a97d-3749b52e4camr1186217f8f.3.1724917818480; 
 Thu, 29 Aug 2024 00:50:18 -0700 (PDT)
Received: from rawyouth.fritz.box
 (dynamic-2a02-3102-6876-004b-e606-e5b4-3658-7151.310.pool.telefonica.de.
 [2a02:3102:6876:4b:e606:e5b4:3658:7151])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c188sm722790f8f.55.2024.08.29.00.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 00:50:18 -0700 (PDT)
From: Federico Pellegrin <fede@evolware.org>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 09:50:15 +0200
Message-ID: <20240829075015.39164-1-fede@evolware.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724917819; x=1725522619; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=pZsdDG4VESllPuu2FepJj89ZUnAzLXl2ruEynjq7lJc=;
 b=BtGrnyupmF+FOj0uUkrEvyu+4VAS8cEIA28EQHkR8/njscRF2HuhVzHsDhq7V3NsYK
 StuM5OHQGtsZlcnAkBQRqYGaiEdqxGoK52KCajEHPWy/ABauuR8H6J58s9YGzH1xCg8x
 ykJc4x2dae2y4L+9HKJPwOT90AFOoihRXq6WKRhAvB+LYr0qUhNq3Kbxjw8gr+1s1XSs
 ckAHAN0zs41Tp+3lB5v8giNkJRKxykAXQqHpoI2DrD86+M+Ux5L3o2uG4tXIwkZAnFzS
 HJyR3/dmibUiN0hKb7CDEgyn0vqpaJH/yVO+Rt8+WHA5kgwRD5rj2+uJmsadZO4low0B
 8VTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=evolware.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BtGrnyup
Subject: [Buildroot] [PATCH v2,
 1/1] package/netsniff-ng: fix install when building in parallel
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
Cc: Federico Pellegrin <fede@evolware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building in parallel, the package will randomly fail in
install phase due to a missing make dependency.

Already submitted and merged upstream:
Upstream: https://github.com/netsniff-ng/netsniff-ng/commit/36f5b55b2aabe16e8c17b8e95a5b69327d3266f4

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 .../0002-Fix_post_install_deps.patch          | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/netsniff-ng/0002-Fix_post_install_deps.patch

diff --git a/package/netsniff-ng/0002-Fix_post_install_deps.patch b/package/netsniff-ng/0002-Fix_post_install_deps.patch
new file mode 100644
index 0000000000..e34fa2229c
--- /dev/null
+++ b/package/netsniff-ng/0002-Fix_post_install_deps.patch
@@ -0,0 +1,49 @@
+From 18e111e06f5eaf074f1c1e0cff79a0e72dce7590 Mon Sep 17 00:00:00 2001
+From: Federico Pellegrin <fede@evolware.org>
+Date: Wed, 28 Aug 2024 06:23:35 +0200
+Subject: [PATCH] build: fix install dependencies in Makefile template
+
+post_install should execute after do_install otherwise when building
+in parallel (-j) this leads to sporadic failures of trafgen stddef
+header, since it is installed in do_install but then post_install
+does a mv supposing it is already there, for example:
+
+```
+  INST	netsniff-ng/netsniff-ng
+  INST	trafgen/trafgen
+mv: cannot stat '/tmp/a/pref/etc/netsniff-ng/trafgen_stddef.h': No such file or directory
+make: *** [trafgen/Makefile:57: trafgen_post_install] Error 1
+make: *** Waiting for unfinished jobs....
+  INST	netsniff-ng/netsniff-ng.8.gz
+  INST	trafgen/trafgen.8.gz
+  INST	ether.conf
+  INST	tcp.conf
+  INST	trafgen_stddef.h
+```
+
+(it is visible above that the stddef.h is installed later than the post
+is trying to move it away)
+
+Forcing the order of post after do will guarantee that it will be there
+when it needs to be moved and it will be safe to do a parallel install.
+Just relying on the ordering of the $(1)_install definition is wrong and
+dependant on make version (and luck!).
+
+Signed-off-by: Federico Pellegrin <fede@evolware.org>
+
+---
+ Template | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Template b/Template
+index 056f594a2..54b597291 100644
+--- a/Template
++++ b/Template
+@@ -12,6 +12,7 @@ define TOOL_templ
+ 	$(Q)eval GZIP= gzip $(GZIP_ENV) $(1).8 > $(1)/$(1).8.gz
+ 	$(Q)$$(call INST,$(1)/$(1).8.gz,$$(DESTDIR)$$(MAN8DIR))
+ 	$(Q)$$(foreach file,$$($(1)-confs),$$(call INST,$$(file),$$(DESTDIR)$$(ETCDIRE));)
++  $(1)_post_install: $(1)_do_install
+   $(1)_install: $(1)_do_install $(1)_post_install
+   $(1)_uninstall: $(1)_uninstall_custom
+ 	$(Q)$$(call RM,$$(DESTDIR)$$(SBINDIR)/$(1))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
