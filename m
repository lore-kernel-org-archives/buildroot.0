Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86640C35FE5
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 04:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B71606FD;
	Sun, 15 Sep 2024 04:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PHvkRGNzP8a; Sun, 15 Sep 2024 04:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 483F0607E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 483F0607E4;
	Sun, 15 Sep 2024 04:09:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A61E21BF383
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0FE54070A
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ou44WJc240lm for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 04:09:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CB2D405E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CB2D405E1
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CB2D405E1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 04:09:54 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a09dd37ceaso811725ab.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726373393; x=1726978193;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1QOLspOmn0NprOk75F2layCPSKaXB6uNOBGcW2NccYg=;
 b=NNy20P41IwGfBa1tX7E4Jcc7OByR56sB2SwLogB3PnRWD2JxoTSG8knbFVwe2Af6dv
 Nz0gHsn21kANvHeG2yj8/oIjCxM0albbMKxZ0ma/OnOspJt6v0Wodm+a1CLc4xqHgcZj
 GanNBzGX+X7hWJ7NG6/BIYDeDOFf98c85h3Zo0MkDSruSvhSjNxd2NV1hvFYz6NvrbBo
 8u3BH/b6DKspy4uGD+9D3SwhU3O/eis74z7Fww2mupNC0cDPMx4yKkEjZxgZSUt8dAK3
 LiDmXiWLAV/G+lbh8uYNwyTTLsC5oETbdJqm0a65ddQ5TuZLVWuRprAYd/4PDmeB5gLy
 klfw==
X-Gm-Message-State: AOJu0Yw5go3c+d1URNa956VUTU6C5WIbKpTEOfb2cENv8h/Fc4EGnfgu
 wL7/xsCm71/hZtxywaEsDt2XbISr8Mye1p7xqb1gvV4YTcPDQ5ZJ+8nj2g==
X-Google-Smtp-Source: AGHT+IHiTo/pLcrFql3Wm+hgvFXOimiZL3QaO6GD+Sm5drDa79NxfA8G8HlvOoSqVDrVi0lyFDwm3A==
X-Received: by 2002:a05:6602:3429:b0:82d:96a:84f4 with SMTP id
 ca18e2360f4ac-82d1f8a8e0fmr1184485939f.1.1726373392974; 
 Sat, 14 Sep 2024 21:09:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed59866sm725203173.170.2024.09.14.21.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 21:09:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 22:09:50 -0600
Message-Id: <20240915040950.1386719-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726373393; x=1726978193; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1QOLspOmn0NprOk75F2layCPSKaXB6uNOBGcW2NccYg=;
 b=FR35k1Wa/EukZ8xzHDVq0IZ276RcTieM4wN5M0Mm4yRjWCIlEn59dRpFlYO7sJbo9N
 LjXRihKM3d4t1CMCG+x5j1Jb0rjLnpo5Y5nQV8j+WQHcWVsY3TaOMo08qQXXUP2p0xQv
 9GIq20QnPVsmMjlJ5H3G/kGId3fIFBRzTVPmQOPtFKFLjCkmbcKHIQrPtxQP3KY9MwiE
 ajW7GoNUMrI9sSSL5wi5GsEEz2xOgKQvForFprlTiccLtL7kT92sOH7FHdmeAh7+1cEc
 Wtq9sU/wG6m+ss4BhMnVwC2B0Qn2DHVh2T4hytMnYiKA22g37EGm0E/QSQKzPkiVXJSg
 MerA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FR35k1Wa
Subject: [Buildroot] [PATCH 1/1] package/python-contourpy: bump to version
 1.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/contourpy/contourpy/commit/7dbbd8b259eebd41d89e122d3366fb287ef01040

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-contourpy/python-contourpy.hash | 6 +++---
 package/python-contourpy/python-contourpy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-contourpy/python-contourpy.hash b/package/python-contourpy/python-contourpy.hash
index 8f23d107ae..8902607ec8 100644
--- a/package/python-contourpy/python-contourpy.hash
+++ b/package/python-contourpy/python-contourpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/contourpy/json
-md5  cae5b781ade023c01bc1a8a53312f2ac  contourpy-1.1.0.tar.gz
-sha256  e53046c3863828d21d531cc3b53786e6580eb1ba02477e8681009b6aa0870b21  contourpy-1.1.0.tar.gz
+md5  81447a2ceaf933b28db04d02086a22ed  contourpy-1.3.0.tar.gz
+sha256  7ffa0db17717a8ffb127efd0c95a4362d996b892c2904db72428d5b52e1938a4  contourpy-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  c2522156ba7d4dfbbec266dfea98bf76a69bc41edb18cad323177fad6b19b35f  LICENSE
+sha256  c7d0a153bffaa104044463ebc633793d451722efd3138b5ffd2527b40f1505a2  LICENSE
diff --git a/package/python-contourpy/python-contourpy.mk b/package/python-contourpy/python-contourpy.mk
index f305793cb2..3804fce8c3 100644
--- a/package/python-contourpy/python-contourpy.mk
+++ b/package/python-contourpy/python-contourpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONTOURPY_VERSION = 1.1.0
+PYTHON_CONTOURPY_VERSION = 1.3.0
 PYTHON_CONTOURPY_SOURCE = contourpy-$(PYTHON_CONTOURPY_VERSION).tar.gz
-PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/a7/3b/632c003e1dfbc82d32c0466762f2d2cf139d26032626dc65944e38d0e5b9
+PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/f5/f6/31a8f28b4a2a4fa0e01085e542f3081ab0588eff8e589d39d775172c9792
 PYTHON_CONTOURPY_LICENSE = BSD-3-Clause
 PYTHON_CONTOURPY_LICENSE_FILES = LICENSE
 PYTHON_CONTOURPY_DEPENDENCIES = python-pybind host-python-meson-python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
