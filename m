Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5E3C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 21:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DC1D4109D;
	Sun,  7 Aug 2022 21:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC1D4109D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sb94YkouFBKg; Sun,  7 Aug 2022 21:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA94409FB;
	Sun,  7 Aug 2022 21:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BA94409FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA031BF368
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 21:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFEDB60BDE
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 21:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFEDB60BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SgWT6KrlXIIS for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 21:47:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0EFE60B03
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0EFE60B03
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 21:47:06 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j7so8967473wrh.3
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 14:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=0M8gONQ9jT21qYKPticOnRuXF9QoNqX4A7/NdCZ/yJc=;
 b=jW2pg3qpqs1TsT/607R1j9NopqcSycmN9uDIcROf34LFCTvB5uVSLKTdJzjJ9S1xkA
 dxq8rNmcLqm/mMWY51Ttb3zbg5cMq1dK+AfSW7ZoHzTyO+JjHahVHJFyxHy7HVCIZ8VF
 E3oXsY+iWbF3xNbornVkkb4mImU2hFD+bYU2I9qHPqy0V39TSuwkVUZj+jtKQcbTeQwL
 KtWVaxN/9+C09CcPGeYQkATnSTS/czEmFDizxc9Kuwq/fWhvOqxhwzgLQ1AG+H7vhqC+
 apD4otDUIYEbRbw17GeSOC/SqR7AcU0TwlrDJB/8AwF2OYYjmKRPP/EJeprioippZG0f
 rdNw==
X-Gm-Message-State: ACgBeo2g57NEEC9AUMREKowLH2PVGd/dKU8SJR7nrZ4gRqsWy0nTYPXv
 q22SleUHw0+s5oVIwW3JyADlGosaQ2E=
X-Google-Smtp-Source: AA6agR7b91tMLpSgp902YAvjlcAjm+JTpYGVhCwIwHtg2358xeQupxhijDSXeJbYgfsh9ztYjcV6Aw==
X-Received: by 2002:a5d:4fcc:0:b0:21f:dd9:df09 with SMTP id
 h12-20020a5d4fcc000000b0021f0dd9df09mr10242853wrw.294.1659908824535; 
 Sun, 07 Aug 2022 14:47:04 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003a4bb3f9bc6sm19529037wmp.41.2022.08.07.14.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 14:47:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 23:46:57 +0200
Message-Id: <20220807214658.191628-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=0M8gONQ9jT21qYKPticOnRuXF9QoNqX4A7/NdCZ/yJc=;
 b=LhdiaCVqKMZXwXVVZC6VU3rEP5yAf0toQawPywExGqpeH9OYniiLhjZGHI/q3q4vPn
 /paa2SFpkK45tmK7gz2FlwjGCv/fsMGh1XMvCZeNVlUStAiBBMsECVng4VZ3ggb2wEK+
 W9nszdnF0O5DjTfnzb+EhbGCmgDYMwo0wKIkJb75fEMm7YHsHfa6BQKn5zp/kPhGLndp
 8ELvVUOoAewnvfhdaCA+AwDs+SIR0e0DA5gI+VOJ5DqM0s8sd52OrwEQO8dhYzaAR1WS
 qXdV5gWr1RTk3JNenLXtguFtq2xq4tjGbNlSZUn9AQo3IoUmMqNZIrzyHuVXVurVaZYp
 wlyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LhdiaCVq
Subject: [Buildroot] [PATCH v2,1/2] package/ocrad: fix license
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ocrad is licensed under GPL-2.0+ since version 0.24, here is an extract
of https://lists.gnu.org/archive/html/bug-ocrad/2014-10/msg00000.html:

"The license has been changed to GPL version 2 or later for better GPL
compatibility. GPLv2 and GPLv2+ programs may use the library now."

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Gilles Talis):
 - add a patch to fix license 

 package/ocrad/ocrad.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index e037a08195..914d53a59c 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -7,7 +7,7 @@
 OCRAD_VERSION = 0.27
 OCRAD_SOURCE = ocrad-$(OCRAD_VERSION).tar.lz
 OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
-OCRAD_LICENSE = GPL-3.0+
+OCRAD_LICENSE = GPL-2.0+
 OCRAD_LICENSE_FILES = COPYING
 OCRAD_INSTALL_STAGING = YES
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
