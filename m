Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D298EEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 17:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7343581DFE;
	Sun, 25 Jun 2023 17:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7343581DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8mmHHAQbNX1; Sun, 25 Jun 2023 17:57:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF49C81DFA;
	Sun, 25 Jun 2023 17:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF49C81DFA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACC7C1BF3BF
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 17:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92F0060AB1
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 17:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92F0060AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31VigHP3QoXq for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 17:57:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B44960746
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B44960746
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 17:57:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2A1C5A4C0921;
 Sun, 25 Jun 2023 19:57:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59624)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qDTz0-000529-2m;
 Sun, 25 Jun 2023 19:57:06 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 19:57:06 +0200
Message-Id: <20230625175706.319901-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625175706.319901-1-bernd@kuhls.net>
References: <20230625175706.319901-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687715827;
 bh=h/rStq1Q42oIeMYyseWmkCMq8hP+SE811o5LC0D+wCA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ysTTP/NP1+sZ31UeBd2RLClyKmXAR809vpj+1uhOGSQrXAM9bQvtDOsNyMXEPeQv2
 x7pGJ1wqeigbatVK1EHKBadZcWCC+MG5b+X+k4mnGr7DAk/Qc648R2Or06OMuemhgj
 0kogyCBeHcDwdgsVtS/9CbZmaPg9F1Sd3nO9YncrqnmUyYbXsWnfDFzw+iHgB9sO4t
 wLZTgxuJQWTxI7E7JKktWpBeXwMRlYAofgxklVnGeI8Rz2MAVWt4TCj/vA4qsVVl9Q
 +BVbMqZip0egQrT46RwAzPjYVvj5AhS/LXpxiWDxvBxYymr8GhlIkBT2gsYIx5fRtT
 8GH7uWh7me76g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ysTTP/NP
Subject: [Buildroot] [PATCH 2/2] package/quickjs: disable on sh*
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

quickjs unconditionally uses FE_{DOWN,UP}WARD and so fails to build on
sh* since its addition in commit
5d50793659acb95050c110d5fc05399df20ce30b

Fixes:
sh4:    http://autobuild.buildroot.net/results/46d/46d7da58a857939ee3a33f60ab64ad278157c3bd/
sh4a:   http://autobuild.buildroot.net/results/b1d/b1db05e79e5505c6606524e54e159224b633eac2/
sh4aeb: http://autobuild.buildroot.net/results/c30/c307a1b67142405f81c9276056b28bea366f2ccf/
sh4eb:  http://autobuild.buildroot.net/results/945/945b508385ba5aa25f982f8a8493628fa828e472/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/quickjs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index 292dba86d0..fd174bc657 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QUICKJS
 	bool "quickjs"
 	depends on !BR2_microblaze # fenv.h lacks FE_{DOWN,UP}WARD
 	depends on !BR2_nios2 # fenv.h lacks FE_{DOWN,UP}WARD on nios2
+	depends on !BR2_sh # fenv.h lacks FE_{DOWN,UP}WARD
 	depends on !BR2_STATIC_LIBS
 	# No way to check for fenv support.
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
@@ -18,6 +19,7 @@ config BR2_PACKAGE_QUICKJS
 comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
 	depends on !BR2_microblaze
 	depends on !BR2_nios2
+	depends on !BR2_sh
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_4_9
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
