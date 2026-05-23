Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E129ACD5BB8
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 16:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7BFD81E32;
	Sat, 23 May 2026 16:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZG1TMiV2lvx; Sat, 23 May 2026 16:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09FAE81E18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779552031;
	bh=uJBlL4ZyP9LJIiGKXGZjs2YkMPPUTCAjjHdmQw49kkg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eoUlPQi3eBm8mTw2XoR99k+XjLKsbvlJVSzAiXdv/jEMklTBzWhNa/Z1sKih66ie2
	 MeXczSQ/rCZYY5b6uAsxdUIXQLnLG9j84XlVmVkHwjxMS0OPmhq8FwyVwf7+h1a74V
	 bpje+NJCUZeKW8M6QXp00ctx6SlNdXQaojICceTz2/Rs8iKGqT6HQTBq9+elm4CiAc
	 YVcU6GuSxlWxkM+TLlhD5BWwTSL1mn0kVs5pdbsgmybBSVzmALiSslS1Ue3pp8n+pV
	 4PxQMOAzbxUX7jITf+vqH+yYuDkt5FSomEEK3cWrDyAL2PtpaB6tc9OLMOC/JrVwgE
	 WY/KBkACuLnfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09FAE81E18;
	Sat, 23 May 2026 16:00:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 402F3263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 16:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2651560B14
 for <buildroot@buildroot.org>; Sat, 23 May 2026 16:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiT_JlQGKTWT for <buildroot@buildroot.org>;
 Sat, 23 May 2026 16:00:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C4C460B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C4C460B0E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C4C460B0E
 for <buildroot@buildroot.org>; Sat, 23 May 2026 16:00:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ADC35A4C027E
 for <buildroot@buildroot.org>; Sat, 23 May 2026 18:00:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44342)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQolz-000000007zf-0FpH
 for buildroot@buildroot.org; Sat, 23 May 2026 16:00:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 18:00:23 +0200
Message-ID: <20260523160023.1306062-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779552023;
 bh=H99MotWAfTxEqrJvo3gLaXqQeMDgKxNNwnRZup+U6Bo=;
 h=From:To:Subject:Date:From;
 b=ohSD5m8+svGjJnC8JeeAoO3K+yLSymyWKcJcxxmETsNly7ZKSyEq7XQI1c8ZJ1bTt
 QItTSiyQDOtBEh+6fQAlqLrn4D5oLUHnJRv878GovnmwbN7wPeRfjZMVGa9hlmHS2p
 Nght28aSadYP4hNIh9ffYj0Ug1otAm2OC2/TcE30dz5EkabaD5p1X79SdyokP1nOsB
 B8n0JepOK2jgTqMAjUp8nYsbfwxyHU7jIxI3aJ5/ltrKoFwJm1DJ1O7y15fR3WZbfH
 qfwBZ0D8s99jkm9DbGaoWKvWloo/AJaHc01IvOSBeZ0IecIEQK8IX8DJMFGXwOu+Cw
 rw/O2ICwOQ1aQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ohSD5m8+
Subject: [Buildroot] [PATCH/next 1/1] package/rrdtool: bump version to 1.10.2
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

https://github.com/oetiker/rrdtool-1.x/blob/v1.10.2/CHANGES

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rrdtool/rrdtool.hash | 3 ++-
 package/rrdtool/rrdtool.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index 1b16b8226e..ce1186cb18 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,4 +1,5 @@
+# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.10.2
+sha256  9787114551ee9b5db7c72722736388dcc54bf00ded51b5dd47feed11fb179fe4  rrdtool-1.10.2.tar.gz
 # Locally calculated
-sha256  5e65385e51f4a7c4b42aa09566396c20e7e1a0a30c272d569ed029a81656e56b  rrdtool-1.9.0.tar.gz
 sha256  ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320  COPYRIGHT
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index fd9883077c..73832cb635 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RRDTOOL_VERSION = 1.9.0
+RRDTOOL_VERSION = 1.10.2
 RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTOOL_VERSION)
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
