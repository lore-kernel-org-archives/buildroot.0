Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B34CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:12:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D95060FC1
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D95060FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5140340461;
	Mon, 20 Sep 2021 19:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03FI7B78d_5B; Mon, 20 Sep 2021 19:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B606740389;
	Mon, 20 Sep 2021 19:12:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A9881BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A13140389
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxTtZbKSBv8B for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:12:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8860E40378
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:12:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SOiGmPkHQnyXHSOiGmYPPY; Mon, 20 Sep 2021 21:12:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632165144; bh=afOrwxzTWl6EXPMq6yH/v/aeB8GzZnmjKEukyZJmh1I=;
 h=From:To:Subject:Date:MIME-Version;
 b=j3Z9iQDuSjO3dfBPkW+XsA23CSgar3jZadrzxdbLXipYAolDTleFXz/e95OPTjB3d
 8ExUXVNb8ESEXDGwlSrAwcftDLDObF7YmClvl3ACBE24eX8czXKWHKuBNuaWGehMMv
 rqADCZcomtcmF7XPL1MJdFxwZ6hyLB6Ty5ISH77HRD7m8FdGFHdtJwdp0nKHWdm+DD
 sstlxPKWT8USyzTd3pk3y88DWgEIljUQMvKgcAl/0QWo8RQGbhY+K8S+m3j/tNtKi2
 xNUmw9QQ5JGD/JoZ9nfpqH0wfFrRFBTe6WzUSOUcYzbKdPTMMHsPoFn9yyag8XdwAU
 POnMKVOdB52Ng==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 21:12:23 +0200
Message-Id: <20210920191223.760496-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920084105.4b8fea91@windsurf>
References: <20210920084105.4b8fea91@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBLXtlvqbHxMlTHy5LSioo4GchnhYBu5DbZUGpwPMTia5MPEmVSt5h/gklhFQ4P6I+sl2qIdpc1R5irkCvH/TrKNmNRaofMPItsRujG2DKEovMSfQ8jA
 XhINOSFlA04+OK//vkIse4YNlI5g4UhKB+UOuFUBICOyLlkC6gVOoBL7NItJ2ZyMaLt1SOV75ogqM+z06Bpst5kgLzLC3d2jj+T1hnRv18HvEiVrqzDCFC4B
 rLDPVCHoMj49SaulYbrVKWJc/IhVHPG528JJLuk0kLC/jBy/PXI2/rBbmO9Ym0mvpm3vbzHEWGy0wzTcFBQdIOrMFMFUw8cxmHteY5zrxhs=
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 3.0.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This major version introduces 16 new APIs[1] and remove 20 of them
considered unstable[2]. All packages that depends on harfbuzz build
correctly with this new version because they don't use the "old unstable"
APIs.

[1]: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS#L11-L27
[2]: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS#L29-L49

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index c00195cba6..97fc5a2c5f 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0edcc980f526a338452180e701d6aba6323aef457b6686976a7d17ccbddc51cf  harfbuzz-2.9.1.tar.xz
+sha256  036b0ee118451539783ec7864148bb4106be42a2eb964df4e83e6703ec46f3d9  harfbuzz-3.0.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 70c1e1f7e6..4534d166ef 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.9.1
+HARFBUZZ_VERSION = 3.0.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
