Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AE1CD98F2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 18:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E2580B56;
	Wed, 17 Jun 2026 18:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKBWov3CG3On; Wed, 17 Jun 2026 18:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E1980B59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781722729;
	bh=c5aoACvIly9CIs75u+JHUXyW5XdLqzn0M0rKDXTcME8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FfPD83KFm/vETPizg7O3Rg9g9F7MnGgsXcMz/+O8+ApES16hTBIpf9wja9UBxxlzh
	 PVmiuH8+0REw0/fMPpkeMvzTiVIzrLRyotdAHVPKQ2uZ4p5wkJp0nwQo4ZJM/9DMm/
	 18fQPXIw32YPzZ98fQh9scc7/KdHuU9Waq18uTM1GJQGKFlACAXu8VBPRiZxW9vPpK
	 BkoYLU2qIn7Q7Ls/E+WVGrh2h1IOkfNxyF3hVKt2q0WO1GSLNzx8aNjYykAz3XIeCl
	 9Q/5A+BUihjKHKsVu/YLSOQjw7deu6s/DesXc+tuN58QRQ0Fs4k8B2neW3Te2DpVcI
	 XI2VdOj6qksbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E1980B59;
	Wed, 17 Jun 2026 18:58:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C48FED8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 18:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C291A40203
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 18:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhdGLo_Of12k for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 18:58:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D779540201
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D779540201
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D779540201
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 18:58:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a06cf.dip0.t-ipconnect.de [91.58.6.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 39488A4C0602
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 20:58:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33014)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZvTJ-000000007rj-1DWr
 for buildroot@buildroot.org; Wed, 17 Jun 2026 18:58:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 20:58:44 +0200
Message-ID: <20260617185844.736701-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781722725;
 bh=m3RR1VJcjXfFvwBL+y0O7JbOdlf9m9lUP5ZKp3Bqg/U=;
 h=From:To:Subject:Date:From;
 b=qUDlI4kfjC2/gTZAtR24ift5W8/Zmef6SYFhHo81xnU60Ua5uG5qiSGw925pMyu8d
 Qy7NDTyE3qljhhDcrabCsyIEQwmdtXwA6bsKtOuz4TrQpQ2fTpmKGTIT/5pC+h7v5O
 5LXv100WP3SPhJBsJIXIYNtWIbFxWV6zqe6SDKAUN1zpXsm0e6yVTQ8LJrdHztiJre
 Jz8Vz5PLtH5cHV0G0ka56tivTDIATtSMDbogR3k7z2ZYRqBhURjLOVl5Xw1nO5/mus
 +/jmaCxzwzxNc3LLu5iIEnAVZMZZD2Fmzr2LzfntRgCCOBUMxN1X+QddJ0itCXERls
 JOA162zU+XJbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qUDlI4kf
Subject: [Buildroot] [PATCH 1/1] package/squid: security bump version to 7.6
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

https://github.com/squid-cache/squid/blob/SQUID_7_6/ChangeLog
https://seclists.org/oss-sec/2026/q2/896

Fixes CVE-2026-47729 and CVE-2026-50012.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ddc267d7369b295a47838888dce316c02f22f5fc
with the exception of an unrelated build error of the libcap package
using the defconfig br-arm-full-static.

 package/squid/squid.hash | 4 ++--
 package/squid/squid.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 508b5517c5..fe362e9a2e 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,4 +1,4 @@
-# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_5
-sha256  f6058907db0150d2f5d228482b5a9e5678920cf368ae0ccbcecceb2ff4c35106  squid-7.5.tar.xz
+# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_6
+sha256  852178fdc37c5b0786a934fc990c7d2fffc82acf19b2284be209b96431d25992  squid-7.6.tar.xz
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 6d403c6c2e..627fef0b9e 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 7.5
+SQUID_VERSION = 7.6
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_$(subst .,_,$(SQUID_VERSION))
 SQUID_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
