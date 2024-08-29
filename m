Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BE5C7115D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 02:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED1B86072A;
	Thu, 29 Aug 2024 02:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bs9eYn-3kGu8; Thu, 29 Aug 2024 02:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04AE960A93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04AE960A93;
	Thu, 29 Aug 2024 02:31:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 117E31BF859
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 02:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2E0A402E5
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 02:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykTCSwyiSFGy for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 02:31:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fede.evol@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2AE8040179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AE8040179
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AE8040179
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 02:31:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso1234545e9.0
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 19:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724898684; x=1725503484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXIZMZwOC1q4WfhseICtPDLPYlTWlaMKgo8VHkI3qTw=;
 b=UziIUE9l0zRD2vexTwu8l0bcs19v9nCrDQ/E31Q937T9EXqyAhExlQbdcm4e6Arg1B
 JLsGgTuOXDTJLj/rd/OfqGYwbLLhMoPnOq4gGZDau1B8KfKip712DcUtgl64cdc+FoRa
 IaHNdzc12vDGUkMScsnL3aBEIwqHndSLWktJrEnJRyebzNxpuPKD/Q2mj41jFcjnVkou
 /84FzH1AP34sddXCWq/6FUKI+6FtDpUqpTYJxPgvM1W7ALQ8wixi4cit8VDsGSZBuhd9
 SeNUXxGS2uy+iJnnUwtoWrxz+KtgZFeV3st1liK4YDxTyrRN3xbBZs72p38LVXEmhR87
 CIew==
X-Gm-Message-State: AOJu0Yycyjh6eStRCX+Mx9SbhyBFwL1Ax58G/NoDCToPY7gvvLqHjHtn
 YxXXzepcqN7TCl42dfJ1PVanWrCM+sHYtayJGFjJkZvjyplvsL3ANgJrLQ==
X-Google-Smtp-Source: AGHT+IFlbrRvcTHLmATYWUl5w3HbuwBt3+c2tHAP0okO2BcO2wHSwhLVegyNVtGr2e305qIC9uhKdw==
X-Received: by 2002:a05:600c:4ece:b0:426:58cb:8ca3 with SMTP id
 5b1f17b1804b1-42bb0263758mr10042875e9.21.1724898683339; 
 Wed, 28 Aug 2024 19:31:23 -0700 (PDT)
Received: from rawyouth.fritz.box
 (dynamic-2a02-3102-6876-004b-e606-e5b4-3658-7151.310.pool.telefonica.de.
 [2a02:3102:6876:4b:e606:e5b4:3658:7151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba63abe8bsm36095215e9.26.2024.08.28.19.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 19:31:22 -0700 (PDT)
From: Federico Pellegrin <fede@evolware.org>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 04:31:15 +0200
Message-ID: <20240829023115.8437-1-fede@evolware.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724898684; x=1725503484; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=TXIZMZwOC1q4WfhseICtPDLPYlTWlaMKgo8VHkI3qTw=;
 b=IAPQzmn5ImWZe99Jm5VmXz1CNoTYquTmcJhoz7R6EczyyDYjSBt5gIKA7heTEN7kTb
 DN2LZ3mthura6vI7BjlSprgFASmtdVs2+iBCG8mYBjitpC+v4E6HdI9FqIjyCHWfud/a
 SiFCc/yh3Johv5JR2VuY/8HdZyWONBkLG9nF1bKQ9rcP7F9VHMAlACKQ7HLEmRrfPH8B
 2OgRT1zRy25qZNWrsJLKZLyVWEdN4oDv9lBkqjQhkixzYhV2RW5dQrykpYBkKTzd2Cmc
 kKcPgy9lz3lHYhzuSd0u5RghoxdQuCMT+qqtJzbpgrScvgs8XZJ0x0aP3oiSLkEs4IVg
 A3kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=evolware.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IAPQzmn5
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: fix install when
 building in parallel
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
https://github.com/netsniff-ng/netsniff-ng/pull/239

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 .../0002-Fix_post_install_deps.patch          | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/netsniff-ng/0002-Fix_post_install_deps.patch

diff --git a/package/netsniff-ng/0002-Fix_post_install_deps.patch b/package/netsniff-ng/0002-Fix_post_install_deps.patch
new file mode 100644
index 0000000000..9ed0744491
--- /dev/null
+++ b/package/netsniff-ng/0002-Fix_post_install_deps.patch
@@ -0,0 +1,46 @@
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
