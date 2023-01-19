Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DFDC004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 14:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08925610FF;
	Thu, 19 Jan 2023 14:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08925610FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K8A6cpyjovC1; Thu, 19 Jan 2023 14:34:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B3960864;
	Thu, 19 Jan 2023 14:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B3960864
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1262E1BF372
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 14:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F02B140B87
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 14:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F02B140B87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMRauYcRJNjb for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 14:34:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D57E4400D9
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D57E4400D9
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 14:34:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so3734354wmb.0
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 06:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fy4o0V/8AaRQIERK8Z3lVBwdSBVN8aC/Gl1KcOckCwY=;
 b=dC50izAbdmrz+pV/9V6RGSX8qjChZd7QI4jvIKlRHNFPs6FC+rXvBydNzi5oQUMUgC
 INdWDm4AXG1lRUqN3/UJBYgN8Yp/jkugoysXhEFiOxVXWkzi9l+CAW1VawdW7Kq2Z9pX
 XjI30AtWU61cuydhTPgRBQ+KKDNAs1SZN700vc09eEjdyde8XEBmRK25pTmjptCiLAXK
 2R3QQMaSij8oDbUY7lk+KEfaGji7c4Pl037s5PGb5h0VbDgrDoQwBgt+92rJ5np1mc/x
 asqOgPf/C9aLRwCcc9NGha/4hpaysrkIYbnHEuLYKn6P7jQTMthDtdlkABNO2cFlDKdu
 Njyg==
X-Gm-Message-State: AFqh2krkAu2cTMuBuZGXaCOlAdVcYpGppO/ThVx7sUn9qU+R9ow+GJps
 whBTwBnLRfO8/v6cDTTkr4/SaoVZa+OPMEDZ6Wk=
X-Google-Smtp-Source: AMrXdXumF+qmGx3+1RcZMmequ/PsjtA3+gy9BhZo/WFWfzdcolJIGsp8VWPSPPTQZ/YWx2aw3y6tMg==
X-Received: by 2002:a05:600c:1d0b:b0:3db:88f:996d with SMTP id
 l11-20020a05600c1d0b00b003db088f996dmr9534438wms.36.1674138858886; 
 Thu, 19 Jan 2023 06:34:18 -0800 (PST)
Received: from localhost.localdomain (ip092042140082.rev.nessus.at.
 [92.42.140.82]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b003dafadd2f77sm5924441wms.1.2023.01.19.06.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:34:18 -0800 (PST)
From: Daniel Semkowicz <dse@thaumatec.com>
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 15:34:08 +0100
Message-Id: <20230119143408.1911081-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fy4o0V/8AaRQIERK8Z3lVBwdSBVN8aC/Gl1KcOckCwY=;
 b=4KY36JVfvrZZlWSxFG978wnId1rG3KE3EMXIEyjXdKUXDvPkq2zlcuEvjwYm9tRXGs
 hGbZtvhHwtekJQa7hIAzLF9xSWzXJ72RnDPgFrXc6Y0Ip1t6m1l/sau5YDCt7suOlnW6
 lMVNJO0ZU1pHk21bPvwJ6SwhUp+t7H+9hGCk7wB9t1HSSJW6LfziO0a9DETmkviuurvw
 1sMlJwzARXwlJVHUk8KYS0t1kZsOxdkH4Dw36TtLYCZ3aZedqwZaUX8ISj7OiC5Xsh04
 KikV130/ik3n/p/5etOXSmG7Ky/lO9aEF88cDpbEThxZEPOffS3F5XW42NpjNJyBo8mt
 dHNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=thaumatec-com.20210112.gappssmtp.com
 header.i=@thaumatec-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4KY36JVf
Subject: [Buildroot] [PATCH] package/libcamera: Bump to version 0.0.3
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
Cc: Daniel Semkowicz <dse@thaumatec.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libcamera recently started to version the software, so use the
version tag instead of raw commit hash.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 68c9c1f005..033e318910 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  59318208a9c1b183cacaf5a7175568d8a9fa094f2dd8c9794269bb6e9636986e  libcamera-ba6435930f08e802cffc688d90f156a8959a0f86-br1.tar.gz
+sha256  d7100286616550aca487b46ae9de2a70bb471352a332b8214901b4148739990f  libcamera-v0.0.3-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 9c03d3a3b3..8979a43aca 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = ba6435930f08e802cffc688d90f156a8959a0f86
+LIBCAMERA_VERSION = v0.0.3
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
