Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FD6C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 21:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6DA981EB4;
	Tue, 28 Nov 2023 21:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6DA981EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24ZQRC6XUVP3; Tue, 28 Nov 2023 21:48:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F92881EB7;
	Tue, 28 Nov 2023 21:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F92881EB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63BAD1BF38A
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 21:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45105404E1
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 21:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45105404E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sbzD8CMEsE2B for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 21:48:47 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 398ED40341
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 21:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 398ED40341
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b472f99a0so19945085e9.3
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 13:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701208125; x=1701812925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qcSFQqSbINkeLBlnn/Ko7ZuiJql/H78DLcpl+2dm8wk=;
 b=TlXFsCBdplZLqiT4YXr+IMkNBe8cQnO1ykt/evs5F2FjLqUCag9hcQmK9sJLL7eTx8
 928JzAvDBEAHEwtNjpHqk+3IAvz2UPWsEGpaybbE1yGJN7lXceezrvNrf80ZoJJQ4Pf+
 a7x5tjx/Ap0SLgGwIcqYQsVPVxRhUdvDPiFjSeZWrQr05/m3RxFI6CGQUbHDQfz1EGGN
 9de+TrOWa/UB8FCj49hIfh415zMn2VY/67+h3LxBPzp0w3uvXlyluLU2eq9BjCJMXJsL
 /hVV47u72JrZsJSbIJHLMgiYIGrToSks0EXDz1eG9/kvJmZlBjZ/muUl7QhDDN9Hvsoi
 V0Kg==
X-Gm-Message-State: AOJu0Yxj1ROtGlfpOwGf+H1TRBN29A9vkKJQt+qxK1bv78RpjosCBhlu
 M+SygIG1QZ7xWiOTZaEQfrOD0TDNOLQ=
X-Google-Smtp-Source: AGHT+IFdcIvWegoqmJI5DUP1srWlH/VTwa0vkGNPOzPCCZf89zu1qBnJWgc94WciqP1c+tyMd802WA==
X-Received: by 2002:a05:600c:a46:b0:40b:26d6:f538 with SMTP id
 c6-20020a05600c0a4600b0040b26d6f538mr13619153wmq.41.1701208124839; 
 Tue, 28 Nov 2023 13:48:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5304000000b00332eb16d215sm12853320wrv.23.2023.11.28.13.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 13:48:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 22:48:41 +0100
Message-ID: <20231128214841.1045878-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701208125; x=1701812925; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qcSFQqSbINkeLBlnn/Ko7ZuiJql/H78DLcpl+2dm8wk=;
 b=Pe+TxICH9A3RGJYex93Ey7DRfGFJQwKfVVxwbew3CiKMk/g0cCYls4PTPNLwrGWZVb
 6eKjju6fKRxEHfVlJsylGzDtozipWCB/H2gBqwTSb+t9o/mncqB63m65cw8HgqCzcdDk
 a9Kr8uiFlOG6WDFocsbfCAoHHEas1uK9odTaapWCM7UpVXnnasasmoFcjnn789D0PYfz
 GaeIA52lFi/KyAdoZwFLhOb6IF/LtyybcN4fXwEfsVX6OfIubzLJujmL+ZJa/cJGBP66
 f4y3syLLMLe4Ca8Wsd7V+bQ3vBiHnDx49vaqRIOanDI3iW10eozvSJtfNKe+uld7Xf92
 QC9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pe+TxICH
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: fix build with
 smartmontools
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with smartmontools raised since bump to
version 2.20231002 in commit 68de45491ba7d4b7aeff6f869934745440f88c00:

 Compiling targeted policy.33
 env LD_LIBRARY_PATH="/home/thomas/autobuild/instance-2/output-1/host/lib:/home/thomas/autobuild/instance-2/output-1/host/usr/lib" /home/thomas/autobuild/instance-2/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
 policy/modules/services/smartmon.te:146:ERROR 'type fsadm_exec_t is not within scope' at token ';' on line 237472:
 	allow smartmon_update_drivedb_t fsadm_exec_t:file { { getattr open map read execute ioctl } ioctl lock execute_no_trans };
 #line 146
 checkpolicy:  error(s) encountered while parsing configuration
 make[1]: *** [Rules.monolithic:80: policy.33] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/a01123de9a8c1927060e7e4748666bebfc82ea44

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ervices-smartmon.te-make-fstools-opt.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/refpolicy/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch

diff --git a/package/refpolicy/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch b/package/refpolicy/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
new file mode 100644
index 0000000000..ddf2943bfa
--- /dev/null
+++ b/package/refpolicy/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
@@ -0,0 +1,44 @@
+From c6d1345732c463cb45d8ba490081ad92936bfd69 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 28 Nov 2023 22:30:01 +0100
+Subject: [PATCH] policy/modules/services/smartmon.te: make fstools optional
+
+Make fstools optional to avoid the following build failure raised since
+version 2.20231002 and
+https://github.com/SELinuxProject/refpolicy/commit/cb068f09d224f90a97fa63a574fb423bbe1ceeda:
+
+ Compiling targeted policy.33
+ env LD_LIBRARY_PATH="/home/thomas/autobuild/instance-2/output-1/host/lib:/home/thomas/autobuild/instance-2/output-1/host/usr/lib" /home/thomas/autobuild/instance-2/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
+ policy/modules/services/smartmon.te:146:ERROR 'type fsadm_exec_t is not within scope' at token ';' on line 237472:
+ 	allow smartmon_update_drivedb_t fsadm_exec_t:file { { getattr open map read execute ioctl } ioctl lock execute_no_trans };
+ #line 146
+ checkpolicy:  error(s) encountered while parsing configuration
+ make[1]: *** [Rules.monolithic:80: policy.33] Error 1
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a01123de9a8c1927060e7e4748666bebfc82ea44
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/SELinuxProject/refpolicy/pull/738
+---
+ policy/modules/services/smartmon.te | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/policy/modules/services/smartmon.te b/policy/modules/services/smartmon.te
+index 32c80f712..761280c11 100644
+--- a/policy/modules/services/smartmon.te
++++ b/policy/modules/services/smartmon.te
+@@ -143,7 +143,9 @@ corenet_tcp_connect_http_port(smartmon_update_drivedb_t)
+ 
+ files_read_etc_files(smartmon_update_drivedb_t)
+ 
+-fstools_exec(smartmon_update_drivedb_t)
++optional_policy(`
++	fstools_exec(smartmon_update_drivedb_t)
++')
+ 
+ kernel_dontaudit_read_system_state(smartmon_update_drivedb_t)
+ 
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
