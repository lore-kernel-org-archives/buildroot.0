Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88470CF8860
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 22:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C64B611B1;
	Fri,  4 Oct 2024 22:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqDOUSYcj8EQ; Fri,  4 Oct 2024 22:05:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1D3D611BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1D3D611BD;
	Fri,  4 Oct 2024 22:05:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1316A1BF35F
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 22:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0111A40E52
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 22:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pf18kX_8AOcV for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 22:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6231740D9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6231740D9F
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6231740D9F
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 22:05:45 +0000 (UTC)
Received: from 91-153-34-109.elisa-laajakaista.fi ([91.153.34.109] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1swqQg-0051Zh-UF; Sat, 05 Oct 2024 00:05:43 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id e1e10035;
 Fri, 4 Oct 2024 22:05:41 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat,  5 Oct 2024 01:05:39 +0300
Message-ID: <20241004220541.2290809-3-aperez@igalia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004220541.2290809-1-aperez@igalia.com>
References: <20241004220541.2290809-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nG8LO70Gx9GN27Ap+FeTpBv55vYHAX5VJrxDULCUV+k=; b=AmhpXjKVbrr2ym2ez5oLKKA344
 7n+PfKi8SnE6epluO2kEl1/NzbdAZGASNLQHyR8eno5WY2dR1zMoSNusEZjvyX2jpvxXikMUwAtXt
 WW6ne6aveMTSjwyDHZ6KDEuFkVq9DRMi9SKsP33oIb8e9jTpdYZZ5giqgjE0bTOsQEHBKBesw8lor
 4G58bBx0Rfzzon+6FjF5+tNOoOojLDG8DEAB9/ePPtnp3jl/tV69ftKvMC2BGOl2TGZRiuWrnRhnz
 b06Z1rk3n/vuhNPAxto+7k+1u2bjHMXqT/25mxCzGY9Uq/OqcvhxgaGKPUP8LgY5wEWLRfsan1cpN
 JD9DlzXQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=AmhpXjKV
Subject: [Buildroot] [PATCH 2/2] package/sysprof: bump to version 47.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Include an upstream patch that allows building with older versions
of GLib, to avoid needing to update its package.

https://gitlab.gnome.org/GNOME/sysprof/-/blob/47.0/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 .../0001-build-reduce-GLib-requirement.patch  | 30 +++++++++++++++++++
 package/sysprof/sysprof.hash                  |  4 +--
 package/sysprof/sysprof.mk                    |  2 +-
 3 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 package/sysprof/0001-build-reduce-GLib-requirement.patch

diff --git a/package/sysprof/0001-build-reduce-GLib-requirement.patch b/package/sysprof/0001-build-reduce-GLib-requirement.patch
new file mode 100644
index 0000000000..fb83e210fe
--- /dev/null
+++ b/package/sysprof/0001-build-reduce-GLib-requirement.patch
@@ -0,0 +1,30 @@
+From c34fba6fe5c3ecd2028461a4317bd2916e2a09d7 Mon Sep 17 00:00:00 2001
+From: Christian Hergert <chergert@redhat.com>
+Date: Mon, 16 Sep 2024 09:48:15 -0700
+Subject: [PATCH] build: reduce GLib requirement
+
+This is kept lower so that you can build without GTK on older systems.
+
+Related: https://gitlab.gnome.org/GNOME/sysprof/-/commit/530b4a9d121c8659148c36ce67f2ce415443baa5#note_2223853
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream: https://gitlab.gnome.org/GNOME/sysprof/-/commit/e5382d1b8cae4d829751938ce39c2e5fbc419064
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 63a31894..696b87be 100644
+--- a/meson.build
++++ b/meson.build
+@@ -45,7 +45,7 @@ need_libsysprof = (need_gtk or
+                    get_option('tests'))
+ 
+ dex_req = '0.6'
+-glib_req = '2.80.0'
++glib_req = '2.76.0'
+ gtk_req = '4.15'
+ polkit_req = '0.105'
+ 
+-- 
+2.46.2
+
diff --git a/package/sysprof/sysprof.hash b/package/sysprof/sysprof.hash
index f21e7621e1..ca025674a7 100644
--- a/package/sysprof/sysprof.hash
+++ b/package/sysprof/sysprof.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/sysprof/46/sysprof-46.0.sha256sum
-sha256  73aa7e75ebab3e4e0946a05a723df7e6ee4249e3b9e884dba35500aba2a1d176  sysprof-46.0.tar.xz
+# From https://download.gnome.org/sources/sysprof/47/sysprof-47.0.sha256sum
+sha256  7424c629434660654288c04248998c357d1ce87ee1559fd44df1980992ef5df5  sysprof-47.0.tar.xz
 
 # License files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 8e69a7044e..81c0a4a6ee 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSPROF_VERSION_MAJOR = 46
+SYSPROF_VERSION_MAJOR = 47
 SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).0
 SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
 SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
