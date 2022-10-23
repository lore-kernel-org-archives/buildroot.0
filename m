Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B144EC433FE
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 11:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A718186E;
	Sun, 23 Oct 2022 11:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60A718186E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDvhnSuh_-GH; Sun, 23 Oct 2022 11:49:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 781E7818A7;
	Sun, 23 Oct 2022 11:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 781E7818A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C44921BF951
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 11:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACCA981775
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 11:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACCA981775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vpa5xBo261IM for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 11:49:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE68181772
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE68181772
 for <buildroot@busybox.net>; Sun, 23 Oct 2022 11:49:13 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so4876362wmb.3
 for <buildroot@busybox.net>; Sun, 23 Oct 2022 04:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uYdoS55rO0nUYuUOsRlPm2+u5QaHBEluIXQj35uA1D0=;
 b=St7k4qcchuhlPo70oC59yldzkeAOyHJIW5wIC0el3aFc0NuMP8Xghi9iGGpgzSpYOR
 8Bh6a3/uyZY5aJX55MqrZGPLOXH/XRYyHWPiaewK6jfzVukQdr+UqU18rGynJFbdk7lu
 pNFLVp9sAdBOK73Y/u65YiH+Ku+Lls/d8C20PZ26IMwG8lEPDeJdkM6UlhAXUS8UQS0/
 gK1JCwXjWyCweKVkfiTaYDFNhbjgbcekikQJ1+SwONyuURh3IMxvPKB+OwU2jf4B04du
 dgAYArx0hHbdpuHfYJzZV0vqh7kDX6LhMiW12FKJRBdz3KTMOznQzWKRlAITtxelYZz0
 ZTyA==
X-Gm-Message-State: ACrzQf1bVa6LDrZ0o/IBy2IuyND2oQijubdZkIg80j4vAoTzLlUpzMRm
 h8BkARhBfWG1Wm6yWo5zKrtM/yMHUlU=
X-Google-Smtp-Source: AMsMyM7u/F2EqvOdKTTqzhBvtiGYm+hI82L2jdtfT0YRoE3d4uG8YzyY/19IEJK6EawKsLIeaqlSeQ==
X-Received: by 2002:a1c:4405:0:b0:3c5:8b6b:1efc with SMTP id
 r5-20020a1c4405000000b003c58b6b1efcmr39875552wma.192.1666525751806; 
 Sun, 23 Oct 2022 04:49:11 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 e42-20020a05600c4baa00b003b4935f04a4sm9307845wmp.5.2022.10.23.04.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 04:49:11 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 23 Oct 2022 13:49:08 +0200
Message-Id: <20221023114908.505511-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uYdoS55rO0nUYuUOsRlPm2+u5QaHBEluIXQj35uA1D0=;
 b=Z19Tc+i3dm9sTQXkqB8J4RCN47beEXWbanTSrkJ8M8Lqk+VQ4uvm26KdmNKJLW2v/s
 TyoNSMTa0ThPGZxwgsd2zpzp0nfrNG33uqYz47epGqnNd/6GV4/md5R1JRlx4nO7D6ZD
 uY6uOwH4adb1U82AhM57RvoQokuTt1DV8ybOkCq0GwgfAqq4igv3m1sewjRpnuRXdFdS
 4DZzr70iKHe+ojBUUCE23S1y8lDwVhEdWJ4wuC/N/QsQa4UdJ3OvX/eqBDrDrboOjydQ
 aEsw/HgH7JOsxO2nDlkOM2CrzChes0E2dT98C+hSGW0+QfkzXYKt3UuaGhnZmE9sxeV4
 hEhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Z19Tc+i3
Subject: [Buildroot] [PATCH] package/luajit: bump to
 6c4826f12c4d33b8b978004bc681eb1eef2be977
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/0001-no-bin-symlink.patch | 4 ++--
 package/luajit/0002-install-inc.patch    | 6 +++---
 package/luajit/luajit.hash               | 2 +-
 package/luajit/luajit.mk                 | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/luajit/0001-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
index d32ec5ad6..dc36fa58d 100644
--- a/package/luajit/0001-no-bin-symlink.patch
+++ b/package/luajit/0001-no-bin-symlink.patch
@@ -6,7 +6,7 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -44,8 +44,7 @@
+@@ -45,8 +45,7 @@
  INSTALL_MAN= $(INSTALL_SHARE)/man/man1
  INSTALL_PKGCONFIG= $(INSTALL_LIB)/pkgconfig
  
@@ -16,7 +16,7 @@ Index: b/Makefile
  INSTALL_ANAME= libluajit-$(ABIVER).a
  INSTALL_SOSHORT1= libluajit-$(ABIVER).so
  INSTALL_SOSHORT2= libluajit-$(ABIVER).so.$(MAJVER)
-@@ -60,7 +59,6 @@
+@@ -61,7 +60,6 @@
  INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT1)
  INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT2)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
diff --git a/package/luajit/0002-install-inc.patch b/package/luajit/0002-install-inc.patch
index 5f6547fc3..8de777dce 100644
--- a/package/luajit/0002-install-inc.patch
+++ b/package/luajit/0002-install-inc.patch
@@ -10,8 +10,8 @@ Index: b/Makefile
  INSTALL_BIN=   $(DPREFIX)/bin
  INSTALL_LIB=   $(DPREFIX)/$(MULTILIB)
  INSTALL_SHARE= $(DPREFIX)/share
--INSTALL_INC=   $(DPREFIX)/include/luajit-$(MAJVER).$(MINVER)
-+INSTALL_INC=   $(DPREFIX)/include
+-INSTALL_DEFINC= $(DPREFIX)/include/luajit-$(MAJVER).$(MINVER)
++INSTALL_DEFINC= $(DPREFIX)/include
+ INSTALL_INC=   $(INSTALL_DEFINC)
  
  INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(VERSION)
- INSTALL_JITLIB= $(INSTALL_LJLIBD)/jit
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 648d6eb18..d00cea4ee 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e0389c7669f8e455383d8f0c9d9354d44cdd1885bbf8fd0d4bcdb8fc6f794063  luajit-5677985dc1f19cf0a67112f4365c7fb79237fa16.tar.gz
+sha256  19a911fdd77af69e48fa50749606a9009696f543cc88e898b4480d8d3c8828f5  luajit-6c4826f12c4d33b8b978004bc681eb1eef2be977.tar.gz
 
 # Locally calculated
 sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 2c1e3216e..c79f18bf6 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 5677985dc1f19cf0a67112f4365c7fb79237fa16
+LUAJIT_VERSION = 6c4826f12c4d33b8b978004bc681eb1eef2be977
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
