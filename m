Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675FDC43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 11:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A3340F95;
	Thu,  9 Jul 2026 11:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLlms8VLRRmC; Thu,  9 Jul 2026 11:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8F4940F85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783595348;
	bh=kgCX6IZ/a2SmQ5G5QgmaFtj/Ov0AO63fgiDYbCLXMXw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aBe5F8haTWsZMUYh/5rByPm55TjfHlItpsD/w48Vv8fgTg87ZO5f5cpXUj2X9G+Nf
	 lLFk+uu9dZXPzkyyezUE2t4UadMopwKBv2w1sc8EJxiYR8SHJ5BsscrLsVM/FmHJiV
	 VSyourEeOolwR5zbtU/UmU9Z7GPv+AafQe1zUFOGXJkUFD+77Cw6s42ewitP8Grcmj
	 BsdFgtTllr/N3zzTgjOH/F289kvC+FYH83hQOIM7V9XhqLJNfvA75p+dIAHVU45hPm
	 5FDhShKTZciEfiNmMdEdZTxJWPOHOv0YBD4rAl7mjTfZqFECeTSQZ8lTx3LmSJ/WSO
	 sGcng0GwBVMAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F4940F85;
	Thu,  9 Jul 2026 11:09:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E3DA377
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8023E406F0
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_BCrbAXSWrq for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 11:09:04 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77D4C406ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77D4C406ED
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77D4C406ED
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:09:02 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id A4B43BDE4D3D;
 Thu, 09 Jul 2026 13:08:56 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
	Andreas Ziegler <br025@umbiko.net>
Date: Thu,  9 Jul 2026 13:08:04 +0200
Message-ID: <20260709110822.305873-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783595338; bh=5CUPAkqGdxDVS/Su3BiEHpLqpK6fsPKfVbkUljTAZkE=;
 h=From:To:Cc:Subject:Date;
 b=Dt35ZW7SMqOeJTtTbfW0iexxEHP72tG5dyMU++WBniFHRNex4gZoO5Ze2/C6Vk6M+
 OJkIN1UwRS1Fmc9IKbthIhm7ssNzwh/IgkOAKgGoHwLAVSLybNhhETxsyw+equLxpU
 g2iGrqAUZh3kitDvZToxzEFi+JJyi8H4crPxCSVs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=Dt35ZW7S
Subject: [Buildroot] [PATCH v2 00/11] add runtime test for mpd
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

Testing MPD in a real world situation is fairly straightforward: build,
deploy, play some music. Representing this simple test within a test
framework is quite complex.

I tried to break down my simple test case into a few atomic steps that
interact with MPD via the built-in protocol. The necessary test data was
generated with ffmpeg and imagemagick and is royalty-free :-D

In good old usenet tradition, test data had to be split in archive
chunks, to overcome the limitations of the mailing list. The data will
be re-combined in a post-build script. 

Working on this also triggered some changes in the Buildroot setup:

The configuration file supplied by Buildroot is only a sample; it will not
start MPD on a default installation. Usually a custom mpd.conf is supplied
in a rootfs overlay. Drop the Buildroot configuration file and install the
sample supplied by MPD instead, it is more complete, contains useful
examples and is update regularly.

After various updates since version 0.20, most dependencies placing
restrictions on sub-components are now superseded by restrictions placed on
MPD itself. Example: io_uring needs kernel headers > 5.1; MPD needs kernel
headers > 5.6. Remove dependencies from sub-options if they are already
imposed on MPD. 

MPD has 99 configurable options; of these, 44 are exposed in Buildroot's
Config.in. Sort order and grouping of these options are different within
the MPD project and Buildroot, which makes a comparison difficult.
Reorder entries in Config.in to reflect their order in meson_options.txt.
Also update at least some of the help texts to more closely resemble what
is published in the MPD manual.

Changes v1 -> v2:
	split test data in chunks to overcome mailing list restrictions

Andreas Ziegler (11):
  package/mpd: install provided sample configuration file as mpd.conf
  package/mpd: remove duplicated dependencies from sub-options
  package/mpd: reorder config items based on order in meson_options.txt
  support/testing: add test data for mpd
  support/testing: add test data for mpd
  support/testing: add test data for mpd
  support/testing: add test data for mpd
  support/testing: add test data for mpd
  support/testing: add test data for mpd
  support/testing: add runtime test for mpd
  DEVELOPERS: add entry for test_mpd

 DEVELOPERS                                    |   2 +
 package/mpd/Config.in                         | 364 +++++++++---------
 package/mpd/mpd.conf                          |  32 --
 package/mpd/mpd.mk                            |   2 +-
 support/testing/tests/package/test_mpd.py     |  57 +++
 .../tests/package/test_mpd/_test_data0        | Bin 0 -> 223630 bytes
 .../tests/package/test_mpd/_test_data1        | Bin 0 -> 223630 bytes
 .../tests/package/test_mpd/_test_data2        | Bin 0 -> 223630 bytes
 .../tests/package/test_mpd/_test_data3        | Bin 0 -> 223630 bytes
 .../tests/package/test_mpd/_test_data4        | Bin 0 -> 223630 bytes
 .../tests/package/test_mpd/_test_data5        | Bin 0 -> 223630 bytes
 .../tests/package/test_mpd/busybox.fragment   |   4 +
 .../tests/package/test_mpd/post-build.sh      |   6 +
 .../test_mpd/rootfs-overlay/etc/mpd.conf      |  14 +
 .../test_mpd/rootfs-overlay/root/test_mpd.sh  |  74 ++++
 15 files changed, 348 insertions(+), 207 deletions(-)
 delete mode 100644 package/mpd/mpd.conf
 create mode 100644 support/testing/tests/package/test_mpd.py
 create mode 100644 support/testing/tests/package/test_mpd/_test_data0
 create mode 100644 support/testing/tests/package/test_mpd/_test_data1
 create mode 100644 support/testing/tests/package/test_mpd/_test_data2
 create mode 100644 support/testing/tests/package/test_mpd/_test_data3
 create mode 100644 support/testing/tests/package/test_mpd/_test_data4
 create mode 100644 support/testing/tests/package/test_mpd/_test_data5
 create mode 100644 support/testing/tests/package/test_mpd/busybox.fragment
 create mode 100755 support/testing/tests/package/test_mpd/post-build.sh
 create mode 100644 support/testing/tests/package/test_mpd/rootfs-overlay/etc/mpd.conf
 create mode 100755 support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
