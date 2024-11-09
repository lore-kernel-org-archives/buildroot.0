Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D37BD5E376
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF0DB846C3;
	Sat,  9 Nov 2024 17:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5DZ_7o8c2y5; Sat,  9 Nov 2024 17:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C394C846DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C394C846DA;
	Sat,  9 Nov 2024 17:27:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 817CBC2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68A336064D
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZ42DArRDg45 for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:27:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C5B860087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C5B860087
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C5B860087
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:27:49 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a6bc0600f9so12073595ab.1
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 09:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731173269; x=1731778069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dnfe9FQQZPB+5heQcAZmylVWSLXObQlli2ZplTNRkhc=;
 b=cbFtwEXOfhMvwKSNsRQWR5thqQD+m0V9/oXn1zBMN0t/+C0cfKaP62CnCR8tBJtxDd
 Nje4BGE52v0CZOLiCWaKrR3W/FziBBJu9tp3a340ml3oCusnELU9uxOAsDtLDRkHmPuS
 ws83tKBgLy9iu9CSBzVAlncDGmJSb4EpmF144g35Sd1LU0JGrdqcDob157UXapkCq2p7
 w3QMH9nLTgPIiwvf8MoGe4g9X7MNlbgG/ACreJ/7rrqjT6WzcEzH6TfZuGfJJO0sC91U
 tvnlMq8sM2FNqIhYNsvOvA9y5uUyxyGjyW/tlgODCdKxDlwpNXQNnuNeZWlDBLgf6TIa
 If7A==
X-Gm-Message-State: AOJu0Yxem2tkrP+qOZ/sgr6DYEuXcyTZoeMiFKqXyvWSzk2iF9KCfAsi
 enk/1GkVUBA3YNd3dIJBSh1fU6GuQVAUOfvQcgPe6ivDM0cvoyKMSS8lSQ==
X-Google-Smtp-Source: AGHT+IFPi5fQPLkBFp3fotIJZS4NKjxtkeOtlONvbkiRuYpxKyPYD8rzWID/IzNwbFf29oy2Hbjf1w==
X-Received: by 2002:a05:6e02:1d96:b0:3a4:db10:742d with SMTP id
 e9e14a558f8ab-3a6f19900cemr75037675ab.3.1731173268678; 
 Sat, 09 Nov 2024 09:27:48 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787f9e5dsm425412173.142.2024.11.09.09.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 09:27:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 10:27:46 -0700
Message-Id: <20241109172746.600757-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731173269; x=1731778069; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dnfe9FQQZPB+5heQcAZmylVWSLXObQlli2ZplTNRkhc=;
 b=Zy4FXGksIQegPUlTqC9uMXS1HAeZspHT+/2W1cMYxKujACiudYhTsITClC1uV/fk5j
 7S5GQKDYai6AzPieCLxNrcByKe7/Wb/6DexypFD7gBu5kdXr925Sm+zTK2ISifLheE2G
 Unj3qWJHa/Y47QY4mAEBwgB2OQG5a8aYoYaedZAQF6yUWAh7CrkBQEaRxp5GKef2BmHF
 Y17QOSKChCMBOifS0+1Hh0rTL5CFpzTVZLkLTB1yUPJIsuu03X3N2YOsMHDLMetpu2JW
 dZBpbt1X8npKDQnmSXHxqTSHg927quZ2wCvujaOwIEDv5aFoE2ATO54HsqWYXdu+iZqJ
 /L7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Zy4FXGks
Subject: [Buildroot] [PATCH 1/1] package/python-google-auth: bump to version
 2.36.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 688a38f925..ef0ceaeb60 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  28fa1c797f8a75839337b742bd0582d3  google_auth-2.35.0.tar.gz
-sha256  f4c64ed4e01e8e8b646ef34c018f8bf3338df0c8e37d8b3bba40e7f574a3278a  google_auth-2.35.0.tar.gz
+md5  8dba1c171af4d945fb479ab27a0aac38  google_auth-2.36.0.tar.gz
+sha256  545e9618f2df0bcbb7dcbc45a546485b1212624716975a1ea5ae8149ce769ab1  google_auth-2.36.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 41c7bc9b50..f2ccc2e3de 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.35.0
+PYTHON_GOOGLE_AUTH_VERSION = 2.36.0
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/a1/37/c854a8b1b1020cf042db3d67577c6f84cd1e8ff6515e4f5498ae9e444ea5
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/6a/71/4c5387d8a3e46e3526a8190ae396659484377a73b33030614dd3b28e7ded
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
