Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E200CCE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 12:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83B1C60AB0;
	Sun, 24 Sep 2023 12:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83B1C60AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIERed-Ppfpc; Sun, 24 Sep 2023 12:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE51260760;
	Sun, 24 Sep 2023 12:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE51260760
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6171BF3EC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8435E60760
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8435E60760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_l046uz8C1c for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 12:31:02 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB6E560739
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 12:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB6E560739
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32003aae100so4069644f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 05:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695558660; x=1696163460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lxZkL/XoL08jSh7WGiG+AS9qgdGXL6p76HmoKljVq+g=;
 b=Xs3KcTZU1ObbZJ+l81tecqdn5OOgmaUlw/mdKPc7dCm8aWcLfnnRT3a8cNoHylMfFq
 YULCnX61eME2Gv6Jn3Otu6gtqVwDO0KgSuvAh670Zk4CUrGGHfjkjs1uGfufBHOUWVbm
 BrcVJR+Nt8KMeFsFxnHM4Wtt6fqKwaOTcX4RFs7ZTy6kySi+PUrf3YDHG9jIf1jONQx7
 WJeiqo5EtXxyBSMqm/JTRvwoJQAx1IdsmDsnhrQO3c95SgDzZXqxjYBSVniiDncQmspb
 1uc6OQaUM5nszJt9z001d9gDRYH3rtgOegKbXD3JHU6M7qHHewIEx2Eh1/zUh0/7YikI
 pgwA==
X-Gm-Message-State: AOJu0YxpqmPlMHlrcl45of0ML9LHigBAnwecs367AwIgHCKJqd4LQk3d
 PhHBt55bjIDaKQ1tWP1ZOQYZkx5AxyM=
X-Google-Smtp-Source: AGHT+IHjYlqUY9KeM/hUSXnPONwe1WfNOwVhnWgYvOXtd6e86Hu2Dey+6EhFivvHM0JBF2xHrJj0Ww==
X-Received: by 2002:a5d:6682:0:b0:31f:fa48:2056 with SMTP id
 l2-20020a5d6682000000b0031ffa482056mr2895126wru.27.1695558660279; 
 Sun, 24 Sep 2023 05:31:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p5-20020a056000018500b0031c855d52efsm9160980wrx.87.2023.09.24.05.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 05:30:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 14:30:58 +0200
Message-Id: <20230924123058.147461-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695558660; x=1696163460; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lxZkL/XoL08jSh7WGiG+AS9qgdGXL6p76HmoKljVq+g=;
 b=fbpoDpKUrJ5IoJ91X9Db1b/ayJeEWzbs/YKS77LBr5Xr9hE9jnGC1EgBwg0zxBk0Vs
 ucVbayDOjY07ZwPb8arvJORRJRgVEsV504gV8qsRM0qdQiGol6EVMNsPfHIxLYAhoxon
 7TueEDZngvGeYS1BBVEj4AuMhbaqBAPgluqD88uAUNwIuOQSBk/UzHadKnP3n7dQW9Ls
 3mXDPqoERmS1mzzsAIxIYNlPhWuUryPL+BRE1wWSRXMV1LQqPLd7zt3nDwwu0daiyJmg
 9ia/uvrhFRVbPkXfLh+8OkNySC2mgQ+vq4GhXcfGGZc9L0sereF/9BSpkCUF8KkC+loT
 mQGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fbpoDpKU
Subject: [Buildroot] [PATCH 1/1] package/ndisc6: bump to version 1.0.7
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

https://git.remlab.net/gitweb/?p=ndisc6.git;a=blob;f=NEWS;h=34d9a653087a8e89f595156a4ec69969e5ca3013

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ndisc6/ndisc6.hash | 2 +-
 package/ndisc6/ndisc6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ndisc6/ndisc6.hash b/package/ndisc6/ndisc6.hash
index e258382c53..550b9fffac 100644
--- a/package/ndisc6/ndisc6.hash
+++ b/package/ndisc6/ndisc6.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  a713210e9be1f15cfa0809f4c2728b00cd5f25881d7585126986982055453cfb  ndisc6-1.0.6.tar.bz2
+sha256  edc431d70510d7321a5a39d243de0d0f63846dc9145b3b549c7348cc2bc96609  ndisc6-1.0.7.tar.bz2
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 23734ca7d7..d797b82e65 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NDISC6_VERSION = 1.0.6
+NDISC6_VERSION = 1.0.7
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=c11" LIBS=$(TARGET_NLS_LIBS)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
