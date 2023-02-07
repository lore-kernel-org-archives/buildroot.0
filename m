Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CF3C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD2C2813A2;
	Tue,  7 Feb 2023 17:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD2C2813A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZb7J4IzqR7x; Tue,  7 Feb 2023 17:17:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17E538138C;
	Tue,  7 Feb 2023 17:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E538138C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBCE61BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B607340A68
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B607340A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4QI_BJuu9kg for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E146E40120
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E146E40120
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j25so10738345wrc.4
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NfoQ1rXiMwWtdbbf89KSpfHtCA9Voc3QYfVbHYab0dg=;
 b=iTbGGe2+l60KlQqesa89kAz5oJC5uivk7FbgmosvHq4sKt4Ctbtv//ZwQk6m0o74nG
 0BtxC/5Z5SIzeJyrLUKpUVPCcE9xLLaePHfbNp+oV4/J78qyvg/NNevL7fs8SMVJfrqS
 jHc++542811l0wN8/wyNuYt3yLZ51mzhoqwDUV7dTpM8Q0qC0pW+u85pXviZo/WMUd+F
 AO5Rdmc6/CCuzyUNxF8NeyDIgJGdQMOjka/T1PIHP4o8hIiPh5UxDGFnIWr692A2qKe8
 2FZUTBfhb91vdc/rP9BIAMfMuHoSVp3o2iqhdnqcumgiRzxC8qFqDi5u9vay58YKVhe6
 M6qw==
X-Gm-Message-State: AO0yUKXx4SdpndbfTcYiGEl/hyg6Y0DrI/H/QWrH3Se9NHsnKhbHzcNh
 kOifZuNevAVnSAP0J3aGh+OLkkGOXNypWPfxpC1Hmg==
X-Google-Smtp-Source: AK7set/FXgR6N1tWcH+BY50MTKE6AnI2QHPjRWwGGStkVw74FUJmM9JJWiq0a4IdFnUKSsSyAShb+w==
X-Received: by 2002:a5d:6046:0:b0:2be:5ca0:a7f9 with SMTP id
 j6-20020a5d6046000000b002be5ca0a7f9mr3552793wrt.33.1675790248775; 
 Tue, 07 Feb 2023 09:17:28 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:28 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:08 +0100
Message-Id: <20230207171721.2973997-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NfoQ1rXiMwWtdbbf89KSpfHtCA9Voc3QYfVbHYab0dg=;
 b=gYTwVPfOvrHLC3iDzzO1pv3tHWnJcMXinVXcoD4sONVz2Ua8vqnP8FWSQs0AH6BcWw
 8Kr8fkxdTmFxQa4cij65C/nE0+FHg0LYmPfFfj9456ZUgyMxM9/wMZKt6lT0BQxCgLFU
 b2Dxeamsqu88+W/FtSAUhYJL97prvAEbQrjKc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gYTwVPfO
Subject: [Buildroot] [PATCH v6 00/13] Extend Qt6 configuration
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series is an attempt to revamp the QT6 series from Jesse Van Gavere
to be included mainline. It reworks a bit of things we discussed during
the developer days in Bruxelles.

Angelo Compagnucci (4):
  package/qt6/qt6base: add support for widgets
  package/qt6/qt6base: add support for widgets gtk backend
  package/qt6/qt6base: add opengl support
  package/qt6/qt6base: add QPA backend selection

Jesse Van Gavere (9):
  package/qt6/qt6base: add support for gui module
  package/qt6/qt6base: add support for fontconfig/harfbuzz
  package/qt6/qt6base: Add support for jpeg/png/gif image format
  package/qt6/qt6base: add support for tslib
  package/qt6/qt6base: add support for libinput
  package/qt6/qt6base: add support for kms
  package/qt6/qt6base: add support for printsupport/cups
  package/qt6/qt6base: add support for building examples
  package/qt6: Add qmake functionality

 package/qt6/Config.in               |   5 +
 package/qt6/qt6.mk                  |  12 ++
 package/qt6/qt6base/Config.in       | 161 +++++++++++++++++++++++++++
 package/qt6/qt6base/qmake.conf.in   |  34 ++++++
 package/qt6/qt6base/qplatformdefs.h |   1 +
 package/qt6/qt6base/qt.conf.in      |   7 ++
 package/qt6/qt6base/qt6base.hash    |   1 +
 package/qt6/qt6base/qt6base.mk      | 166 ++++++++++++++++++++++++++++
 8 files changed, 387 insertions(+)
 create mode 100644 package/qt6/qt6base/qmake.conf.in
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
