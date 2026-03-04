Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495F5EFCE3B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 19:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FC4E60821;
	Wed,  4 Mar 2026 19:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oQQcyRU-aoT; Wed,  4 Mar 2026 19:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 599536064D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772651080;
	bh=bOeiWeYJ8ZgrcPZGZMmiKTxAMu+LU3sYA9RVnf+HbD0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dNm28+k17+cNrec3KcXxCtbZmHmo+W3MJy3TTZ4nYU/Bpd518f3KWkCxvXpfeB418
	 FvPJyhWa8ZHSSOSETfgFehGLRzZOvTJDO94jXILEOQhDojtg8GDONpzjpmK6l1+JBX
	 92fGlAuQch7KbT724Gj6JebQBWjMmqAcseXL/q/a9xA8IehHP61ElI4LCsbgyoAteD
	 r/m7bQJPGGS1NSvoFTG1IwFcB4dIa7Ua2gkis29ZByD1Udbql+6cbB/8pB+jScyX6p
	 JEWmKDLJbkyKEDCT+99rEBzfS6ZCP/QLL5RYRaeSX8kj5T7guJKn7Fqz8lzKQzhRz+
	 OOV74oTzOFF+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 599536064D;
	Wed,  4 Mar 2026 19:04:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF15F223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC7E3406CB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reRY2OFPHZ29 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 19:04:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C718F4069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C718F4069B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C718F4069B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:04:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b996.dip0.t-ipconnect.de [84.161.185.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DA5AEA4C338E
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 20:04:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52082)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxrWN-0000000050C-3WxS
 for buildroot@buildroot.org; Wed, 04 Mar 2026 19:04:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 20:04:35 +0100
Message-ID: <20260304190435.3483370-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772651075;
 bh=WwgjwCEDUDC3PeKb57QtqSV+MTtqlqMe8EEa0gEhpqM=;
 h=From:To:Subject:Date:From;
 b=kEpBrwcEmwU7hpteqrvuhuoM+cbOltXyKpEBvkRtE2N8N5PjpY25Ow3zAkebyUMIJ
 kjilFSL8Txp0h5I2mj6R7ciNDF+q+Yr56y9XA/7rlvXWsSxIrN88Sxol5LXlJ2jFXb
 ijmcbwuNFCTfST+flHdmw9/qrtqy/jKs0eQBVs4TEWwsrPRv+THUogD3WdCiRbwU6v
 WfKgY7sPAWjTFk0yaar1XCR0/jEU1SfGflyWSicDCzgITC3PGHJEvOCWTB9qGMowOm
 Hbg8EsS0XttLQXODjeN17FvaiWfqoY3jr5Hn6Lj3bkxmmZMfeBWfLcSniiNyDoyahM
 S8hzls4nEE0Ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=kEpBrwcE
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: bump version to
 20260227
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

https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260227

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 41041370e2..588cf7cde3 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9232313161ce9dee5facd2870a7bd361d6000b1d409552b5c12efc6498e7f402  intel-microcode-20260210-rev1.tar.gz
+sha256  fcac5a08d7559a2ce4ad3b1ce5d59619c8adb364b9c51988fedd94220392bb37  intel-microcode-20260227.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 9f6592132a..321272e10d 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20260210-rev1
+INTEL_MICROCODE_VERSION = 20260227
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
