Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB66BC2A062
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 22:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C10405A4;
	Sat,  3 Jan 2026 22:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TBDP7vI7tlt; Sat,  3 Jan 2026 22:43:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D0514061B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767480234;
	bh=FPbjiRJatPUg8Lc2854VoLx76Rb5xxMYEndHxcDAgp4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=MdqXvQk+ypClEjBQKo5W+bDBddvcfsRgQcS9iuGovA7Qif1FSSb7qczn6ZjDITDdk
	 mb7Ze+6fXOG7zaTr7fA6Apjzt+QV/rVs67J0EljMORyfX6zvvwrSiSjiptE4bJJK8L
	 g/Er3P8vzXummti3q7dPJYpJ5gWKTmZ2WchAZZqNOibML3BfDx/HUvUEchhVVRISBc
	 rLZGSf9GwVVjcfWq4nrlvQrWlVKT8FMy/Lvv/Ni/GgmyGkIH+ATYwmUWsUMghnL56j
	 ri0JW4tXffyGA8UmxXL94egfwSqNT+Iqi13yLH9U2wiQv/hJCgledQnR253BJ077A0
	 E8yNuxQLdvHZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D0514061B;
	Sat,  3 Jan 2026 22:43:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0209325B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D827380D5E
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RY_5Y3g4gSYf for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 22:43:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 984BB80CB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 984BB80CB4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 984BB80CB4
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3A5A6C1C95B;
 Sat,  3 Jan 2026 22:43:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1F5D66072B;
 Sat,  3 Jan 2026 22:43:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 68C85113B06CF; Sat,  3 Jan 2026 23:43:47 +0100 (CET)
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 23:43:21 +0100
Message-ID: <20260103224330.2933161-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767480227; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=qe+mAwBGWJqdT33BeaSsKbRbVKGMs3D9oxiKu9A/VRs=;
 b=fWh/AshM+XUFEiuCRrdKW195Ms17Y95ymwN9kcm1OFdvLPiO5IOWDhDOXQYXmoD+b3KJIY
 pwmXBqDNlWBd4e7r+1MoibeO8qXFLm6/RlkZMHkremGKa5mOg7W5dm1PU8wmvScgI9smzS
 6ROt8QfbPYQ8/2QV77rTKj4fSKfezwN15yxRZVEwGpZGh3ctII9m4AglyYlIRGg6n69W4b
 sKEp4sBezQGRK5CfR1uz4zqcWC56v5TwLwTrZlTYveLhazFC//WDj5Jt//RDR06pC3SRL7
 6sCMjptPZa+BTyooJIYf5XCoImLMlQus1btSlPg1S9j7R/OLaQ+O+T+3bFpP5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=fWh/AshM
Subject: [Buildroot] [PATCH 08/11] package/libgtk4: add missing dependency
 for BR2_PACKAGE_LIBGTK4_GSTREAMER
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Back when the libgtk4 package was introduced in commit
faf2a1d2abfbff79fc0603def835066587144420, its
BR2_PACKAGE_LIBGTK4_GSTREAMER option did not properly propagate the
dependencies of BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL, causing the
following Config.in warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
  Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE [=y] && (BR2_PACKAGE_HAS_LIBGL [=n] || BR2_PACKAGE_HAS_LIBGLES [=n])
  Selected by [y]:
  - BR2_PACKAGE_LIBGTK4_GSTREAMER [=y] && BR2_PACKAGE_LIBGTK4 [=y]

Fix that by properly propagating the dependency.

Fixes: faf2a1d2abfbff79fc0603def835066587144420 ("package/libgtk4: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgtk4/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 259226e0e4..6d871b8517 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -87,6 +87,7 @@ config BR2_PACKAGE_LIBGTK4_X11
 
 config BR2_PACKAGE_LIBGTK4_GSTREAMER
 	bool "gstreamer support"
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
@@ -94,6 +95,9 @@ config BR2_PACKAGE_LIBGTK4_GSTREAMER
 	help
 	  Enable gstreamer support.
 
+comment "gstreamer support needs an OpenGL or OpenGL ES backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
+
 config BR2_PACKAGE_LIBGTK4_DEMO
 	bool "Install libgtk4 demo/example programs"
 	select BR2_PACKAGE_SHARED_MIME_INFO
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
