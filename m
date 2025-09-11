Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C72CA1016
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 09:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A47EB844B4;
	Thu, 11 Sep 2025 09:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMYKcDpumk1t; Thu, 11 Sep 2025 09:04:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9721B844B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9721B844B9;
	Thu, 11 Sep 2025 09:04:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85425443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 09:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7782F41F87
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 09:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMuXJ1WzU1hi for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 09:04:10 +0000 (UTC)
X-Greylist: delayed 544 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 11 Sep 2025 09:04:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A1FA641F85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1FA641F85
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.250.0.168;
 helo=mx.adeep.su; envelope-from=adeep@lexina.in; receiver=<UNKNOWN> 
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1FA641F85
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 09:04:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6658517338C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 11:54:53 +0300 (MSK)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 11:54:13 +0300
Message-ID: <20250911085446.3432160-1-adeep@lexina.in>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lexina.in; s=dkim; 
 t=1757580899; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=uazXj7gEhRvNU5p0Bbgy+TYA7rztiuLG8+Uy/cTSVc8=;
 b=kSVKHjjFbqowMw0ul6D8vBlOOFazGmUbY7HrXipLob4WhnAsKJkgRiXTT+K/N40fC0uNNJ
 mx1niL+Y/eePYDwdc2+QyK/PIySp4SsHA5jkc1OtsLaLfJYQ2u3kG8LkQb2az/dZ/U4a9r
 HEOnfWSZkTGuJR0Z2a1chchDbN84kndh4ALeN6PsvMeIYOwihTcmfy7LqxrGR21/K25FmA
 dP/XsAzQAHNHkD1/NLZu1GpbdICIQbhjDRj3TW9zlmo5cJ23ZX2l22HWoaoQe8o6jYmB/c
 o5hdj7YVP+8+eauH/VNRfmmkGUkUM58Fwsih2kqzvBbKZFRMhHwoF0U9/mih+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=lexina.in
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lexina.in header.i=@lexina.in header.a=rsa-sha256
 header.s=dkim header.b=kSVKHjjF
Subject: [Buildroot] [PATCH] package/rtl8822cs bump driver version to latest
 with support kernel 6.16
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
From: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update driver for kernel 6.16+
- Update repository link

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 package/rtl8822cs/Config.in      | 2 +-
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rtl8822cs/Config.in b/package/rtl8822cs/Config.in
index c827291ae4..2e1c376902 100644
--- a/package/rtl8822cs/Config.in
+++ b/package/rtl8822cs/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_RTL8822CS
 	  Realtek RTL8822CS Wi-Fi driver as a kernel module (JetHome
 	  repository)
 
-          https://github.com/jethome-ru/rtl88x2cs/
+          https://github.com/jethome-iot/rtl88x2cs/
diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index 1d7c074ff1..2a649fe493 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6150edd8e5d5812831597d4f49a6631a503468c512f85cbe449d853b6caea261  rtl8822cs-0986d5734e7630efea218dae9c16d11a10231819.tar.gz
+sha256  12bf44c0dbce921440f5800a98e877fadda2d656824cca546c2b9e0e99e6a489  rtl8822cs-0ef9ddd619d2a386df90fd7c32b65958b0d675ed.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index 345e4a0c48..d10388c2e1 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 0986d5734e7630efea218dae9c16d11a10231819
-RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
+RTL8822CS_VERSION = 0ef9ddd619d2a386df90fd7c32b65958b0d675ed
+RTL8822CS_SITE = $(call github,jethome-iot,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
 RTL8822CS_MODULE_MAKE_OPTS = \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
