Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0B8F47CD8
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 21:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A76182D96;
	Thu,  5 Mar 2026 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nB9RPwSlb8_e; Thu,  5 Mar 2026 21:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C820582D2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772744995;
	bh=jvRNIoIQ1KXdnlhGqKrYY2KbqIGnA5h96OCGu5RIgZA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qIhrKKpK/JNiEVUFPdOh1I4tVjTUjZ7iBDYX9mLwYfx8UKliBX9lcLaYInNNe9FTT
	 mrFP4ZN4Cj1QZdWYfkxKfgQgYJ3vymYujS2U6dQRObwitY/MsPXuHNH8f7Yz0jb4IR
	 aEIOJV3xSX0DQY6F4bxtc1MEZQDMjuGhZsd/VUpfMWj48KVN9PhoXgFUFdL95tM6qh
	 5vZ8XgVtP9LgkiDU9IUUtzw616YT2rMqjgimZkwympqbGu//NO+4UQPkWH9/2ttjWW
	 qH3ECs28/ib5iWrpkgKL4ZtpHwc9FvRFDUrbc7lzjhe/4ZPtFBNqfdO6YtYcfQatkY
	 6HPMsWx70VxYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C820582D2F;
	Thu,  5 Mar 2026 21:09:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EB9525B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5088240C34
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VPAtUB60Qik for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 21:09:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 530FD40C22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 530FD40C22
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 530FD40C22
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:09:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AEB74A4C346B;
 Thu,  5 Mar 2026 22:09:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47648)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyFx8-000000003FD-18jG;
 Thu, 05 Mar 2026 21:09:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Mar 2026 22:09:35 +0100
Message-ID: <20260305210950.3471974-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772744990;
 bh=vHuvHFAmexemngW/1unaPU0SIo3Tdj3eRsvv8ADj3Fk=;
 h=From:To:Cc:Subject:Date:From;
 b=FqWhhvQjQfOVGIjq+L1KhmBizTyDN+flUzZAMow2Bn4RTbr1r8BugxSS38L4x2mi2
 EJcnWek0S8t5AfTqcUeb8fY+z5USteEncdJAm6cYcVNnPMJWI4PlQa/A5uJU6bdWMW
 gjENhwOGlH8JDqkRgP36FZAPwDJggrDNqHxh9iekjUCUy4PXYd27+BWopYwXyaf0uw
 Pknl1kb9gt7HbTAQwOEiICPfoEXkZ/tBbgjBO75UJb4plKAbMiePMJEFgDer1yKcAv
 tMWi06mPReaXRhK4zqlVimQhutZyP+JY/8JhNUEyrj52zonrCYHPzz1w1x8LNQEFh+
 IAX1vsgzoLpjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=FqWhhvQj
Subject: [Buildroot] [PATCH v2 00/14] package/{glibc,
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

Hi,

this series bumps glibc to 2.43:
https://sourceware.org/glibc/wiki/Release/2.43

This series was tested with an allyesconfig on BR2_x86_64 with gcc
13/14/15 and includes fixes only for build errors introduced by the
glibc bump.

To test add one patch from patchworks:
https://patchwork.ozlabs.org/project/buildroot/patch/20260203224414.192218-2-petr.vorel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/
package/ltp-testsuite: bump version to 20260130

Regards, Bernd

v2: rebased for master branch after -next commit

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
