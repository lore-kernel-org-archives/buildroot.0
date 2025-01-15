Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54538C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 03:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED38F4071C;
	Wed, 15 Jan 2025 03:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sojGMN0P8Jbk; Wed, 15 Jan 2025 03:40:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9FEC4071E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9FEC4071E;
	Wed, 15 Jan 2025 03:40:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E1C3B8B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 03:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D107F8305A
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 03:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSqlgsS5uxVQ for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 03:40:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC23784067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC23784067
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC23784067
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 03:40:24 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2167141dfa1so7431585ad.1
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736912424; x=1737517224;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a5BlZ/VRYmyqbb3XNyQY0dzkvoA6IV3DW9YTWudsm6M=;
 b=XyCkyZSBCPpVdOvEZp+bKVbuCZbuDtK0MgCh51rYUhaj7eO7mIlvcBGjDV3m404vC2
 7M/CaN7jrHnCTJOFL1YloKs0MhaGiC2wCaTbjtNYc44tgfQh/qeJ7lsbbU4xWocSm+xp
 GqiI3V8YCwc/yL2ATd2Q6p3w1jZHEZku/SfD2sSM8CHDEFUtq/hW5GikTVZJf8tmwDr3
 a22uBK0PPnhS789rfIiHe1uXy3v+RpxKH2VpdaT8Z51gooBw/6Th+dSj+kJm4CGCpvur
 dxjP0I3vKbLPGHIKYLFQOrn454XzlN9o63Bl+uC7r4YhALN/7mwsqnHuxSe8WiISB0AL
 2REA==
X-Gm-Message-State: AOJu0YwgHdxd6XVTIX63WL+IH5mWTgVZho3LBl7zi38jEyN69ws1KbqT
 +B1zCB2vNtcm2/YXnxu1AtLc7b8BRaLaUGSkFv7zX9fQnHzddrEq/9dGzVnZ
X-Gm-Gg: ASbGnctp8xgPveZU46cU4AXFtMQGTlT/SPiIEjDS17vTM+fNEaAWKyEA8bZcMhl4BxE
 wvqSzZUq6VBBWN5oGI8pOsa5vFTfdP/8S9OzhpMLYCs9i0GkOGUqTqGiXo02BR26/io91bLoKlm
 62wpK484D0oDXPg93lJgeCiKTYIxwQpB0+nIG/HmbRjzybQ4egOJwGSxhx7TxoRnhwsKPM0fX3I
 170qY995b8G2KKjZ3WM7n8TR9NQPTzpjyODtL6z/Bjxcvbnz2C4WTVFnaX49GmXiMvgkONIjcIq
 qjUqDdpcvBMUdQJvuWSgCcbVMG5OxvxxMhZmPXRL
X-Google-Smtp-Source: AGHT+IEX9E0CFjX+091wK/SVRpnew2Ss/wvTompkTwS1py9KzIwKLvS7n5AxlRaHvA62bkQTq6xOcg==
X-Received: by 2002:a17:903:238e:b0:216:311e:b1c4 with SMTP id
 d9443c01a7336-21bf029e049mr19397705ad.4.1736912423346; 
 Tue, 14 Jan 2025 19:40:23 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f12f8dcsm74049155ad.66.2025.01.14.19.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 19:40:22 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue, 14 Jan 2025 19:40:20 -0800
Message-Id: <20250115034020.792083-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736912424; x=1737517224; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a5BlZ/VRYmyqbb3XNyQY0dzkvoA6IV3DW9YTWudsm6M=;
 b=SHXSOI5g03aaOTOEOsCSr+jm9fr10WgNF+Rh0GQXssllqnloj8sHysbJiggptF5iiK
 NEqbyiuQYgQjTaoA4tCFaoqFvqr0upTI276T3VGMVD8u9RSipnSCgKn5hMmUiYxIi6F+
 0fUKFbAgvXBX5uUI40UusoMG62jrh/NQueqaFvV7PfEwvNImObsAxZAiEHgXnFPOMWmN
 j3+5s5D6XamZwrQgkMdDBsJ+hpKwgi3nARnzU4zbKRDhQwL9egWjeWvwO3cSZlQ9EdTH
 5hQqEezTOD3MtjZAIrSKv/VwRZ6pcDUvb/8RHA2kj+gALRArnMSIV2U4blFi38FoNerP
 bx7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SHXSOI5g
Subject: [Buildroot] [PATCH 1/1] package/libxcrypt: bump version to 4.4.38
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

Release notes:
https://github.com/besser82/libxcrypt/releases/tag/v4.4.38
https://github.com/besser82/libxcrypt/releases/tag/v4.4.37

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---

Notes:
    $ utils/test-pkg -a -p libxcrypt
                                 arm-aarch64 [ 1/41]: OK
                       bootlin-aarch64-glibc [ 2/41]: OK
                   bootlin-arcle-hs38-uclibc [ 3/41]: SKIPPED
                        bootlin-armv5-uclibc [ 4/41]: SKIPPED
                         bootlin-armv7-glibc [ 5/41]: OK
                       bootlin-armv7m-uclibc [ 6/41]: SKIPPED
                          bootlin-armv7-musl [ 7/41]: SKIPPED
                    bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
                   bootlin-m68k-68040-uclibc [ 9/41]: SKIPPED
                 bootlin-microblazeel-uclibc [10/41]: SKIPPED
                    bootlin-mipsel32r6-glibc [11/41]: OK
                       bootlin-mipsel-uclibc [12/41]: SKIPPED
                         bootlin-nios2-glibc [13/41]: OK
                     bootlin-openrisc-uclibc [14/41]: SKIPPED
            bootlin-powerpc64le-power8-glibc [15/41]: OK
               bootlin-powerpc-e500mc-uclibc [16/41]: SKIPPED
                       bootlin-riscv32-glibc [17/41]: OK
                       bootlin-riscv64-glibc [18/41]: OK
                        bootlin-riscv64-musl [19/41]: SKIPPED
                     bootlin-s390x-z13-glibc [20/41]: OK
                          bootlin-sh4-uclibc [21/41]: SKIPPED
                       bootlin-sparc64-glibc [22/41]: OK
                        bootlin-sparc-uclibc [23/41]: SKIPPED
                        bootlin-x86-64-glibc [24/41]: OK
                         bootlin-x86-64-musl [25/41]: SKIPPED
                       bootlin-x86-64-uclibc [26/41]: SKIPPED
                       bootlin-x86-i686-musl [27/41]: SKIPPED
                       bootlin-xtensa-uclibc [28/41]: SKIPPED
                                br-arm-basic [29/41]: SKIPPED
                        br-arm-full-nothread [30/41]: SKIPPED
                          br-arm-full-static [31/41]: SKIPPED
                       br-i386-pentium4-full [32/41]: SKIPPED
                          br-mips64-n64-full [33/41]: SKIPPED
                     br-mips64r6-el-hf-glibc [34/41]: OK
                   br-powerpc-603e-basic-cpp [35/41]: SKIPPED
                   br-powerpc64-power7-glibc [36/41]: OK
                           linaro-aarch64-be [37/41]: OK
                              linaro-aarch64 [38/41]: OK
                                  linaro-arm [39/41]: OK
                             sourcery-mips64 [40/41]: OK
                               sourcery-mips [41/41]: OK
    41 builds, 23 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 package/libxcrypt/libxcrypt.hash | 4 ++--
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index 9bcf119077..88abb79ee0 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,5 +1,5 @@
-# From https://github.com/besser82/libxcrypt/releases/download/v4.4.36/libxcrypt-4.4.36.tar.xz.sha256sum
-sha256  e5e1f4caee0a01de2aee26e3138807d6d3ca2b8e67287966d1fefd65e1fd8943  libxcrypt-4.4.36.tar.xz
+# From https://github.com/besser82/libxcrypt/releases/download/v4.4.38/libxcrypt-4.4.38.tar.xz.sha256sum
+sha256  80304b9c306ea799327f01d9a7549bdb28317789182631f1b54f4511b4206dd6  libxcrypt-4.4.38.tar.xz
 
 # Locally calculated
 sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 60901988ac..c2b2ed3e4a 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.36
+LIBXCRYPT_VERSION = 4.4.38
 LIBXCRYPT_SITE = https://github.com/besser82/libxcrypt/releases/download/v$(LIBXCRYPT_VERSION)
 LIBXCRYPT_SOURCE = libxcrypt-$(LIBXCRYPT_VERSION).tar.xz
 LIBXCRYPT_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
