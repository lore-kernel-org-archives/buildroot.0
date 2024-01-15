Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432A6C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE34283FF4;
	Mon, 15 Jan 2024 21:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE34283FF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmeSnBTRBWEO; Mon, 15 Jan 2024 21:41:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14E4383D9D;
	Mon, 15 Jan 2024 21:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14E4383D9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADCD81BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80FD4614D1
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80FD4614D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5D-M9KiA1nPx for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:41:45 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4D9D6147A
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4D9D6147A
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55965fd00aeso1036726a12.0
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 13:41:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705354903; x=1705959703;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hpw6QDfZ7CRDDXlrN0tPEBR8x1gdFbXBW7CAV/UeT6M=;
 b=sbeTeZ/a4BOJ+jKkyuEaTbMITsHelY85Pjx6eawYijXt2YxNfTcceJhqj3iClCGk3Y
 XDiwoS7LbIlb3HDPklqqG5Vv4CWW662cgf/ZqidAsg3ERzPoO/5O9TRdnHmBKB1xhMvu
 3YYG1fY+0A5H3XKT13XtGZM07+tAdoAAeH5G5Jua02x2XsMoBBXxF57gnW4BNWI2oyZj
 6WO6b/6OHSzDM2dsZdnzWeRbmyx1Ij4mxEHsq1S53SzwO/lY0mZZ71r2w3P8g+lcqKFH
 azEkMv2mwnIywtUT64WuvzgzqM/0q9wYPWgmM7BptkXW2QBIH7YIFN1JLuFImfsa7V5j
 ZIOQ==
X-Gm-Message-State: AOJu0Yzr8H5vjtiwLKgANWkf//3/RuGSw6+hXlTny0aN79J/TI3j8RRZ
 Km6gwJdYwhjb4IhupqG+vC92/bM+T4s=
X-Google-Smtp-Source: AGHT+IHp1ROfqdCCNxHIhgO5whFBO9MKP9fsMWETkY63RkuWd5GMt4YFrtAwUIsa2A7eTGid2I529g==
X-Received: by 2002:a05:6402:311a:b0:559:2d98:9554 with SMTP id
 dc26-20020a056402311a00b005592d989554mr1506581edb.25.1705354902566; 
 Mon, 15 Jan 2024 13:41:42 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 dj15-20020a05640231af00b0055845b1b318sm5927402edb.65.2024.01.15.13.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 13:41:42 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 22:41:34 +0100
Message-ID: <20240115214137.2350453-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705354903; x=1705959703; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hpw6QDfZ7CRDDXlrN0tPEBR8x1gdFbXBW7CAV/UeT6M=;
 b=D573Uehk8Y7g3HN+i2GshWpPavMMfAC6HPCx4VNaqNw1AbMwCqakyNfbd3YInSJgU1
 r8OvgSidivHOug5SL6ZTApDDIZ9Mgax2pGysOJ0ZH/29PvV4SlTXF6JUNII/dok7hVoT
 bssf6P0UPqzT5+Kkn4Jx48WW/KNmqhcgwfmQwblj/mKT+Jb3m3k8ws7An6RlDn4nQJVi
 eL5hCIqfno5YQSjMuMmQCkGgqnh7z4RBW7CKnbUTXjoEyqrTLTmPkhfDVRK3/hiCvwI6
 GPD8qq902szumBqKqtzDEoFGze/Denm9PIMdauDCf0Hxxtwbnt+V1G7x0Ibc4VtuxUpK
 J1mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D573Uehk
Subject: [Buildroot] [PATCH 0/3] Bump kernel versions
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Bernd Kuhls <bernd@kuhls.net>, Petr Vorel <petr.vorel@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petr Vorel (3):
  linux: bump latest version to 6.6
  {linux, linux-headers}: bump 5.{10, 15}.x / 6.{1, 6}.x series
  linux: bump 5.10 CIP kernel versions

 linux/Config.in                      | 10 +++++-----
 linux/linux.hash                     | 18 +++++++++---------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
