Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0050C47072
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 10:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C64D42096;
	Wed, 15 Nov 2023 10:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C64D42096
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XayYmclDPhSQ; Wed, 15 Nov 2023 10:02:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 947054207E;
	Wed, 15 Nov 2023 10:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 947054207E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11D3C1BF307
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 10:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEAC460701
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 10:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEAC460701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6lNFEQJx-GRj for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 10:02:52 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 199EA6062F
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 10:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 199EA6062F
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32fdd0774d9so4103399f8f.2
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 02:02:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700042570; x=1700647370;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RXVN6aIueAAbxoVkkxq+4c7XOIIM/j3PvHWCHQwokyY=;
 b=cUM5J94KOISfNKSUPu+cVtCtziyTXWlVjambI3mW0z6WEtfQv2fiZbW7vww0T1Df+k
 3aa5VdQbdisRZrNO0FeXWEs4Z8bn2U1sfkAODNOzySrZKI+pBCReaiW00OVyORAjSu8t
 Zw6D0wS+ApYle4sehzX7j45/pSgLVnO0eEUu7+1+LHa6SnKe/2uFpYCAPmUY856lgeQE
 j1+j44ETvZfTW53L588emxe9WqBICzsqftHF27wOeLFQqHe+MIQy/yz0MpcmjDvKJ3J7
 ib0SEH/CoA8pwJihiz9YI4YfzbkNxQGPSyT6bwyBJXJ8yxh6btENiF+rmvtAOoX+mqi8
 4ewQ==
X-Gm-Message-State: AOJu0YwN5+GiIxiOf1udMI18+3pwFHdSiKClvFLOhLzu2vylxgBUGWC4
 9mhqxLYcuW0b3t4wjAYfwYE=
X-Google-Smtp-Source: AGHT+IHEGPUNatvmt0DhGcDmVC2jhtC5Fhqd2XrLXs6pElSArr5q4jlHwQU3bmaJnRuEAHoNIk7hYQ==
X-Received: by 2002:a5d:6082:0:b0:32f:a423:ef38 with SMTP id
 w2-20020a5d6082000000b0032fa423ef38mr8342801wrt.38.1700042570077; 
 Wed, 15 Nov 2023 02:02:50 -0800 (PST)
Received: from wslxew193.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600011d000b0033134ab9691sm10027058wrx.57.2023.11.15.02.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 02:02:49 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
X-Google-Original-From: Boerge Struempfel <bstruempfel@ultratronik.de>
To: 
Date: Wed, 15 Nov 2023 11:02:16 +0100
Message-ID: <20231115100222.29685-1-bstruempfel@ultratronik.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700042570; x=1700647370; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RXVN6aIueAAbxoVkkxq+4c7XOIIM/j3PvHWCHQwokyY=;
 b=c62+AyP58s8dU3s0Nx8ZaeLObkM5lYqoph8TzBIkFQgAyXczJtgONzlO8aqYEnROKd
 4lGGT6OuRgw2JdIccj3GTtvsjIvUFGnJmSJ6EydUux8MocaL/oM06aiyz+6qalEbtsl1
 UzFKRefYLH8dm7dpqa2FWvWF+q9p+Xbnv1zQ5RFEZApUebrp/+5101/0bdBaqi3Nm5KI
 AT+tJIV572nP+t+wAW6Dcv9/rXL4HFGLpBpUL4GocCjWUgVay1+35ugM/eV/UKHeccg6
 K3D7Qj/UsecVl+ixNi5OUuFuSe+fAEy/duufzsvpcw7tQiZnW798wzSoISBk+W2yfmH6
 ZaKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c62+AyP5
Subject: [Buildroot] [PATCH 0/2] Adding support for gpiod v2.0 and higher
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
Cc: vfazio@xes-inc.com, bonet@grenoble.cnrs.fr, bstruempfel@ultratronik.de,
 buildroot@buildroot.org, boerge.struempfel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since libgpiod v2.0 breaks its api, and leads to
compilation issues with multiple other packages,
we introduce libgpiod v2.0 as a new package libgpiod2.
Furthermore swupdate is updated to support both the
old libpgiod and the new libgpiod2 package.


Boerge Struempfel (2):
  package/libgpiod2: new package
  package/swupdate: Add compatibility to libgpiod2

 package/Config.in                             |   1 +
 package/libgpiod2/Config.in                   |  24 ++
 package/libgpiod2/libgpiod2.hash              |   4 +
 package/libgpiod2/libgpiod2.mk                |  44 ++++
 ...cfw-Refactored-switch_mode-signature.patch |  73 ++++++
 ...pio-chip-and-lines-in-gpio-structure.patch | 128 +++++++++++
 .../0003-ucfw-Refactored-gpio-handling.patch  | 131 +++++++++++
 ...d-compatibility-with-libgpiod-v2-api.patch | 208 ++++++++++++++++++
 package/swupdate/Config.in                    |   2 +-
 package/swupdate/swupdate.mk                  |   5 +-
 10 files changed, 618 insertions(+), 2 deletions(-)
 create mode 100644 package/libgpiod2/Config.in
 create mode 100644 package/libgpiod2/libgpiod2.hash
 create mode 100644 package/libgpiod2/libgpiod2.mk
 create mode 100644 package/swupdate/0001-ucfw-Refactored-switch_mode-signature.patch
 create mode 100644 package/swupdate/0002-ucfw-Save-the-gpio-chip-and-lines-in-gpio-structure.patch
 create mode 100644 package/swupdate/0003-ucfw-Refactored-gpio-handling.patch
 create mode 100644 package/swupdate/0004-ucfw-Add-compatibility-with-libgpiod-v2-api.patch

-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
