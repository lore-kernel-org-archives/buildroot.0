Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBBFF4BB84
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 20:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F28E18450D;
	Tue, 24 Feb 2026 20:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qqey1pHN9Vz; Tue, 24 Feb 2026 20:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F4D83DCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771965382;
	bh=AQS1s+q4M6p/eXbSIrjG4cDbjldJGkv1lyU82w7kcgQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DFumtXQ5xpIDliqVo+d/EEndUsheKe3tt0sD14QVPzzLaCbX642yUfIeFrpRS2rT/
	 IjoUIzVOU67cyGi6WgLGMz1OwM5OtUR8lOWR/Xq65N/ouVdCyz9fCQFJ9jPpfOLaFY
	 z1b5xAMfNOFqHHAJdTjgJNogpvDYvDswqmIx1xisp7ZhZEarMXjaDBNQhqf3oBtKT3
	 598WtdNKsWRZI3bkYShr4L/AEBhH1/6DY0jMQg3+Y1I4qtz642SJUD8AUCy4mnn3h/
	 96v+x/FMCkAbqwflZIrGECudNazGeYq5LumDcB6IUf0wQ+c0ZpjoHu6QTDqoisIYxs
	 mongVtJ/oKhDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28F4D83DCD;
	Tue, 24 Feb 2026 20:36:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A20723D
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 20:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E06B661463
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 20:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0se3FImKdtA for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 20:36:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D06DA61461
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D06DA61461
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D06DA61461
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 20:36:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4376de3f128so4230425f8f.0
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 12:36:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771965376; x=1772570176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iLdYwavTZSEgIQ5YnzfpNCtILaWJIaFxSaDx5R3lIZU=;
 b=VZXYPcA6un9v+zbWL2iCsfWzcfAKLSeGGpldvit/UAJsXAhhRjqlrvapg3K4rM/mCR
 9Mz+MO5Uznp/nKb7rUTDG3zTh3MOCh0Sf1LGWsOfZ17CWNomwF4H1g8ebaPJHhmHvTes
 Y0aZIoJ17a/Lm0WcsEiESlqTZRB1GlaMLfEMn21I32s2eb7SrFj86970GM/FBicLeM9I
 jY+WyiTFXqrbrEJHCMYuyul9Kd7W9MgLHYEcopQJr1hmPAL7DYCnGPB7wNkP5iJVPrZK
 9B5V8Jef/UeRw0YbArQ1KTcnbvpcU1rtrNIsRANcVFSH1pQ0YaN1n9g+EhI/c8HXwMMi
 EH2g==
X-Gm-Message-State: AOJu0Ywqar2jTLRlTMhWuqbeViTHFW6lEPTkxHrxLYAnWVnEt4nBQlBZ
 kw5yCuo5VmUPKPzxgpoG0tXIiBA6MCx5HpZQxx1Eu4w0Lttc7xIDlAed0ssF48H1cTQIkugaO3e
 cWUIF
X-Gm-Gg: ATEYQzwf11ImzH7DETWjP7xWwiTixBGoTHXcCVTnXJ1NTo9QDeLMXZ2uyN3M6cb4KbV
 Qfd88iO2HC4FIkYIxjghdANyAG0uD4/BT7Qfo4ESrwf4JWllB3i8wK9EnKIFi8WZvhyanH9CRMd
 eo9+qnbNYGblYvpkswGPgAtwp+FNrMiCI4IVW7FS7xfy+k9d6MG53rDNsGMtVxJ1XuixNDMLyFf
 M2M6ZMFQHfL4K2lCV08AXCKIOoIgmEk9Xb2Liedrb2MUFX5lOi/H0UJ0pfjlZUAG6P4z2aTAss5
 U87ccJxO0mLbkQMEk/+esUdsQ+pnjX8y6yhllSxFvCCoHKK0KnUSIFBY1SwUyYQLru1xH3ZXClz
 gZDeT/getyLU6Um85uUsAedwiEmqXfIdZ73HKEO5+Oz1uMFsrLywd0bMO0TGIYtzwbwUv/feIXt
 tR0T2Uxl+TiPF/3CY=
X-Received: by 2002:a05:6000:615:b0:435:9770:9ecb with SMTP id
 ffacd0b85a97d-4396f18f812mr26138419f8f.56.1771965376042; 
 Tue, 24 Feb 2026 12:36:16 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970bf9fb2sm29766642f8f.1.2026.02.24.12.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 12:36:15 -0800 (PST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 24 Feb 2026 21:36:15 +0100
Message-ID: <20260224203615.248962-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771965376; x=1772570176; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iLdYwavTZSEgIQ5YnzfpNCtILaWJIaFxSaDx5R3lIZU=;
 b=KRQExxhBnbp+DiTdgkMHB9NZrhiT9zAZy0AXi6FlI/OE5PpR43B66lSeocrohbCBO2
 mIVrDVTB+QkBwXJWL82MoI+TBabHB0tptm0PSwDKghesuQZvJpAV63cT5EnR6cpvSe/r
 FLhQ++G52WadCficNzcRVsgAjd+9ZdLLMejide2pn57KHhC5rkJ3+3yqHzTt577Q1nDr
 I0wKLVB0hcv2mgYPvaUa10ezivk9jYrDhvm/rzm08fr6cIKDeRqf0wBTISZDT1Jiltjo
 Y+uAACmvm6jUh8BYWtsMhWAOVhSSVgHJGuo01T/FFS5My/44cFir86y+/Ziv99Zfz5B7
 4CGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KRQExxhB
Subject: [Buildroot] [2025.02.x,
 PATCH] package/fluidsynth: add patch for CVE-2025-56225
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerability:

- CVE-2025-56225:
    fluidsynth-2.4.6 and earlier versions is vulnerable to Null pointer
    dereference in fluid_synth_monopoly.c, that can be triggered when
    loading an invalid midi file.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-56225
  - https://github.com/FluidSynth/fluidsynth/commit/45f2a79f4265dcc4f98cfbafdb10727fb1c0d411

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...inter-dereference-during-legato-mode.patch | 25 +++++++++++++++++++
 package/fluidsynth/fluidsynth.mk              |  3 +++
 2 files changed, 28 insertions(+)
 create mode 100644 package/fluidsynth/0001-Fix-a-nullpointer-dereference-during-legato-mode.patch

diff --git a/package/fluidsynth/0001-Fix-a-nullpointer-dereference-during-legato-mode.patch b/package/fluidsynth/0001-Fix-a-nullpointer-dereference-during-legato-mode.patch
new file mode 100644
index 0000000000..a155164bcf
--- /dev/null
+++ b/package/fluidsynth/0001-Fix-a-nullpointer-dereference-during-legato-mode.patch
@@ -0,0 +1,25 @@
+From 45f2a79f4265dcc4f98cfbafdb10727fb1c0d411 Mon Sep 17 00:00:00 2001
+From: "Tom M." <tom.mbrt@googlemail.com>
+Date: Mon, 14 Jul 2025 18:13:38 +0200
+Subject: [PATCH] Fix a nullpointer dereference during legato mode (#1607)
+
+CVE: CVE-2025-56225
+Upstream: https://github.com/FluidSynth/fluidsynth/commit/45f2a79f4265dcc4f98cfbafdb10727fb1c0d411
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/synth/fluid_synth_monopoly.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/synth/fluid_synth_monopoly.c b/src/synth/fluid_synth_monopoly.c
+index d1de13196..6e6e2a906 100644
+--- a/src/synth/fluid_synth_monopoly.c
++++ b/src/synth/fluid_synth_monopoly.c
+@@ -410,7 +410,7 @@ int fluid_synth_noteoff_mono_LOCAL(fluid_synth_t *synth, int chan, int key)
+                 fluid_channel_breath_msb(channel))
+         {
+             /* legato playing detection */
+-            if(channel->mode  & FLUID_CHANNEL_LEGATO_PLAYING)
++            if (channel->mode & FLUID_CHANNEL_LEGATO_PLAYING && channel->preset != NULL)
+             {
+                 /* the list contains others notes */
+                 if(i_prev >= 0)
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 1c9139aa9f..bde3f416a7 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -12,6 +12,9 @@ FLUIDSYNTH_CPE_ID_VENDOR = fluidsynth
 FLUIDSYNTH_INSTALL_STAGING = YES
 FLUIDSYNTH_DEPENDENCIES = libglib2
 
+# 0001-Fix-a-nullpointer-dereference-during-legato-mode.patch
+FLUIDSYNTH_IGNORE_CVES += CVE-2025-56225
+
 ifeq ($(BR2_PACKAGE_FLUIDSYNTH_ALSA_LIB),y)
 FLUIDSYNTH_CONF_OPTS += -Denable-alsa=1
 FLUIDSYNTH_DEPENDENCIES += alsa-lib
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
