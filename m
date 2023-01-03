Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6239AC3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 10:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD7DA607F1;
	Tue,  3 Jan 2023 10:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD7DA607F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9PhT3tnWk54; Tue,  3 Jan 2023 10:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE19C605AD;
	Tue,  3 Jan 2023 10:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE19C605AD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1A381BF34B
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 10:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78ABE4055F
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 10:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78ABE4055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMsXOPh57u6V for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 10:34:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6819440102
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6819440102
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 10:34:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso12548183wmq.1
 for <buildroot@buildroot.org>; Tue, 03 Jan 2023 02:34:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQH/jtJQKVU48KyhsM4IggRIxwJw7kbjXL3plFQeaiM=;
 b=zJJoAkU2EuP2TzQYdV5Tzpqujai86O0l/Z+1Q0k2r0Q20tnP55Dr0bkHNyLqVc/GuL
 LJLvqO01L++Jvr8CbIhju8BCM8zJpGEwbFe8GMFDgumwmE/sejRNZTPn4wkNpWycXpdH
 PGEJUgrcJxmksoLtM3F9RAUlu2lAdEnloOoi/CpQ7uXIELxpm/Ahm2j6lHELXKjEiEkU
 QKNvYx+S489p6do2R8HSkML6f9EpRVqjooXsStyxULJPiQ+cvzHXUpfhOlaSC+aD4lsn
 nN6sTcDwNvoNYbq/FWoepQ0kN4cKF0QRvq/wtdCuIweUx2xNSz1FugHYtpHZiDjIzVi/
 0Elg==
X-Gm-Message-State: AFqh2kpSExoKbqQhN3CcIRMTm0oxvo5B6Mg2Rq5jwQmi9rJmApol67sP
 JkZNtaHgjWWGsmDmPM6Fa5zKO5n78IbhOg==
X-Google-Smtp-Source: AMrXdXvfKqLaQwp5estlGW5QB5smt/WJAVvsqeo4cAmorPsb1Oe4Y9qefctEAmXE+4WZGdf1YKYogw==
X-Received: by 2002:a05:600c:33a5:b0:3d3:5a42:bd5d with SMTP id
 o37-20020a05600c33a500b003d35a42bd5dmr30869235wmp.32.1672742095394; 
 Tue, 03 Jan 2023 02:34:55 -0800 (PST)
Received: from debian.barco.com (d528f5fd6.static.telenet.be. [82.143.95.214])
 by smtp.gmail.com with ESMTPSA id
 o2-20020adfeac2000000b00299b9adc5a2sm5315410wrn.66.2023.01.03.02.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 02:34:54 -0800 (PST)
From: Dennis Van Hoorick <dennis.van.hoorick@gmail.com>
X-Google-Original-From: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
To: buildroot@buildroot.org
Date: Tue,  3 Jan 2023 11:34:37 +0100
Message-Id: <20230103103438.1889-1-dennis.vanhoorick@barco.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rQH/jtJQKVU48KyhsM4IggRIxwJw7kbjXL3plFQeaiM=;
 b=ZGQ0hYaOCzk5xIaEONl3G/+MKFpj1dd3MaIhyyru0zCafVVsh61PK0aroYblUPxsXA
 p6Ch+zSzk93AvGEj7gkDktTIhqUfDFz7hMx2puIaFQ+3ordnjUp2DSSUk0hNPfz3M5rx
 bHWdIL/CjAfZVKOu/nUZM7ne5CLr2TCeUlWbdZohdgIODTiCY807A0O/2zLCbM/MZ5LJ
 6XFBaXF3BRZweGivp07augexOk0wfyvLbbA14DyMtbGKXYdRQ8Bj6UZv7r9IFjBuYlJa
 fzEzTOo0eSTYrDjM+aNCKLGaynPKbISWWV9g9DKcSQe8mFzCcgUAMehqdkAmVDEPxuBn
 NOZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZGQ0hYaO
Subject: [Buildroot] [PATCH 1/2] package/ncurses: Fix homepage in Config.in
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
Cc: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The homepage listed in package/ncurses/Config.in was incorrect.
Changed to correct one (https://invisible-island.net/ncurses/).

Signed-off-by: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
---
 package/ncurses/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index 9f7753b06a..c0086cbbe3 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_NCURSES
 
 	  This package installs only a few vital termcap entries
 
-	  http://www.gnu.org/software/ncurses/
+	  https://invisible-island.net/ncurses/
 
 if BR2_PACKAGE_NCURSES
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
