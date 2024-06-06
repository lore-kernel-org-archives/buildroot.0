Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63E3C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 10:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3840608DE;
	Thu,  6 Jun 2024 10:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkAOEbHkLVFC; Thu,  6 Jun 2024 10:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF5AB61476
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF5AB61476;
	Thu,  6 Jun 2024 10:48:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 840981BF5E0
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 10:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 716E280E1D
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 10:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-EbZpu6W5qK for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 10:48:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E2CA80E06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E2CA80E06
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E2CA80E06
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 10:48:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCB1161C1A;
 Thu,  6 Jun 2024 10:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9D4C2BD10;
 Thu,  6 Jun 2024 10:48:21 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 13:48:10 +0300
Message-ID: <20240606104813.1514-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717670902;
 bh=cFqM7b9YjlpIbY4PwXF2TqzWLImNqEHC35f2ekNH1ow=;
 h=From:To:Cc:Subject:Date:From;
 b=l3S/Hjm5Ex2PPHpiNSJ0U3TLhdINbJYu3qf9gB17omPZPHtf8Bz0ktftRDtRZVSqa
 UJXs+9TEVGpIY5x4SQLNqU04mFMbQjpmBpKtGkY/H/urUvsCjpXGqC1o9SWLVKk6tg
 /5VcpVXF5JPXepBPpKBqcuXPtuAMjiRkHAaL/CsWxBY5syzNrw4oG//EXLZxs+FuQH
 88xs6Lp1NVut/fGaf/8OtQDbEz2GeGM8GFYpaWJ0Nyw0+m3WSaQwykMqAzkXi/gaz/
 3Ni7ubkae6JCx+PqaBUHEnZaOObEu7vH0i2KFeayq7iCCSq/9/YuLNH9b+J8Q2/yC5
 tBsS+Ye8hG1hA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l3S/Hjm5
Subject: [Buildroot] [PATCH v2 0/3] Upgrade systemd to v255
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The goal here is to upgrade systemd version to v255, which is the final
version version with sysvinit compatibility. I also cherry-picked couple of
bug fixes from the systemd upstream, which address errors complaining of
missing superblocks:

1. Filesystem found in kernel header but not in \
   filesystems-gperf.gperf: BCACHEFS_SUPER_MAGIC
1. Filesystem found in kernel header but not in \
   filesystems-gperf.gperf: PID_FS_MAGIC

On feature side v255 has a nice tool called 'systemd-pcrlock', which can
be used for creating and experimenting with TPM2 authorization policies,
which is very useful.

I also upgraded tpm2-tools to 5.7 because it has a useful conversion
tool called 'tpm2_encodeobject".

Change Log
==========

v1: https://lists.buildroot.org/pipermail/buildroot/2024-June/754748.html

Cc: buildroot@buildroot.org.
Cc: James Hilliard <james.hilliard1@gmail.com>
CC: Arnout Vandecappelle <arnout@mind.be>
Cc: Erik Larsson <karl.erik.larsson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Jarkko Sakkinen (3):
  package/tpm2-tools: bump version to 5.7
  package/systemd: bump to version 255
  package/systemd: add the missing superblock identifiers

 .../0001-basic-add-pidfs-magic-31709.patch    | 50 +++++++++++++++++++
 .../0002-basic-add-bcachefs-magic.patch       | 50 +++++++++++++++++++
 package/systemd/systemd.hash                  |  2 +-
 package/systemd/systemd.mk                    |  2 +-
 package/tpm2-tools/tpm2-tools.hash            |  2 +-
 package/tpm2-tools/tpm2-tools.mk              |  2 +-
 6 files changed, 104 insertions(+), 4 deletions(-)
 create mode 100644 package/systemd/0001-basic-add-pidfs-magic-31709.patch
 create mode 100644 package/systemd/0002-basic-add-bcachefs-magic.patch

--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
