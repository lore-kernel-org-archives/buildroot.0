Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53671C3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 17:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125E540571;
	Sat, 27 Jul 2024 17:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhArGSWxeiSD; Sat, 27 Jul 2024 17:58:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0455F4066E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0455F4066E;
	Sat, 27 Jul 2024 17:58:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C16461BF2FF
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 17:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE8B0407A5
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 17:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zi46I7zA5Lbr for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 17:58:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D25BE406A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D25BE406A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D25BE406A4
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 17:58:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce6c.dip0.t-ipconnect.de [79.214.206.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8535EA4C3440
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 19:58:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47394)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXlgD-000000006FO-1itz
 for buildroot@buildroot.org; Sat, 27 Jul 2024 17:58:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 19:58:05 +0200
Message-Id: <20240727175805.1739987-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240727175805.1739987-1-bernd@kuhls.net>
References: <20240727175805.1739987-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722103085;
 bh=KcxVewBSoQDkiev9CketfKsdPucEzi/NHVOdnDQr9xA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=o/ageXKyEL32st1QZ5bM2cdYjhFgWIxvnM/DKlVdZoXfi8L/tQ0GaS1fcx3MDLZjQ
 PQKbbIH4IOLCB5HO9KjVOpJUdujKxLalOVzzC8DReJvdKulYDnlPZdqzG3tJjmc/FW
 dB+PcFSAnWV+r8F9jH5mtxaSskbkC+FUmDuVaswQNmIqUX4bvXLKr0XUY96IkZVDrI
 2IIyA66MJ8a+pzTmnTOajXAA1MiTWUVtjNH+ewVjXg1KO4ouRZX4oES11EIcgO4na3
 7Bw4HEYl2lONwNtw+Vn74t1TUeIEXIgIHIIK/7LpHb0I555OqK4llA3Vixy9hTfsu4
 mxGL33jdAI6Nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=o/ageXKy
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: remove Bernd Kuhls from libks
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

I am not using this package anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 16dea15bce..bf44035a59 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -430,7 +430,6 @@ F:	package/libglu/
 F:	package/libhdhomerun/
 F:	package/libheif/
 F:	package/libilbc/
-F:	package/libks/
 F:	package/libldns/
 F:	package/libmicrohttpd/
 F:	package/libminiupnpc/
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
