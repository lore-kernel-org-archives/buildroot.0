Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BA3C83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 22:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 095C381583;
	Tue, 15 Jul 2025 22:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9S_NndsQ8Tw; Tue, 15 Jul 2025 22:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D2FC81570
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D2FC81570;
	Tue, 15 Jul 2025 22:53:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 575B8DCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 542AA81295
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0hjaqylXYaW for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 22:53:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 636E88130E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 636E88130E
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 636E88130E
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:53:39 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-875acfc133dso245759539f.1
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 15:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620018; x=1753224818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IupnRXlSMKNz3CIEes40KXhlqNiazK/PZZjfiSIQr08=;
 b=Fw5mv2Ptjo5eTEhxji/JibbJ2r1olZZmjMLrWF8bQwiiCfvJRN6c2ttG+cLWNZ5/j8
 tXfWoiW8Q7kdpeNnS6UP1N22hqtCMX2W7Jw6lFc/SYZ0pUm2fL/hnVr8EuiJ8vc/Gwqm
 V7qWAs1mCC5IXNN2ToLoF2kwqW2CL7H1plP9ouhBmP0q3nh5g0uQPoOIGk11kf7xmDcl
 r+ptR11QWwUNQ4Z0KsUluEunpJepAwCnRdSHG+yZhJ3OQIJ1ZCfPHmt/CuE5XU6ljw3Y
 aVGj9CeswrYcYwHoA7/8HRQmvsRLezZxlkK3blI0isYhSqxaRtX2SBfN7eZ1nQmp3zhD
 U8KA==
X-Gm-Message-State: AOJu0Yzzt/c5Vvq5/5pp7KHpA0UlapOHbjGYVhJG+3USObL+IQwMdlMn
 kUBusYiT036oUVKyz3FV4vbysZTzkdV5iN6xvFpPCDcKhwg7GPdFdx9YFZutkfy/7Jw=
X-Gm-Gg: ASbGnct4OyklvYKs+xHsSPRfbIdL7NUNURuwWg+1F7pWetub615sB6+CHfVn/Xm/QGw
 l3fyLTMQJ9cEMDaKbkvKaYitH1YMdJfwOxP8hkZySYShBFinr6CNUJRAtOq3ZoBUJkiudhx0N81
 Fla/FSF5GoCNKssdG047Ksdz+dgoyHfNdmwL8M/yv/bDxF7QJRebU6pYwG6vvo+s6C+i6Aoen0Q
 xVfpltEs9/HlcqPz62VHJwexZde1k1BIrUuLVFuTECKYfohT8xUFW/uBFSadvX815TxyWhJHOFt
 ePJZXtaq3/yt1xJj698Bnno400z9Mgz1VJLk9ccOmocAuAm9XhxS6girOVACYv4GraXJLsf4Ezf
 T72iGwvYVNecNaJwAtoQEM9o2HjKxcpN1dYFghpuJKXwR9zEQy7Etmx4VIKMJKH393YMDTz/rXZ
 BQypp4oVk=
X-Google-Smtp-Source: AGHT+IEjJIH4dvVZ49/75N9ZJl5sNu4o6K04C0grVxA2rSr5CXA8PqNSO10jZtbIka4fpIASaoQ3jg==
X-Received: by 2002:a05:6602:8005:b0:864:68b0:60b3 with SMTP id
 ca18e2360f4ac-879c2b7625bmr22997139f.12.1752620018112; 
 Tue, 15 Jul 2025 15:53:38 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8796b8c3a1bsm334568639f.5.2025.07.15.15.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:53:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 16:53:35 -0600
Message-Id: <20250715225335.747969-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752620018; x=1753224818; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IupnRXlSMKNz3CIEes40KXhlqNiazK/PZZjfiSIQr08=;
 b=UbOJjlME/SOG5ofXFXm7JV8i5ZdqJnd5e/lRGaSdsCwc/FBgtYowmzuLVmyxZ6ljvS
 S9eKB0WwvEIQf3Bx4jI5aBwM9o1Q1CiYjof7YceYqenDlVSv5qkeFMXr6qi1JNV70V2i
 GzZAd0qxkEnwNro2TLsCAO7SuZVa38wEL+XGJ0cAw0jXKYayO2VeTg776y7syokUNXJy
 W68kZuALWsB8/XhSiMZ+feZtcTIpGeFLgk/KptkajBAyoyFdK0feVRVd661BuQl26sIP
 Dgz2KZvuANfOowoAW0yxqhiEOSCLmM/ogZ518K1ppfpZ7djP4XlN3mjvzvW5WD8YbWIl
 LNXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UbOJjlME
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-scm: bump to
 version 8.3.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required host-python-typing-extensions dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index f2bdf8a208..9a1c6f0262 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  d8046dce093a94dc382b68b45f6a6257  setuptools_scm-8.1.0.tar.gz
-sha256  42dea1b65771cba93b7a515d65a65d8246e560768a66b9106a592c8e7f26c8a7  setuptools_scm-8.1.0.tar.gz
+md5  35e09656d091a94b27f9c50b383b32c5  setuptools_scm-8.3.1.tar.gz
+sha256  3d555e92b75dacd037d32bafdf94f97af51ea29ae8c7b234cf94b7a5bd242a63  setuptools_scm-8.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index e646147785..8bf879082e 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,16 +4,15 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 8.1.0
+PYTHON_SETUPTOOLS_SCM_VERSION = 8.3.1
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/4f/a4/00a9ac1b555294710d4a68d2ce8dfdf39d72aa4d769a7395d05218d88a42
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/b9/19/7ae64b70b2429c48c3a7a4ed36f50f94687d3bfcd0ae2f152367b6410dff
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517
 
 HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = \
 	host-python-packaging \
-	host-python-setuptools \
-	host-python-typing-extensions
+	host-python-setuptools
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
