Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E2BC5DF79
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 19:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EADE440674;
	Sun, 16 Aug 2026 19:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66zNefrhzC3G; Sun, 16 Aug 2026 19:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AB3340687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786907882;
	bh=dEOAlRocTA7bTjUdhOwUWgEFuPiHH8LA6ZpDOPJ/vN4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A1H353xk2hDW0FzBA7b7mccO/lbLff/jh2afF4ns7yO9/ehgHeAZc59aGwu7Px9FU
	 2TIuLtfLtAlJuCtZoSVmuF9mqZqhdmWRVuC9fDGKo/QsvqMrbZdo9FirLoGq93YNUm
	 YY9PuqeOeCrfvE1qrKHK9mjYZJ31rzyVjWF4fbRp185tzZqPUZC35grgxRsOP/feoh
	 LGnRg34GL6sBZmgVntljaZprhRL3XO/VinW95NDmbqPJj465rGoOfF4QjHEwgiV3Kj
	 Gz1tJ0NjUCZsM2TCUmHG480WJNpJq1ce4/d5lyuJ8MBWgYeEr8iYVrinmCTkw4dlfV
	 i7MtJwbZPhgNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AB3340687;
	Sun, 16 Aug 2026 19:18:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1A5F3A0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 974A9406D2
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XI6awzsOGpxn for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 19:17:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A90BC40674
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A90BC40674
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=icTXLkR5
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A90BC40674
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:17:58 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-936e393176fso61874385a.0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786907877; x=1787512677; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dL77w/37IwieS91xFF7BTetHVnsMP1zfLvFWqXdFGFw=;
 b=icTXLkR5QNMhw/3PYnkcEy7qhh52I7cSKmGBPl710bTuYKGIwZVUAKcFk3pbPYitKf
 jfxS3CSriE2+46JrW8HZk9FsRfGf2AUpCslsADPNKkPmsbD4N3NXGU+Y/fXKgJ6Miftj
 UcFeh17p1vjEXRZPjmqWdYA64ndG4UC98MTy7BNV6xQtb5L//7fN6Vzi1gioi2sjYda2
 n+h015OoUcDG/I1go1gJmN3lB9/0LUbxb4BGEj7F9EZwW8eyAVSYRLtyejH7cKIxmqs5
 0277/orTga5WTAct6a1vDZsieBj1t6v56Cb4JzlmMpO/YJLxkZnFZO9nreNM9kEpVE8z
 W+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786907877; x=1787512677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dL77w/37IwieS91xFF7BTetHVnsMP1zfLvFWqXdFGFw=;
 b=Jl+5mHxyF12QHdKojFdlZ6zAHHaUtKDkzGeOrKIX3sVrMmqyy9KXBiTGc4Dv4hDFzf
 WdEtaDhac2FxLgoay1N8NLv0zIyP9v/Kk8Na6uDso96JR/mstq0ZuxZdjiTvIOY7mV5f
 R3I7aAWEI33azkfOt9wWDKK1g0uxIbW/WrSHlMfMMSbBAWUjdaWnuDpk7vIAlJ8pMkxe
 tswaeC9FaTlRk4WEDPMRClUlD8FFp+54yuEvNBas6g8Ee+s6aghxsUVstE5dzrHcCSBt
 eWSSZ2pED0R6sthFL9OX55IlvJoX179MDFg57+86zcaFMYsZnU3yfiuC8mMhheG0ZPLW
 B7wQ==
X-Gm-Message-State: AOJu0YxDFvbKZGZDJoc0fcNvTvIgDlep3zcfPhevqOK90Y58P5zTmx9i
 SwRfpsiceWi8d05vWD1RrGaNCb7MBHe813P2d0qt2jK9jfcujwOJfYouTBPV6w==
X-Gm-Gg: AR+sD12bfin1DGenKWGIU9XjsZcKido12lyOLcpgJgX2vlSApNI5oWLlqitl+hJjBkq
 oAs1uszIKdVuxQYOvu4EtwStsMIcdKXzjRPm3AawTbZzmGQBUNu0R+Qpyk3Itq7g8vRrzo9qoYp
 r7nrFhdf/Yh7noKwU9XpP8ctiA6Ng+49uY7ymCBqPwS4cpLPhqfj3+nSKKpQ+lAQzGhtwUwSZdy
 GElbIXn+j389KjrFJ2IpGkS2PkP8lfxb+HwlnyczjE2DsjpO8pbf9yhHALy2PlZPSxN5JwCUmwS
 cKK5k6U3N+1oWrJ43VCUlRlMkBET5cq3EiVR8CiBfgRhfNf4x5VN4mBrTBy6jtm65ImC0Ljm/dJ
 Jup1MSWb8Un1Eyd+/xzO3HvdeA/qyAuF/dZPZ7QJcqF1Vog2DXVzkKJMgDFNOHzst0hCa4ruXlt
 KKGpil+PrDXMt9C0B1NIcs0iaGHWk49cz039M45UIaFZcpGyRpq2+shrtHrqwmSs7H3U9jplF1B
 jQfwiDtyUiNW8Q=
X-Received: by 2002:a05:620a:710c:b0:936:e71c:444a with SMTP id
 af79cd13be357-936e71c4b50mr1027496285a.4.1786907877193; 
 Sun, 16 Aug 2026 12:17:57 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-936cdf561efsm825489585a.8.2026.08.16.12.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 12:17:56 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Sun, 16 Aug 2026 15:18:24 -0400
Message-ID: <20260816191830.533747-3-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816191830.533747-1-alseycmiller@gmail.com>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/8] package/plutosvg: new package
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

plutosvg is a small SVG rendering library built on plutovg.

PLUTOSVG_ENABLE_FREETYPE is on because the FreeType integration is what
provides OpenType-SVG rendering - the hooks FreeType calls for the SVG
glyphs in a colour emoji font - which is what consumers of this library
generally want it for.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/plutosvg/Config.in     | 10 ++++++++++
 package/plutosvg/plutosvg.hash |  3 +++
 package/plutosvg/plutosvg.mk   | 18 ++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/plutosvg/Config.in
 create mode 100644 package/plutosvg/plutosvg.hash
 create mode 100644 package/plutosvg/plutosvg.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5e39d38fc9..56b01fa5cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -170,6 +170,7 @@ F:	package/xen/
 
 N:	Alsey Coleman Miller <alseycmiller@gmail.com>
 F:	package/liblc3/
+F:	package/plutosvg/
 F:	package/plutovg/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
diff --git a/package/Config.in b/package/Config.in
index d98705e981..5e1601036c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -350,6 +350,7 @@ comment "Graphic libraries"
 	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
 	source "package/ogre/Config.in"
+	source "package/plutosvg/Config.in"
 	source "package/plutovg/Config.in"
 	source "package/psplash/Config.in"
 	source "package/sdl/Config.in"
diff --git a/package/plutosvg/Config.in b/package/plutosvg/Config.in
new file mode 100644
index 0000000000..613b1b8ba6
--- /dev/null
+++ b/package/plutosvg/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PLUTOSVG
+	bool "plutosvg"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_PLUTOVG
+	help
+	  plutosvg is a small SVG rendering library built on plutovg. It
+	  is built with the FreeType integration enabled, which is what
+	  provides OpenType-SVG (colour emoji) rendering.
+
+	  https://github.com/sammycage/plutosvg
diff --git a/package/plutosvg/plutosvg.hash b/package/plutosvg/plutosvg.hash
new file mode 100644
index 0000000000..fb6c210e93
--- /dev/null
+++ b/package/plutosvg/plutosvg.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  49d5cfe772d3aa10cd4879f2f6e189f5083c08e4c8ea01bf3d5b87c97dfca7d2  plutosvg-0.0.8.tar.gz
+sha256  a55d1e78eaf75779c336b4ba061e74aae56a21195d234474fb24a398935d6ce1  LICENSE
diff --git a/package/plutosvg/plutosvg.mk b/package/plutosvg/plutosvg.mk
new file mode 100644
index 0000000000..17142a1eb4
--- /dev/null
+++ b/package/plutosvg/plutosvg.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# plutosvg
+#
+################################################################################
+
+PLUTOSVG_VERSION = 0.0.8
+PLUTOSVG_SITE = $(call github,sammycage,plutosvg,v$(PLUTOSVG_VERSION))
+PLUTOSVG_LICENSE = MIT
+PLUTOSVG_LICENSE_FILES = LICENSE
+PLUTOSVG_INSTALL_STAGING = YES
+PLUTOSVG_DEPENDENCIES = host-pkgconf freetype plutovg
+
+PLUTOSVG_CONF_OPTS = \
+	-DPLUTOSVG_ENABLE_FREETYPE=ON \
+	-DPLUTOSVG_BUILD_EXAMPLES=OFF
+
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
