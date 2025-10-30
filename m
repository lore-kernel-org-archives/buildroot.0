Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC2BCCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 20:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D78C84344;
	Thu, 30 Oct 2025 20:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftRF2ZSN723O; Thu, 30 Oct 2025 20:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E08584347
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E08584347;
	Thu, 30 Oct 2025 20:26:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DCE32A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 20:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A71061530
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 20:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7f3v0gJyH9o for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 20:26:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B109E6152D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B109E6152D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B109E6152D
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 20:26:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cb2.dip0.t-ipconnect.de [91.58.12.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C4BA3A4C5A98
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:26:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37826)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vEZEM-000000007vc-2u5l
 for buildroot@buildroot.org; Thu, 30 Oct 2025 20:26:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:26:42 +0100
Message-ID: <20251030202646.1825077-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761856006;
 bh=ZUxBss4r9HpyZScA5WubLy2P/fbzzOGaBlZvl0EmyQM=;
 h=From:To:Subject:Date:From;
 b=xsb14U7Twu05szjPOpACaN+XnWXuo/PYQZna+5vX4gI6MYYnM6OSW+qZlbdao7n4N
 QbBa0esY2Y+/XGOuASuIyzZRQefgzcfitoHeOJDIzrjr/4dzsfJbJ9xsDrGcQijIMz
 wxgyosjvK6AeyeSjNJWNlFo+jlMR0QlrwmCcfKJT3SWb3VFJWFlQUeAFU0/kLoyMam
 1tgvSAFdQPLQXPbcDVPwv04JQWqp3F2G/JIaup3qsXzShS1xG78Gk1b/106+PKVO1U
 kICYjlJMn53rFZz9aMkRQWwWjHW1t4CW7Vx85ncgBsHRmov5PVMHC/CL06br7vHB+Z
 IIAyEOMgmBZ5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=xsb14U7T
Subject: [Buildroot] [PATCH 0/4] Remove packages
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

these are accumulated patches to remove unmaintained packages in the
format of a patch series to avoid conflicts in Config.in.legacy.

Regards, Bernd

Bernd Kuhls (4):
  package/ramspeed: remove package
  package/expect: remove package
  package/mongrel2: remove package
  package/procrank_linux: remove package

 .checkpackageignore                           |   4 -
 Config.in.legacy                              |  25 ++++
 DEVELOPERS                                    |   3 -
 package/Config.in                             |   4 -
 .../0001-enable-cross-compilation.patch       | 120 ------------------
 .../0002-allow-tcl-build-directory.patch      |  34 -----
 package/expect/Config.in                      |   7 -
 package/expect/expect.hash                    |   4 -
 package/expect/expect.mk                      |  21 ---
 package/mongrel2/0001-Do-not-run-tests.patch  |  45 -------
 ...-Fix-Makefiles-for-cross-compilation.patch |  78 ------------
 .../0003-fix-build-with-gcc-4.8.patch         |  62 ---------
 package/mongrel2/Config.in                    |  33 -----
 package/mongrel2/mongrel2.hash                |   6 -
 package/mongrel2/mongrel2.mk                  |  26 ----
 package/procrank_linux/Config.in              |   7 -
 package/procrank_linux/procrank_linux.hash    |   3 -
 package/procrank_linux/procrank_linux.mk      |  22 ----
 package/ramspeed/Config.in                    |  11 --
 package/ramspeed/Makefile                     |  14 --
 package/ramspeed/ramspeed.hash                |   3 -
 package/ramspeed/ramspeed.mk                  |  22 ----
 22 files changed, 25 insertions(+), 529 deletions(-)
 delete mode 100644 package/expect/0001-enable-cross-compilation.patch
 delete mode 100644 package/expect/0002-allow-tcl-build-directory.patch
 delete mode 100644 package/expect/Config.in
 delete mode 100644 package/expect/expect.hash
 delete mode 100644 package/expect/expect.mk
 delete mode 100644 package/mongrel2/0001-Do-not-run-tests.patch
 delete mode 100644 package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
 delete mode 100644 package/mongrel2/0003-fix-build-with-gcc-4.8.patch
 delete mode 100644 package/mongrel2/Config.in
 delete mode 100644 package/mongrel2/mongrel2.hash
 delete mode 100644 package/mongrel2/mongrel2.mk
 delete mode 100644 package/procrank_linux/Config.in
 delete mode 100644 package/procrank_linux/procrank_linux.hash
 delete mode 100644 package/procrank_linux/procrank_linux.mk
 delete mode 100644 package/ramspeed/Config.in
 delete mode 100644 package/ramspeed/Makefile
 delete mode 100644 package/ramspeed/ramspeed.hash
 delete mode 100644 package/ramspeed/ramspeed.mk

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
