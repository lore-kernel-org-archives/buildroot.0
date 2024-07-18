Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564E5C3DA60
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 12:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAB06818C9;
	Thu, 18 Jul 2024 12:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Swk_lW0TTyo; Thu, 18 Jul 2024 12:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58FB181CA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58FB181CA7;
	Thu, 18 Jul 2024 12:20:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EFB21BF35C
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 12:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90C80606F3
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 12:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xG83URLtvNr for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 12:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.50;
 helo=mail-ed1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5433D6069A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5433D6069A
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5433D6069A
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 12:20:02 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5a156556fb4so863457a12.3
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 05:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721305200; x=1721910000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YdZdafm2TK3Yb7NRDs4twM6V/pKlrFEcl/kOsg6h0mo=;
 b=wDH2BRkrv6DS5Ar/TXVDCOydoA5UE00eAI4MhzGB2p5F17TxFAC8vybRcxmxpplEkO
 vw+2Zvp7VASCuFCBni+uFJPX6PBstDdXVMyX13EkpDPUWPiTS7FDfxcOFUIWTNcaFo6A
 1YK/kN6lMjllx5aJj93UGJ5QJxJ3HUsn+vdYlmzx5Nbs+UnlYRmx1DCNadAZnxRY5CdM
 HmQFOB1Is4TMhaALvmWvKJju6414WHLwAEfsdQBKrhB18Y0l+ZW9LuEyPRAA//jLeVTT
 Nvko6766g5rJlv10qZ0YXRPq8RPH1/Rrzaed6TRFZP9BTpBqXrtUEFRXADQZzUHmSY/a
 nmlQ==
X-Gm-Message-State: AOJu0Yw4oRB0Eaww7CaabdMPhz71lZUwnNYDyQppK2fdoXu4IxapvHex
 BfVW5BVG2ptXF0ZXMuHjdmZa1FHOIxrbkK5IwTIshv/d+lM8YGooVa6Wnw/vZQu7PrEV
X-Google-Smtp-Source: AGHT+IGh0j7MeavlTUyxYP1DzH+tNGAfItzL/suSBBhv3bDeRr2NI99UBsJm2Ggeil9p/+2EByW0DA==
X-Received: by 2002:a50:9b5c:0:b0:57c:b83a:fef5 with SMTP id
 4fb4d7f45d1cf-5a05d5c2ca5mr3192605a12.34.1721305199476; 
 Thu, 18 Jul 2024 05:19:59 -0700 (PDT)
Received: from
 codespaces-d72b27.1rg50c1zhzeevdmdspvvpbyf4g.ax.internal.cloudapp.net
 ([4.180.234.48]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a22b56e59dsm382936a12.75.2024.07.18.05.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 05:19:59 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 12:19:55 +0000
Message-ID: <20240718121955.10918-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/cairo: fix compilation on toolchains
 without c++ support
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
Cc: eric.le.bihan.dev@free.fr, thomas@devoogdt.com, yann.morin.1998@free.fr,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, thomas.petazzoni@bootlin.com,
 aperez@igalia.com, fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Fixes:
 - https://lore.kernel.org/buildroot/20240717200926.1a7db2a1@windsurf/

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 ...3-meson-only-require-cpp-for-windows.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/cairo/0003-meson-only-require-cpp-for-windows.patch

diff --git a/package/cairo/0003-meson-only-require-cpp-for-windows.patch b/package/cairo/0003-meson-only-require-cpp-for-windows.patch
new file mode 100644
index 0000000000..9774f29f8c
--- /dev/null
+++ b/package/cairo/0003-meson-only-require-cpp-for-windows.patch
@@ -0,0 +1,38 @@
+From e93ef3feb69994e3aa4e0ab66ccd66139b097e49 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Thu, 18 Jul 2024 12:16:51 +0200
+Subject: [PATCH] meson: only require cpp for windows
+
+Allow to compile meson without c++ toolchain.
+
+Fixes:
+ - https://lore.kernel.org/buildroot/20240717200926.1a7db2a1@windsurf/
+
+Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/573
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ meson.build | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 9100152ee..297482b03 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('cairo', 'c', 'cpp',
++project('cairo', 'c',
+   meson_version: '>= 0.59.0',
+   version: run_command(find_program('version.py'), check: true).stdout().strip(),
+   default_options: ['warning_level=2'],
+@@ -489,6 +489,8 @@ if host_machine.system() == 'darwin' and not get_option('quartz').disabled()
+ endif
+ 
+ if host_machine.system() == 'windows'
++  add_languages('cpp')
++
+   add_project_arguments('-DWIN32_LEAN_AND_MEAN', '-DNOMINMAX', language: ['c', 'cpp'])
+ 
+   win32_extra_deps = [
+-- 
+2.45.2
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
