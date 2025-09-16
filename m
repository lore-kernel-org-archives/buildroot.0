Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA0ACAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E7FD61174;
	Tue, 16 Sep 2025 20:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-6Y6xu6SKZE; Tue, 16 Sep 2025 20:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8309F6117A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8309F6117A;
	Tue, 16 Sep 2025 20:27:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A3C312D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B3208350A
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmXLPcenYMFO for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99696834FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99696834FE
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99696834FE
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45f2acb5f42so2088695e9.1
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054457; x=1758659257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vi0IFXrf4nIQ2GBw+NQqw53UY26jdnNGVQVWNHzoShY=;
 b=WfjOf+ULkt+RICAm7OK4Yfe62lyupJpAmJXUPc+R2PtKklDZiaOXG1SkyIhrqsazQ6
 6OsZX5sbvPxn1RBK3nBdFV+8QDBkJqvmbQTI5ap3DdW+COMC2DNfBaams7mbbQkG9e3f
 teezf5Jnb7WZVAdPARr61nfhcQwwilLsYToc3xuftHtrNzBNBuIm9tVOxryr5jI51Kqj
 8bsyqx7cl+aAfkKrh3ffDWDkh3Alnb4nhzzZeynHPaKAzFeE8OAR3vyj3jncVkVYbrQ2
 TLkCtzFKBd+BDF5fwZZcA301bVqckmuHAUZhC6hFIbjkO9UhIIu/Qo89zuic1elincgf
 KrTA==
X-Gm-Message-State: AOJu0YwV1E73ofSVfrxOB/j+V4JzzA6szCf1qWSl+bESBzCLfXztg0a5
 UkcZIIObmqYTgX/01pJbWd0F2wp12QneEhMdMO2jPUdHjUiAhNHDGC+nYQ9rpwmTijHKwMvhn+B
 KSWcMCxQ=
X-Gm-Gg: ASbGncu6S+DJPBQbFITAGx6UWpm8CsYUQ16MIswgCUs+WB+G9uhp6Cd9kCXPsFaqnb+
 n57HB/vtrc7xr5dj9o7qMZV+sAT3fbSuk2W7K8a9qpWK6T1HZsFcbL2f1BX3YS7cxteTgfCz4VG
 XxsbL6vnV/G2dAgFMuXVm4Nigq/mYk9AuOYjruZyco5TVdroDAO9xx6dfocpaE9dSe4S1MXO4W6
 evaOLfmpDioTpgE3ib6H1idboWyecrUG58QGw4Cki01ul8wqPoEJaKQXeqRhqzLdDiVygcMXfFX
 Z4Tyx9KEXpNhDVWm0P5E+AJOoGJRo0sUAhJsFe41tlr4v2/dSzzfufJhw2NmeHAoIbnU8/M1U18
 ODAl/wVgQKato8LAebGrbo/P9Aw==
X-Google-Smtp-Source: AGHT+IGZ1GqVy1pNitVNyt++HDmZqOjxi9238BsZ2kQTt1siR4cOteBcoP5V1G4wQC1ChUjG2BbUqQ==
X-Received: by 2002:a05:600c:a597:b0:45b:8b95:7119 with SMTP id
 5b1f17b1804b1-45f32d09f0cmr30585555e9.8.1758054456829; 
 Tue, 16 Sep 2025 13:27:36 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ec22b16adesm5497723f8f.13.2025.09.16.13.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:27:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:27:24 +0200
Message-ID: <20250916202735.1121872-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758054457; x=1758659257; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vi0IFXrf4nIQ2GBw+NQqw53UY26jdnNGVQVWNHzoShY=;
 b=J1WAVtXy8U6xlBiVDzyehQXQs3ocEd81wG14KOKNImcJyJ4UpJUnISFnqdWwF2S8Yf
 gbPqvw6vfMVxCrrAtse5xYHTXOt7tSkvAPQVWkcqOSs3nQsKdzAswM6Xu5CB5cF5Mpcy
 kO7BioxBVASBFV4rHZ+AIWWLrxXTKtk3PzbpkGrk4NM8HU+yvRECMTe9K4lEDfWKWACB
 fvnmjex7t8Axcztfz89kr+Is3H36Qx/EfAjXxaoG19QFtxW+QyoqoH/a88q50Ilbjjfv
 WLslfmNvElb4dPQNDQHP1g+XuuKrqi/ZQ32LxwpBYVG5Ae7HU3NrU+PgXOrHLduBwLeo
 pP5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=J1WAVtXy
Subject: [Buildroot] [PATCH 01/12] package/asterisk: fix deprecated CPE ID
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
Cc: Michael Fischer <mf@go-sys.de>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'asterisk:open_source' has been deprecated in favour of
'sangoma:asterisk'.

See the following for more information:
 - https://nvd.nist.gov/products/cpe/detail/7FC01D7D-5AE9-42A8-B31E-A99E745E5BE5
 - https://github.com/asterisk/asterisk/security
 - https://nvd.nist.gov/vuln/detail/CVE-2024-42491

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/asterisk/asterisk.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 6d682f161d..18af217129 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -26,8 +26,7 @@ ASTERISK_LICENSE_FILES = \
 	codecs/speex/speex_resampler.h \
 	utils/db1-ast/include/db.h
 
-ASTERISK_CPE_ID_VENDOR = asterisk
-ASTERISK_CPE_ID_PRODUCT = open_source
+ASTERISK_CPE_ID_VENDOR = sangoma
 ASTERISK_SELINUX_MODULES = asterisk
 
 # For patches 0002 and 0003
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
