Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3318E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2A4E83B6B;
	Sat, 11 Jan 2025 15:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUDcZyWKNqDz; Sat, 11 Jan 2025 15:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2CCF83B41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2CCF83B41;
	Sat, 11 Jan 2025 15:19:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F8E3950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AE914013D
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysdnbKn_8wJT for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE404400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE404400F9
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE404400F9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:19:48 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a8f1c97ef1so8125565ab.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736608787; x=1737213587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ij/O8D7EKgPerwlIQEbhR48ZTufQ50L7FT9LPvcLbe8=;
 b=NIRb7GVcU2VtuxtlZPGMIo5Cb0dGSqJ6CZ+Sk2zmZ0CXllKk1lzw6+MpZRZK/neijO
 izhVd7IlTqjxYxBIRaff9KDUhh5myKgm31XdJRqeP9+zJxMAFgavDXFdW7BWIKULwdMx
 kWKaL0kMI8eDZR+LSBoUhLQSH4kfWeCMTL7uZ6UviMj8Veg9koKuzZgFTBYNysYyKpg6
 A6YNTglGiYUWAmftAsE4Ynt0WqCgGgY7z36JtexbJAzetNnp63lozbJYT0wzjsP7Zik6
 H5Zxn4odGKPno2Hbccj2Apl4ktQ2A0dWPQmC7nibfjQLOv6Ls1z2GEZcFg5yHYB+tgKF
 lYFg==
X-Gm-Message-State: AOJu0YzFi1WGbJLfynl/702OMeIE3k4xVHkTYD6pPLjdW92VFkMV8U1r
 mVuxGruQ7yIAcj64RFhaIvkBMHXpv+ubCZ5cSgTkUbhHyGZBkxwkvTCVv0sSmfY=
X-Gm-Gg: ASbGncvHmgsk0E7aQxGsB7xQq4isFAgx2pf9PQ3aIW3dg96nP/hP92aUMbiYZYX+tbB
 aYedgvvXrEJaxkpik45jBpf/g/PVoWJM07wFvw6yxx05Y2Bu+8djD3RN8O3Z7WzMmi9jpqM+giG
 jkDnsHdEL+3yV1oyTfM8AuBkCn45HZGL7zst2mscegmKv0ufl24Ibrc4Yc5jko63++ly5Qx69ji
 BiU2Wlw69lqZ8F27ItYscEzXcmO0OUSlTRVb9RuOUVQBDmSpWvf0vCRCVad3udeN7DM0krxYzw/
 VaEpa4oT56GETlYfZbBzkDaUP+yI4Ag=
X-Google-Smtp-Source: AGHT+IGW5GaxjEueAXaWklard4HDh9xC/NffMfiDGLSbCD467z1dxfK/9FCBLuQSBFCgLYyrgVYPaA==
X-Received: by 2002:a05:6e02:525:b0:3ce:3c8a:b7e0 with SMTP id
 e9e14a558f8ab-3ce3c8ab948mr87661965ab.5.1736608787523; 
 Sat, 11 Jan 2025 07:19:47 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce630ffcd1sm5537805ab.56.2025.01.11.07.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:19:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:19:45 -0700
Message-Id: <20250111151945.2835796-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736608787; x=1737213587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ij/O8D7EKgPerwlIQEbhR48ZTufQ50L7FT9LPvcLbe8=;
 b=cVMHc1P5+KBV30cgm0y3cLiq/ixLYmCpMy57tk2h0m1aw4KXZPC3PuJ8selsGrWFIv
 yiX4JdpJDbqGS1+KDN/wSR5mQ6rdBOVe3dURTZHe49izdI0EZyE+oJgdrV5d4SGLCYye
 r18X28Kazsf4E6Oc93SD1s3/6LFa8GeWhkJf5MoJhVyHd4oFn1NVMua3ST6KIioMkW1v
 ePWrGJjxbc8hWx1275f8STFn51JWkuiSEG1NYxguELcwQ2FK28wCds4PU3rJx7IA/UyD
 qhe2/sd68IJqZlTNYsxV/CFkwSfxRlsSHRYUfiTJI8mYdt69/vkokoNty3ykU0rKOoJn
 C3ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cVMHc1P5
Subject: [Buildroot] [PATCH 1/1] package/python-psutil: bump to version 6.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 0b7c3f6bed..3432ac6506 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5  2baae02411c42c185e129c3f26030079  psutil-6.1.0.tar.gz
-sha256  353815f59a7f64cdaca1c0307ee13558a0512f6db064e92fe833784f08539c7a  psutil-6.1.0.tar.gz
+md5  d06db97a604ddeac1d42694eac4390db  psutil-6.1.1.tar.gz
+sha256  cf8496728c18f2d0b45198f06895be52f36611711746b7f30c464b422b50e2f5  psutil-6.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b89c063b3786e28e0c0a38f1931db61fed35e69dd2a2966fbecffee0f46c8d10  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 73f54231b6..ff90126a8f 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 6.1.0
+PYTHON_PSUTIL_VERSION = 6.1.1
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/26/10/2a30b13c61e7cf937f4adf90710776b7918ed0a9c434e2c38224732af310
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/1f/5a/07871137bb752428aa4b659f910b399ba6f291156bdea939be3e96cae7cb
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
