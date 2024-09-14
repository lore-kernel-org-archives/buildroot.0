Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65546C0219E
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 193CB4064B;
	Sat, 14 Sep 2024 21:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1dmi37dQJsP; Sat, 14 Sep 2024 21:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8E3940658
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E3940658;
	Sat, 14 Sep 2024 21:17:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3F881BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2C5660621
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wADCraPicRmp for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:17:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8A2C6061C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8A2C6061C
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8A2C6061C
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:17:51 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a08ca8d3fdso6063505ab.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726348670; x=1726953470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MYEEVCa3FjwWVtHlhM0/Y5hUAvpyf2pBoE2guw4w3sQ=;
 b=n8z7x24DpnZ8QV5s7/SXqhWsEnAtOHsqRgFsWMe21S+iZ5lJxqYLTjABzlQDS9Vjcw
 wQIpr3PofY4Hr119WKPGt+M0cLClG1aF2D0ERLYqdnpOmaj3uIsd1yym2tL8KZY6K5WW
 4BaPv8pc+XWKdhnzeQPGegq5cXrPhHRYfP0HSL8k5BfwGGRJDl0vAZyxhHpQbJOEKu/h
 jyF84V51yGjmqeMf98kqG7GG6PHuozZ2R+Lc1JxDmjrt15BpwNdwUAsxwaziA+anpzZ2
 STyocgWRhMuJs1ZzfEILiKocGjgsx0yJxSPPFXBfIM0VV/HawUwRsuyQ4WkEK6V0l7gt
 jEmQ==
X-Gm-Message-State: AOJu0YxjxArFoI+skCHHnckCRIivG0VoZh9ymIG6tAOmp26rwZA1BzTI
 QldyZp1pDYs0Y6oNhtHH+QGCJuktr0ylqQEn4vitOiJpcmwW+OEwa0Vx5A==
X-Google-Smtp-Source: AGHT+IEE/ZrtokNjoRblifhnqBqKCaFgv+tB2DC0AKfgnpEds3ADdVUGTcAu7jO9So2zkmNxahpxVw==
X-Received: by 2002:a05:6e02:1383:b0:39f:5abe:ec25 with SMTP id
 e9e14a558f8ab-3a08495478amr108791285ab.19.1726348670375; 
 Sat, 14 Sep 2024 14:17:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e1c0f8sm6365965ab.47.2024.09.14.14.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 14:17:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:17:48 -0600
Message-Id: <20240914211748.1271243-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726348670; x=1726953470; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MYEEVCa3FjwWVtHlhM0/Y5hUAvpyf2pBoE2guw4w3sQ=;
 b=A008m/od7NMnn5hYIe0Kgvuim/IYG7hfqAGN/83uudHAlWnmK0kAzqeibLfFipzG17
 faWE5DWTGRxozrb3mlEIN5N87UpogbNyjolIf+wo5L+f+GNtmh35DceBYVqWBzjCoob3
 sHkZ2R7dExHc8oE0UiVOqDMsTvFzZ4lErzSOQvvBFOHyVP8GBxp82wpzYKZqKt0qtbeY
 6dryf62xUbPj2Hk/pU3sHVyldYXwJQM6DJndZu40HuuTdCVRbIynrR7iXCA8In1e3T+6
 FmfMDv6HX0y9k2ORIlhXueKoZuoGJrT5sqmAQWut9hXShrcR0D/CFKRRnWSw6blRvknF
 BPCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A008m/od
Subject: [Buildroot] [PATCH 1/1] package/python-alsaaudio: bump to version
 0.11.0
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
 package/python-alsaaudio/python-alsaaudio.hash | 4 ++--
 package/python-alsaaudio/python-alsaaudio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alsaaudio/python-alsaaudio.hash b/package/python-alsaaudio/python-alsaaudio.hash
index ab8b868b97..205130f30b 100644
--- a/package/python-alsaaudio/python-alsaaudio.hash
+++ b/package/python-alsaaudio/python-alsaaudio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyalsaaudio/json
-md5  720b2e1a47a5fdb587ea1b4eabbd23e6  pyalsaaudio-0.10.0.tar.gz
-sha256  e21175500a2bd310ae3867e7991639defc1e2a5c92cf1b9f7083296b346738ab  pyalsaaudio-0.10.0.tar.gz
+md5  8c11664f8787e3d9900d666f15565713  pyalsaaudio-0.11.0.tar.gz
+sha256  a78a9dca33524b2c9064b34e21f5ab874272313cf324a9a77592f396a5e0fddc  pyalsaaudio-0.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ef6ba930f96986d78082e67c817ac617b9e833d60d5a0460f24c9c674a010935  LICENSE
diff --git a/package/python-alsaaudio/python-alsaaudio.mk b/package/python-alsaaudio/python-alsaaudio.mk
index 0692f4a8e9..4b3276842e 100644
--- a/package/python-alsaaudio/python-alsaaudio.mk
+++ b/package/python-alsaaudio/python-alsaaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALSAAUDIO_VERSION = 0.10.0
+PYTHON_ALSAAUDIO_VERSION = 0.11.0
 PYTHON_ALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_ALSAAUDIO_VERSION).tar.gz
-PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/e5/f0/411140b1c2d8eea8531233f39103e7ebda560030493e298be6439ce36936
+PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/21/a6/3d833079b030d449345e35ce0e2874e330d3612135734f07b9ceace25bcf
 PYTHON_ALSAAUDIO_SETUP_TYPE = setuptools
 PYTHON_ALSAAUDIO_LICENSE = Python-2.0
 PYTHON_ALSAAUDIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
