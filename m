Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442D0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 09:54:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B71B61051
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 09:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B71B61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D09D1605CC;
	Sat,  4 Sep 2021 09:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFw-ApXIYJJP; Sat,  4 Sep 2021 09:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38663605AF;
	Sat,  4 Sep 2021 09:54:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B68A1BF836
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 09:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37A8A425D7
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 09:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7IjguXJ1MTy for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 09:54:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 634A9425C5
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 09:54:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d6so1481589wrc.11
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 02:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jx+lRHbDWEjZ4zR/sMHoHWSq89sAd+YK4tIsaJq2UF0=;
 b=MdhYtgaKXtO2EhFi4LSwEP1gMDD8adWZSYl59PnwPi3zZ9S0EGfwW+6wxFJtIkns/v
 31aZ8N5LqNCOwXG6l6Izk4aUtCePIamL4Wzr3ScNQFePoQrZMW+lLOoj51kP3J38dYi7
 3fVWrkdin/+1jGQAFFRUwg2IdRsLOV4k3OtzEE14G8knxCVQyxn31Em0/NlBlQOrwj9M
 QSQAhGcHjnwBxYb4QJ2h9nl9e5ZvsDiD8q7Tl1/z80er23UZ2PlG3XwJZw+lfTR5GOCc
 e5QEf4sRkanyUHxVskfLVmNbewnlKillwP2LSdAwAha/GL9mF6XsVuDqKuENaNfJqN1W
 +4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jx+lRHbDWEjZ4zR/sMHoHWSq89sAd+YK4tIsaJq2UF0=;
 b=VAD/bgSNbH8BCutjFsXtelB81nUhWKZCMsJhapMm1HAeO13v5xNZsMGI7gHE/fCtUr
 aSjcR0Mj8hT+9y5RAJY5vF2HNtasHqX5UAGwi3RNk+n1sTJ7cXswa/BBubimtGirUIHv
 noLMEIc+hc9fnHfg3RyfTpvA2iVDuJLc+jHZPnJNzOM2OIJw245EPNofBql5WeSNRzCT
 uBPiQdDzDBFNrDmvh9Zj0ne6Pk4HpxIQwblJKEe9KjofKH254CAoD+WQje9JihLcq68R
 prJ01v7W+5sQ6ALUuew16OSbCi35Oy4yFFJofmpvA06xycLLe5/giZwiit1dLfjQBZ1Y
 qcsQ==
X-Gm-Message-State: AOAM530lv8/MtMEq+A4EIIS3okSozdPfJiBYbZuk8txdJc1G6ZBJIK3Z
 Qaog/DUA3d1J85QqwnvN/OBmhi4sHCywUA==
X-Google-Smtp-Source: ABdhPJzhhQ/bxZnVmLbf78RcSXq1JsxrsYqz3DNnZkMG5c0YniLOe5AkqkxS1RMeKI7nYQybikQvjw==
X-Received: by 2002:adf:ea4d:: with SMTP id j13mr3271006wrn.86.1630749248218; 
 Sat, 04 Sep 2021 02:54:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id n66sm1640676wmn.2.2021.09.04.02.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 02:54:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Sep 2021 11:54:03 +0200
Message-Id: <20210904095403.1519090-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvirt: fix build with lvm2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

libvirt needs a lvm2 standard install since its addition in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1 to avoid the following build
failure:

../output-1/build/libvirt-7.4.0/meson.build:1831:6: ERROR: Program 'pvcreate' not found

Fixes:
 - http://autobuild.buildroot.org/results/dc9af7a677af7e53c1240ebbee5b0edc84c8cf52

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 1b420771f5..847c35e06e 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -166,7 +166,7 @@ else
 LIBVIRT_CONF_OPTS += -Dselinux=disabled -Dsecdriver_selinux=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LVM2),y)
+ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
 LIBVIRT_CONF_OPTS += -Dstorage_lvm=enabled
 LIBVIRT_DEPENDENCIES += lvm2
 else
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
