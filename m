Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D79AC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 03:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 927536FC4C;
	Fri,  7 Jan 2022 03:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAZpiVgPyQFY; Fri,  7 Jan 2022 03:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD2C26FC46;
	Fri,  7 Jan 2022 03:30:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF9BB1BF2AA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 03:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7F83833C7
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 03:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=sigma-star.at
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZn2NCRxpGJX for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 03:30:44 +0000 (UTC)
X-Greylist: delayed 00:05:23 by SQLgrey-1.8.0
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D1FB833C6
 for <buildroot@busybox.net>; Fri,  7 Jan 2022 03:30:44 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4JVTB70nC9z4wyY8
 for <buildroot@busybox.net>; Fri,  7 Jan 2022 03:25:18 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at
 header.b="nun/+Hr5"
Date: Fri, 07 Jan 2022 03:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-star.at;
 s=protonmail; t=1641525906;
 bh=Qy0eZiC9ju+6/DrEto3g5TXN27KUKHcJkM1Wm1L/UjA=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=nun/+Hr5i5PeLKnyyyasCq332My5Vt5002v8aZvG62xh7deM6TcMEjNF6irpQv7fp
 h/dlvy9Ly2ZkmDaHJZ9XwnTCv2yv+1A5IRSBXgRCY1xlVy+QFwyH/Wxw9FyDN+ySAu
 9Vah1Ry7Gj6c3sPm6D+G3Rflz2oLWvz7E59CyKIjDvSS1cxYk7tT/8S0yxL7sa/Ujs
 Th3SHZpeqJ3kQ3bB53r/2vYgaek1D0Qu4Z8+NFyEVs7TfYR38+diQ9fzjqLBhJdhby
 ZlC69z2kGnzQ7UgKzkVofTCI86wzrzQ49aeXI+K0Pf4eyFfscRMaYFO6pTNSPuKw6r
 cXwSLSGz2p3Lw==
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 "Robbat (Gentoo)" <robbat2@gentoo.org>, embedded@gentoo.org,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Pascal Bellard (SliTaz)" <pascal.bellard@slitaz.org>,
 =?utf-8?Q?Llu=C3=ADs_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <c31dba4f-42a8-ba48-7df2-b56bf4699a4c@sigma-star.at>
MIME-Version: 1.0
Subject: [Buildroot] [ANNOUNCE] mtd-utils-2.1.4 is released
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
Reply-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

mtd-utils-2.1.4 is released.

Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.4.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.4.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v2.1.4

Alternatively also mirrored here:

Tarball:               https://infraroot.at/pub/mtd/mtd-utils-2.1.4.tar.bz2
Tarball gpg signature: https://infraroot.at/pub/mtd/mtd-utils-2.1.4.tar.bz2.asc
Signed git tag:        https://git.infraroot.at/mtd-utils.git v2.1.4


Roughly half a year after the last release, this is a smaller, patch level
release that primarily consists of a hand full of fixes that have accumulated
since then.

This includes some fixes regarding the user space ports of mtd-tests using the
wrong page size, and most recently a fix regarding a missing jffs2 kernel header
in the last release tarball, causing build failures on some systems.


Changes from 2.1.3 to 2.1.4:

Features:
      - ubiscan debugging and statistics utility

Fixes:
      - Some mtd-tests erroneously using sub-pages instead of the full page size
      - Buffer overrun in fectest
      - Missing jffs2 kernel header in the last release, leading to build
        failures on some systems.


Raw short log since the 2.1.3 release:

David Oberhollenzer (2):
       Fix: add missing new-line-escape in jffsX-utils Makemodule.am

Diego Ismirlian (1):
       Add ubiscan utility

Miquel Raynal (1):
       mtd-tests: Read and write pages during speed tests

Ralph Siemsen (2):
       mtd-tests: use pages during readtest and stress
       fectest.c: fix buffer overrun


Regards,

David

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
