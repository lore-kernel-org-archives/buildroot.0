Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577EAE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2537983880;
	Sat, 11 Jan 2025 17:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrB3-acnDYwK; Sat, 11 Jan 2025 17:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FE558380E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FE558380E;
	Sat, 11 Jan 2025 17:30:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D7C7950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E74040124
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VqShukVtj9tZ for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF51E400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF51E400DD
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF51E400DD
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:30:24 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a8ed4c8647so19417045ab.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 09:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736616623; x=1737221423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFiL6YasW5Ipg1oqfSjQCsiIKHYhAV1LYAb8zEToF6c=;
 b=C77TpII9tv7on4RaoMdyQOb61HkPx92VQNlVb3Cd6mp8/JMWLKhc6m0NzBTuf8I16w
 iYK3GYGGLiayP4zhTXJn0XvtkwxPT5lY9G/wweWVgVuj3rewMolxTKljmMM1M+E477sd
 +vMEb0hN1DbN1XD0KG0Y6ohsqNEqNSoc9mv3dd8FLS+gDiHZugRjXnDu5dUKcOHsY50T
 Nkjr06FPkMMlh8Bwj9HjEczJK6GX679lmTR5O+H/WQjhStjpZYa/xSWbBK6gR9gUj3Rc
 OfeTwSUCCEqQFTzIb4zm4BnBgITzi7L48vCvZvQ0WN/QgawcQbvTHfCG9mpdLIs7d5DJ
 ipuA==
X-Gm-Message-State: AOJu0Yzm8knm/TzakiUU6dq8KG22s5gTdcJuamJKDcypLjTyn/VtZIyU
 0Z1L6t47l69eFB6/JCtcx/ZAASOzIE5gZFf/DaCdvsSRw12YXn87gmcdN6oA4bY=
X-Gm-Gg: ASbGncsPYfzFtUHXzG9/gvvHt5vEAsjRyaPYbIi92WUTLYrVXVSimX7LtTR0SZT60Ie
 Rn4bEnYastreG48mFouT+qBGl6VRZ05cBzr0KubB+cvsxiHRDeBsgX01ovnMGqHviR+OZ2B+CmP
 ouLpEJMb/muwBjA9WZ5WDnK8xr4Nvtm1Bn5FrZ9cockQHOz38fMTVGsnG+aV9NNXv/OsQ9WRAf7
 eKrB29022w6LfwJJrCd9tid694MGWBawt+kuiSW8tSxUendikeh4xfK19W2l0D6/96U/y/3pQCQ
 TvTppOmnIkseMxbKrt+WO4jHTNjnO3I=
X-Google-Smtp-Source: AGHT+IEgOL9z5TdYXm3mDEME1wafqfivBVzmboRybQSU9amreDzbQAJ1vozPAt8rIxe1aARJg/SskA==
X-Received: by 2002:a05:6e02:18c5:b0:3ce:66cb:fa7c with SMTP id
 e9e14a558f8ab-3ce66cbfb1amr14336015ab.15.1736616623467; 
 Sat, 11 Jan 2025 09:30:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b614781sm1629167173.44.2025.01.11.09.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 09:30:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 10:30:21 -0700
Message-Id: <20250111173021.2915176-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736616623; x=1737221423; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nFiL6YasW5Ipg1oqfSjQCsiIKHYhAV1LYAb8zEToF6c=;
 b=Ge6QWDNeC9/li7J/+pCu/6iFAoww8c7bRgBBdjo2NmqzBY2jcK71/EjHq/4+Mp8tUu
 vD/yMm+ALEdPUOIugqvtEZmnujxcjVzbZW//s0qYArf+Mk4AgjLr0iHTu8TqiT0PBHgk
 8NFN5u6s6ilN153+Z5J4lX4Wfkty8FqY2EaTSP7As+aLvtsp5e6yFToeivxqg97MZrQP
 MT5OkM98Zn0PZtMSANT3DCvFO+iqzUc09bOG4fzab00WJ3kEkQoOWQCXSThhEYP/9+Te
 suA6cHQ1FDUxnJR+hod8bdaLcPI3afsSqNnE7aYOspCJR8McRC1I6rvO918kmMZ0bB/6
 mfew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ge6QWDNe
Subject: [Buildroot] [PATCH 1/1] package/python-socketio: bump to version
 5.12.1
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
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index 709278fd5f..3535c00819 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  d55f0439cf7d056c0dca99fe13ad8054  python_socketio-5.11.4.tar.gz
-sha256  8b0b8ff2964b2957c865835e936310190639c00310a47d77321a594d1665355e  python_socketio-5.11.4.tar.gz
+md5  fa264f1d5086cda8df1e01e7feb4a09c  python_socketio-5.12.1.tar.gz
+sha256  0299ff1f470b676c09c1bfab1dead25405077d227b2c13cf217a34dadc68ba9c  python_socketio-5.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index bc6cef6fc6..b07e6a689c 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.11.4
+PYTHON_SOCKETIO_VERSION = 5.12.1
 PYTHON_SOCKETIO_SOURCE = python_socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/32/31/4ba0d9d86c645ba335d645f49167ca58b0874ca0e421682f97964e8adb42
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/ce/d0/40ed38076e8aee94785d546d3e3a1cae393da5806a8530be877187e2875f
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
