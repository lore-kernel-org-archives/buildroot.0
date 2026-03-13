Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A8C107BCE4
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED99560E06;
	Fri, 13 Mar 2026 21:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGX7yYgxJBNf; Fri, 13 Mar 2026 21:02:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F363360B4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773435723;
	bh=NpjJPeOFm54Ozm7KdHGaNtvTXYIZEipvCTSq7LZe550=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WNu3JuclFdeH3BzwbEZ36SeiAeixS/kiAupvuYJYOLSdEAmUwZSL00qcdt/rlGEA3
	 zH22vocw+FwH4ofdMAhQiMbcryefbZ84HJ/u93rUES1ZYcPGkbhK4x0oBOhgW3iu2Z
	 /UcPDSPHwO7q5I3nutncHTjOHmiX2rkGYoxjt2ZBPHQUe1xYwinQ3f1d8DMHetUo9C
	 QJ/q63DMqpYQXyI0CQxpIVdmtUVR1yJiNf2B3ulHlcoFEdOPZE9mGSnU2Ur8r5v2b2
	 acdvzECAE+RUFWe5YZvX8/gQpmE9rkcdcUAUVpBQnqEOf4cugp74h7mrXJeqLSiGgq
	 ZyDrInaxfGp5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F363360B4B;
	Fri, 13 Mar 2026 21:02:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 863EE201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C54080CBC
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0O5iP2fX7arB for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:02:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FCB180710
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FCB180710
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FCB180710
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:01:59 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 19dtw9idVtpTf19dtwwaBt; Fri, 13 Mar 2026 22:01:58 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Date: Fri, 13 Mar 2026 22:01:57 +0100
Message-ID: <20260313210157.295086-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKhNb4SS+E8JB2iIcyhVC5tsARSI5i3br77VFwxEjGqFjztDzHhRLBA7rWMdvHww+HEUXk4Lwetgftul0CVrWxzZI5eUckuz6jpGmFQlAXylNuq2MqAJ
 R8H3mSaEvLC2cgObuKgr+5+t9e0OFrp8/N6pEIXb8Jclm5VrypnrSyupD6IrQtl/t0+itSqgLxzXV6z8aNVGc3lak6jUHQgmcaorCJ0XP1dP0pC1NGocR2H3
 K5GWYQR9g9DbliJXdMtBwB/QULsr2aZv+gyzdzy85znKOLhl/qy3MwPpEALNTWkTklmQcOiAY1GpvXm5IimCLw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1773435718; bh=S2qnyhRAlo6Xxe93tZZ87s6NMuQGQl4zDgvoV+ZUplA=;
 h=From:To:Subject:Date:MIME-Version;
 b=WKYcZ2bRVWPv6QWNv5vqDJz8KxBZ/u07Aq7KDokrhltQCUdpXI3Lly07QRjPNX4px
 pTYsb3vH2CEZzAUi1MdYAqk6ro1Z8CVP4e23NgPccRpgchSC/hjEfEmq8p/5Itiewl
 gPMvHiCRgEegajeohiANIMCrPDDS9crPUVG7lCIZ6qq1x6gN7yDvbzdMo1IZPnrGD1
 p5elUqN4aK5m7FxXaVx45SxbL4KpBkUGqH8Ba2HjLdO95FGx+BWbCuBHU9/dks/sGc
 FNv5mXMsmUUjARLI1+dIeaFpofcVJaRFvFdFVfoFqUZbea6zXY9bhUQIh/9cIrqxxV
 nLi3pu6hglx+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WKYcZ2bR
Subject: [Buildroot] [PATCH] package/erlang-jiffy: bump version to 1.1.3
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

Release Notes:
https://github.com/davisp/jiffy/releases/tag/1.1.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 7c314694e7..b5cbb99f0e 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f43bafc1ae5c9c1a7843a4c6b2d0b7ef57188e567381bf734035ef9701a7458f  erlang-jiffy-1.1.2.tar.gz
+sha256  44b93897b0ca4f085b9424d8673b3a78ff85daaaca4d055a40e2a03a8cf4587a  erlang-jiffy-1.1.3.tar.gz
 sha256  0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index b3f7cf82c7..b0839210d6 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 1.1.2
+ERLANG_JIFFY_VERSION = 1.1.3
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (Google double conversion library), \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
