Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0FCCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D7B0605F1;
	Sat,  3 Oct 2026 16:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4Jg-ANUVzwv; Sat,  3 Oct 2026 16:16:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8F3946068A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791044213;
	b=Xdjoi8wnYjVj3X/khZdjpz4BJ9baAibgr5J4rNNwCWdQszXJXp0rdnmgh6VaUD2qXroB
	 xMpzChHYnPuEuZWX/niZ9oRlEEcDvWOD9E4i3H5Tg78LFAV6NED4f7RU1roQejD47SgUV
	 s+3BDGh+YBL0CgSMFS2agyrmo6pC95D6UxO8s8ntNL4dff27Z7Iudb+z1p4qpIkAz8gW7
	 jopXHO+ectmyCyf8RGlXVYrcrBmnKt5ZWjvRKb8wHjyGpF8/l3O5g3LstDbTeNtGxlDSC
	 kV4lkA8mKPz2bcCyyVJjvuTmvpUtt5QTt6w9Is2sEU159DqyO0yg24C5rCE/rT72QrA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791044213;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lY2RglTwVyONNqOhs4aoSvUq/fZw9wd7nDhdM5mNL60=;
	b=B3IJgDRzUZG2vq6dTJb9su9nzEyCGFhccVqENu+2Mr1tUfcvhGoIdaDaanaNQDWt9eaN
	 weXCv5PmGmFM5o/jHifBxtiNkafFsP4CYchGS0W+rAzW/eg7t2CniB2lvy9Q8u+BI/FEd
	 yT03NdW47Dz3hcBrvEyDCzPSuqIvTG2TWOz1oUZt/JfCCN3pDP+tEAaJbBTUl6lnC30aC
	 uL6sagzHr+HXq6llLzvE1d8vZqHbfDPagQijaeUJGx1OWclfi3rvsAcr1dJ5CYLHoxJzb
	 EH746ZWgEQYOzj+h1+Igp1tTLwDqH7BtyZOVIDNr/2sUdpR5+495kyXIaxFo4L6Ltcw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791044213;
	bh=lY2RglTwVyONNqOhs4aoSvUq/fZw9wd7nDhdM5mNL60=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SBwIK6Skt1MtuRmg4CCTTCRoh7J2U7qXq2FPhGRgqXk4bQLT9mIKaTVd1jDQfCefQ
	 K/Mgvif48nU1Bq8n3dhiSPyRgqftjHcVXkFTYPRnfIMbdmjRoiYouHW74uAWZsNWyo
	 mmTWOcMB5UcQ9w6b1S41o2GHYGVQ07Yku3930fIRYTqclepp7i5b0IwC2cP4j2Swsd
	 4jpBUXLPA9M8JS0Vkzg5B1neFj+g4cNStciVIXxKSr/IlqwPmt5qY/N3RdvGS3DITC
	 zzGxYjibP9qbjDJEIPAc+ZPhLmqRVgC3iOGbzzv86F0E8u8ZS6J+ZHqXdyNZwEUSB9
	 16f6+lnFnuEFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F3946068A;
	Sat,  3 Oct 2026 16:16:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D065A335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDD1C605F1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mexux2UXeXtj for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:16:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 29AB46068A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791044211;
 b=f2O8q2PTqEQeMNLXvNbTEwonIdeQ7NPs+ILmeAW7boRnICGYc0xQCQTTRgINcum50lXE
 czbJEQLIlvC5oye4nXZE7mMLZv6l4z0PhSlkqtuBVHw+284iEE+r6DEgH5K+uUt5L/8Rv
 H/mAdtRwEKrjqhrK6jQM2sIRqaBdPkOqdy9di0K14UiTpktITxrE/oCfl4m9p2/AhuxE4
 iLeIBFbkmFyubxO9rTL7c4q7ONG1UujDpWE6f8yKqLdEUYxQURIP+EXWsWsO/mdOJ9vQO
 5Z1K0xLU4R9C2Tip27RrhsmYXorLsnwA/Sib/Gk+Rw0FoqePRX8/6VJBc09DFAN/nFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791044211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cMtQ+JoqBMeu65o8sIS5NK32MHDEg1QeiSxR1EmaV08=;
 b=A/Qi/hYvvE4duPG/cPKK+P8n+LrPlBmgbRvHW7tDRNK/VI9Vs3jrh4vD5V0ORIOxDkYy
 amxiVHLc9d4STOYXNks7Q1M+DjUknd0kBh6vgFPSnOKHvITgCeKwbjxS9ZN7tgorFH3Ma
 N0q5ek21FrILlMsmSNzZ+/MTEVqUwjKvulsia8ffvKVzVo1cgJG8gcIGiDHaGXCvbcf4P
 8Ss4ykPc28X+gzLjsCdpQ4EvtG0NRDbRvxucg2dXIYDy0CuzIphIcVqdJ8mqAngKP2ry5
 sbXmW1Am9AJHx4eRAe8OOKlyW2h5t3YdS6ZYhOsez0xQxvRxBOpeRvVJQmRF++rWz2w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29AB46068A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:16:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 657398908D; Sat,  3 Oct 2026 16:15:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 18:16:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 510003c0411a915d71709417e53d2bd62be9f999
X-Git-Newrev: 7ed738bf5d3cb7a3184a2c4e4ac61258fbe6d012
X-Patchwork-Hint: ignore
Message-Id: <20261003161536.657398908D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnu-efi: fix license information
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7ed738bf5d3cb7a3184a2c4e4ac61258fbe6d012
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Split the confusing "and/or" for gnulib, so dual-licensed and GPL-only
parts are clearly noted, and add the missing LGPL license. Lines in
GNU_EFI_LICENSE are ordered the same way as the information is given
in the LICENSE file.

The license situation of inc/subst/elf.h is curious: The file itself
is licensed under LGPL-2.1-or-later, and used in gnu-efi under
LGPL-3.0-or-later (accompanied by the appropriate license files),
which in turn allows using it for object code under different terms
with certain conditions (see section 3 of LGPL 3.0, as noted in the
gnu-efi LICENSE file).

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnu-efi/gnu-efi.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index f615df91bc..f979b65c31 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -9,8 +9,10 @@ GNU_EFI_SITE = $(call github,ncroxon,gnu-efi,$(GNU_EFI_VERSION))
 GNU_EFI_INSTALL_STAGING = YES
 
 GNU_EFI_LICENSE = \
-	BSD-3-Clause and/or GPL-2.0+ (gnuefi), \
+	BSD-3-Clause or GPL-2.0+ (gnuefi), \
 	BSD-3-Clause (efilib), \
+	LGPL-3.0-or-later (inc/subst/elf.h), \
+	GPL-2.0+ (tests, some IDE & CI files), \
 	BSD-2-Clause-Patent (EDK2 routines)
 GNU_EFI_LICENSE_FILES = \
 	LICENSE \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
