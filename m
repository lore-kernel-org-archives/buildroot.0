Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10791E6F070
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 08:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B73F84026C;
	Tue, 23 Dec 2025 08:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Ny6uhUYVlqJ; Tue, 23 Dec 2025 08:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455D040227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766479847;
	bh=hcOeqqxnyAi27jxCuaLmuXcWp6erTSv1ZAXxBd2sNFE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QlDolJxjO5bYjw2Y1KliBxiyCJzWbCuNfsdUg+IgjrgzzD/UsQFKiq88gd8MRQM9+
	 jIyYZuMtQMfTQhrtlPBnDx33Z24CJhl48j3UrbivbATRTUcW1qIcN5hU8XFzR6uyis
	 PSN/6mJItvybOKemod702gfPvqMcYKalLodpFJjab20X0iKVMhnn4Zh5m1d1Fr4Juk
	 51ErnLWP7P6STQkUJ+NRLT7iedtY2PpvegSSAKsEwlQYgosItVGY3+w4TnlG529Ito
	 ijC8eTEStjLPO+7zmSL+Ov8FUM1MBN6P7PMdHZf1pq9aklSdO32mBdSQIdkz7rdL/y
	 TGr7ddLyltmVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 455D040227;
	Tue, 23 Dec 2025 08:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F45B25A
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 08:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C1778123E
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 08:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bTOWfPCzQNW for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 08:50:44 +0000 (UTC)
X-Greylist: delayed 332 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 23 Dec 2025 08:50:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 009BB81237
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 009BB81237
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.250.0.168;
 helo=mx.adeep.su; envelope-from=adeep@lexina.in; receiver=<UNKNOWN> 
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 009BB81237
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 08:50:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF23EC61A2; Tue, 23 Dec 2025 11:45:03 +0300 (MSK)
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Date: Tue, 23 Dec 2025 11:15:31 +0300
Message-ID: <20251223084436.984227-1-adeep@lexina.in>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lexina.in; s=dkim; 
 t=1766479506; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=grlgj0QFu47F3CyQY2LYhpEwiP4NVoO/IDbl5fD7gt0=;
 b=Dx/Qjd4RO81++qNg3xG+2p13U5i916bOSidFvgktZtshEpoOob/HESl96wsHA0yuBAr0wD
 eTIupPMb85CKHiUVzd1CdhIwcJ3r2pbgq5s2ZV1wsbvGfBD4p9nmfiYAJNqJQLB+cRNQC/
 kcU+dke5Tpk8980ZrssDzW7fxm2kxVnsqJcIPAf4z3ghacB/XLvqU894SuUkdD9pfgqdQ0
 l/yOmsE8lMeUNd7kSZ41KQX399vhMLzeg+A/foOKcvPy1djRMb8w+QXbQF8SxHwnDBb23i
 yEnmo/KDXL6TwxGmc1j1ou0UkFgUKS1ZPi8scH/h+dVOQCfEkxyskxryEepWUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=lexina.in
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lexina.in header.i=@lexina.in header.a=rsa-sha256
 header.s=dkim header.b=Dx/Qjd4R
Subject: [Buildroot] [PATCH] [RESEND] package/rtl8822cs bump driver version
 to latest with support kernel 6.18
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

Update rtl8822cs driver for Kernel 6.17/6.18
Fixes: https://autobuild.buildroot.org/results/bafd5af112e49359201580ece3a12bc8724914fe/

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index 2a649fe493..ff2e5d3eaa 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  12bf44c0dbce921440f5800a98e877fadda2d656824cca546c2b9e0e99e6a489  rtl8822cs-0ef9ddd619d2a386df90fd7c32b65958b0d675ed.tar.gz
+sha256  71d1d29d1f04a9decaba4e23df0b213fb454c4cf15f6305133d2821188b588b0  rtl8822cs-2519c0b865e31d93daa65fc5b1168722f6ec7526.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index d10388c2e1..c6a541dd99 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 0ef9ddd619d2a386df90fd7c32b65958b0d675ed
+RTL8822CS_VERSION = 2519c0b865e31d93daa65fc5b1168722f6ec7526
 RTL8822CS_SITE = $(call github,jethome-iot,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
