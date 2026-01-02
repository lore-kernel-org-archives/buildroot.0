Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73652EED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A5F560B65;
	Fri,  2 Jan 2026 17:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSxdz-qNbwJK; Fri,  2 Jan 2026 17:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B03460B59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767376238;
	bh=gY6qxs1izymOy2cgGzXJ+/56XiHpsRXeiNrxe5HRObo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RActatEM/dI4etc10i70A5Wd5btxMIBhiUP8j86bjXWfCuK0FFSX2XM564VeULRSZ
	 oHy5rNSMAYuJNEwFf/qllnmah8i0p3Vj/MPZfWnN3YjlIK+i5Gc5Bq3D7sCuwzsM4t
	 /nn/KFHEsJHULf7tHBxRl+9WBGNHvG4bnAc5liPsco3XWz8AGR9komoNyxwQypLrKE
	 WcNSWV9ChcRrfdWfPEOdnIlNjr9Ue25rlC2kx7XDVByB+Wp1JZ/5eZWfcU4iCdLtPg
	 R00svWASs2TVb0QNKHJTjQMvYd4Wa1/iOOppZXZDLUUqh/wJuTdiRUoMClSu20WxVz
	 q6jMUwsAJ3dZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B03460B59;
	Fri,  2 Jan 2026 17:50:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F9A3351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 514DB403C9
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7vVTuMsUc-V for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 641544034D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 641544034D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 641544034D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:50:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4D94A4C2D82;
 Fri,  2 Jan 2026 18:50:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59068)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbjIG-0000000053I-1L6Q;
 Fri, 02 Jan 2026 17:50:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 18:50:32 +0100
Message-ID: <20260102175032.1918906-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767376232;
 bh=kHnbw8Nm7pGX17Ts9U8UeFuLwfvlNjfby5RWe2gC6DQ=;
 h=From:To:Cc:Subject:Date:From;
 b=oU6q6a66EFV6w/UfYcdU7ia2WhUxem5vlnnc+lZ61SyOAXemPaA5pbTUdTlR7E0WS
 +0uXTtvp1HjXioA7gAlsTaHmfU68aVtEATHG7ouO6q/pbbMh5HMSZ2MIHl4lX/F8fH
 aU6SfAwT7by8M0maQXfKNHRHqkfj1Y+hOZ9N1+SGgQaSWdC3N/Q5G5yOVW+gCTe84p
 0QwP6WnMI0z2BCz+nberWf9hnuyVCkkrY7P5eF4yhNEvLg4myaL0c2NQkIr1FBSIo7
 mhBEU9OigzzLL6q4QM3k18VqjJI5UjMUggwqzCrw8mOC383vEvnPeeIWpyoEIectRa
 2T2ImUlwkkVcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=oU6q6a66
Subject: [Buildroot] [PATCH 1/1] package/libcorrect: fix build with cmake 4
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

Fixes:
https://autobuild.buildroot.net/results/44b/44b881a3455ff6a77f29532f25c12c40c34ceac4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Patch 0001 was originally added by
https://patchwork.ozlabs.org/project/buildroot/patch/20251203215723.2323032-11-bernd@kuhls.net/
but was not part of buildroot commit 1a9e812d24c4e609c65e3dc39813e0c61b20966f

 ...make_minimum_required-to-Version-3.5.patch | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/libcorrect/0001-bumped-cmake_minimum_required-to-Version-3.5.patch

diff --git a/package/libcorrect/0001-bumped-cmake_minimum_required-to-Version-3.5.patch b/package/libcorrect/0001-bumped-cmake_minimum_required-to-Version-3.5.patch
new file mode 100644
index 0000000000..95e76ee43f
--- /dev/null
+++ b/package/libcorrect/0001-bumped-cmake_minimum_required-to-Version-3.5.patch
@@ -0,0 +1,24 @@
+From 8e779493cd1597b8a9c50ff48f97d4e5d10f96d6 Mon Sep 17 00:00:00 2001
+From: Tobias Wellnitz <tobias@dh1tw.de>
+Date: Sat, 27 Sep 2025 23:51:48 +0200
+Subject: [PATCH] bumped cmake_minimum_required to Version 3.5
+
+Modern Cmake versions require cmake_mininum_required to be at least Version 3.5
+
+Upstream: https://github.com/quiet/libcorrect/pull/50
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2e8e07e..67ea044 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(Correct C)
+ include(CheckLibraryExists)
+ include(CheckIncludeFiles)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
