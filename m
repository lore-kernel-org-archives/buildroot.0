Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B15E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 07:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE3DD83D15;
	Sat, 30 Sep 2023 07:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE3DD83D15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05rpfa0lnPUC; Sat, 30 Sep 2023 07:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0558883D4A;
	Sat, 30 Sep 2023 07:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0558883D4A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B17E21BF681
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D8AD403D6
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D8AD403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJVFfVNwcTsd for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 07:54:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 209FC41CD8
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 07:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 209FC41CD8
Received: by mail.gandi.net (Postfix) with ESMTPA id CE6D340003;
 Sat, 30 Sep 2023 07:54:27 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 30 Sep 2023 09:54:16 +0200
Message-ID: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696060468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YAt46w0eX8Pbf19gCN5niHR4qbfH3QogiO6Bu2D/RGM=;
 b=Rt3vamlRXc+7JQ7PfElJnVjz0QsTm4IL+FK/7Fq59DUwFLELs1qFix00elm1o8Ng//ECHv
 JOspM6ownxXovNbIZ0LA2l14CmzxzrxILoAElOYkro5Ue0rfLbiym4jdwy/RFM7XCclEv8
 7Du4fuVAxDpeMAHG83oWp3JnHiiCleWHISBe4rOMwRwBxHOWI9/7FdEP6ASZ9D/j3wPVYn
 nhKShsLDJcSEs4c1ge7odnfP4wO/5Ss4i5yO7ofXSfj77dDC4KxFl6ehw4LCcegp56TB92
 i01qFM14xANaVWu02v3fHhU8C+Bp5T9KYnjR28pD/fa2UTWz0se5riKNBDbKtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rt3vamlR
Subject: [Buildroot] [PATCH v2 0/7] Move gcc target libs installation to
 target package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Henri Roosen <henri.roosen@ginzinger.com>,
 Stefan Mayrhofer <stefan.mayrhofer@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Currently, the gcc runtime libraries installed in
STAGING_DIR/TARGET_DIR are installed by host-gcc-final, a host
package. It works of course, but isn't very clean. But more
importantly, it prevents us from having a sane handling of licensing
for gcc. Indeed, the host gcc components are GPLv3, but the target
components of gcc are GPLv3 with the important linking exception.

In order to handle this, this series proposes to split the
host-gcc-final package into a host package (which already exists) and
a target package (which is added as part of this series). The logic
installing the gcc runtime libraries is moved to the target gcc-final
package. Once this is done, the series adds the relevant licensing
information to host-gcc-initial, host-gcc-final and gcc-final.

Changes from v1:

- Instead of introducing a separate gcc-runtime package, keep the
  logic in gcc-final, but with a target variant package. This was
  suggested by Romain Naour and indeed makes a lot of sense.

- Split into finer grained commits now that we're keeping things in
  gcc-final.mk.

Thomas Petazzoni (7):
  package/gcc/gcc-final: rework installation of libgcc_s/libatomic
  package/gcc/gcc-final: remove useless comment and empty variable
  package/gcc/gcc-final: move to make foreach loops
  package/gcc/gcc-final: split lib install by target/staging
  package/gcc/gcc-final: move hook further down
  package/gcc/gcc-final: add a target variant in charge of target
    installation
  package/gcc: add license information

 package/gcc/Config.in                         |  3 +
 package/gcc/gcc-final/gcc-final.mk            | 97 ++++++++-----------
 package/gcc/gcc-initial/gcc-initial.mk        |  2 +
 package/gcc/gcc.hash                          |  7 ++
 package/gcc/gcc.mk                            |  3 +
 toolchain/toolchain-buildroot/Config.in       |  1 +
 .../toolchain-buildroot.mk                    |  4 +-
 7 files changed, 60 insertions(+), 57 deletions(-)
 create mode 100644 package/gcc/Config.in

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
