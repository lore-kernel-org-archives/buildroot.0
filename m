Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5BCC369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 11:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C0C681141;
	Sun, 20 Apr 2025 11:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykXIxDUTTzLj; Sun, 20 Apr 2025 11:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D12981122
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D12981122;
	Sun, 20 Apr 2025 11:39:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5D911C0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 11:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BC4D6062E
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 11:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTUSVjJfo-3X for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 11:39:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.48;
 helo=mail-wr1-f48.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 81F0D607E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81F0D607E8
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81F0D607E8
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 11:39:36 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so2277610f8f.1
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 04:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745149174; x=1745753974;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nlBWgaBB9TtHaa+/FGh9aupLjuSwzOy1mfafLwerXfU=;
 b=M48u6lhaMj+RJhiiNqjXDO3HmwmM9ap3jCK6NL54RTQMkC4Bwz3Cb2zjfTEky5wu1h
 Ygj/a3xaip+ie419sF4tSEz/G7egC6PqQrczCDXw5BY2IVsuwCuAa06fWVW4NykbZBGi
 2yCv1031K867F1cFZ3PnHl2Rw7WfXS1yddteLuLqNwE0Jk82HCMBcmTTi36Mff/YgfD0
 9EHoQhhcpIMytjJzMnj69bj5HCYu02WGw2fZtwr88pK+RzABks8m5TZKEb/4gSwRgwL5
 sDQ46rB+xJpvcuxjQ0EuIvOCudfiOovIh1AHmgq5mXulgDUN6CyHa0CdYdG1wQh9VFPM
 CWMg==
X-Gm-Message-State: AOJu0YxMYOs2zsSCGs+OXCO/6RgZQod7a2H05Co5owmQa3lTvAbOmrCn
 xv7IQQrDTV2hJH8mps4ttVRaz4fuCSOei8m9TsPlHi/iKnfv7JsKnWcmMptD
X-Gm-Gg: ASbGncunEzQnOF/82LdhCwpAIsDPlq8DnNUrqznHix0qQFy8SeJJSVF9XuWj69c4L0Y
 PV7sthYnCmU7vl831U8QVXitOIG9C4VcekAzZAvekaFCL8nHL5CNGUErwXGppqsDUCapveuI4oU
 DTYqs2M23fKw4aovhiZoZBX9ZmVMXe6yvhITPEQR0PWeesH8XU/ohe8yp7MISue0+P8UrrXm8lD
 KHajSak2fHAuFd2b1QHu4ixUcwrnJbvw76dN+hG91CFovWm+iaivpx8M2UTAlJvjs5bVLJI0MoI
 NL/xPK4TygFhVpg0NmSEMaFwMHlDD3mCDbm5GFMz2x+pKzzpQN5ZXlZ52D6wT4M=
X-Google-Smtp-Source: AGHT+IEK/Ut8niNrbqW3enJ1qq1RmfY4VKW5XQWTlJA1BwTzUqJxIf9eMwbvWkJXvxKD2J4rb70wLA==
X-Received: by 2002:a5d:6488:0:b0:391:3207:2e6f with SMTP id
 ffacd0b85a97d-39efbace3e3mr5753971f8f.42.1745149173727; 
 Sun, 20 Apr 2025 04:39:33 -0700 (PDT)
Received: from localhost.localdomain ([87.66.230.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931acsm8697424f8f.72.2025.04.20.04.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Apr 2025 04:39:33 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun, 20 Apr 2025 13:39:30 +0200
Message-ID: <20250420113930.1137446-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/syslog-ng: bump to 4.8.1
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

Announcement:
 - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.0
 - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.1

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index bab628f521..f6d0e83433 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 4.7
+@version: 4.8
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 7f829c8b13..4ca6a3e33e 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  5477189a2d12325aa4faebfcf59f5bdd9084234732f0c3ec16dd253847dacf1c  syslog-ng-4.7.1.tar.gz
+sha256  e8b8b98c60a5b68b25e3462c4104c35d05b975e6778d38d8a81b8ff7c0e64c5b  syslog-ng-4.8.1.tar.gz
 sha256  d7d51f8d0f6ee9757a371080e7f5fa19ac73afbef14db6e981705cf1ec813d6b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 91d2dd5269..d97e2f7b3d 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.7.1
+SYSLOG_NG_VERSION = 4.8.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
