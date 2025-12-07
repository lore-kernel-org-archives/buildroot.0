Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40516D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 646E440708;
	Sun,  7 Dec 2025 16:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZgSc8uLuF6a; Sun,  7 Dec 2025 16:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A675740686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765124409;
	bh=nrh4ZFLyhZ39npJNaEiGe8xQX9K6xkKl5R1kz9oui6s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I7DSLVmwThqM/lFB7GumHkD1LMtLRaQKaRBoHK1oQsV7dk8DqR5oDkgrmfZ+b2+hy
	 9hyXxlXUaidkX05JoIVFyVMoQ4PmSkzAyCVyPQiiOK6iGDOb1BZSfEcFLMk+ilhKNn
	 pVh4sWUlybloqnMX+DbhkTBigPUt2RTOLXqY8BIDOa4tVGI4rB8iDXhJg7VxgDK4sZ
	 UH7B1TtudQEM/z1ZVGQFG/vRFj60yqHJ6pZNpeZHKiTxHm/1Q9yvVGBNh9TBdRasFQ
	 lqXuw4IUiXaI4QNhSm3OUlfB89TtLC3JY6BY2IZaDJ/wYvDirVX8chILeL7g4I5dxI
	 1uyq1Ijs8PNdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A675740686;
	Sun,  7 Dec 2025 16:20:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E7B4151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FABE6067C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qp0dqJsxW1jW for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19B766077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19B766077B
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19B766077B
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:20:06 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-64180bd67b7so4775487a12.0
 for <buildroot@buildroot.org>; Sun, 07 Dec 2025 08:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765124405; x=1765729205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xXnT0Q8zE3QDYaYf2huEIXLYhhX73EUjobjoWYlT2Cc=;
 b=WDuBmTin4jy7ZtOM5s1a4ld5Dg6QJtcWBG4ukIcMcnQyH6UchoX5+x5Z0wHdXZblVL
 9Dvpyi8nFbREyAwcXPgAY0isatSB3US5cZrJwvsHx2hTfBxNa0xqDPsDROa2E5KDsxnD
 7GPFmmaR81dyBvOWS5YlJb7KupxEF5ubCyuoe18Macrhg/cTQpRk3nimWAf/qVCxpxMR
 uhTP702LAFTOelcqI8vjOf7BrOFZpEnW6Rl8W616hux4jKFlAxrr+rRuclaOevmCOLhp
 6sK8UABT0zosZEFYatTDCnGLvSE9c8nTDvHAalT3pbEQGLVCixUuegY7IZO2GHjloUPo
 NMvg==
X-Gm-Message-State: AOJu0YzMCW1Lf39qXEeVtfo/xmdIHGzfs3Q13LCj4ZJNEW2l+hTlFxV7
 tf27kGW20Wg7ZaYgrWukK+LK8VORGX3ydnEuaR0HsS3BiPHlYwqdJRvZ5cLGjTjvMjaNyTsxPJW
 4RXK9
X-Gm-Gg: ASbGncuX1OtZqW36WnAoDngY2+1qAtDUIovRI+siiGxXnHoCGqXshlI6sIApmTS8V8K
 tv1RPbdeXugcdmBxE+DLSNfq4YH7YPXio8YXe9qf7xyPpgtPVC6lJKeLQ9svMJ1LoWh5On6ZDfB
 vZG5VcylddGwY0YovKnhTUKfaNIqP1tRrymKMaNTa6T6Azoypqny4o14GUQxKDfTdaqfrfgMNFT
 J7HjvZIhGETo6bJD8AGhrBTxb4gjxmZU3ST8G43SWa8nVvyo60pIOQtPD5fY/RxtgdvrJyVNRev
 R3QO98Ddd2Ia626yiaQ/oUB2ElayOz9KlMXDydLP+DfEf97TCv4uQOmBw4M1gEAiXyzph6jNXeD
 Ss9R3nx5UA5C1hbLg1NY2AumYHSM+pNxnvcHAaN6KV3Ie4c4/eabfqp6UUuT6EH9tkjuXaPhUCj
 8vnB665v/G5heZfnQ1he8Xbq3yVsAMlRSVwu1oHEg0l2oW4ab75tQqSQ==
X-Google-Smtp-Source: AGHT+IElrQs71EywUu+AZrv1aisdCR0CgHh/1MG5ycchaNNEMophfBOiqxLUgAX48C57mMbiYOI0oQ==
X-Received: by 2002:a17:907:1c84:b0:b76:694a:b0ca with SMTP id
 a640c23a62f3a-b7a243df5eemr584577066b.27.1765124404581; 
 Sun, 07 Dec 2025 08:20:04 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([109.54.117.180])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f449d181sm900711766b.26.2025.12.07.08.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Dec 2025 08:20:04 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun,  7 Dec 2025 17:20:01 +0100
Message-ID: <20251207162001.12754-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1765124405; x=1765729205;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xXnT0Q8zE3QDYaYf2huEIXLYhhX73EUjobjoWYlT2Cc=;
 b=iR8q6uvlwivKB/POHO4d3CBLODHElxnqN6qRYOj7984JUMtl6lDdVGtuqao+aWRt0L
 FVaOLrTAefycHYeqDkNxoxH4lv/2CqEx/E4L1+chGGGOj+gnjhw+Rt/Js8uoEBzwaysj
 21YRIqyF/Oez6R+d57ctVDgsYKrwFg0qy4VEQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=iR8q6uvl
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 0a71218a3008..adb21b66c74e 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  a5b8109da3c169802f51a14d3bd1246395c24bbca55601760b0c96a3c0b2f8fa  armadillo-15.2.1.tar.xz
+sha256  8ee01cd4da55bc07b7bc7d3cba702ac6e8137d384d7e7185f3f4ae1f0c79704f  armadillo-15.2.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index ee218dda3447..cb83ee9e178b 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.1
+ARMADILLO_VERSION = 15.2.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
