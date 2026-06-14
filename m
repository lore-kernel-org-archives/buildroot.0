Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988E6CD98D2
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 15:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2538260C31;
	Sun, 14 Jun 2026 15:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeDLTee41Yi8; Sun, 14 Jun 2026 15:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 169A260EDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781452430;
	bh=IxC6aWpG96Fw1ppDJ2S7cpp2K5NskK9H3NTa4W7XwUQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SZ4fBx+66f4yrL4/nflEzlX/TbKi1XvW+j4ndFk76EHeITxTxwNANunMKX/PquDu9
	 c2YG4Va9GrxAy+a3QiNoK6iHz5R019G0r5Jq5jBkt+zbZoFswX+0nacbG3q8cKbUzb
	 g/T9ccN6mp58wL8fmO6v5sMYeTp4OmPW5jNfwtxJSyHXuxnesoQxKQl/Q5kv+3pmhO
	 XUYOTzJdoMF2iyB/m+Aoew2wMw9bauXsIv7utW0ScAvKgIgUJ62nQjZDyQjCzZYKkj
	 LON42K7FPeCh9cwZFzZSF3eepQH8n/v1ks4gAO6L7+MR642p7Ib+20n6+MiOdV3JYS
	 HIAsrhk1yf2cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 169A260EDF;
	Sun, 14 Jun 2026 15:53:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CCCF2EF
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D0E141045
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8IVrfdJKuNe for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 15:53:44 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0ADB407C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0ADB407C7
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0ADB407C7
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:42 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5aa612bf6efso2180204e87.3
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 08:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781452420; x=1782057220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqMievBnxX2VnhO3UUuksfcuU0rM/yjiYLGjghYi80M=;
 b=SvvS4SkBC/S1TAqxQMv/f8qZ3ak0ugKxZ9qm2LYyEdIsh2isLzBlEEky4NLvDyzAN9
 7LynyTtpYJZchAao1KyjHtPz12tzuggKqqagPDUOc5oMpEcURCJjqvg/QQk7YmkSBpYu
 E9eqzYwCCEIY1oHWjdFD+3PPIq3CZfbfTtSSc6uWSjPAoecYPxO/aZ1qf6Adahcrgj+u
 uPlpME0Nu31yACynEra3ibur2rJYKYR5KPVjYEFfD9zun3DsmA4L4gKLUrqEZqHesAJV
 NPGvbROXmLyr50STVSgBD8iXXzI94hqY6IwuvILE3I1AgEF/JmaVl3O1x1AHszT5SbuJ
 G9Zw==
X-Gm-Message-State: AOJu0YzfUcMXY/yfxlELjeVnYdovVkn1t96u2k/qKyFnSXWiJXgVeRFx
 CGYjoTn3AVXymj7v1Mq7VdPhc5wDx+wzYmbezhzcidmYF3bb0HvM43s1Ke53OERxcDpA5KsIZVI
 CyRrlM13ZRg==
X-Gm-Gg: Acq92OHXBYkBn0ZMLl/A1q9QgkIEGgiaCnlbUgxos0VAq2ymgvhSqNHtnCU74EZ3vt5
 k8CzdaewAQd/4wBvD0j5rN3Jj6qeudfdc4EwY0g2bzyJLPe9nZEgyMLq/ont1Zmwb8a2nKYFhbH
 4bOIKvjbO8Ag49ZdjOiSsIpWo1GNO27dKRARXWREAROlUFHvUxpUS1/0yy6a0X7a/3IlI2bMZHR
 M7zsrPDfMHsKeb7A4aESk5nxNeLLCH+KuXdf2bmbO07AU5nxRCojt6yp5hJKut0HwF+J5b7InfM
 sDzUJSKha/zNF8xV9r4qEH0N6Fi6jn4CEXJk3aU60Ulc1qal57YThabZcdsFIaWnS634m6bX5cy
 SswKpP+fSqZU0FWUOriXNU1zuL8tg7OOyEiPYsB3CoNN31kGCzJGn62c45trOo/2OClf3B20A8y
 uio6cLiS+RffBQIuB3rB2s87yk5QjzZ5e9i6t5zkWthNzjTG92L4UIog==
X-Received: by 2002:a05:6512:66d4:10b0:5a3:ff6b:cb5d with SMTP id
 2adb3069b0e04-5ad30da8f06mr1359066e87.19.1781452419462; 
 Sun, 14 Jun 2026 08:53:39 -0700 (PDT)
Received: from localhost (81-226-112-165-no2360.tbcn.telia.com.
 [81.226.112.165]) by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5ad2e1baba7sm2039247e87.83.2026.06.14.08.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 08:53:37 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Date: Sun, 14 Jun 2026 17:53:20 +0200
Message-ID: <20260614155328.304282-1-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1781452420; x=1782057220;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qqMievBnxX2VnhO3UUuksfcuU0rM/yjiYLGjghYi80M=;
 b=GKJOJEtImrg/oYxrLrZybpDaKeLjLC4Qjq7SSL0cOtu0KqznRn6fTcNsX2YFplMiFJ
 fe4VGWkTwGqcYt1RH+RYbWU6hLvnVh15veFe3aISHj1lg94wjod6tDBYZCSKpK7TobAB
 vT1W2qfJREnDklgMsOOfuez0qnDdub8x0ED5uX5+4oYfdK7bMMV1Iu1vjkygn9yMSpvx
 bwnJ0zYM4oqcGQPbXiai71M4YxJMaKMZ8CR5P1r6GwenGaHwlCovWRhLwANOpUHOYM4i
 fx1hVXKe+zC1lyI6mv9fu1nhQ8CmmxzL7Cr6oBy9028VsFNHt3ySMbeiYGVLtEM+OCHH
 gxmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=GKJOJEtI
Subject: [Buildroot] [PATCH v2 0/8] Second set of fixes for build failures
 and PPD file conflicts
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Romain Naour <romain.naour@smile.fr>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sen Hastings <sen@hastings.org>,
 John Ernberg <john.ernberg@actia.se>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 John Ernberg <j@j-ernberg.se>, Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

This is the second set of changes in preparation for for syncing less
dependencies in PPD builds, to avoid the package rebuild problem as
originally proposed at [1].

These patches are a little less trivial.

Apologies on the delay with v2 on this, days do not have enough hours in
them.

Since the patches are technically free standing developers are only CCd on
the cover letter and the patches touching things they maintain.

[1]: https://lore.kernel.org/buildroot/20241227160622.1654822-1-john.ernberg@actia.se/T/#u

Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Sen Hastings <sen@hastings.org>
Cc: Yegor Yefremov <yegorslists@googlemail.com>

v2:
 - Simplify libcamera-apps check (Arnout)
 - Make commit messages more explicit (Arnout)
 - Pick up a review tag (Joseph)
 - Drop Jailhouse removal (Romain)

v1 (RFC): https://lore.kernel.org/buildroot/20260601204735.888967-1-j@j-ernberg.se/

John Ernberg (8):
  package/foot: Prefer ncurses terminfo if ncurses is selected
  package/libest: Drop java support
  package/rtl8188eu: Conflict with the linux-firmware rt81xx sub-package
  package/{skeleton-init-,}systemd: Install legacy.conf from the systemd
    package
  package/libcamera-apps: Only enable EGL if both epoxy and xlib_libX11
    are selected
  package/util-linux-libs: Do not install to target
  package/python-xlib: Drop the package
  package/python-html5lib: Drop the package

 Config.in.legacy                              | 14 +++++++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  2 -
 package/foot/foot.mk                          |  4 ++
 package/libcamera-apps/libcamera-apps.mk      |  6 +--
 package/libest/libest.mk                      | 10 +----
 ...y-fix-version-parsing-on-Python-3.14.patch | 42 -------------------
 package/python-html5lib/Config.in             |  8 ----
 package/python-html5lib/python-html5lib.hash  |  5 ---
 package/python-html5lib/python-html5lib.mk    | 16 -------
 package/python-xlib/Config.in                 |  7 ----
 package/python-xlib/python-xlib.hash          |  5 ---
 package/python-xlib/python-xlib.mk            | 14 -------
 package/rtl8188eu/Config.in                   |  5 +++
 package/rtl8188eu/rtl8188eu.mk                |  1 +
 .../skeleton-init-systemd.mk                  |  1 -
 .../legacy.conf                               |  0
 package/systemd/systemd.mk                    | 13 +++++-
 .../util-linux-libs/util-linux-libs.mk        |  5 +++
 19 files changed, 44 insertions(+), 115 deletions(-)
 delete mode 100644 package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
 delete mode 100644 package/python-html5lib/Config.in
 delete mode 100644 package/python-html5lib/python-html5lib.hash
 delete mode 100644 package/python-html5lib/python-html5lib.mk
 delete mode 100644 package/python-xlib/Config.in
 delete mode 100644 package/python-xlib/python-xlib.hash
 delete mode 100644 package/python-xlib/python-xlib.mk
 rename package/{skeleton-init-systemd => systemd}/legacy.conf (100%)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
