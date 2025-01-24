Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A663CC0218B
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 18:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FF0160733;
	Fri, 24 Jan 2025 18:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZFJGC23BIyC; Fri, 24 Jan 2025 18:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A6FF607E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A6FF607E0;
	Fri, 24 Jan 2025 18:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EC61944
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0B9E811CA
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-8ea8vWDJ7h for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 18:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E69AD80C21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E69AD80C21
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E69AD80C21
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:47:18 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3ce873818a3so20098525ab.1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 10:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737744437; x=1738349237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BhcRIdaVW7PCp1+GdP02Kfdu7FdhTrZNb01/6EsUW5o=;
 b=HBXA8bLyfAKidtVRDVhRk4DVC8E+S0/g6QIvdEINIcswrBRYHx/ELTrxCoGLrf5cET
 auRp3I85300QrfC6MQg8PgK0RTFvQIpq3WYsKsg71CXPsmlr9isCEi7suCITDcBW9axD
 mFy9dktrtQwEZ0OMBpQeXBvtdN3C2dC9BZ72TkWnt1PgsgjW4+YA4Bq0aXS7NIOAkTuy
 po+9kV7VgS5sbpHisUjDQtR+pNHWYdNAfm2JnkvvM0AQM54diaN+hLsOACwHfyKXTI32
 c0jQgBRnmiCJeXAQKurdcNrJdfVsIPHvzOQTVA8AKpZvRcwqRmY3PV1ErsRemrpgE2+u
 +43g==
X-Gm-Message-State: AOJu0Yz3SMJrVaK9XtvXXsVB0knN/Bt3WUHazUO64tzIwViaYCUsKC9e
 pmqfGmTkmYpI0a+bAvQ/wKsI/ertNaCcHqxXDYBTqGWjsgJoaKHKTlck1Ng1
X-Gm-Gg: ASbGncv/x+nTPwg9feUAa+doobwBkcVdcQtbanmOr6FZ5BJiWz6IEdGwmtKNSNhh97D
 dRU2L7jbtoat7vzvytd3WP5RJPTM/+2zkz3qFIYYAEjSet/Hw4L/GuLA1blr17dGNApCs1Hqc0z
 DsCJIT366+XzvAp2xXA2xpzsJjRyjxzzR6u3bt+cy3mqesS017YdgPDZESRTCPpq817gshe5/S8
 /R7S8Mq7bLvh1P4Ee2QKj5iSM3QVUeK7Gstt10Ny37qZ9d5Ih+5TO0s/7VWx/o2i3T6iLTz45QR
 3a7l4lAl0V/VdoJKdiqgaKh6a3wmekbhohkivBVafXb44t3woQthtm4=
X-Google-Smtp-Source: AGHT+IGJ4R85BOzEKNVog/Q81pK9u/MuySnn4Tkez5o+nKsg+6KWMcCPZTCFYa8QnqOK/DNV3rTufg==
X-Received: by 2002:a05:6e02:221e:b0:3cf:c773:6992 with SMTP id
 e9e14a558f8ab-3cfc7736a50mr55163515ab.12.1737744437569; 
 Fri, 24 Jan 2025 10:47:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc7506d29sm8236165ab.65.2025.01.24.10.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 10:47:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 11:47:13 -0700
Message-Id: <20250124184713.3797130-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737744437; x=1738349237; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BhcRIdaVW7PCp1+GdP02Kfdu7FdhTrZNb01/6EsUW5o=;
 b=ac8o1aby1FsO6IiCoywVla9z69ugMLg/2WV035Kl8gCLEW3+qM00NmHkANGeBwsdeC
 n8uOOeID7PQ8K3qkycZXN+R/WIQlIqGWxKqkg9ksyvxtF4R502XAQhGM2xY+q/yp6xtK
 2w4UPMtawyjX4vhMJCRzB2KKabkojXdN3DONfe066mY1XlIJDRjmZjkiLjEYzfvbPedE
 ewjPyYzToarGac1H2iNTteAkXiBFBrBJsZDIi9t4CTtR5AmVr0bNimQn45zAntALSAFc
 mSptb+ANqsbPANbpo+szkR4oPWSGvGV5A6q5fi2sTEd4lNJQscBPsPR8UWAv4D16k+9e
 JazQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ac8o1aby
Subject: [Buildroot] [PATCH 1/1] package/python-filelock: bump to version
 3.17.0
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
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index c81d016f8e..a266762eea 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  4c66a5abfc4004cbb0cc30d22e472031  filelock-3.16.1.tar.gz
-sha256  c249fbfcd5db47e5e2d6d62198e565475ee65e4831e2561c8e313fa7eb961435  filelock-3.16.1.tar.gz
+md5  32624573c1dcea186f907c78e4fb80a2  filelock-3.17.0.tar.gz
+sha256  ee4e77401ef576ebb38cd7f13b9b28893194acc20a8e68e18730ba9c0e54660e  filelock-3.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index f26030a9e4..44599ee865 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.16.1
+PYTHON_FILELOCK_VERSION = 3.17.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/9d/db/3ef5bb276dae18d6ec2124224403d1d67bccdbefc17af4cc8f553e341ab1
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/dc/9c/0b15fb47b464e1b663b1acd1253a062aa5feecb07d4e597daea542ebd2b5
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
