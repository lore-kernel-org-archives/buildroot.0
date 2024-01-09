Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36ECC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 17:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F18560BDC;
	Tue,  9 Jan 2024 17:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F18560BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bCiBMVVmAOVT; Tue,  9 Jan 2024 17:30:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 863A460AA6;
	Tue,  9 Jan 2024 17:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 863A460AA6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADBCE1BF3C8
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 17:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84FC44018A
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 17:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84FC44018A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvZrupV5AdF2 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 17:30:22 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 587414013C
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 17:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 587414013C
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3368d1c7b23so3111699f8f.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 09:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704821420; x=1705426220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rso0sCgnhOsQWDCPvZH9Q3N3+ZLMxJ1id5pJETrh/es=;
 b=oXgtSGa3uo+KuCB4RPAOGgAD+XVRpEYRJCG0rgufa9mVg/0DoqzXhIO4o5rY/NoTsL
 ZJqaCjst0VQJuNHgTDxZiE7nOX0WL18dnsKcaUeeRodvsxmfW2hHVD/gZ5dP1qHYepwq
 bhXpe8PLql76UHv+3ah6tD7zz8VWkOAixK/8jpgqUc65Smu5BlTTri0Gij6br1SbPK+u
 Elw7eX6ADwlFlnGgjw3zkvZFHhV8MGj1mTdPMNtLuZTDs6kEDApTlizgZPz12fPobQaa
 QKUtNBwfBY42z6tb8M38Hm1DSWpjJ8dDgrRMxWMLXHeItD4AqvgEjrf1fzYFuESjXisS
 HEyA==
X-Gm-Message-State: AOJu0Yy0QdqSOaP7HzWgVgRqpcRWGufdyd46m5sk5bqM+hiZEagAcNgA
 ZHPVwceO+iouFZMbomnPgIqJCFsHNH0=
X-Google-Smtp-Source: AGHT+IFnzgWrrrN6kkQUC9B3QKOW9uRy38IpzC/OTD6btwoY9N/E5bR3pxj+MqJfEqRvrr9LWzDBGQ==
X-Received: by 2002:a05:6000:1c3:b0:336:76dc:4d30 with SMTP id
 t3-20020a05600001c300b0033676dc4d30mr650028wrx.45.1704821419852; 
 Tue, 09 Jan 2024 09:30:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b00336a2566aa2sm2906263wru.61.2024.01.09.09.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 09:30:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 18:30:15 +0100
Message-ID: <20240109173015.7528-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704821420; x=1705426220; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rso0sCgnhOsQWDCPvZH9Q3N3+ZLMxJ1id5pJETrh/es=;
 b=gBGjq7yQOVg/VRuhVR6PQogf7+x126fp4lOzm1Ehn9rSTJ+Fv6X/JkKG4eabCLa2TB
 F6NbmXoKv1/VPlAosX0R56S2O5RBeSURWadBMbs9lfe8Ju7wyCmwK6zqOOOuIyAYGzWX
 JPK3DH9XyUTSK6nGe1/nm8AAx0JOdOMMPUeWH3afA21asqAaDhaCHznncLA+AXFlX8Ky
 XhkH+ubXnOD+b5MmSsUHkIBvUW97gsKPBF2qaaGznnGS0i2V6f6EsRfHedQVbrYsQ5pf
 0Up7hOCadBvrJqNgOXNJE1V+H9h32E2pkA8CaGZQsY7imzG5TvFYx5BE4pt2nmuAH9aC
 xI/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gBGjq7yQ
Subject: [Buildroot] [PATCH 1/1] package/madplay: force arm mode instead of
 Thumb mode
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised because madplay uses mad_f_mul
which is defined in usr/include/mad.h (installed by libmad which has
been fixed by a similar workaround in commit
0aaadd525f2df02911349ffe1518814fa095bf96, unfortunately the fix works
for compiled code, not mad_f_mul define):

/tmp/cc5SGGoU.s:102: Error: selected processor does not support `smull r8,r9,r2,r4' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/0c0955d4f6726b50cad721f4d3437dabde316e70

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/madplay/madplay.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index e1a78bd7d7..91ee44ab5f 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -15,6 +15,14 @@ MADPLAY_DEPENDENCIES = host-pkgconf libmad libid3tag $(TARGET_NLS_DEPENDENCIES)
 # Also 0003-configure-ac-use-pkg-config-to-find-id3tag.patch
 MADPLAY_AUTORECONF = YES
 
+# madplay uses libmad which has some assembly function that is not present in
+# Thumb mode:
+# Error: selected processor does not support `smull r8,r9,r2,r4' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+MADPLAY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
