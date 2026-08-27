Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2810DC61DBD
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 03:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0281807F2;
	Thu, 27 Aug 2026 03:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xm4FWc4bzAJs; Thu, 27 Aug 2026 03:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787801242;
	bh=c3eq231bWLwJ9Ws5dJ4bdM3DQhwT2e7bR2Z2xlVYYSE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ho7eAw148JzV4LDmZv3dL0g90ZtzBilHlnHUe3loerc899RHV8mCtTUzyCcwRQdl2
	 kF+iZNCet70d2r6fdBhUO7z+GVJ/k1PU4jpz90IOOKJGe/+i5AP/V1A0EdpZUGbP3a
	 yl34OL5Eds19BmjiVSGHRhOfm+jL3/AUXepZAIEBlakIaLTnuro13uCn/QdQ+dDpxl
	 JFlL5P/V5Kh35OWzeLBUv+Wg2BSxE4Yvhx6VJkTrE562ojvPC8F7cqhOf/01plyrWl
	 GCp4UKkMpX5xD9aFrjRICtZL3gESka2mEcG+XmaV8Z+Gm1GfMJ6UCDkNWylNL/+Itm
	 d1s4uqfaB9/Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73DDE807A1;
	Thu, 27 Aug 2026 03:27:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 047547AA
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 03:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 025FA40247
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 03:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKDTMWT-jtfH for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 03:27:19 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=fvY3L+Sl
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E9F94009C
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 03:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1787801234; bh=YIvgRXPQY/CU+OT/49V6qns5i8cMU6ybWjILmZjx45A=;
 h=From:To:Cc:Subject:Date;
 b=fvY3L+Slb+AlgAxf+IEuBiwswzyTWg0C0/ruHLqZNh1c/8O2JuoGxeovpO8VBePrI
 oiNthwL6323Y0nGPU95gMkGYdX/FTYl45raJtLDLwWkywlke3/eMAD4V3YRD/Orrx5
 2ugcp/hPFw0fDf8qz5OhMd3Whlf7wm4GN85GcfYE=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 797BDBDE2087;
 Thu, 27 Aug 2026 05:27:13 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Andreas Ziegler <br025@umbiko.net>
Date: Thu, 27 Aug 2026 05:26:37 +0200
Message-ID: <20260827032643.1940-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v3 0/2] Add runtime test for mpd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot mpd.conf now contains exactly the minimum changes, that need to
be merged with the upstream configuration file to make a default build of
mpd runnable.

The runtime test has been stripped down to be able to dispense with
using test data. It uses the standard Buildroot configuration for mpd
without customization. 

Changes v1 -> v2:
	split test data in chunks to overcome mailing list restrictions
Changes v2 -> v3:
	leave Config.in unchanged
	reintroduce Buildroot mpd.conf as fragment file
	simplify test to be used without test data
	remove test data 
	remove mpd.conf rootfs overlay

Andreas Ziegler (2):
  package/mpd: use upstream mpd.conf w/ buildroot modifications
  support/testing: add runtime test for mpd

 DEVELOPERS                                    |  2 +
 package/mpd/mpd.conf                          | 31 +++--------
 package/mpd/mpd.mk                            | 22 +++++++-
 support/testing/tests/package/test_mpd.py     | 51 +++++++++++++++++++
 .../tests/package/test_mpd/busybox.fragment   |  4 ++
 .../test_mpd/rootfs-overlay/root/test_mpd.sh  | 35 +++++++++++++
 6 files changed, 121 insertions(+), 24 deletions(-)
 create mode 100644 support/testing/tests/package/test_mpd.py
 create mode 100644 support/testing/tests/package/test_mpd/busybox.fragment
 create mode 100755 support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
