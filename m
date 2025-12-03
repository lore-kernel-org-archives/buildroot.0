Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24E9D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF4C440540;
	Wed,  3 Dec 2025 22:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzXBMybtZ0BM; Wed,  3 Dec 2025 22:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B3C440390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799342;
	bh=ONsim998g0+wYWh+ukJp6wPgtY7rXHclRD0RyCCEiZg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IyJwLLK5d0/21BOL/et9R01ExW02DYyjWig5Nsr+iAxZzXYEfQG1MciviMajGLAi3
	 V695omfgYWEB1mMgU0P4WHsLonJ//WmC1BNHyi/5uLFcQP1TVbZ+vmTxO8PIEddaKZ
	 S6K851JdQNAnulLvmd8FXhQa5el9B7kAsyOUqUzX89GY/L0ny/FCq+1eRQMcEB0alX
	 xUcsoOldbEinV/iW57UXIhuGdUjV6454mUVABJDjXyuoypAtgJXSOV+1QYuP0BNZIG
	 sKRSVp1yFYQJYC47urxN4ZVs7rkrVmZ/cUjzpqh+4Gji1WXUmQk16LF/Nym+Rx98kk
	 95kKf3OxFuYKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B3C440390;
	Wed,  3 Dec 2025 22:02:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 194C9D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F411882226
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOzaoZ-XZJba for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED50F821F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED50F821F2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED50F821F2
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51CAEA4C79C9;
 Wed,  3 Dec 2025 22:59:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugp-000000000Lw-0BpI;
 Wed, 03 Dec 2025 21:47:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>, Davide Viti <zinosat@gmail.com>,
 Eero Aaltonen <eero.aaltonen@vaisala.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  3 Dec 2025 22:47:08 +0100
Message-ID: <20251203214709.2321976-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799144;
 bh=kjMgnlpiZw/NHg4mhgav6q4onipS3OoZBE8WuIBDpis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eOJaTvy3GTC68NjwXhOE0kO6V0DO6lCPnRt2XNF5mUB6M6gvf27DldL3jyeNT3zS6
 W18FPWWalKHhzZqaXNUzcFskZUXwtE8Bn2kBx5GvtGf5PJzz+YTVCf1mriK4M6Hug4
 dEEhfVYNmVhoF319yaw7cLtMGiJME6EoxCa9kIjh6NxAURukaEak4ws9jNJ3N4mIVB
 hgDiaJ9BOrifqFReQsGDdfVSmfFZxkD5ZPzfyM/uaZl8m5tcx6gLe21p4tdkFZjA/3
 v/pz/zqx9XxulPgbt0i2hxC0A7QXxHldZDy2zeMKIB8spoBmrKJywMCbgBVIUTunwV
 4wka1xZifeEiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=eOJaTvy3
Subject: [Buildroot] [PATCH/next 20/21] package/read-edid: fix cmake 4
 compatibility
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/read-edid/0004-cmake4.patch | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 package/read-edid/0004-cmake4.patch

diff --git a/package/read-edid/0004-cmake4.patch b/package/read-edid/0004-cmake4.patch
new file mode 100644
index 0000000000..4adf1ce300
--- /dev/null
+++ b/package/read-edid/0004-cmake4.patch
@@ -0,0 +1,10 @@
+Fix build with cmake 4
+
+--- read-edid-3.0.2/CMakeLists.txt.orig	2025-12-02 08:53:55.032171422 +0100
++++ read-edid-3.0.2/CMakeLists.txt	2025-12-02 08:54:25.324940568 +0100
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.12)
+ project (read-edid C)
+ 
+ option(I2CBUILD "Build I2C get-edid implementation" ON)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
