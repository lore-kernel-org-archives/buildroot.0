Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAF3C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 17:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E157480D94;
	Sun,  4 Jan 2026 17:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AP7tqqtb60K; Sun,  4 Jan 2026 17:22:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 255B780D96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767547362;
	bh=c6VwGyt6btaM2uKaj6KjvHZFw4ULlUCZ8XIslvMdeT0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NKJiQRNU1yjhPPI+UYLoRLE67iWnjT4YdhDZrUjV44C1if2hepLWL/vjIyzxubmjF
	 eCzf8JmiQCa8YIxvWpXUQoUkkVKKehkpSHQzVrkGulRmaP40wGo8OnWd6V0I7dNzMe
	 rNA4NcwAaJjSrAVz0MPQi+z9JhE6SNHL3h5BwYNQWeqnhPR5bvZJYizMo+aNG4fMPu
	 VyU3Y5nHyHfOwwFJ8Cho8jk6ddimZ+9AbHyW/7G+xJEBtijtHPF96gw3sczmvnhX0Q
	 TrsC02I3qKSWBLwZSkM2fIfMUm0/fkDzMP+abZShy3MLErEXNEGFODZL5WFHe97/vb
	 8gF4Sq/27WpmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 255B780D96;
	Sun,  4 Jan 2026 17:22:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AA132DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11102605BD
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_KzsYs7w2V1 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 17:22:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 238516062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 238516062E
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 238516062E
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:22:37 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id cRoIvk9vsGVgvcRoIvb3AF; Sun, 04 Jan 2026 18:22:34 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun,  4 Jan 2026 18:22:26 +0100
Message-ID: <20260104172232.3437646-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260104172232.3437646-1-giulio.benetti@benettiengineering.com>
References: <20260104172232.3437646-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLhH08eNhP1mKir/GJ7XeGhu1Mxatb9jj6IxmkIMUGoqm3FzDlTAXzxm+qhIAkYgByJkmRhnTL2xAXQvAz0dOmTla1vN5bF68BZ01UMfd5FnLEr6wG6f
 jWulLJ/8aOyyqCF67zWy3G4Cx5QsAoUMVpbdx4/dm66t0grb+EwZ+71iDwU3b/Q/v0k0NEQ7zrPefx6NMROflk4lb6c7kg9eKASqTDCbuxQrR7L/XDjf/o1x
 CBnJSKRgdIiTh5954qSEvkHHJP41+wexgMV/k1+RzxY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767547354; bh=NBCVo6HOQQirk/MJ2NU6DM3tGLgLjL74QTJtcBxZoIs=;
 h=From:To:Subject:Date:MIME-Version;
 b=YQ7fToueEAPCVXiEYHFLa9hfIhGEPGuhTjBJifaA7Yburcg23LWwGTJPj7lMxy211
 KOKSNV5U8xy0TB9izx+26bLdw3uqVzv0uMe+nNKP57EAsNV38V+hbczEXqOIrV+3RL
 z9G1d/Xa3ENWkQrjwGM9UD8M36z0zuoypLooCSpcE0OGx0J8kDSfl7Hzksi+emprxe
 oSg+v9+9SQPs3RiyutPqz0KDB30dCp47rgf4B60Sh1VcKv1xw11uHdIDgk6knCcGBH
 R9+ug1j8PigBjlL/sPnkfbMpYjDyaC4olTfYJamKWp93x8Gd7vEB5R9PFEkK+BkhjI
 G/5z7UnuhyNug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YQ7fToue
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to package bind
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d2b3b34f61..75190bd5c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1302,6 +1302,7 @@ F:	configs/mangopi_mq1rdw2_defconfig
 F:	configs/olimex_a*
 F:	configs/rockpro64_defconfig
 F:	package/at/
+F:	package/bind/
 F:	package/binutils/
 F:	package/cryptsetup/
 F:	package/dash/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
