Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC347C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 08:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83D9281E1B;
	Sun,  3 Mar 2024 08:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKEVxnTWFOhf; Sun,  3 Mar 2024 08:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93FDA81E59
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93FDA81E59;
	Sun,  3 Mar 2024 08:40:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 580F91BF38B
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4584A60667
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mP750T-YgUoF for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 08:40:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F06660631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F06660631
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F06660631
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 08:40:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id D06E81BF204;
 Sun,  3 Mar 2024 08:40:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 09:40:08 +0100
Message-ID: <20240303084014.156991-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709455218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ugd6UyL+Kb+KuBgB+A+Dh1GvkS5KJ4njgwmgcrPavM0=;
 b=O8MPgh745tkWASmAsz3FhLwEC0NfE1mz5vMDR3wfUsbKQt6OWleeCgBgstPwgIwGcW1wA7
 q01lnBMKd6DUCD8jMWEqlg4Bk5l17TtEYqOszp7JmBZDQuDTPjQQGDajJfN4lHOpwXIiGa
 +V1YdeQyKtX7Igi/uCmK64+UXuZwVEh/mLajLAvC06PaT4VMCL/B3E5IeDU9vWONRe7vLV
 /wdUzMYLuEWKJLgqLIfWo32oWGLutgrnmNWfn5Dv5acW+w6Q1yWlz9J3UAcmAycxjLLaqH
 ztx4AsspxtCztTtCmHc560P/eRPghk56ttIKO/xoDFnH/kR1xg0d9UEDj13vpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O8MPgh74
Subject: [Buildroot] [PATCH next 0/4] Upgrade to Binutils 2.42
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

This series of patches update binutils to version 2.42, doing the
usual dance:

 1. Add 2.42
 2. Make 2.41 the default
 3. Drop 2.39

An fourth patch is added to drop some code that is no longer needed
now that binutils 2.39 is gone.

Thomas

Thomas Petazzoni (4):
  package/binutils: add support for 2.42
  package/binutils: make 2.41 the default version
  package/binutils: drop support for binutils 2.39
  package/binutils: drop BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME

 .checkpackageignore                           |   3 -
 Config.in.legacy                              |   6 +
 ...or1k-fix-building-with-gcc-version-5.patch |  50 ------
 .../{2.39 => 2.42}/0001-sh-conf.patch         |  14 +-
 .../0002-poison-system-directories.patch      | 167 ++++++++++--------
 package/binutils/Config.in.host               |  14 +-
 package/binutils/binutils.hash                |   1 -
 package/binutils/binutils.mk                  |  10 +-
 package/elf2flt/elf2flt.mk                    |   2 +-
 9 files changed, 111 insertions(+), 156 deletions(-)
 delete mode 100644 package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
 rename package/binutils/{2.39 => 2.42}/0001-sh-conf.patch (82%)
 rename package/binutils/{2.39 => 2.42}/0002-poison-system-directories.patch (79%)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
