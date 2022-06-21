Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C58C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 21:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5649C8454A;
	Tue, 21 Jun 2022 21:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5649C8454A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRbPsfrEhVi1; Tue, 21 Jun 2022 21:34:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 761A384543;
	Tue, 21 Jun 2022 21:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 761A384543
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9F521BF2F3
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 21:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9230E61120
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 21:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9230E61120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F_AA_RHiqKOI for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 21:34:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 304A86111E
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 304A86111E
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 21:34:27 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id e40so8610526eda.2
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 14:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YFSpXsNGmCKy07WRnOB64Yju/K+XoKrOZzVlJM9jdRU=;
 b=dzu15BWeVrzgpn1jzfrMYbtoSPiV7e6SMGrJzu9VMq7Ib2Lx1f2WnEru0dzyMhJdV1
 KVBu/eMYP+JUvoOq5LqJFtbdJnu/cdCv1aL2YxSsuejAH465578+5gq7w6KcWtftzudE
 NZNUM8rUcHyZhSm7eS8rHOiFujxa4N441v734kzWZeN5upOyAuaEgBTa1KBniEHfYajz
 1BC+D3mIlXjccyNgAlNsqR4dqrVlP/tVioEsGPN01pH1OH2AT/nET1z7G3jQwvlM4YeH
 AjwXKX67jn1SPUGeNsCiBm2uUAJd+tZ89bGn/WGMH64++/hdw3KvOnGVzo4oeceHlSNT
 9dXw==
X-Gm-Message-State: AJIora/rpRA+9N6Zy9tDYWhyn7zK+6pryniTtZuyePWAT+Td02+F/5B/
 zXbGIO4eQiOB3u0UqanLXykQNE7IClPclQ==
X-Google-Smtp-Source: AGRyM1sr/AacO31sJfYXxB+4gFcLPqfxHRa7P8I9ZS5j8VX7EsIytqUdbmFbpf/mb7LWn4d4O5US6A==
X-Received: by 2002:a05:6402:4390:b0:42e:b7e:e9ac with SMTP id
 o16-20020a056402439000b0042e0b7ee9acmr144485edc.97.1655847265337; 
 Tue, 21 Jun 2022 14:34:25 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 2-20020a170906328200b00722dceb3f8bsm2305140ejw.151.2022.06.21.14.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 14:34:25 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 23:34:21 +0200
Message-Id: <20220621213421.2192237-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YFSpXsNGmCKy07WRnOB64Yju/K+XoKrOZzVlJM9jdRU=;
 b=GbwsYjGjDfRvAZ43ArHj6MsnQgM7VrxSuEY9kgSgbvJ4Nvy/Lhn0gc9B4t6oxNbZLq
 WR6885ExWF2hHt971xePT6QzBoMJyPhCToev4Sze+QykF1onFOVkCgUktNpcdQ13PO8z
 KoOKR62i9adb8t80cWngMI+7nDlbC6p26Og10=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GbwsYjGj
Subject: [Buildroot] [PATCH] Eckage/python-web2py: bump version to 2.22.5
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 3f781a7016..dbf85437f2 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  a779adc5626999c854e9abc976296c2c1059bf6988a421c0bfba923f9b08d8cb  python-web2py-2.22.3.tar.gz
+sha256  d4a15fc15254d3fa9e9e9b5a726ae51a0989b7d740d53fd7c3d5b81ac6b8274e  python-web2py-2.22.5.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index b1897978af..b9a4e95609 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = 2.22.3
+PYTHON_WEB2PY_VERSION = 2.22.5
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
