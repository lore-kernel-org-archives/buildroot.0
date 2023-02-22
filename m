Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1E9C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC0E060AE7;
	Wed, 22 Feb 2023 22:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC0E060AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RyfCTHELNMNL; Wed, 22 Feb 2023 22:08:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 256B360A93;
	Wed, 22 Feb 2023 22:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 256B360A93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 587AA1BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B238419BB
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B238419BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNlPBVSVT7Os for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:08:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3EC44175B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3EC44175B
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:08:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id p16so4720941wmq.5
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:08:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P4x+L+wvuNsbwCTiecbybpXgGNKfjVhjoevmYaVTLZI=;
 b=I+jPQrAP8bFPZx2w6GLJXFlmTXqd9XG9OeP0yJLjT10n3BRS3j6e0es9YcXbnuRf7L
 KjvxEdgSuxd1YsAxi+oS6QuhnRv+Dnja6JjiNRuoGUZj7p31TmElVUpuOQtR9p4GN64s
 G/hDafWOXCw7gGDWx0xcLXpy/XtHFsBp5Ci6oVxkneKeDct/g6/OZmgHBnwvbPC1JQ/J
 yqC5ABNls8T1NUpDhpJUii9gKms3l5Qo+SrkF9eB5hoaG+pBKUKVeHpS5U5fPpiu3vUO
 TsV0OZgdh9FRu8GurdGJxebqkUXMj5WPVM0MI6ut4vuGRwayTsGEWfPrNJIPLZc0UZNY
 hEUg==
X-Gm-Message-State: AO0yUKXnnIqCP/drCS9qMdDND86ywnzDDjfa02l2hB/ncQxJXcHTMXn/
 k4xOO6Jh0sD9kDJlLa4HcwNfz2ZbTYg=
X-Google-Smtp-Source: AK7set/zbFvdM6nVYWT7XLimwgU/IaP6IHOKPXsXwvD8OxQogFh0nfa6uWKr5jlnNn8k6TrdXBLybQ==
X-Received: by 2002:a05:600c:43d4:b0:3ea:183b:a525 with SMTP id
 f20-20020a05600c43d400b003ea183ba525mr506798wmn.36.1677103720770; 
 Wed, 22 Feb 2023 14:08:40 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m22-20020a7bce16000000b003e209b45f6bsm7287904wmc.29.2023.02.22.14.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 14:08:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 23:08:35 +0100
Message-Id: <20230222220835.355342-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P4x+L+wvuNsbwCTiecbybpXgGNKfjVhjoevmYaVTLZI=;
 b=P+g8auCC5sVXD4J5XrKFcR4LCKBLZz+AgPdI1tuhMvdO1B/OeBvfxF1R7PfzWg2aZ2
 k6rYkFWO0Yp5BID9Q+MxJZ2Af8QiMK/kpWekTWbnZR+WqCzd9Djc7OAwUpT4vpZ61E8R
 fC2HSWX6CS5h6qenE/0cxzsQf9kqVEWrHbvTVy9uzMmgadvrlWRS/TVqA+TScRrj8tCQ
 QsvNb8VCx9m1WyA0mYSvkhwcUq6mwBD7KZYHE/+p/QgWIKE7WsouH5fM1NTol6wRNbG1
 SJR3ZbRJ9LQ3GszqelYVxfgqJmFw04j/m7L0+3m85tuvi3FOrp2P/0wFsyiGcdrBrm0Z
 R41w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=P+g8auCC
Subject: [Buildroot] [PATCH 1/1] package/optee-client: fix
 BR2_PACKAGE_OPTEE_CLIENT_TEEACL
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo added by commit 917a961d9c77d5f1aaa47206add9b9ff80e74a82
resulting in the following build failure:

-- Checking for module 'uuid'
--   Package 'uuid', required by 'virtual:world', not found
CMake Error at /tmp/instance-5/output-1/per-package/optee-client/host/share/cmake-3.22/Modules/FindPkgConfig.cmake:603 (message):
  A required package was not found
Call Stack (most recent call first):
  /tmp/instance-5/output-1/per-package/optee-client/host/share/cmake-3.22/Modules/FindPkgConfig.cmake:825 (_pkg_check_modules_internal)
  CMakeLists.txt:43 (pkg_check_modules)

Fixes:
 - http://autobuild.buildroot.org/results/e1c6b5c9e841a003037045b2ff7afd9836e7c640

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/optee-client/optee-client.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 311ca191b0..ef113c838f 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -27,7 +27,7 @@ OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_TEEACL),y)
-OPTEE_CLIENT_EXT_DEPENDENCIES += host-pkgconf util-linux
+OPTEE_CLIENT_DEPENDENCIES += host-pkgconf util-linux
 OPTEE_CLIENT_CONF_OPTS += -DWITH_TEEACL=ON
 else
 OPTEE_CLIENT_CONF_OPTS += -DWITH_TEEACL=OFF
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
