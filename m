Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC66C5472C
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 21:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A83B808AC;
	Mon, 26 Aug 2024 21:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4qXyUj6jDlt; Mon, 26 Aug 2024 21:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 879B780A07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 879B780A07;
	Mon, 26 Aug 2024 21:44:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 648991BF331
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 21:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52231405C4
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 21:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeYxLn6YsQKY for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 21:44:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10BE14025D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10BE14025D
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10BE14025D
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 21:44:41 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-533de5a88f8so4229785e87.3
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 14:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724708679; x=1725313479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L0UlI2AJ8MutRdyMz8c6k9TO62D+2OhYBdeRlsceQ1E=;
 b=uXL8U5bg6W3BDHCLnDlKyABf+5bDHFcMatolu10me1B2dBN3xNGAGFONptKNsRrRUT
 ptBC5elUbNQbxWokbCbcBvXh/pKZGm8DRIgBMREJ7Onoqkp7tAfAVkLGwa7+jOku3AwH
 bImHpNBb0CrpqFOKNAmS6CO5BXBxhF2HBvqLkWsEakzt5JXP//8AiEsKp0h5AOGZ4OsF
 +1fmVuO3oNwSJSjm1zppox+CwfsHkU2H1p2PxF+W0zbI9fQZdnvuLcb7Tcfnas5zeeY3
 g7WRrlkK2Gv5Ckip31WZ5a7cX3fjOBk6zqj91Mp4J8sK2tDLp0WJFXcdAyGXzvqlhkIg
 g3/w==
X-Gm-Message-State: AOJu0YwoCXky3AtWoyagZIi6p/S88QREmYId657mlE4kMTVpNOp6Q/cV
 XkIoHSriWGZojFVanYnaFj/Ne8nJ5LfcDmQqLCJaAJyBUSMkIflF0VS1Xg==
X-Google-Smtp-Source: AGHT+IFWAxHWJtIYmfHm1kQZhkomSk0USObkexTbl8nlE6HiNYIikdy9Sgd++TSV9bn+OMzNsLY6ZA==
X-Received: by 2002:a05:6512:3b27:b0:52e:f2a6:8e1a with SMTP id
 2adb3069b0e04-5344e3de28emr455831e87.29.1724708678397; 
 Mon, 26 Aug 2024 14:44:38 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5334ea59583sm1580182e87.169.2024.08.26.14.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 14:44:37 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 00:44:22 +0300
Message-ID: <20240826214434.1530363-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724708679; x=1725313479; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L0UlI2AJ8MutRdyMz8c6k9TO62D+2OhYBdeRlsceQ1E=;
 b=hFIcUPcVDctsgnPJ5byaIlQ+Q5utz4KGyTZ72Uk7vDIpjNZ5fEv3V5Z4Q+lrfWONF5
 fhB5bA3NoA0XAcZ9Wljzt2zHfz5NY7Hrzu1cuUlskozcD1Wj13vi/TiZwv64o7oE9q6D
 IVsy66plfOGza9NnbMVyZBE3S7VCSMoGU85iJVFkTH+JBO5CsYeEDA1t3/v+iQgPyr7X
 BINEmm8QaE2JIIty4+yw0C20+18yNiOvkWiQisiEOsnthcPEXc/rqu+N4kWlx5t/Svve
 bv0dug1Ze9KaGNBYo1GEt0D5J7PQXhmmqmvEkywVimZu5P4XImZDsm8XmsL9dZstzGIu
 XRzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hFIcUPcV
Subject: [Buildroot] [PATCH v2 0/2] perf: add binutils support in new kernels
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

This patch series updates libbfd (binutils) support in perf for the
binutils >= 2.40 and the Linux kernels >= v6.4. New versions bring
the following changes:
- new kernels have a new 'opted out' perf build option for libbfd support
- new binutils provide new libsframe library

New libsframe library needs to be installed to the target images since
libbfd and libopcodes are linked against it. Perf recipe needs to be
updated to use new perf option for libbfd support in the new kernels.

Regards,
Sergey

v1 -> v2
- update help message for a new perf configuration option
- select binutils if libbfd perf support is enabled
- update commit message

Sergey Matyukevich (2):
  package/linux-tools: perf: add explicit option for libbfd support
  package: binutils: install libsframe to target

 package/binutils/binutils.mk              |  1 +
 package/linux-tools/Config.in             | 10 ++++++++++
 package/linux-tools/linux-tool-perf.mk.in | 15 +++++++++------
 3 files changed, 20 insertions(+), 6 deletions(-)

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
