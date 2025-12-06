Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C209D3ABFB
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 08:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD4516081D;
	Sat,  6 Dec 2025 08:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7TXYMTZZHSGs; Sat,  6 Dec 2025 08:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9197C60801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765011089;
	bh=nShSgZP5nijaz+xb9o0dhVod4lCdEOuGpJA44gBKc4s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fhHyXf1TRkNF+BqSiIfv/x3riOZoERantWF0q2akNg2Pg0c/5sMAvgxK4ut8bAxF4
	 +G1tH6uAjEhFtCakGMEsxzupSpUkfw7x1yxPD1g1eOhpOjrCmmGuE98L8pDSzRy1mA
	 f8G6hazUAj+znstUXk17Iq6EpSdObxhb/entBDV7XjAfUmMRtc8jUqsjmCD49lY2oa
	 0b2EDGSN4WlPdEQaQ0mdLMFU5pdg///BJhSUFD3OhKtlqEJohEzJbm2wSpqXBl2oIo
	 4i7HltThgVnJ3tyCJjyhIhER5JfILIx6PZdOWyeSnBw9bFTmeXoLdGHNnPPt2Pjp9H
	 yUNoNPqNHwmzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9197C60801;
	Sat,  6 Dec 2025 08:51:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 683121A9
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 08:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F6128435C
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 08:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jmf7ghS4BFbL for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 08:51:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 91F3B8438F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91F3B8438F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91F3B8438F
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 08:51:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DA689A4C019D
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 09:51:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59126)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRo0f-000000003Ji-3uRp
 for buildroot@buildroot.org; Sat, 06 Dec 2025 08:51:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Dec 2025 09:51:22 +0100
Message-ID: <20251206085122.437825-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765011082;
 bh=uWDAQVD1Rq3FO8yBxUBiCXL1s+mKSqVHvlKjRRwLK8w=;
 h=From:To:Subject:Date:From;
 b=TeoIZrspcUHpsZPpokf6c7iLRdYAGgrhA3B2OWWenDXLcOOnKwxswn9jrt/FAs6gG
 P6vZyHDWhzxQgpx3DIDu/qpo+ExgRp35TO169l0vXMLqMU73T4TB42+JmInzoxBN6M
 lr4at9ELlDXj8DbPwOOxOZOYSr83GlxYS26kZCqdfC0zCFLIU38HVdArnweSe2SKBF
 vKx+RzMbEOgaUzWhElGqkbIlxnGLxHNlh5QN1KkOnwAGtpzm401G46QrR3N/nHw/gm
 XwaCvkP3n92ksu0c+J69TJ/L7NLErXMwU+QWJK71F4tU/xld6ofIdElvr0Do6wVxwF
 vCNzoSJEKOQVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=TeoIZrsp
Subject: [Buildroot] [PATCH 1/1] package/racehound: switch project site
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

Previous repo is unavailable, switch to fork.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/racehound/Config.in    | 2 +-
 package/racehound/racehound.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/racehound/Config.in b/package/racehound/Config.in
index 5b8bdc77bc..757743f79b 100644
--- a/package/racehound/Config.in
+++ b/package/racehound/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_RACEHOUND
 	  - CONFIG_KALLSYMS_ALL
 	  - CONFIG_KPROBES
 
-	  https://github.com/winnukem/racehound
+	  https://github.com/kmrov/racehound
 
 comment "racehound needs an Linux kernel >= 3.14 to be built"
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
index 6499e166d8..93ce5c8e57 100644
--- a/package/racehound/racehound.mk
+++ b/package/racehound/racehound.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RACEHOUND_VERSION = f09f06fcc3c77c8c5541be3ba5be80aa8148ce0c
-RACEHOUND_SITE = $(call github,winnukem,racehound,$(RACEHOUND_VERSION))
+RACEHOUND_SITE = $(call github,kmrov,racehound,$(RACEHOUND_VERSION))
 RACEHOUND_LICENSE = GPL-2.0
 RACEHOUND_LICENSE_FILES = LICENSE
 RACEHOUND_SUPPORTS_IN_SOURCE_BUILD = NO
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
