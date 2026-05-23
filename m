Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611FCCD4F54
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 08:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5067B6087C;
	Sat, 23 May 2026 08:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mzUrguz4L1g; Sat, 23 May 2026 08:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BF6860872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779525361;
	bh=MDeEUXOu7i0uoJB3DuX/ZSUh66zksU0UVKrxQP1EHCM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sFQL8r3D9fhgzlGLHL4kpcRZdaMCQcOeo6uY4pxHNAQ+e6SUIQZmeRK/vrotAVWL4
	 AofZ5GgBmuigm+ZTMQIjsQFbhr4insCk9diDSCrCWFA4BYNA+VjU6J9Ah1JAK+yPh1
	 n5jxgnLwpdDZNaRmbjCH57msXHvNI7LkPHQuKgZJ9kcpPYZdHsd3u5tYSxps0qPQPf
	 HVRUWsYWoqdI213fGhxvbl4XQfGKh1UKuc6xkye/syaPJyT5QJuFPUStIR2fiP8yzZ
	 MC2NcMPmZWJ44FP3EvfY+JNPkw5vUMlMNVJrcRnJlJYTXRDshYvw//f7VuSdfmB4+K
	 N73n8yNwpaA2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BF6860872;
	Sat, 23 May 2026 08:36:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8DEB263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 08:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA82140352
 for <buildroot@buildroot.org>; Sat, 23 May 2026 08:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXLy3wxRGBZz for <buildroot@buildroot.org>;
 Sat, 23 May 2026 08:35:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8188C40332
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8188C40332
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8188C40332
 for <buildroot@buildroot.org>; Sat, 23 May 2026 08:35:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 52314A4C08EC
 for <buildroot@buildroot.org>; Sat, 23 May 2026 10:35:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56092)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQhps-000000003SM-2z9c
 for buildroot@buildroot.org; Sat, 23 May 2026 08:35:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 10:35:56 +0200
Message-ID: <20260523083556.51535-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779525357;
 bh=fPNAu8DR1bpZFf8sB5zY7yfkGXqL4QLviVF4Bl3N03I=;
 h=From:To:Subject:Date:From;
 b=egCunT4aAIOC+P1vLfBzjS4e7uXSVfpr/ONq5lzpFtLHCYHPqd7ZGmhFP1OwPwdZl
 oj8La/UCS4/MVx3lQVgIcizhRZFswiKwUwBWm6EdHLFhyc+GhlSj+HnmDX7YvkQlxw
 SmzVjSyG7SYcyGmnVOnfsYq3oR9UtTbc4Y2r/UVhNotyrpJchKdY2xfX1xMr4X8UGe
 M4BywJheKQc9y3CqGRLtxXZon0Ai1RUUcfnHM5V/3dAjV4I+3Hvw3lODEyHKrh7tXf
 7LqHtzfg/eIQ4K66aVGzKFmXh416faBEWWVnFCA2f5Olh9uynFh987HkOSQwE8kr2D
 E2OfoECEqpKoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=egCunT4a
Subject: [Buildroot] [PATCH 1/1] package/nginx: security bump version to
 1.30.2
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

https://nginx.org/en/CHANGES-1.30

https://nginx.org/en/security_advisories.html

1.30.2: Fixes CVE-2026-9256
1.30.1: Fixes CVE-2026-42926, CVE-2026-42945, CVE-2026-42946,
CVE-2026-42934, CVE-2026-40460 & CVE-2026-40701.

Updated license hash due to copyright year bump:
https://github.com/nginx/nginx/commit/7fa941a55e211ebd57f512fbfb24d59dbb97940d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/nginx/nginx.hash | 4 ++--
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 1d11937987..5055b4bd57 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918  nginx-1.28.3.tar.gz
+sha256  7df3090907fca3cc0e456d6dc00ceb230da74ea88026ceff0affc29dbbd9ac4c  nginx-1.30.2.tar.gz
 # License files, locally calculated
-sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
+sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index a8b7ee7319..3f6aecebef 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.28.3
+NGINX_VERSION = 1.30.2
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
