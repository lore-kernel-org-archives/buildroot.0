Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3BCC83F26
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 20:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7486F614C1;
	Wed, 30 Jul 2025 20:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Albuq-tq5RPA; Wed, 30 Jul 2025 20:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B929614BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B929614BF;
	Wed, 30 Jul 2025 20:39:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1638C186
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0826E4085A
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWMfFIfECCUD for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 20:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.236;
 helo=relay16.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F34640E86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F34640E86
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F34640E86
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:39:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 10C0444A01;
 Wed, 30 Jul 2025 20:39:50 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Wed, 30 Jul 2025 22:39:44 +0200
Message-ID: <20250730203947.1097409-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730203947.1097409-1-thomas.petazzoni@bootlin.com>
References: <20250730203947.1097409-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeettdeguddtgffhteeflefhtdetvedvledukeekiedugeejhefgveduueduueethfenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhis
 egsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753907990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A0lLO6gNgJk/vVLyC/hj56o/efq76hq3+LTusVB5OPA=;
 b=WdsK//lg/wU8Z4UL9LIEovgAht2IPSrXGxUVOZqS1MGiPkU65XZJf525ROijxhZg03P3/q
 hGsatmPSoPxR80NXquj8DUD0uAkgeQXeeZlEYBavRtvFwCzw2g5chB1jY3MOAEGq7jGStn
 WE2hAbO68lPn72s9Ud/81Gmj1TVEKIdIEw30Qk6N+sWr6KbW4Ey2qGmgxXFx+l+psvlBJl
 aV0eA71xy0aCiZ9d4wQz6lH8nn9blUpE8BA72qH8Ba2refhtz6MhkimubyCZK03f21O4sT
 UIaHGJLAXX+kyBe+axrmbqHniig/Af+yHLHKbL2rNLbXrKKf9vg6u84oGAbilQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WdsK//lg
Subject: [Buildroot] [PATCH 1/2] package/gcc: backport upstream fix for
 glibc 2.42 build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

glibc 2.42 drops <termio.h>, so the libsanitizer code needs to be
adjusted accordingly, by backporting upstream gcc fixes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...bsanitizer-Fix-build-with-glibc-2.42.patch | 81 +++++++++++++++++++
 ...bsanitizer-Fix-build-with-glibc-2.42.patch | 81 +++++++++++++++++++
 ...bsanitizer-Fix-build-with-glibc-2.42.patch | 81 +++++++++++++++++++
 3 files changed, 243 insertions(+)
 create mode 100644 package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
 create mode 100644 package/gcc/14.3.0/0003-libsanitizer-Fix-build-with-glibc-2.42.patch
 create mode 100644 package/gcc/15.1.0/0002-libsanitizer-Fix-build-with-glibc-2.42.patch

diff --git a/package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch b/package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
new file mode 100644
index 0000000000..13f7f469c4
--- /dev/null
+++ b/package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
@@ -0,0 +1,81 @@
+From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 2 May 2025 17:41:43 +0200
+Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
+
+The termio structure will be removed from glibc 2.42.  It has
+been deprecated since the late 80s/early 90s.
+
+Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
+("[sanitizer_common] Remove interceptors for deprecated struct termio
+(#137403)").
+
+Co-Authored-By: Tom Stellard <tstellar@redhat.com>
+
+libsanitizer/
+
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
+	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
+	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+
+Upstream: 1789c57dc97ea2f9819ef89e28bf17208b6208e7 (gcc master branch)
+Upstream: d32ece49d32b00448d967e7dbc6900fb25cbc775 (gcc 15.x branch)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
+ .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
+ .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
+ 3 files changed, 12 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 49ec4097c90..dda11daa77f 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
+   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
+   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
+   _(TCFLSH, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCGETA, WRITE, struct_termio_sz);
+-#endif
+   _(TCGETS, WRITE, struct_termios_sz);
+   _(TCSBRK, NONE, 0);
+   _(TCSBRKP, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCSETA, READ, struct_termio_sz);
+-  _(TCSETAF, READ, struct_termio_sz);
+-  _(TCSETAW, READ, struct_termio_sz);
+-#endif
+   _(TCSETS, READ, struct_termios_sz);
+   _(TCSETSF, READ, struct_termios_sz);
+   _(TCSETSW, READ, struct_termios_sz);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index c87d5ef42c9..7bbc6f2edac 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+   unsigned struct_input_id_sz = sizeof(struct input_id);
+   unsigned struct_mtpos_sz = sizeof(struct mtpos);
+   unsigned struct_rtentry_sz = sizeof(struct rtentry);
+-#if SANITIZER_GLIBC || SANITIZER_ANDROID
+-  unsigned struct_termio_sz = sizeof(struct termio);
+-#endif
+   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
+   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
+   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index c07f7cd0b0d..a80df656826 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
+ extern unsigned struct_input_absinfo_sz;
+ extern unsigned struct_input_id_sz;
+ extern unsigned struct_mtpos_sz;
+-extern unsigned struct_termio_sz;
+ extern unsigned struct_vt_consize_sz;
+ extern unsigned struct_vt_sizes_sz;
+ extern unsigned struct_vt_stat_sz;
+-- 
+2.50.1
+
diff --git a/package/gcc/14.3.0/0003-libsanitizer-Fix-build-with-glibc-2.42.patch b/package/gcc/14.3.0/0003-libsanitizer-Fix-build-with-glibc-2.42.patch
new file mode 100644
index 0000000000..13f7f469c4
--- /dev/null
+++ b/package/gcc/14.3.0/0003-libsanitizer-Fix-build-with-glibc-2.42.patch
@@ -0,0 +1,81 @@
+From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 2 May 2025 17:41:43 +0200
+Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
+
+The termio structure will be removed from glibc 2.42.  It has
+been deprecated since the late 80s/early 90s.
+
+Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
+("[sanitizer_common] Remove interceptors for deprecated struct termio
+(#137403)").
+
+Co-Authored-By: Tom Stellard <tstellar@redhat.com>
+
+libsanitizer/
+
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
+	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
+	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+
+Upstream: 1789c57dc97ea2f9819ef89e28bf17208b6208e7 (gcc master branch)
+Upstream: d32ece49d32b00448d967e7dbc6900fb25cbc775 (gcc 15.x branch)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
+ .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
+ .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
+ 3 files changed, 12 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 49ec4097c90..dda11daa77f 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
+   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
+   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
+   _(TCFLSH, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCGETA, WRITE, struct_termio_sz);
+-#endif
+   _(TCGETS, WRITE, struct_termios_sz);
+   _(TCSBRK, NONE, 0);
+   _(TCSBRKP, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCSETA, READ, struct_termio_sz);
+-  _(TCSETAF, READ, struct_termio_sz);
+-  _(TCSETAW, READ, struct_termio_sz);
+-#endif
+   _(TCSETS, READ, struct_termios_sz);
+   _(TCSETSF, READ, struct_termios_sz);
+   _(TCSETSW, READ, struct_termios_sz);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index c87d5ef42c9..7bbc6f2edac 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+   unsigned struct_input_id_sz = sizeof(struct input_id);
+   unsigned struct_mtpos_sz = sizeof(struct mtpos);
+   unsigned struct_rtentry_sz = sizeof(struct rtentry);
+-#if SANITIZER_GLIBC || SANITIZER_ANDROID
+-  unsigned struct_termio_sz = sizeof(struct termio);
+-#endif
+   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
+   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
+   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index c07f7cd0b0d..a80df656826 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
+ extern unsigned struct_input_absinfo_sz;
+ extern unsigned struct_input_id_sz;
+ extern unsigned struct_mtpos_sz;
+-extern unsigned struct_termio_sz;
+ extern unsigned struct_vt_consize_sz;
+ extern unsigned struct_vt_sizes_sz;
+ extern unsigned struct_vt_stat_sz;
+-- 
+2.50.1
+
diff --git a/package/gcc/15.1.0/0002-libsanitizer-Fix-build-with-glibc-2.42.patch b/package/gcc/15.1.0/0002-libsanitizer-Fix-build-with-glibc-2.42.patch
new file mode 100644
index 0000000000..13f7f469c4
--- /dev/null
+++ b/package/gcc/15.1.0/0002-libsanitizer-Fix-build-with-glibc-2.42.patch
@@ -0,0 +1,81 @@
+From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 2 May 2025 17:41:43 +0200
+Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
+
+The termio structure will be removed from glibc 2.42.  It has
+been deprecated since the late 80s/early 90s.
+
+Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
+("[sanitizer_common] Remove interceptors for deprecated struct termio
+(#137403)").
+
+Co-Authored-By: Tom Stellard <tstellar@redhat.com>
+
+libsanitizer/
+
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
+	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
+	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+
+Upstream: 1789c57dc97ea2f9819ef89e28bf17208b6208e7 (gcc master branch)
+Upstream: d32ece49d32b00448d967e7dbc6900fb25cbc775 (gcc 15.x branch)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
+ .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
+ .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
+ 3 files changed, 12 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 49ec4097c90..dda11daa77f 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
+   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
+   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
+   _(TCFLSH, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCGETA, WRITE, struct_termio_sz);
+-#endif
+   _(TCGETS, WRITE, struct_termios_sz);
+   _(TCSBRK, NONE, 0);
+   _(TCSBRKP, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCSETA, READ, struct_termio_sz);
+-  _(TCSETAF, READ, struct_termio_sz);
+-  _(TCSETAW, READ, struct_termio_sz);
+-#endif
+   _(TCSETS, READ, struct_termios_sz);
+   _(TCSETSF, READ, struct_termios_sz);
+   _(TCSETSW, READ, struct_termios_sz);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index c87d5ef42c9..7bbc6f2edac 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+   unsigned struct_input_id_sz = sizeof(struct input_id);
+   unsigned struct_mtpos_sz = sizeof(struct mtpos);
+   unsigned struct_rtentry_sz = sizeof(struct rtentry);
+-#if SANITIZER_GLIBC || SANITIZER_ANDROID
+-  unsigned struct_termio_sz = sizeof(struct termio);
+-#endif
+   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
+   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
+   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index c07f7cd0b0d..a80df656826 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
+ extern unsigned struct_input_absinfo_sz;
+ extern unsigned struct_input_id_sz;
+ extern unsigned struct_mtpos_sz;
+-extern unsigned struct_termio_sz;
+ extern unsigned struct_vt_consize_sz;
+ extern unsigned struct_vt_sizes_sz;
+ extern unsigned struct_vt_stat_sz;
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
