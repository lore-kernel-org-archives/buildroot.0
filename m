Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806BCCA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 12:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A4D40DF4;
	Tue,  9 Sep 2025 12:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id et9OpoBX8kSW; Tue,  9 Sep 2025 12:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA6540DE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA6540DE8;
	Tue,  9 Sep 2025 12:59:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BAC9CA
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DF5480DF5
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgmjQZsnX8hQ for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 12:59:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4245780DD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4245780DD4
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4245780DD4
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DC7421A0DB4
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AAA8D60630
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F39D102F28A9; 
 Tue,  9 Sep 2025 14:59:38 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  9 Sep 2025 14:08:05 +0200
Message-ID: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757422783; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=LSUgPzMI13mazpifvG+xz82hZOnJ+t/jPuWvDDPvuCI=;
 b=QZSElZ/FN9nw1QrnwKp+QoIOprINwFE5jrWleHNZkA2BNmg1ueihiXwE56gH1Luk+vIFtY
 5aWIUY77WQuyNph0SCyxpQhL2/qsDHdWzet5c7c0THiCd4saHqJtRZWt97b1ZZmC/dxWpl
 EoFlHyVlvOrbEM8X3gpfXjAqaCNncP4hkMxCSR/uAIpEP28czt2jzG0G+NRbsZsnOLzHzs
 vbmAPj6tvesQNUnm0OzsDMBywaJN+3PqHaoH4/k5mxSP6R6BCza4EH0NiLM4pQKo4XL+of
 Ti6+FRa1135UjbidZYmWmYMvXhWy5mBscC0ObZVfEHek/+1FWiG4OkxWh6bfgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QZSElZ/F
Subject: [Buildroot] [PATCH 00/11] SELinux fixes and updates
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This series has 3 patches fixing various build issues with the current
SELinux stack, and then continues with an update of all SELinux
components.

It was verified by running our SELinux runtime tests:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/2029530265
  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/2029530263

Best regards,

Thomas

Thomas Petazzoni (11):
  package/libselinux: fix build issues caused by 3.8.1 bump
  package/libsemanage: fix build issue due to basename()
  package/policycoreutils: fix build with musl due to getpass()
  package/libselinux: bump version to 3.9
  package/checkpolicy: bump to version 3.9
  package/libsemanage: bump to version 3.9
  package/libsepol: bump to version 3.9
  package/policycoreutils: bump to version 3.9
  package/restorecond: bump to version 3.9
  package/selinux-python: bump to version 3.9
  package/semodule-utils: bump to version 3.9

 .checkpackageignore                           |  1 -
 package/checkpolicy/checkpolicy.hash          |  2 +-
 package/checkpolicy/checkpolicy.mk            |  2 +-
 package/libselinux/libselinux.hash            |  2 +-
 package/libselinux/libselinux.mk              |  2 +-
 package/libsemanage/libsemanage.hash          |  2 +-
 package/libsemanage/libsemanage.mk            |  2 +-
 .../libsepol/0001-support-static-only.patch   | 52 -------------------
 package/libsepol/libsepol.hash                |  2 +-
 package/libsepol/libsepol.mk                  |  4 +-
 ...-all-paths-that-use-an-absolute-path.patch |  2 +-
 .../0002-Add-PREFIX-to-host-paths.patch       |  2 +-
 package/policycoreutils/Config.in             |  5 +-
 package/policycoreutils/policycoreutils.hash  |  2 +-
 package/policycoreutils/policycoreutils.mk    | 37 ++++---------
 package/restorecond/restorecond.hash          |  2 +-
 package/restorecond/restorecond.mk            |  2 +-
 package/selinux-python/selinux-python.hash    |  2 +-
 package/selinux-python/selinux-python.mk      |  2 +-
 package/semodule-utils/semodule-utils.hash    |  2 +-
 package/semodule-utils/semodule-utils.mk      |  2 +-
 21 files changed, 30 insertions(+), 101 deletions(-)
 delete mode 100644 package/libsepol/0001-support-static-only.patch

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
