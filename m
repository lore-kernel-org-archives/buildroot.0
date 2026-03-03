Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3675EDEBEB
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5198F6063F;
	Tue,  3 Mar 2026 20:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVYJfUUbbncD; Tue,  3 Mar 2026 20:01:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A40C9606A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568063;
	bh=TwiCrkKFv9/+kydrBShgEChyGnBukxmJCs2ZtK2iukQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=atFWamtGtFygNawtkgK6OMc7QfBG5db4oBdI73cgag+TD1Vpf6vUeCqKDaXU5nV56
	 504E2Tiav7UCL1rBDLaxwYHuGEK5Po81sMgwhG87D0+TxeN36WDvQKCKqXVrVZRfFY
	 K4lnB0i9w8zZsGKrR5UwKjXJCV0QdeoHQ8jPYb4dNTO+C1LuL1BzUyLkLP2B+Iq6rh
	 Iqv4MDTez0T/P54aBc8e7LG+4beEwjun2BvqrYJ61isJmFUl+X5RV0NnuwA7OkZekd
	 3sckNEuh3R46HgV5nFDY8R4PcLlk8fBck3J7fFykQ3TqDf7eJFohdC7r9ghxztV1de
	 VFP0xT74y8/1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A40C9606A6;
	Tue,  3 Mar 2026 20:01:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35E1D25B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B5CF4189A
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ap0NCmBE4oBi for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:01:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A74D040CF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A74D040CF5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A74D040CF5
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:00:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65658A4C3288;
 Tue,  3 Mar 2026 21:00:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvL-000000003gI-0ywU;
 Tue, 03 Mar 2026 20:00:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:39 +0100
Message-ID: <20260303200054.784253-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568055;
 bh=sGn6T3uUD4BXa1CRF7EbnDWb2PH7dyG3kfC24A1gh6o=;
 h=From:To:Cc:Subject:Date:From;
 b=S/lDnCw/FxNyshxe4vOv7G+vux8bDtnIbjhS+AkJb8fd5lnZAgUXoYfCrwRMB4Dhy
 Cqs2c80iQugIh3hTyILd84KMFTW8Scuj0yV6h5CK/clUOhRrnw8OalaNlUnKu7CmzH
 8ObH9hEuUdiW9QU47aCSBsO1a5tD0habf02+PaO4wiXmeht8mf6+Jm3edic0dUjd0x
 +j70Zw4Y41DsvabOcyZ/Hc+H792AH3nMhV7lZxOwmyZTOe1mBCQ5r5pwsUXFsh2+eo
 fy9YP4dElyIZuad9EQmmk91f7B4L3YY233BuKFcm78Ga2ZL0k/JycrqnelBLqSxNXQ
 jFRRTtE4RxYyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=S/lDnCw/
Subject: [Buildroot] [PATCH/next 00/14] package/{glibc,
 localedef}: bump version to 2.43
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series bumps glibc to 2.43:
https://sourceware.org/glibc/wiki/Release/2.43

This series was tested with an allyesconfig on BR2_x86_64 with gcc
13/14/15 and includes fixes only for build errors introduced by the
glibc bump.

To test this series it is necessary to cherry-pick these commits from
the master branch to -next:

fbdabe5fda6573fb90571e0188ffaed5dc16dea9
package/wlroots: bump version to 0.19.2

3fcfe01d70cb0f8f350cd6bb1bda914fc7fc8609
package/wlroots: fix build with libinput 1.31

and add one patch from patchworks:
https://patchwork.ozlabs.org/project/buildroot/patch/20260203224414.192218-2-petr.vorel@gmail.com/
package/ltp-testsuite: bump version to 20260130

Regards, Bernd

Bernd Kuhls (14):
  package/socat: bump version to 1.8.1.1
  package/lxc: bump version to 6.0.6
  package/foot: bump version to 1.26.0
  package/libkrb5: fix build with glibc 2.43
  package/wlroots: fix build with glibc 2.43
  package/ntp: fix build with glibc 2.43
  package/waffle: fix build with glibc 2.43
  package/links: Fix build with glibc 2.43
  package/ltp-testsuite: fix build with glibc 2.43
  package/libvips: fix build with glibc 2.43
  package/freeswitch: disable mod_enum to fix build with glibc 2.43
  DEVELOPERS: remove Bernd Kuhls from libldns
  package/gcc/15.2.0: fix build with glibc 2.43
  package/{glibc, localedef}: bump version to 2.43

 DEVELOPERS                                    |   1 -
 package/foot/foot.hash                        |   2 +-
 package/foot/foot.mk                          |   2 +-
 package/freeswitch/freeswitch.mk              |   5 -
 ...mp-Fix-GCC-build-after-glibc-cd748a6.patch |  77 +++++++
 package/glibc/glibc.hash                      |   6 +-
 package/glibc/glibc.mk                        |   4 +-
 .../0001-Fix-strchr-conformance-to-C23.patch  | 189 ++++++++++++++++++
 ...IPS_FREEF-for-expression-like-macros.patch |  33 +++
 package/links/0001-glibc-2.43.patch           |  27 +++
 ...y-on-GCC-to-4.8-and-binutils-to-2.24.patch |   4 +-
 ...3_SOURCE-undefined-to-build-localede.patch |  37 ----
 package/localedef/localedef.mk                |   2 +-
 ...fine-_GNU_SOURCE-and-include-fcntl.h.patch |  84 ++++++++
 package/lxc/lxc.hash                          |   3 +-
 package/lxc/lxc.mk                            |   2 +-
 package/ntp/0007-memchr.patch                 |  42 ++++
 package/socat/0001-no-documentation.patch     |   4 +-
 package/socat/socat.hash                      |   6 +-
 package/socat/socat.mk                        |   2 +-
 .../0001-c11-threads-fix-build-on-c23.patch   |  57 ++++++
 package/wlroots/0002-xcursor.patch            |  33 +++
 22 files changed, 563 insertions(+), 59 deletions(-)
 create mode 100644 package/gcc/15.2.0/0004-libgomp-Fix-GCC-build-after-glibc-cd748a6.patch
 create mode 100644 package/libkrb5/0001-Fix-strchr-conformance-to-C23.patch
 create mode 100644 package/libvips/0001-memory-fix-VIPS_FREEF-for-expression-like-macros.patch
 create mode 100644 package/links/0001-glibc-2.43.patch
 delete mode 100644 package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
 create mode 100644 package/ltp-testsuite/0001-openat2-define-_GNU_SOURCE-and-include-fcntl.h.patch
 create mode 100644 package/ntp/0007-memchr.patch
 create mode 100644 package/waffle/0001-c11-threads-fix-build-on-c23.patch
 create mode 100644 package/wlroots/0002-xcursor.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
