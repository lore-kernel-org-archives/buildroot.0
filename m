Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E613CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3957F60DC3;
	Sat, 18 Oct 2025 19:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PG9hNUMallLN; Sat, 18 Oct 2025 19:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D28260E2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D28260E2D;
	Sat, 18 Oct 2025 19:43:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CADE1CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22F2940AD9
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8g_O-cPNyfT for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:43:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A5C740A56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A5C740A56
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A5C740A56
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7F915C09A1F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C5CC86069D
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C6487102F237E; 
 Sat, 18 Oct 2025 21:43:22 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: romain.gantois@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Oct 2025 21:42:58 +0200
Message-ID: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760816603; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=CVRa8MSBP8dLSGmeLy1LGsp8xCR5FvvDbyxS4+Jt8mo=;
 b=HYXcFrHYaBqdH4HDS53xXperr9PAG3dAy3JOKO3sm2U+GmzVqOjPGTyUFHwSEQxttfWkd+
 SM0h9C7qo4ScOSUy1Z0NtYCf0I12/RnSfpQgzoBg8FxIqtnSwfbCwwQEblu7PCa+28QKSh
 UeELkqJHUR/HcqBpO27ced3dztjHcLbwHSs3/5zk9lYXvSTVej+XaRzQ59+qUZMC2RVuzS
 HfRHNNXRMIU+/w6ycu5IDcx59zMLWzwRWpRiS8CZ2LZIMWv4CaAp/E+rHWwE4j3vlDfUl7
 GDB5k2B49BhvyKAjpUtj7sVmqbCozqI+sLzoEe5dYb17G6ET1C/XWtjYyxwzDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HYXcFrHY
Subject: [Buildroot] [PATCH 00/11] Add support for building Snagboot
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

Snagboot <https://github.com/bootlin/snagboot/> is an open-source and
platform-agnostic tool to recover and reflash embedded platforms,
replacing vendor-specific tools by a single unified tool.

This patch series aims at allowing to build Snagboot for the host as
part of a Buildroot build, so that a Buildroot user can use Snagboot
after the build to recover/reflash an embedded platform.

Snagboot requires a number of dependencies, which is why we are adding
python-crccheck, python-fs and python-pyfatfs as new packages, and
also enabling host variants for the existing python-tftpy,
python-pyusb, python-xmodem and python-appdirs packages.

Since we're adding so many host Python packages, we thought it would
be a good idea to test them, but our runtime testing infrastructure
wasn't really convenient to test host packages. The first two patches
therefore propose some improvements to the testing infrastructure,
which are then use by the remaining patches to make sure we at least
minimally test that host Python packages work.

Let me know what you think!

Thomas

Thomas Petazzoni (11):
  support/testing/infra: improve run_cmd_on_host() to show stdout/stderr
  support/testing/infra/basetest.py: add BRHostPkgTest class
  package/python-crccheck: new package
  support/testing/tests/package/test_python_serial.py: new test case
  package/python-tftpy: add host variant
  package/python-pyusb: enable host variant
  package/python-xmodem: add host variant
  package/python-appdirs: add host variant
  package/python-fs: new package
  package/python-pyfatfs: new package
  package/snagboot: new package

 DEVELOPERS                                    | 11 ++++
 package/Config.in.host                        |  1 +
 package/python-appdirs/python-appdirs.mk      |  1 +
 package/python-crccheck/python-crccheck.hash  |  4 ++
 package/python-crccheck/python-crccheck.mk    | 15 ++++++
 package/python-fs/python-fs.hash              |  5 ++
 package/python-fs/python-fs.mk                | 15 ++++++
 ...oject.toml-relax-version-constraints.patch | 45 ++++++++++++++++
 package/python-pyfatfs/python-pyfatfs.hash    |  4 ++
 package/python-pyfatfs/python-pyfatfs.mk      | 17 ++++++
 package/python-pyusb/python-pyusb.mk          |  2 +
 package/python-tftpy/python-tftpy.mk          |  1 +
 package/python-xmodem/python-xmodem.mk        |  1 +
 package/snagboot/Config.in.host               |  8 +++
 package/snagboot/snagboot.hash                |  3 ++
 package/snagboot/snagboot.mk                  | 29 ++++++++++
 support/testing/infra/__init__.py             | 19 +++++--
 support/testing/infra/basetest.py             | 22 ++++++++
 .../tests/package/test_python_crccheck.py     | 10 ++++
 .../testing/tests/package/test_python_fs.py   |  9 ++++
 .../tests/package/test_python_pyfatfs.py      | 53 +++++++++++++++++++
 .../tests/package/test_python_pyusb.py        |  9 ++++
 .../tests/package/test_python_serial.py       | 12 +++++
 .../tests/package/test_python_tftpy.py        |  9 ++++
 .../tests/package/test_python_xmodem.py       |  9 ++++
 .../testing/tests/package/test_snagboot.py    | 16 ++++++
 26 files changed, 325 insertions(+), 5 deletions(-)
 create mode 100644 package/python-crccheck/python-crccheck.hash
 create mode 100644 package/python-crccheck/python-crccheck.mk
 create mode 100644 package/python-fs/python-fs.hash
 create mode 100644 package/python-fs/python-fs.mk
 create mode 100644 package/python-pyfatfs/0001-pyproject.toml-relax-version-constraints.patch
 create mode 100644 package/python-pyfatfs/python-pyfatfs.hash
 create mode 100644 package/python-pyfatfs/python-pyfatfs.mk
 create mode 100644 package/snagboot/Config.in.host
 create mode 100644 package/snagboot/snagboot.hash
 create mode 100644 package/snagboot/snagboot.mk
 create mode 100644 support/testing/tests/package/test_python_crccheck.py
 create mode 100644 support/testing/tests/package/test_python_fs.py
 create mode 100644 support/testing/tests/package/test_python_pyfatfs.py
 create mode 100644 support/testing/tests/package/test_python_pyusb.py
 create mode 100644 support/testing/tests/package/test_python_serial.py
 create mode 100644 support/testing/tests/package/test_python_xmodem.py
 create mode 100644 support/testing/tests/package/test_snagboot.py

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
