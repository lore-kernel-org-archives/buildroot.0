Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE56EEF5868
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 07:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9C4A82923;
	Sun, 15 Feb 2026 07:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ES_CRfUFLXuq; Sun, 15 Feb 2026 07:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E335E828A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771140140;
	bh=kDt7y5P4aT2VHHNG0lQ1q53Llc28C7FTTwA7KJpw0tA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DAZ2MJ6rVSDtH1ysnySexR0t78uLjKlCBYV79y9r5dqmLjUJXxQwj6PU3a0o3DUrh
	 iLRu5WJf8vZpzB13COGcmlCzfjZ30FpJrCRNoz/aUsKmDeaKSSiktJm4S1ddvAKjkU
	 1dpSvK5o8wTCP9MtMbke246mS3P3UBzgRcP8N3kEnqcYrzhalUXuewvL9bgYElKU7O
	 I6Mqde6TBjCng60+b/MBVHu2oii5L0naLK3nh3xn1+NoG0I9WETzLKiRYz1GH3qNMO
	 XZqoFUMxChnHaAoA1vp8y1VM2TlTb5ybpUWqSxfUQE6yF2cUf8SG1YDprsxpUXLL0p
	 +KkLZFiARhLQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E335E828A9;
	Sun, 15 Feb 2026 07:22:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5608D31F
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 07:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AA80828A9
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 07:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOLZfENlxkjK for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 07:22:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74CCA828A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74CCA828A5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74CCA828A5
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 07:22:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C3D76A4C00B8
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 08:22:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49966)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vrWSJ-000000001bv-3fAc
 for buildroot@buildroot.org; Sun, 15 Feb 2026 07:22:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 08:22:12 +0100
Message-ID: <20260215072212.12312-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771140132;
 bh=1G9u8DfZ85v38fJSnyrDBuf+ypAqLlSaeddX33HHvvs=;
 h=From:To:Subject:Date:From;
 b=NKb3rOjnnTNZg5nmmEn3Jd/Do+NXqg1hc+42fLJOf/cvOSGHtV10e2fqFpGJFjy1V
 zJrsqWC8ocUkm5psPCZpaMhnhhBOmqnLAgAWrPLUtbUUB2arXO6/oii0mU6p4UJ03o
 IDCkJEtlydjOX9M7rTIbiee+bT0ZTIArFQ7eXvS3eYt0Tn0b81WmD9itIeSZtSFr5p
 6ij71XmuzqERP78YIcrsxejrF8tyE/qX+y17BY8102ft7fsIR5I4biyttZSdR6KdzC
 E4vfmXDiwOPNNNXOnuoWrLuWHpbgU3etCPkwS3QyoMeuvJW7qUYRqISobTG/qJ0Mfk
 fx9Na3sXcFoNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=NKb3rOjn
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version to
 21.2.15-Omega
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

https://github.com/janbar/pvr.mythtv/blob/21.2.15-Omega/pvr.mythtv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index a8b6ca79b6..c187fb0054 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c34a54d06aefef1c4c250ab766c459becc1fdaf42782da75cf749b71585bf6dd  kodi-pvr-mythtv-21.2.14-Omega.tar.gz
+sha256  47d058a9bd960ccdc3352b2fac6f4aeb7587bad50cf1daee20d643c5e64deeb2  kodi-pvr-mythtv-21.2.15-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 78ea3041b7..9b1b336dfd 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.2.14-Omega
+KODI_PVR_MYTHTV_VERSION = 21.2.15-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
