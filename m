Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142D6C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 08:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7FEB80AEC;
	Sun, 28 Jul 2024 08:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lBE3L24E25O; Sun, 28 Jul 2024 08:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C27F280B08
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27F280B08;
	Sun, 28 Jul 2024 08:01:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 793221BF32E
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 08:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66BA0404B6
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 08:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAyvXTayKOtD for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 08:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81A6B403C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81A6B403C9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81A6B403C9
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 08:01:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cca8.dip0.t-ipconnect.de [79.214.204.168])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A14B6A4C325F
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:01:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46322)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXypw-000000007Lx-1qcn
 for buildroot@buildroot.org; Sun, 28 Jul 2024 08:01:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 10:01:00 +0200
Message-Id: <20240728080100.5517-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722153660;
 bh=GGarBwH0l/ZVreuSCEQqMttpsR5GIAcCaIvpZtivbFw=;
 h=From:To:Subject:Date:From;
 b=EUePhFA96+R+vP4H2WtnhfrDzaDmwvDyrIq4Gbhujrg1DOtMcwpGB9j4FMLvjIMS/
 D/+0cdAXjQU7N6PMpZ1GDRht5SiZr/jvmKi63wYDP00ZBiM6mtBq9m7f027BDhLk/p
 TiMROIsrIKMkf98OilbOMEvNG8fe4mpo1VIhdSeO32BSkFzCyHW5cXZw2600xVHW9U
 +oquRDIjJEuxQ66/wqMvJ8ufgBNb8ysaOFJGELbFpNCFJKuKJNYBKF4RkBB+oi/uqE
 XZgnYalWxEUBhn+YohtldrVxrvr1TuTIYePTUv8f+XYpjNtxHcXOVqBXMkhVJOWx/x
 U/IMvAvPO/3qw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=EUePhFA9
Subject: [Buildroot] [PATCH v2 1/1] DEVELOPERS: add Bernd Kuhls for openvpn
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: rebased

 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a8c92f122..c6b0d68bcb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -466,6 +466,7 @@ F:	package/mjpg-streamer/
 F:	package/mpg123/
 F:	package/ntp/
 F:	package/nut/
+F:	package/openvpn/
 F:	package/opus/
 F:	package/pciutils/
 F:	package/perl-crypt-openssl-guess/
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
