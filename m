Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374EAC5AD5A
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 20:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C49DD80B83;
	Sun,  9 Aug 2026 20:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBq5nMm85Jtd; Sun,  9 Aug 2026 20:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86A2F80B88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786306432;
	bh=RO0NbsgYIb49RKgocSpO68psvY+ieU55YeUrBIl8Sbo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LzbcF7EnPR1p28JK9B/D7mUZFr7zHrmyrCQGArUh24Zjt1dRbxnN/ws4ux0yLyU9T
	 eTpmUNCA/+RU2fKf7wPnBtVzmg4DY2956HbuP5fGsgpVShhs03J7VnjQnE0Y1pJROs
	 NyvU9SaP7ETo52k2JbIckc30GRCjN/DCBvK7TWwSCHORCCjOrTS9fnGEXw5onofyuH
	 uZERko+RhKrq3MTww5gJXWNAtiRCeK0h22sBLPZVvbWO9ufehSqrNEi6g+i/L4sq0S
	 AER5I8ihdJrpZjvxOjsYnLrCXy7mn3YZ42Hr677zBVDvG1xJkfjFoRzPXTQqLTSwbw
	 fkLJmHt1Haouw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86A2F80B88;
	Sun,  9 Aug 2026 20:13:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7162198
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD115404C9
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOFkKl5Ba6fj for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 20:13:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1080404A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1080404A8
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1080404A8
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:13:49 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-92e5c9211d2so100231785a.1
 for <buildroot@buildroot.org>; Sun, 09 Aug 2026 13:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786306429; x=1786911229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=us6KfqyLzWfDOD11+acU9qiwQm5kG4nyq4H5EjFwG8Y=;
 b=lqJC2qUdM1xCUc4X7sBiLr8qbe2FaVctuluA2rxDspQulcgSMZKq23Z4chSVbstqL6
 O7uxEJwd+1l0ab6rcpYVBSRfxxjRE6+ZJ6VOX91osIWshBEkcheFjZXYWOuHUWurSmBs
 4oGQzBl7XJ76ENJSbt2wN/xVwLOJQXnM//iIsyU8C9PTHtnEiV5RUaxp47cZBt7f4Qyw
 RHSO7toltr3xFt24q6JNboAMOSBZ0q80CUWVci5kvJ9haFNw6hCOfpxaNd6YTP6TDCgP
 i4sUEMO+6JuF47bmxgkzcHnPovdDS6t+5FIfl5LahStYP7JoC0uSVkZtTVHtR4otXyCF
 7YsQ==
X-Gm-Message-State: AOJu0Ywn9tFQ+gTpAPS+OOM7rspO0mgVcTD3IGlvH/0KRAGA32U+vYTH
 A3mIZmQu1Zz1jSu5PD6H6Gj+sXzJ6AL8KKZ/Qauy0a2ObgJsXXB4FmIpEYbNhA==
X-Gm-Gg: AR+sD11l1FDRBJsTJQY2muKhdUrnHXZz2tNIqRNF5ntjQItKF1f8cPMt7cdVn4xRoMz
 rgOLGcAvD7ooOfcdu7l0P9pT+yT0xfmdloB7f5r0MK6SPgW3HGImuUg6V9Lc8Ovs+pdblmT59Tv
 OdhC5OQQdoPAFZMpE2srUlbxpWALMlIAJEXfcsrMG7xF4+UrJodVnTHCvbzz5F6W0wBrRBZ6A6y
 5+NbQHxigAB3T2dx/qxTLWad4ynp1xB0j2eWSpc1ED2EsDSdu1DRLMKxaBI5AgPM5hJh0Dfioic
 k8i+cwGWg94fB6Ifvk1hk5NnCcaUSO4SFZ2UYtC9dxqhYXPUAG/15yR52ETZLHtmYrOUNmOXnPq
 v+HbjOsXnplJOyp7QN91rAMt+5lUVK2GU3Ra7l+WZ9Re6vfyFyI3Licn9z0nJGpmffcPGCwVt/Q
 vXqj1lvwc6p9ilVxZSM0gQxdhBZr13Kxz0ed7C5sGkBdCX/pG6I9jDz2L+UaetTYe8wZnx0ygUa
 jiy1zFP1hFa77I=
X-Received: by 2002:a05:622a:148e:b0:517:9570:c1bd with SMTP id
 d75a77b69052e-52d20a10fc2mr180981721cf.25.1786306428650; 
 Sun, 09 Aug 2026 13:13:48 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52d163d9107sm56681461cf.13.2026.08.09.13.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 13:13:47 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Sun,  9 Aug 2026 16:14:02 -0400
Message-ID: <20260809201403.3855903-1-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786306429; x=1786911229; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=us6KfqyLzWfDOD11+acU9qiwQm5kG4nyq4H5EjFwG8Y=;
 b=fjsEesxbeA+ex6q4shHVj1CzP+6cC/eo0mGeQi5tajWBhPfrHPc22Pa7hhYg+ybWOs
 AQCUT8EfYmantCRkHgSiFb+bzGgNiUcBDrAvVmHau0eNUSJ6na0LfnJivDG5fd+ZHIQH
 VISQ8JSxiG3miP/AtBdHwxquaqR5lCTUsOjoo7tlB0rOY8Nmow6UVb+DDhmcKdDYBCQx
 JSpEIF41MV8EF4FzX6YiYv3kcITlBZf1mSxNAVUBZs/fvDBrVvztcxGipgWI0NNQG1SE
 7LdUc5/WcX0sY5XoDt4b/X6uA2goxA9BJaliI8Gy2wZd44e6SmwaUmB9Xqpy9Z5ONcLM
 x1QA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fjsEesxb
Subject: [Buildroot] [PATCH v2 1/2] package/libxkbcommon: build
 libxkbregistry when libxml2 is available
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

libxkbregistry is the keyboard layout catalogue half of the library. It
parses the XML layout registry and so needs libxml2, which is presumably
why it was disabled unconditionally rather than wired to a dependency.

wine needs it. Its configure.ac requires XKBREGISTRY_LIBS alongside
wayland-client, wayland-scanner, xkbcommon and linux/input.h before it
will build the Wayland driver, and wine.mk passes --with-wayland for any
build with BR2_PACKAGE_WAYLAND - which turns that notice into a hard
error:

  checking for wayland-client.h... yes
  checking for wl_display_connect in -lwayland-client... yes
  checking for wayland-scanner... .../host/bin/wayland-scanner
  checking for xkb_context_new in -lxkbcommon... yes
  checking for wayland-egl.h... yes
  checking for wl_egl_window_create in -lwayland-egl... yes
  configure: error: Wayland development files not found, the Wayland
    driver won't be supported.
  This is an error since --with-wayland was requested.

Every other term of that test passes; only XKBREGISTRY_LIBS is empty, so
wine and wayland together could not be built on any architecture.

Gated on BR2_PACKAGE_LIBXML2 rather than turned on outright, because
meson.build takes dependency('libxml-2.0') unconditionally once
enable-xkbregistry is set, so a target without libxml2 would fail to
configure.

Regarding since when this is broken, three pieces had to come together:

 - libxkbcommon has passed -Denable-xkbregistry=false since commit
   1791bc30a5 ("package/libxkbcommon: bump version to 1.0.1", Sep 2020),
   i.e. Buildroot 2020.11. libxkbregistry has therefore never been built
   in Buildroot.

 - wine's configure gained the XKBREGISTRY_LIBS term in its Wayland
   test in wine 9.0, with upstream commit d64ea8e4a6c9
   ("winewayland.drv: Enumerate Xkb layouts and create matching HKL.",
   Nov 2023).

 - wine.mk started passing --with-wayland in commit 7cb49e7712
   ("package/wine: bump to version 9.19", Oct 2024), which is what turns
   the missing XKBREGISTRY_LIBS from a notice into a hard error.

The breakage therefore dates from Buildroot 2024.11, and every branch
since is affected, including the LTS one: 2025.02.x carries wine 10.0,
whose configure has the XKBREGISTRY_LIBS check, together with
libxkbcommon 1.9.2 built with -Denable-xkbregistry=false, and its wine.mk
passes --with-wayland. 2025.05.x and 2025.08.x are in the same state.
A backport to 2025.02.x is thus needed.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---

Notes:
    Changes since v1:
     - Extend the commit log to document since when the problem exists, and
       whether the 2025.02.x LTS branch is affected (suggested by Thomas
       Petazzoni). No change to the code.

 package/libxkbcommon/libxkbcommon.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 21a2b937ef..406affe401 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -12,8 +12,14 @@ LIBXKBCOMMON_CPE_ID_VENDOR = xkbcommon
 LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
 LIBXKBCOMMON_CONF_OPTS = \
-	-Denable-docs=false \
-	-Denable-xkbregistry=false
+	-Denable-docs=false
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBXKBCOMMON_CONF_OPTS += -Denable-xkbregistry=true
+LIBXKBCOMMON_DEPENDENCIES += libxml2
+else
+LIBXKBCOMMON_CONF_OPTS += -Denable-xkbregistry=false
+endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBXKBCOMMON_CONF_OPTS += -Denable-x11=true
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
