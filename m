Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8ACC197A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 10:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42ED28148B;
	Mon, 20 Nov 2023 10:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42ED28148B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMewGDe8YJar; Mon, 20 Nov 2023 10:33:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C27C81587;
	Mon, 20 Nov 2023 10:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C27C81587
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B5E21BF35E
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 10:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E39140459
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 10:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E39140459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXxMvQ_NdwbR for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 10:33:53 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CB0140424
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 10:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CB0140424
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-548b54ed16eso1180554a12.0
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 02:33:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700476431; x=1701081231;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r8dFEA//q7yr6uH+Lm77y2FOK+N8anX6kVGslNidoH0=;
 b=R2FW6DPatSXB8fUiirXrx7btRSUmCyg782vvOyHjfVBAz6q++R1DEkYRKdNSZGtxXt
 P92Fb8BQjbFzceGnqeHFaxgpX1pS1sS5UqkFj6c74uURLkRQBryKj5YHFnBXSppoTMBz
 d9gnyuXpvKBZHwMVUJffAaB89teJufDyrVqndwDrZVQFfk39trLbBVO4n0IJeoVfrErl
 B+xPY42lkSCanEEZD4nxLTL6RnZwTUZzgIMKQ370Md51Z6EAwrznCrI6BNWrWBrbLjEE
 SZGgivJYHRLJuip1Lf3r6JXfIDM9MYiQaKx+vd04yENQObUS6GQ9uTv0TQWQFUCbihEq
 dn+g==
X-Gm-Message-State: AOJu0Yw2HYmuBVCVZJQCIURExENZIkOTUv4bvsIvJE1LkFic2f8wY6Hc
 4FeXzv+LpvyfM8WaH+z45pQ=
X-Google-Smtp-Source: AGHT+IGdf0BsQGFru0/Omcfs7t2CBOm0dE+g9fO6tKfRFccqIHlc24XEB/ue6rtRK3dKSHrC68SGzw==
X-Received: by 2002:a17:906:3bcb:b0:9e5:d618:d6c1 with SMTP id
 v11-20020a1709063bcb00b009e5d618d6c1mr5609701ejf.19.1700476430947; 
 Mon, 20 Nov 2023 02:33:50 -0800 (PST)
Received: from wslxew193.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a170906090e00b009ae57888718sm3732153ejd.207.2023.11.20.02.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 02:33:50 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
X-Google-Original-From: Boerge Struempfel <bstruempfel@ultratronik.de>
To: 
Date: Mon, 20 Nov 2023 11:32:56 +0100
Message-ID: <20231120103304.89728-1-bstruempfel@ultratronik.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700476431; x=1701081231; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r8dFEA//q7yr6uH+Lm77y2FOK+N8anX6kVGslNidoH0=;
 b=KqBPCnC87NTYlbEIO+ron9vXYiLmAeuig48QaViiehCroluDbyQofcnvdNpjM9yX72
 LQ12b7EFQ8HmhMIxaZynU0OAtnbj/f2XFqOPRwt1huZEKRaqTMw6mmtKNni9/n7e/W0b
 RcQPe0AvZ8hZL8g5RWsqcrXDqlHtW/9HLqnr5G9HzKNlfaA6Qp7qmyg697mz6c2zsh3q
 BIT0N6eRxDvHdcP5mmI6e8qVKrGsGIffWDDnXbmRKnnVX6mKxnMWuJW3dNrb8xot9S1A
 uy4yKYuimQZoAumAW/O5RG+Rm1kQfhgFDD3I4PXkZEDxeNHQNLiYhb29rUgtKxbsAmhf
 lqmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KqBPCnC8
Subject: [Buildroot] [PATCH v2 0/2] Adding support for gpiod v2.0 and higher
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

---

v1: https://lists.buildroot.org/pipermail/buildroot/2023-November/679675.html

Changes from v1:
  - Added myself to DEVELOPERS for the new libgpiod2 package
  - Removed the dependency on the linux headers
  - Updated from version 2.0.2 to 2.1
  - Added comment in the commit message to swap the dependency in the future
  - Added a note in the commit message, that the libgpiod2 does not correspond to the libgpiod2 debian package
  - Updated the help text to explain the difference between libgpiod and libgpiod2


Boerge Struempfel (2):
  package/libgpiod2: new package
  package/swupdate: Add compatibility to libgpiod2

 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 package/libgpiod2/Config.in                   |  27 +++
 package/libgpiod2/libgpiod2.hash              |   4 +
 package/libgpiod2/libgpiod2.mk                |  44 ++++
 ...cfw-Refactored-switch_mode-signature.patch |  74 +++++++
 ...pio-chip-and-lines-in-gpio-structure.patch | 129 +++++++++++
 .../0004-ucfw-Refactored-gpio-handling.patch  | 132 +++++++++++
 ...d-compatibility-with-libgpiod-v2-api.patch | 209 ++++++++++++++++++
 package/swupdate/Config.in                    |   4 +-
 package/swupdate/swupdate.mk                  |   5 +-
 11 files changed, 629 insertions(+), 3 deletions(-)
 create mode 100644 package/libgpiod2/Config.in
 create mode 100644 package/libgpiod2/libgpiod2.hash
 create mode 100644 package/libgpiod2/libgpiod2.mk
 create mode 100644 package/swupdate/0002-ucfw-Refactored-switch_mode-signature.patch
 create mode 100644 package/swupdate/0003-ucfw-Save-the-gpio-chip-and-lines-in-gpio-structure.patch
 create mode 100644 package/swupdate/0004-ucfw-Refactored-gpio-handling.patch
 create mode 100644 package/swupdate/0005-ucfw-Add-compatibility-with-libgpiod-v2-api.patch

-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
