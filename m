Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413A6C5AD49
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 21:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D508883DA6;
	Fri,  6 Jun 2025 21:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJZWB9F-7ry7; Fri,  6 Jun 2025 21:29:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA4C083E14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA4C083E14;
	Fri,  6 Jun 2025 21:29:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDC4CC8
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 21:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C347040652
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 21:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3__5i-PRx9Z2 for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 21:29:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00EA440683
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00EA440683
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00EA440683
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 21:29:02 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-235ae05d224so26830005ad.1
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 14:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749245342; x=1749850142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xepZEb/f4zURXkLN8iLxU1PeYPr+T0FNn/MoBIajA3w=;
 b=o7YZ/8GouOqFAoNKfg1tREL/p4R0AdDufr9U+QIQJwcSDdEB8am52Tm0KvCsxd40gK
 xf8exk66BLOR4l0JB17N9GkxLF8IuGZt2boY3yvrTaI4tDqDZxfIgw2VhmR6X5U4ISAk
 Cm9X4LacaUGt79mae9WNh0lpGCMYweh2ktS2C3p4G4kCdLBvut689Ecq2VzIj78VWN4b
 2fk4xHWhTaS7Jn285S0/Fq4GaCUKmlycKlX7HCtp8TFoWb6Mm266vucqhnO+2vu1OGGs
 DfGSh4kjuDiFfwT03tTK63WRAmzicc1AwWFWJftGOztuTKqSVwwbdDTwsXY0c7s1Mx0q
 DUtQ==
X-Gm-Message-State: AOJu0Yz9GilogGFFkl4d9HU+6X/zB19b4QuxRPerzLmPH5vcm7kK79yp
 ErGgJkcLLRNaYy44w3id5Nn5/GbCG0pX6uVscBXFe40aGy4Ql6HBLkAdr5bBTqW2
X-Gm-Gg: ASbGncuxXKl9KY1hzhBUTZa1iJvXuCyNjpoCN7gAAFjiCw2YS63Ji1uZ005L6rQLMha
 E/Tb0bgMmM0bydH73A9cspNMcmkXmrrHGAdle3VsZiNV3s2AT+g9uBBr017XFcdeg+oXvlDEFFv
 /l3HQWYjFdVEwyaVH6BpolRD2xU6mRRSghGDsYBFhJxEj7ZoiL+ulcapMUtFMuwImf6FlqtFxVo
 xRMmOb6ZM0IdLfJtU0MmDMXJcHcoL/2roz5BXDoeBFy6T5YvvblJVo+4TJ0hPdSY4YSvuU1ORio
 JkpFzBUsIji4BdrW/lnUvwT4jIbd8QfnSIezTvd1zmkl18lMweKhzwfAe+t3iHAY0VBG8XM/5sy
 WvzGnXl1g3wGWxeV3ayEmHSn9kaWQa4YtTgRAZQ==
X-Google-Smtp-Source: AGHT+IGcemhlQQbxvgvxnaprNIjo3ArtsKZlsVOAvst10tWQVBELxhyZ0sz+ZLIHPyxsiSxuVoUMzA==
X-Received: by 2002:a17:903:3c63:b0:215:a303:24e9 with SMTP id
 d9443c01a7336-2360204dac7mr66779495ad.3.1749245341788; 
 Fri, 06 Jun 2025 14:29:01 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236030780f4sm16964695ad.51.2025.06.06.14.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 14:29:01 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Fri,  6 Jun 2025 14:28:51 -0700
Message-Id: <20250606212851.15883-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749245342; x=1749850142; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xepZEb/f4zURXkLN8iLxU1PeYPr+T0FNn/MoBIajA3w=;
 b=DqIAgoUyXAXNg2d+LCEEUc8DXepv7yyedkxnpBYVwuI2Jm7Ta061Pp+LkBYWkQr3vR
 ZaOSPFuNfR/KdEjl5DsoVkTOJgknGRE0nmxVA3O4KigWyt1g0p+dS8SYq0jplSw+HFK+
 j+J/EuHzLYTMqRZdQLzlxhNLylLWcUJ6A+B6ttsHsjZQEqJ+Svyre4uDL3mjipdJEh2q
 vDn9JtI5IPz0Mvb+LWFaIuKOvW9z+nid8A9bPOpBx/Az0HTTswsnoie5xJi3F0MFg9NL
 DhRQwdxzr8fuIS913Nt/yNZhXAyPhPP4GEciY6UYfJ07ngc8zO7ZMJES5E+YUGHNHy2A
 3bzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DqIAgoUy
Subject: [Buildroot] [PATCH 1/1] package/gcc: update to 13.4.0
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

Release announcement:
https://gcc.gnu.org/pipermail/gcc-announce/2025/000187.html

Changelog:
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=13.4

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 .../0001-disable-split-stack-for-non-thread-builds.patch      | 0
 .../0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch          | 0
 .../0003-Remove-crypt-and-crypt_r-interceptors.patch          | 0
 package/gcc/Config.in.host                                    | 2 +-
 package/gcc/gcc.hash                                          | 4 ++--
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename package/gcc/{13.3.0 => 13.4.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)
 rename package/gcc/{13.3.0 => 13.4.0}/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch (100%)
 rename package/gcc/{13.3.0 => 13.4.0}/0003-Remove-crypt-and-crypt_r-interceptors.patch (100%)

diff --git a/package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/13.3.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
similarity index 100%
rename from package/gcc/13.3.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
rename to package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
diff --git a/package/gcc/13.3.0/0003-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
similarity index 100%
rename from package/gcc/13.3.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
rename to package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 496ead1e6a..83176684a1 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -71,7 +71,7 @@ config BR2_GCC_SUPPORTS_DLANG
 config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
-	default "13.3.0"    if BR2_GCC_VERSION_13_X
+	default "13.4.0"    if BR2_GCC_VERSION_13_X
 	default "14.2.0"    if BR2_GCC_VERSION_14_X
 	default "15.1.0"    if BR2_GCC_VERSION_15_X
 	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 00da7dd49b..76699a7b0f 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,7 +1,7 @@
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
-sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.4.0/sha512.sum
+sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9bac1055bbcad8ed5b4da524cafaef654785e23a50233d95d89201e35f  gcc-13.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.2.0/sha512.sum
 sha512  932bdef0cda94bacedf452ab17f103c0cb511ff2cec55e9112fc0328cbf1d803b42595728ea7b200e0a057c03e85626f937012e49a7515bc5dd256b2bf4bc396  gcc-14.2.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.1.0/sha512.sum
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
