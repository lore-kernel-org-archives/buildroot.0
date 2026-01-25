Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70771E63CA4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 20:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 404FB405B5;
	Sun, 25 Jan 2026 20:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_Mwh7hk4Yu1; Sun, 25 Jan 2026 20:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66BEF4051A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769374183;
	bh=U+KSWw+0JHfyBMNfeOpt5m2kKgwDpgKgFK7JMtxeRXg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ilCIV/KU6nGcMyd8EwFlb3r+wX21bWn7VfgY9P9+4fVfa/7v8GxqOc2FRasXKRYNj
	 TiviUgEfDlCQRDufRaq7f88MhX/ua6bqiklre5hps0QaMX72Rk970ODWwhohfpyoy/
	 u1Ms3w3JV2xy9OHBQ4JHCAxKQ//2zVtz5OHItsW2qpAtddXKshpj12iuQPEuU5UbL9
	 eLkuLlTWG2baJsrXB8S/blzGIbGuMeEQek2kzwNJDbFGn6F4kJga7tgpVUnJpL0dA/
	 GrhuEndKFVuP6irjmUvwcavM12R+dXS+fTqG8pdiyb1HF142L5kSg1pHCHRgPQXMb2
	 PXYzegzKWnW9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66BEF4051A;
	Sun, 25 Jan 2026 20:49:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34DDE11B
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 20:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F3DD40391
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 20:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfPMa8vQRHgb for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 20:49:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF3F740379
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF3F740379
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF3F740379
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 20:49:38 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id k739vnr1Ufibdk739vG2R4; Sun, 25 Jan 2026 21:49:35 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 25 Jan 2026 21:48:56 +0100
Message-ID: <20260125204856.4192059-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNSRrwdX9i+wjNYAHI5zF3/Eu3FPLPOXrlNC+lYSYSJ3naPreSqn5CYLoNhbaJ1H8vo46JKywPwFz1s6j3zxtR4bSsPHB0JcHhJZke4kaFJI1wq0jObT
 UXvRu+ZP5M8DTpHq0qMBvBgSbQIKO5E3OqFE9wFApdZLFAhz3D8qTQBVd65tISK3cVM9RNzaP2mYyvaU5Flv88SvAyQXflw2His0n0mJQxL/dPVSreLqQ1Wj
 wKB/9ZZTZeOeJXUX7wQ06ZsyferDazxEx7AobuRx+yQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1769374175; bh=O9xTObrtZgdQnR08Zs/9YrXuM+antvKyeqEdOFqT8/Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=nmuqza9Vjc19cX5l3cEpWJvnuEtmetZkGPgMRB0HRHpQ2xipSvDuRkUrL8rUNz/Jf
 hG/Idde1Gqw1xMdGmDK32rAYf2vtALL7lYvLyYA4eTO4+3/OXCmABCFo2MlRgd5T75
 1h8OF9Vxf4H+CoP/ETSyykdfd8IhsSkcYeISoOI11XvNf3dwyeQ5AO24pYgSPdpcIm
 ZhIheP5eTKF6ypR9FHdidK61ApUGLAwcbPxKQHPNTlSnOSot2EDDICn5fHYsAE2vCy
 NXZGkVu5JDxHHKIH45EGbWOG7AqE1hTRIU8PfVby6xGVpJjY+PN8yC+0z2PqZw0N11
 n6RNkasM/ca1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=nmuqza9V
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 12.3.2
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

https://github.com/harfbuzz/harfbuzz/blob/12.3.2/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index c5ac08c615..57643c8318 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/12.3.1
-sha256  3ee7133f7f160b27bc34c058e147a559bb781c2b8208bc760db9fa9fa69cea07  harfbuzz-12.3.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/12.3.2
+sha256  6f6db164359a2da5a84ef826615b448b33e6306067ad829d85d5b0bf936f1bb8  harfbuzz-12.3.2.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index c0cdd15367..787f42d820 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 12.3.1
+HARFBUZZ_VERSION = 12.3.2
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
