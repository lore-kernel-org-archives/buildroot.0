Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7265FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 20:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2E534057A;
	Wed, 29 Jun 2022 20:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2E534057A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TNtHZohM5_yV; Wed, 29 Jun 2022 20:21:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A20164098F;
	Wed, 29 Jun 2022 20:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A20164098F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0460B1BF2A6
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 20:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D273341561
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 20:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D273341561
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p78SmnWWgHj4 for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 20:21:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8ECE41506
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8ECE41506
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 20:21:07 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id o4so20177415wrh.3
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 13:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZrXeT/FbHUEyuSCRZLJDXGBpAPBY7LOeevT0ex4Mxsg=;
 b=oSCTvKXaGjoEmKRGsqO4mGkAuDmJ4ax64e7UmZ5P4ZyPFOoQzRe79wtioLBpmq2Atv
 12EINXg84F+QtfNdHgU4vq/bcx21VYzhWZFcdTyXMGPFnNMxf5ixiVOCgsfiEd6Amv4f
 rq3vCmtMY2Z9ZMm1qPlb63czUq+er72aSYqc/9CFtJmddbPGgEv1hn0n79IipQt4fMTT
 eKkyxr07J1JkvtIBJFDfLDRq5MnTKV2pKlQIkBf8LT4JoVEMW1D2BYWuPQxPNCUExX0q
 X1FlJBO3LTn02KfpztK1lP6yGcVG9RNUQQkeiVMfLNBdSm2aASoW80C0wOWMlGKSIKsW
 JH6w==
X-Gm-Message-State: AJIora/jktXgLoY1EjIZKPDDAJPuUmvRVhYLGnWV/LAsYpF6LHt2+Hl8
 3TF6O6F/zSegapvUiKw5fGvU11/ce90=
X-Google-Smtp-Source: AGRyM1tX/b8pBTYBv4W92T8zvBeWpw/QHq7vtTS9BHlC1KX+qDKXeWlHMlg5FJ0h+1zaIeqPte45oA==
X-Received: by 2002:a5d:6d46:0:b0:21b:933d:7950 with SMTP id
 k6-20020a5d6d46000000b0021b933d7950mr4886209wri.679.1656534065533; 
 Wed, 29 Jun 2022 13:21:05 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c19d400b0039c4f53c4fdsm161787wmq.45.2022.06.29.13.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 13:21:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 22:17:56 +0200
Message-Id: <20220629201756.571047-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZrXeT/FbHUEyuSCRZLJDXGBpAPBY7LOeevT0ex4Mxsg=;
 b=BBnxchC4vx6+iYXqwKu+wpLE1PlgfMgU44ok6s+OwO3rZBV8cqW6qQgo74hrUPufXT
 vsx6FY8R+sR+wTg7Y26gCbtTlYD0tCtenZptjw4WeZWKsf/35DpJrskaOnF5JUnGY+m9
 u1zK4CjZ/pOmw+6svMhLvk+ltvYeqYbiJXUjkf3umqXRGhh4a6t0Qz//TywCjmIC5Blc
 N3tqRTczCZE+o3lEOrEY2+DqdWa0YaB/Cbdiz0rM45Un49TBvEaRPHPpbyyCrux+o30y
 rLopEAqm6QsVjE6uAayRTvt2NAlOeBmpf2+HqXygYN4y2Z2Krca+u8qingmZHSi4dSrw
 tMag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BBnxchC4
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 9.56.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-2085: A NULL pointer dereference vulnerability was found in
Ghostscript, which occurs when it tries to render a large number of bits
in memory. When allocating a buffer device, it relies on an
init_device_procs defined for the device that uses it as a prototype
that depends upon the number of bits per pixel. For bpp > 64,
mem_x_device is used and does not have an init_device_procs defined.
This flaw allows an attacker to parse a large number of bits (more than
64 bits per pixel), which triggers a NULL pointer dereference flaw,
causing an application to crash.

Drop patch (already in version)

https://www.ghostscript.com/doc/9.56.0/News.htm
https://www.ghostscript.com/doc/9.56.1/News.htm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...05-Fix-typo-in-non-forked-lcms2-code.patch | 28 -------------------
 package/ghostscript/ghostscript.hash          |  4 +--
 package/ghostscript/ghostscript.mk            |  2 +-
 3 files changed, 3 insertions(+), 31 deletions(-)
 delete mode 100644 package/ghostscript/0001-Bug-704405-Fix-typo-in-non-forked-lcms2-code.patch

diff --git a/package/ghostscript/0001-Bug-704405-Fix-typo-in-non-forked-lcms2-code.patch b/package/ghostscript/0001-Bug-704405-Fix-typo-in-non-forked-lcms2-code.patch
deleted file mode 100644
index bb1227f687..0000000000
--- a/package/ghostscript/0001-Bug-704405-Fix-typo-in-non-forked-lcms2-code.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 830afae5454dea3bff903869d82022306890a96c Mon Sep 17 00:00:00 2001
-From: Robin Watts <Robin.Watts@artifex.com>
-Date: Fri, 1 Oct 2021 12:44:44 +0100
-Subject: [PATCH] Bug 704405: Fix typo in non-forked lcms2 code.
-
-[Retrieved from:
-https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=830afae5454dea3bff903869d82022306890a96c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- base/gsicc_lcms2.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/base/gsicc_lcms2.c b/base/gsicc_lcms2.c
-index ccf1d7051..9badb6dee 100644
---- a/base/gsicc_lcms2.c
-+++ b/base/gsicc_lcms2.c
-@@ -462,7 +462,7 @@ int
- gscms_transform_color(gx_device *dev, gsicc_link_t *icclink, void *inputcolor,
-                              void *outputcolor, int num_bytes)
- {
--    return gscms_transformm_color_const(dev, icclink, inputcolor, outputcolor, num_bytes);
-+    return gscms_transform_color_const(dev, icclink, inputcolor, outputcolor, num_bytes);
- }
- 
- int
--- 
-2.25.1
-
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 95305a5e06..ca26a38a02 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9550/SHA512SUMS
-sha512  3646b7981dced443559ba97c74c08463139e86a5479661e4dcd217c51e3f8e766da9cf4d7889a98ba3c079a17e9e5b452cc765b633e0720deab2337e77efdd09  ghostscript-9.55.0.tar.gz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9561/SHA512SUMS
+sha512  f498384af80654c040635564b8bc9a64c4bb5b0769bb00aade4042bbe9117c482362dc1a1fac72db3ce9487dd5a5bb8fb81b35b360680fe598df33dfbbe79499  ghostscript-9.56.1.tar.gz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 02cb35fcfc..5bf8b08966 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.55.0
+GHOSTSCRIPT_VERSION = 9.56.1
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
