Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7128CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 18:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 242D460ED1;
	Wed,  6 May 2026 18:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTdF87TgqKQw; Wed,  6 May 2026 18:41:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7668A60ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778092865;
	bh=gSbuzozkGbJsGMH6TOq/7ALPNvSeNasG1c3/k2I4NLg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HKEt2/MwLxlRsz20aGDN+NjqFBP5vJDVqB0ns13qexgptY+hJrdskGZecHTHsadHp
	 1Z0L3SiTUEATTM/cjNOgvjQ8IS4tiFbDFAcWtWWoHWt5d/+flXJuEbpFK3pOEVinB/
	 jz6YWOXq4ac67YD8oHOkdiXmRnm/w6dpANQLw1wd2F/ziGTcFbyJjHrxApJXCFUxh4
	 597Y6ff+euwe+Kq8bEhyDa7MLB4Qq4+634iJkgNco7o7jVFVAnT1AWNUul5eXWCqZH
	 eHaq9qWPR8y+FA28VJkcfNG2Po2K5rUfz6Y0/Xvkelv8tarCoES0QTWN8JayIWAZ+/
	 0rtoHVWAetmsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7668A60ECA;
	Wed,  6 May 2026 18:41:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB613280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A862B82BBA
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cstl9SJ7pRs2 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 18:41:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1A5582B69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A5582B69
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1A5582B69
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:41:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 19A70A4C00CF;
 Wed,  6 May 2026 20:40:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKhB2-0000000040X-2yto;
 Wed, 06 May 2026 18:40:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  6 May 2026 20:40:44 +0200
Message-ID: <20260506184057.665854-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778092858;
 bh=LnmvCfsWhSCElaDjHBPssRbSB8Ryi9jqxgE74B9mMUw=;
 h=From:To:Cc:Subject:Date:From;
 b=mJ8+H3zMwuFtERz3rEnYo2UfCxvoWXltqkHfKF8Kx4oR5ao4a+39dPwdLEtnDVJxv
 GWgEOuTHuwn5OITOs10g58LznrvE2gDuAvFw1c/oFUH07aX3c3Lxf7UQ2l01h2IxhH
 hGwsKz2FmS5p3zl6DDzHa4mFYLyRgzt2MEPMjya0W7boNp/7Se/dhFrVx2Ze2PCd7G
 Z7DjENX5bGKMZ/HgRG8pLGYBkBWhkVnGdxY6B4rJp/DcSKKQQbQQLI8mAEvUNOIuDO
 mY+xwLHahZnE0QwlsCQuBIH2+YbXt5XjEX9G2UABTlsH8CJxx+RX3H4oyy1RNgXIw1
 8cjtEDcS2bI7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=mJ8+H3zM
Subject: [Buildroot] [PATCH 00/12] Add libudev-zero as provider for libudev
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

Hi,

this is a new try to get packages which need libudev, but not a full
udev-daemon, working on systems that use
BR2_ROOTFS_DEVICE_CREATION_STATIC=y.

A couple of years ago a patch series splitting the eudev package into a
non-daemon/with-daemon version ended up into a discussion about space
saving and complexity:
https://lists.buildroot.org/pipermail/buildroot/2023-August/735616.html

This new series still introduces a new virtual package, libudev, with
eudev and systemd as possible providers but otherwise keeps these
packages untouched.

The third provider is the new package libudev-zero which is a daemonless
replacement for libudev.

Run-time tested kodi with libcec and intel_gpu_top.

Regards, Bernd

Additional note: eudev seems unmaintained upstream:
https://github.com/eudev-project/eudev/issues/296#issuecomment-3651442802

Bernd Kuhls (8):
  package/libudev-zero: new package
  package/libudev-zero: provides libudev
  package/eudev: provides libudev
  package/libv4l: optionally use libudev
  package/libcec: optionally use libudev
  package/igt-gpu-tools: only needs libudev, not udev daemon
  package/kodi: only needs libudev, not udev daemon
  package/mesa3d: add optional dependency to libudev

Yann E. MORIN (4):
  package/libudev: new virtual package
  package/systemd: provides libudev
  package/qt5base: optionally use libudev
  package/libinput: only needs libudev, not udev daemon

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   2 +
 package/eudev/Config.in                       |   4 +
 package/eudev/eudev.mk                        |   2 +-
 package/igt-gpu-tools/Config.in               |   6 +-
 package/igt-gpu-tools/igt-gpu-tools.mk        |   2 +-
 package/kodi/Config.in                        |   6 +-
 package/kodi/kodi.mk                          |   4 +-
 package/libcec/libcec.mk                      |   4 +-
 package/libinput/Config.in                    |   6 +-
 package/libinput/libinput.mk                  |   2 +-
 ...01-Avoidable-OOM-on-small-systems-62.patch | 176 ++++++++++++++++++
 package/libudev-zero/Config.in                |  18 ++
 package/libudev-zero/libudev-zero.hash        |   3 +
 package/libudev-zero/libudev-zero.mk          |  29 +++
 package/libudev/Config.in                     |   6 +
 package/libudev/libudev.mk                    |   7 +
 package/libv4l/libv4l.mk                      |   4 +-
 package/mesa3d/mesa3d.mk                      |   4 +
 package/qt5/qt5base/qt5base.mk                |   4 +-
 package/systemd/Config.in                     |   4 +
 package/systemd/systemd.mk                    |   2 +-
 22 files changed, 275 insertions(+), 21 deletions(-)
 create mode 100644 package/libudev-zero/0001-Avoidable-OOM-on-small-systems-62.patch
 create mode 100644 package/libudev-zero/Config.in
 create mode 100644 package/libudev-zero/libudev-zero.hash
 create mode 100644 package/libudev-zero/libudev-zero.mk
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
