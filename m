Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48E2C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 19:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92F5840D35;
	Sun,  5 Jun 2022 19:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltZBdN7Uemko; Sun,  5 Jun 2022 19:43:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEACB40D24;
	Sun,  5 Jun 2022 19:43:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0991BF388
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BEEE40D24
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rmDqWfImLGx for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 19:43:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB6CF40180
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 19:43:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 4640C240003;
 Sun,  5 Jun 2022 19:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654458187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PxrVzpkqWULA/if0g7czLst2q5+30UVK0sAzWaHJcgw=;
 b=g8ENRySq0+1ephyrv9SMvXhdhFjndTdbVzBEdxn+L2rqOk33KfsNrRS22AM2/yZStnMuLX
 zG1Z99EpMXOtIYcd2qU+W/HDL7wC12HFWBhOPllvbwT6D6HWVuT7qkVer50cPyO6+Zcq8q
 A8jTiJYYbjmXWAgxpmUiPSABh8NzIalOj3X9KQd4zXmyFKxSBZizNc2ZUQ8pldv8445OAi
 N2HYtAEOCtrnCujHU3jMvuLMDRtcZWrJG5qUAHt/0nlCxyF8ZKOtol7XtplS7uehhKURVw
 VSu6DnOmDon+CU/81mj4mPB670lUoQBpwq6oRkJ/GGbilM4T3rdyO2Gy3EnuXA==
To: Buildroot List <buildroot@buildroot.org>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun,  5 Jun 2022 21:42:52 +0200
Message-Id: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/7] Fix a number of toolchain dependency issues
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The starting point for this series is the investigation of several
build failures affecting the master branch.

Most of those failures are due to the fact that we can currently
create configurations for which no C library is available. This
happens on architectures where glibc is the only supported C library,
but BR2_STATIC_LIBS is enabled.

This is taken care of by the first four patches, which are basically
split from a single patch posted by James Hilliard.

Then, another problem is that a recent commit allowed glibc only for
powerpc8 on the ppc64le architecture, leaving a number of other
PowerPC variants selectable with ppc64le, but for which no C library
was available.

Finally, the toolchain-external-booltin package had a similar problem
to the glibc/BR2_STATIC_LIBS issue: the package would be visible even
if BR2_STATIC_LIBS=y and the selected CPU architecture is only
supported by glibc.

Thomas

James Hilliard (4):
  package/uclibc: introduce and use BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS and
    BR2_PACKAGE_UCLIBC_SUPPORTS
  package/glibc: introduce and use BR2_PACKAGE_GLIBC_ARCH_SUPPORTS and
    BR2_PACKAGE_GLIBC_SUPPORTS
  package/musl: introduce and use BR2_PACKAGE_MUSL_ARCH_SUPPORTS and
    BR2_PACKAGE_MUSL_SUPPORTS
  Config.in: only allow BR2_STATIC_LIBS on supported libc/arch

Thomas Petazzoni (3):
  arch/Config.in.powerpc: disable some variants on ppc64le
  support/scripts/gen-bootlin-toolchains: properly take into account
    !BR2_STATIC_LIBS for glibc toolchains
  toolchain/toolchain-external/toolchain-external-bootlin: regenerate
    with correct !BR2_STATIC_LIBS handling

 Config.in                                     |  2 +
 arch/Config.in.powerpc                        | 10 +++++
 package/glibc/Config.in                       | 38 ++++++++++++++++
 package/musl/Config.in                        | 28 ++++++++++++
 package/uclibc/Config.in                      | 28 ++++++++++++
 support/scripts/gen-bootlin-toolchains        |  5 ++-
 toolchain/toolchain-buildroot/Config.in       | 43 ++++---------------
 .../Config.in.options                         | 10 ++---
 8 files changed, 124 insertions(+), 40 deletions(-)

-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
