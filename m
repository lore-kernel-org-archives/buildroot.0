Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D44C021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B04E26064E;
	Mon, 17 Feb 2025 12:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlGk4NELp7bC; Mon, 17 Feb 2025 12:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3EB860656
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3EB860656;
	Mon, 17 Feb 2025 12:39:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BB8672
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F79B409C9
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjPTL4bGLb_a for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:39:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=aleksandr.o.makarov@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 190B5409E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 190B5409E7
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 190B5409E7
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:39:16 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-abb892fe379so197405766b.0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 04:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739795955; x=1740400755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CMtyy/tZOyNybWji+pqqHoOd3UIgvDOjeZH1NrXlHOM=;
 b=Ho75Gqne4mdROYAM3YT/0OSatdOp0BLCfn+35VXRnzgjg3w2ciYYaGWbcMsBb5ipFp
 6CwwF1k6PxyL7HfrDsPMYOIfriaM1qmU5C2Z3i7VfyabeSI40o9E5Qs+ohGLuJUOLSxl
 GM/udCWTr0i+g8Emx00/p/2tKAqPpfuZXn8qFAR9M7qY45PXG+MYy+3MOHaDtRMI2n8T
 ykfLBKHRmqrEGjIwOq7aVNyl2UB1MBcIu/uYq4MimG/2IB+5cD8ThGl+U2gycWww8aW+
 KNVYU0muD8GbZg/sR9d9c8diU3J68vLP9zHR6PEIFX0bByOzg2XumURR8pck/vAu1QWC
 qhnQ==
X-Gm-Message-State: AOJu0YxhKhvWj3+gGIJAD5tCNKK6Vkn+3MTxDe0T5HHaMYa5T/U9wBP+
 CpFs6zr3OWcA4vYWp4ZiuJorS2RELJ5zooD/pDgFJpx/U0nqyMcplTCykb1C
X-Gm-Gg: ASbGncs5ps1IfSWEd/nFgtQxwGkadtji0QWn7CD3ty6M1SPh39W+i/H38oXQnU6/z/K
 f5LelnuenilsETZc1EEjXsT5Dl/Up94qUY4KxfzxbBgq3gZub0M9GZR+ODk9addsrbHuv05fA8o
 yEEy57n5rd/Y0PbPBxS/2ipWdxx5HHhBNEc9t0VsasuSVGAoy9m5XsKOjfe2vNAPuyCH/OU3Nz4
 VQPcrTfVbnV8cLMR32RdIr41F3J4HBXHcsFygsgbMS/djRD7wPOlpaXkUraPG82zGcQZowTOOiW
 Cdby1+iezuneePVJ4zv+U6HbWaQa8Wl9GAd3HWwgoWcoYEs7+MAS8wWVrw==
X-Google-Smtp-Source: AGHT+IHs+7Qa4+VYwPGwY1d+T5lC1zFjbl5h4WHWOydnvkk2L7XOsEpcdJIp5icJeNl9mJHWxW9opw==
X-Received: by 2002:a05:6402:510b:b0:5dc:a44e:7644 with SMTP id
 4fb4d7f45d1cf-5e035ff9cacmr22928951a12.2.1739795954631; 
 Mon, 17 Feb 2025 04:39:14 -0800 (PST)
Received: from aleksandr-System-Product-Name.lan ([138.199.34.134])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9da9f0desm173541266b.105.2025.02.17.04.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 04:39:13 -0800 (PST)
From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Mon, 17 Feb 2025 14:39:09 +0200
Message-ID: <20250217123910.370880-1-aleksandr.o.makarov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739795955; x=1740400755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CMtyy/tZOyNybWji+pqqHoOd3UIgvDOjeZH1NrXlHOM=;
 b=KQDgG6niGT1g5e9OKsjRkCxQuHgWSVxEY+WaVjp9IVbvok6f4KsAl/KAmRoGed15c7
 qBj2LrpGjlJQFjMtr4pRxFD235kU8NQkb/6+HbcVgThC0l7rhcALBIGUMwn6t6jEp+74
 DIrVD1dAM8Ygwsj9yK39vtDkMeagpiC2hwHKgjOPxwA1+YI47AYF13bNzBNhv585p2Yq
 pvFXJ5L0HU+66aS+vjwc2bQXMyDrD3sbu6KQK2yBm/WgdJiqo+oLLF5ohGdcnHzTL85d
 9X8IQG104RskQz/UyZX4LBKeK88HnxJoD2FeTlWi9eIB3GLsA5/xJEPd4DqLifScbBPS
 YejQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KQDgG6ni
Subject: [Buildroot] [PATCH] package/cpp-httplib: bump to version 0.19.0
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

Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index 45c2214105..0984bd359b 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6ed5894bbbc4a34a0f4c5e962672d0003d2ea099bbadacc66f6dee2b213ff394  cpp-httplib-0.18.0.tar.gz
+sha256  c9b9e0524666e1cd088f0874c57c1ce7c0eaa8552f9f4e15c755d5201fc8c608  cpp-httplib-0.19.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 5a02b562b3..f3a8710d20 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.18.0
+CPP_HTTPLIB_VERSION = 0.19.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
