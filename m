Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A3AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:55:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27BBF6108E
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27BBF6108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0A3460820;
	Thu, 14 Oct 2021 21:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O02tZh5PLAgv; Thu, 14 Oct 2021 21:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C7316082E;
	Thu, 14 Oct 2021 21:55:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD36F1BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C20D04033D
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RZOR4IkYn_59 for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:54:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BA1A40328
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:54:58 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b8gjm2mFRumo4b8gjmr1do; Thu, 14 Oct 2021 23:54:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634248497; bh=qIAfWpSqDLboaaletYDEVrxtM69WGQmd5OHECF1siOA=;
 h=From:To:Subject:Date:MIME-Version;
 b=RoqNBZVxYD6V56jFf4R9/yX9ulQuBu8eQf9hAn7f3to/BKp5iDxVaQWnLStjH01Jw
 9gIZYjihuaHq4g290FAngopd7r07gGtbSABmGJ9UL2/Z7UnwJfextoN5uo/wacYRgv
 mVIGzQ9kM38MlgJI/3OW6APJ4agy67D9gT3dkU/il1VxuGA1AlBkUFZc5FqMOUUgMS
 ThKuv4F4+GSnJnViWyN2wsXG0Q9FDLBPCe8eZ37DQouarOXJFN0kdlsT78zKDm1Xgx
 oM+CbH/cn0yQe6kVCFSqfoK8nlcOk/lwNU+sw7vjyeo8P7p+TMHdwVjCEQ15KWfPFa
 wjEIkp0dW5KrQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:54:53 +0200
Message-Id: <20211014215455.2444205-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfP3t6lrIfD4yk9C+2bAHU1yrJDj+J+XAiZ51ywtNqEBjzof6p03+ZGXmK3o0xFlMI2yl7Nawz30qqbZKhekWn28+qn1FP9dV4aedWa1WwxLZ6u2FLV1v
 qmSDqUiTmVhbcj+JwFxdLFinmNzmUeND9QM+2Q0EeJKiEQ8jb/LJnUR85hoVzYaW56O1D/CqFqqNLqdOFn2Tg6/mXn0EJUJaMpcESt64uvIgGYIUVUebXqI8
 6S9GHlfgBJEmrGC8vmCeOKgx9mYiFwYuRjuBHIPMSogIVsLCTLtotBgz+jWTwLgV/Oad+DSRwOyVXiQZqwVuPHre6U1+FYKPN5BYpmvTypI=
Subject: [Buildroot] [PATCH 1/2] package/erlang-jiffy: fix build failure due
 to lack of -fPIC
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Will Newton <will.newton@gmail.com>, Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package erlang-jiffy needs to be linked with -fPIC otherwise it throws
linker error:
```
failed with return code 1 and the following output:
/home/giuliobenetti/br_reproduce/60296a48210e7ffc6bc9fa50ee586441a8957e85/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/9.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /tmp/jiffy.so.FCaOXC.ltrans1.ltrans.o: relocation R_X86_64_PC32 against symbol `dec_destroy' can not be used when making a shared object;
recompile with -fPIC
```

This is architecture indipendent, so let's add -fPIC flag to LDFLAGS in any
case.

Fixes:
http://autobuild.buildroot.net/results/602/60296a48210e7ffc6bc9fa50ee586441a8957e85/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/erlang-jiffy/erlang-jiffy.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index e50a5f598f..dce6a0f8b3 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -11,4 +11,7 @@ ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (tests)
 ERLANG_JIFFY_LICENSE_FILES = LICENSE
 
+# erlang-jiffy needs -fPIC to link succesfully
+ERLANG_JIFFY_REBAR_ENV += LDFLAGS="-fPIC"
+
 $(eval $(rebar-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
