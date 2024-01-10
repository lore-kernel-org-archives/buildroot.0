Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C3BC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 04:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1EE842C53;
	Wed, 10 Jan 2024 04:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1EE842C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1luuvSZEN-N5; Wed, 10 Jan 2024 04:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E42B142C28;
	Wed, 10 Jan 2024 04:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E42B142C28
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 031401BF5F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7522613B7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7522613B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kX5V2g4_-6gs for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 04:24:58 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9FCB605A1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 04:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9FCB605A1
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3606dd96868so22178675ab.2
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 20:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704860696; x=1705465496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=73r4eqLgkrGJRPOXfQl7fPbhgXlD1NwJ9W+kiomw/R4=;
 b=qQYMfn75WlUfZ3rIPo6jGJCsXZbxg7GEh72gCjlpn4cY9GUzG6DPfSEa2Bgdym4YtW
 Wcvegz2EB9ZyMoyD4w1EsEorrfmUD6w1d24J8yAeEXxZoGLOHNMd8fTAXmtaB7NhSv7U
 2Z7+Q8cYTim3+wLtQqJPTO9MMvMfnq/iv7ezfEdh0oSopkk7ZuSHYiB9TeR/SF5kC/w3
 WbjSBvvhLz35Tl2nl/ZxmXnny6r/6iFhhzTMAJ32OO6RPZRetz3rXLED849FjQd0P4DF
 TB/Ge2+aAiEFFAAOS19znmj+Cop/Dlr5NzCmDC+1XjeKquNk50PN0P5ae7Fto0tLLiHd
 03KA==
X-Gm-Message-State: AOJu0Yw6XZzq4wiH5qLIY/aBrQZum2hkaQEWerUo1Sx6rsLOu6ldL9tq
 qwub9i38Kix1/L3EG8wZquJk4VEszWxBJQ==
X-Google-Smtp-Source: AGHT+IHrDH6clVULDlM18z6zKQIHyhZqz0HnEhonfVG3XLkL9W3yPY8OqL3eMwFg98H04a2JyDGtBQ==
X-Received: by 2002:a05:6e02:1a6c:b0:360:6ca4:d304 with SMTP id
 w12-20020a056e021a6c00b003606ca4d304mr601900ilv.61.1704860696501; 
 Tue, 09 Jan 2024 20:24:56 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 by15-20020a056e02260f00b003608b8c848esm1022012ilb.32.2024.01.09.20.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:24:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:24:54 -0700
Message-Id: <20240110042454.1040891-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704860696; x=1705465496; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=73r4eqLgkrGJRPOXfQl7fPbhgXlD1NwJ9W+kiomw/R4=;
 b=Q0h6X0Lz85ZoDBpthvI9biMiK497iBfqYOjUPowWX9MauXCH3qbitufHPF5vPtgvOU
 OY3E+n12hCYZ8iY3QPbU7aaloRe9vt+Mn2KyP8tNncjJ3C9ftpugRkQ7SR4r+odGbHmk
 jL0ChC0bEF4J8MUjTsU6lrGCjZ7gNgpXxlmQxkoSOH/y5rKUfyewYsAy2+eEmDo9kuUu
 FwyGwGHOWIKSbQ4toqq0FV4JWBaLVPkCoLgYpwfsgQUdH2241Eyaw9Db0ewuocCblxvm
 tjh6j4wO60LGcxLiD3yySR4pEvOfVOpKugn6KDP47wOIrRnBkpYWqDeTXY78z/+kedMO
 6YtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q0h6X0Lz
Subject: [Buildroot] [PATCH 1/1] package/python-pexpect: bump to version
 4.9.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pexpect/python-pexpect.hash | 4 ++--
 package/python-pexpect/python-pexpect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pexpect/python-pexpect.hash b/package/python-pexpect/python-pexpect.hash
index a38c8d5a03..617428feb1 100644
--- a/package/python-pexpect/python-pexpect.hash
+++ b/package/python-pexpect/python-pexpect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pexpect/json
-md5  153eb25184249d6a85fde9acf4804085  pexpect-4.8.0.tar.gz
-sha256  fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c  pexpect-4.8.0.tar.gz
+md5  f48d48325ee7f1221add0396ea9e2f14  pexpect-4.9.0.tar.gz
+sha256  ee7d41123f3c9911050ea2c2dac107568dc43b2d3b0c7557a33212c398ead30f  pexpect-4.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a483ae1c4dc738a6c8b73feb49074e1835da02ab5aa686f2675029906fa364d  LICENSE
diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
index d230b11338..469144aa60 100644
--- a/package/python-pexpect/python-pexpect.mk
+++ b/package/python-pexpect/python-pexpect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PEXPECT_VERSION = 4.8.0
+PYTHON_PEXPECT_VERSION = 4.9.0
 PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
-PYTHON_PEXPECT_SITE = https://files.pythonhosted.org/packages/e5/9b/ff402e0e930e70467a7178abb7c128709a30dfb22d8777c043e501bc1b10
+PYTHON_PEXPECT_SITE = https://files.pythonhosted.org/packages/42/92/cc564bf6381ff43ce1f4d06852fc19a2f11d180f23dc32d9588bee2f149d
 PYTHON_PEXPECT_LICENSE = ISC
 PYTHON_PEXPECT_LICENSE_FILES = LICENSE
 PYTHON_PEXPECT_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
