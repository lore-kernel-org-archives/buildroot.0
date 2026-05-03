Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52846CD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BC168422D;
	Sun,  3 May 2026 14:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szNWuw6AtOqo; Sun,  3 May 2026 14:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F324884227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819769;
	bh=VxW/KnFmWHzWD6QMsGY7cYMRgpIB7/h95GQdzD3VX1Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZbwVgm6FEYtSM9SJ6ulGX5FoPMqeFZseKmucdxcOg7hRda16Y6oeW+hj3htHmc+jC
	 cXdc7VXfylTwEF9ilO3F66zaYQ5LFzlM0z3FM7MJMTas00eHQe8SN4dU0Hqm1Juy7u
	 M5XC8ikBDyLb0MSOYf6KXUzbVgetTcqJ1Pz5vHfOmmWEfCi6ioMV13HBOhJu9xuR/q
	 K/dMNQ8YslA5/JXDHSxJFcJIZbsmvRyaZxSHH+b/3GGmz1Jv4l1Y5hoLdH/dLTKcpZ
	 tR9y1F0snhMNL6Je8NWrsLh47IzTBOtdtGIIz6i7h39kL5LfLD6OX/R3i59Xw3LJD3
	 7TIadAuv9yI5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F324884227;
	Sun,  3 May 2026 14:49:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A586127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CA3D414C6
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gr8809CvOfAt for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:49:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56FE64149E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56FE64149E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56FE64149E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:49:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E5A7CA4C0AFE
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:49:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40976)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wJY86-000000001nT-0JYx
 for buildroot@buildroot.org; Sun, 03 May 2026 14:49:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  3 May 2026 16:49:07 +0200
Message-ID: <20260503144908.2807535-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260503144908.2807535-1-bernd@kuhls.net>
References: <20260503144908.2807535-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777819749;
 bh=8VW/FvgxQC8lD6lONywtbyVEKBCMkg+EDVgVLReb6vg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=m2wiXfOmTM6/Hx9P3RZ5NgDkP7hKIuG69vDxB9mMvYrS4hxN2br2RnjULHBs59a2f
 SyYlYDXQ4jHb82rBMaV0m+MieEvQm8REk0vcLN+OZJjbl9d3lU7Cdq+GrhuraqU61U
 PgOOOZmnPfegf7xysArBbPu+XgE7tx1U3lq4BWbu7pPmvZfQ8UoOtHiigcLQ4TE5TZ
 I0Ea1n9o3eAeo6UrRYcuccdnEwcP04YZ3hU6QU6agpV/xfZK+xE8AErh2/xUGs1pp9
 1ud+psIy+PykiM7pEugvDsEUp9nvgnnoKgN3p23F7/UG6qDibKTWouZ9xsw03VqKOZ
 djLRtqyTBsouA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=m2wiXfOm
Subject: [Buildroot] [PATCH 3/4] package/gdb: change the default to GDB 16.x
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
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a2caa3d58a..fe639a4019 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_15 if !BR2_arc
+	default BR2_GDB_VERSION_16 if !BR2_arc
 	default BR2_GDB_VERSION_ARC if BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -78,7 +78,7 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2024.12-release-gdb" if BR2_GDB_VERSION_ARC || (!BR2_PACKAGE_HOST_GDB && BR2_arc)
 	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
-	default "15.2"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
-	default "16.3"	   if BR2_GDB_VERSION_16
+	default "15.2"	   if BR2_GDB_VERSION_15
+	default "16.3"	   if BR2_GDB_VERSION_16 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "17.1"	   if BR2_GDB_VERSION_17
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
