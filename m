Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B70CC4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 07:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A132E42ECE;
	Thu,  8 Feb 2024 07:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id muhzHiWzDEsj; Thu,  8 Feb 2024 07:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB40E42ED4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB40E42ED4;
	Thu,  8 Feb 2024 07:49:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D33481BF476
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 07:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0384616E7
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 07:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abuXz2_k094B for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 07:49:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5D176165D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5D176165D
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5D176165D
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 07:49:33 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d073b54359so20958491fa.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 23:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707378571; x=1707983371;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d4Dq+ww5LuK9lpKCkfmE9QnsMcb92jJ+YbcgTLSeJPc=;
 b=CYwu6855U2oYHDcAZg4JIFmFXPIkLus4A2Uv3OA0EdsxvmHW6VKmF2LxltvdHgkDgf
 fKbLYmzfee89piTT8f/ONKw98p907NyZw2fdoj2zKNYueJpGo653CGVuP8fbgp8QhuTF
 lTp2L84svEsjDjRnFhkKnSS41pAfLXlZ9/F5HVEYlW+NK2kCR7n0gTEawf9hAhzFwj0I
 ScVqFSFvDSNy59Z9coiwYXsXkP63RcRaEAoJzIr5sIAiCti1yTD2dxLDPNAB4lWS6/7Y
 QgTefx1GbsidFykqtAKXKdK5uxswN90mtj1ysc2wb9my0e0z/9Oy6UVrjmcw7KZ0cgWu
 4GBg==
X-Gm-Message-State: AOJu0YynuWYMQQF8E1MiVaGWA+NLw+23w85rEaVQi+P8eu0qT87xp3s9
 x2ixf2oV3l8yDqaOVPBzXrTMtb+qfch+CH2aN3Xt+oA1Xzh4l5Q3zN56SxuRjZE=
X-Google-Smtp-Source: AGHT+IFxXRYEYekL3BNRchJm+y8qTOCT4AN6W3dhNFoCDFU8nFGrSRwvLcMIHt3OMUN9N2CVrk5KFw==
X-Received: by 2002:a05:651c:782:b0:2d0:b758:93a5 with SMTP id
 g2-20020a05651c078200b002d0b75893a5mr4925069lje.18.1707378571084; 
 Wed, 07 Feb 2024 23:49:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW4gMR30EdBDq25kad2cr1wjjlLXl6XcKCfsyuu4sLb6wCLADZoviiwULdbmS2Ni7QE+1k7C8APR8QTfYj7XuvRDBzVv2RZjTkyNNQEEZquKeaaFO03PXhxkZrEFkK02R1C1U7db3mteK0kLu/f2YfFz/zO34o69NfogHKqT0Bia/G0ri7kkU3NBoQyLS3MCymbak8uGvQ=
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a2e7e10000000b002d0ca6e0f9fsm366371ljc.15.2024.02.07.23.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 23:49:30 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 08:49:00 +0100
Message-ID: <20240208074901.1654224-1-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707378571; x=1707983371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d4Dq+ww5LuK9lpKCkfmE9QnsMcb92jJ+YbcgTLSeJPc=;
 b=SWwFwhOLC8RMiZBsLuR2tB44TAxhVT3/gJCgW6bsTJHSbxh2EcjmS+hqFBPACbzSf5
 E3GE0aZXGBXYWzh0oN6v9QHCXUw800l4kUObuVP4VI/QGGN2FydrmtUphFr9kLQ40Dsf
 CYffPBE0UOPUfVHhCDH2eDXbrFGOIxP5yY5Uu4CsgEir4DuCMU1NpTwB4q5qW1ws00Kr
 mGBFQ3ngk+KZwNGcU8jUng9CkQDRJHYfMFO3CxiJRFf+s1YiXFt9Mpu1j1lcAY4nJRdM
 7Rqf9J0UOvCiVGFRXYIT11am0G/gCXwHOOj4zEjhSX2N5SEXFh6z3QDNWL0u0DhLA8Wp
 U88w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SWwFwhOL
Subject: [Buildroot] [PATCH] package/python3: fix install
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following failure in the install step of host-python3:
    ...
    /usr/bin/install -c -m 644 pyconfig.h output/host/include/python3.12/pyconfig.h
    [ERROR] _tkinter failed to import: output/build/host-python3-3.12.1/build/lib.linux-x86_64-3.12/_tkinter.cpython-312-x86_64-linux-gnu.so: undefined symbol: Tcl_AddErrorInfo
    The following modules are *disabled* in configure script:
    _ctypes_test          _testbuffer           _testcapi
    _testclinic           _testimportmultiple   _testinternalcapi
    _testmultiphase       _xxtestfuzz           xxsubtype

    Following modules built successfully but were removed because they could not be imported:
    _tkinter

    Checked 110 modules (31 built-in, 54 shared, 15 n/a on linux-x86_64, 9 disabled, 0 missing, 1 failed on import)
    ...
    /usr/bin/install -c -m 644 ./Lib/types.py output/host/lib/python3.12
    /usr/bin/install: cannot stat 'Modules/_tkinter.cpython-312-x86_64-linux-gnu.so': No such file or directory
    /usr/bin/install -c -m 644 ./Lib/typing.py output/host/lib/python3.12
    make[3]: *** [Makefile:2068: sharedinstall] Error 1
    ...
---
 package/python3/python3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 42765abcf4..81d9a904c7 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -34,6 +34,7 @@ HOST_PYTHON3_CONF_OPTS += \
 HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
 	py_cv_module_nis=n/a \
+	py_cv_module__tkinter=n/a \
 	py_cv_module_unicodedata=yes \
 	py_cv_module__codecs_cn=n/a \
 	py_cv_module__codecs_hk=n/a \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
