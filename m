Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F395C54ED1
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 23:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1DFE805CF;
	Tue, 27 May 2025 23:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBMlrPubZPpZ; Tue, 27 May 2025 23:25:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D73838057B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D73838057B;
	Tue, 27 May 2025 23:25:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4060319D
 for <buildroot@buildroot.org>; Tue, 27 May 2025 23:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26AF060D76
 for <buildroot@buildroot.org>; Tue, 27 May 2025 23:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZ32RH9bKV4c for <buildroot@buildroot.org>;
 Tue, 27 May 2025 23:25:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE76C60D73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE76C60D73
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE76C60D73
 for <buildroot@buildroot.org>; Tue, 27 May 2025 23:25:27 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-742caef5896so2827952b3a.3
 for <buildroot@buildroot.org>; Tue, 27 May 2025 16:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748388327; x=1748993127;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uXBSUnb7e5zzIjZ6PBwaB2BnT29ixwUqQsC+5iw0Iko=;
 b=n/BXkGgJGnC9qxeN3ZVvu/NWvXQsn+4UBOS620QSR/1/QwWVl7QMX0T1ncdrqXxDJ9
 JZ2/u9NJ5ufL4iGRQaQq9e9v2t/T9bgC88sXKvMmHPUCp3Xm1HSymh7AhAywQxJiocNP
 KEjo3W2JCZc8TkZnEpuxm2xwDIGE2iml3yHmmszG/Vtcu02+GSh3go2fXyy3/KxYLGJC
 Up0tySACpSLmjHevt1F4K69tF5JNMDukmv3w3WoigI10bIkX8J4grOC72WswObSeaMuZ
 tntmjh+weShBm7qmggarCL0WwPToEOwxt4PpYl2VXMgPiuThf+zbOoSR6JHjmBKiCpQ2
 +crQ==
X-Gm-Message-State: AOJu0YxNP1ieL2L/Km12G4NHpgKxFACZ4Jhzy8hFcutvFsBb7g+660mi
 TZFZ5WlID/7Jvpdkg9yAVS3RAzFbmXo6jXwAaHGiJvthP4LNI+u+sEtA7naHJfU7kBo=
X-Gm-Gg: ASbGncu3q4lHzo/uk7aadNIRH4vEeMIryoKjPOgTWdVI6GkiJlJ2mJKFFIpVvBSwB5n
 P/Z5zjVVaS6YpmWfqR/l2xu8QbcXfS9WzTgikZueJNsP71YjX+9HNcIrK94gcc1gr5GMw/7Y0sS
 lqp8B6cJh3azfTG54JrPgwPs4ocGZX47z9iXx+iOWv8iCiBZ4kV+aAIwG/7RJhn9X6OjK9prduu
 OGCyr0otLFzNeRjfbAH8zMRDg4zuN9JScpy9agv8vZsp5boi1NHH0CkKIxkdMapfnLNRZe+Fuck
 cMW7irl+mKMcppaxUrdwOuENXvcVM2oug/+8fOVrnLrIAv1hfvBYfKC8bzibCQN0pns=
X-Google-Smtp-Source: AGHT+IHg2Z8vU2xUZk3B9niN/6zs27k4W8s4bINMh0CMulpTqVopgRpTriUgEKdgRi5jIK3JHdu9gA==
X-Received: by 2002:a05:6a00:1384:b0:740:91e4:8107 with SMTP id
 d2e1a72fcca58-745fda2a06emr23069770b3a.0.1748388326949; 
 Tue, 27 May 2025 16:25:26 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-746e340fb7csm15692b3a.101.2025.05.27.16.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 16:25:25 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 May 2025 16:25:17 -0700
MIME-Version: 1.0
Message-Id: <20250527-fix_support_lib-v1-1-18610605348c@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIANxJNmgC/x2MQQqAIBAAvxJ7TjBpK/pKhFhttRAqWhGEf086D
 szMC5ECU4S+eCHQzZGdzVCVBcy7sRsJXjKDkgolqlas/Oh4ee/CqQ+exGQQ0Zi6XrsGcuUDZeU
 /DmNKH0zCXmxhAAAA
X-Change-ID: 20250527-fix_support_lib-ba555aa44f86
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2758; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=R4XD/4zc5otN7BvmSJRom98EaFTtG8hMoiSv13945YU=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ4aZ571TbF+zLDRfRJSWLtyRe1LX6pzUI9b1GgdvvSpmz
 3240Sy4o5SFQYyLQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIn42DH84fqQ99+96dnf1sum
 79a+49r3X+jUvTdfs/ur5nF733d6XcTIsHu9h4MXb96fb4Knrb43LDUrP3wyXL/tibuFVkl6+Fs
 PVgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748388327; x=1748993127;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uXBSUnb7e5zzIjZ6PBwaB2BnT29ixwUqQsC+5iw0Iko=;
 b=l8YbQvt8bUo5h8lVcLprrL9sUANoELbioHjukBSwT140YAytSIsafwlsjh93ipe+x/
 +NN7PCJWDEk1VFtw8o015ogudGsTyahvsIauEuNHPbK37z2+5mciD/q0gB0BSU4U/xZ5
 4o81bL+vHhFTKUj5m9rb7dm5hEnHxPmQ38kbyGmweIoAEd9QYpWTR2KTXTapT2dxt5X2
 7IMF5a+rGzTDyqsZusxBfbRClPOiLzhW76uNGakJP94pLIE9AkotAXhIAZVzxU6GVZiI
 UDe7fPbNSDl2Cp66Q1Kjkqap/LBW92edvvFnaDKOAiiyDoMMNZ+9i7/OMxVmkCqNIS4a
 pNIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=l8YbQvt8
Subject: [Buildroot] [PATCH] toolchain-external-custom: Fix support lib dir
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is currently a hardcoded way to get a separate lib directory by
looking for libstdc++.a. This is a flawed approach because it assumes
that the toolchain has libstdc++.a, and it assumes that this library is
not in the sysroot. When using crosstool-ng, neither of these conditions
are guaranteed to be satisfied. The libc directories for crosstool-ng
are placed in /lib64, but libraries like libatomic, libgcc_s, and
libstdc++ are placed in /lib.

Remove the condition expecting the libraries to not be in the sysroot,
and look for libgcc_s instead of libstdc++.a to support toolchains
without c++ support.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Related patch to fix crosstool-ng support [1]. Both this patch and the
linked patch are *required* to have crosstool-ng work with buildroot (at
least for riscv).

[1] https://lore.kernel.org/all/20250415-fix_external_toolchains-v3-1-81609e84100a@rivosinc.com/
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c08bf0a65391833de840c2f5ca112bb0b7802471..f8ff869de78aa66b10023a59773a89b10f6d29b5 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -451,10 +451,12 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	SUPPORT_LIB_DIR="" ; \
-	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-		LIBSTDCPP_A_LOCATION=$$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
-		if [ -e "$${LIBSTDCPP_A_LOCATION}" ]; then \
-			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
+	if test `find $${ARCH_LIB_DIR} -name 'libgcc_s.so' | wc -l` -eq 0 ; then \
+		LIBGCC_SO_LOCATION=$$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libgcc_s.so) ; \
+		echo "LIBGCC_SO_LOCATION_RESULT: $${LIBGCC_SO_LOCATION}" ; \
+		if [ -e "$${LIBGCC_SO_LOCATION}" ]; then \
+			SUPPORT_LIB_DIR=`readlink -f $${LIBGCC_SO_LOCATION} | sed -r -e 's:libgcc_s.so::'` ; \
+			echo "SUPPORT_LIB_DIR: $${SUPPORT_LIB_DIR}" ; \
 		fi ; \
 	fi ; \
 	if [ "$${SYSROOT_DIR}" == "$${ARCH_SYSROOT_DIR}" ] ; then \

---
base-commit: bd9a6c2b36d92dd38fb3b537ac9645344bec76ac
change-id: 20250527-fix_support_lib-ba555aa44f86
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
