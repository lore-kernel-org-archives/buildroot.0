Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EA3C87FD2
	for <buildroot@archiver.kernel.org>; Sat,  2 Aug 2025 11:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFFD5607AB;
	Sat,  2 Aug 2025 11:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CnCLT8Le6fS; Sat,  2 Aug 2025 11:37:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05BF5607A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05BF5607A5;
	Sat,  2 Aug 2025 11:37:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DCDCF13D
 for <buildroot@buildroot.org>; Sat,  2 Aug 2025 11:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE9E740F09
 for <buildroot@buildroot.org>; Sat,  2 Aug 2025 11:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WgCKhF8Z0KU for <buildroot@buildroot.org>;
 Sat,  2 Aug 2025 11:37:36 +0000 (UTC)
X-Greylist: delayed 92290 seconds by postgrey-1.37 at util1-new.osuosl.org;
 Sat, 02 Aug 2025 11:37:35 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4BF9640F04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BF9640F04
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BF9640F04
 for <buildroot@buildroot.org>; Sat,  2 Aug 2025 11:37:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 372514400A;
 Sat,  2 Aug 2025 11:37:30 +0000 (UTC)
Date: Sat, 02 Aug 2025 13:37:26 +0200
MIME-Version: 1.0
Message-Id: <20250802-fix_ngrep-v1-1-03dbe4c6b0ce@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHX4jWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwMj3bTMivi89KLUAl1Ty8Qkc9OkNFNLQ0sloPqColSgJNis6NjaWgD
 74w6pWwAAAA==
X-Change-ID: 20250802-fix_ngrep-59ab75bf5919
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Wade Berrier <wberrier@gmail.com>, Florian Weimer <fweimer@redhat.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdeigeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsuceuohhnnhgvfhhilhhlvgcuoehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevieekieevtdfgveffvdetleeijeduteeiveeutdeuhfffuedttdetfedvuddvleenucffohhmrghinhepsghuihhlughrohhothdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedvrgdtvdemkeeggedtmeehvddurgemugdurgemheeflegvmedvrgekmeeltdgvieemsgefjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgeegtdemhedvudgrmeguudgrmeehfeelvgemvdgrkeemledtvgeimegsfeejledphhgvlhhopegludelvddrudeikedrvdegiedruddvfegnpdhmrghilhhfrhhomhepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopeifsggvrhhrihgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihess
 ghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepfhifvghimhgvrhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754134650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HLpW1miTgfbhFfaMaaXiSWshvAPX9dYEXFSn6B5pnLo=;
 b=mS+XX7ZY57t4Q0aRb5rAuPnursbbdaOlBvdKIjqxWOElT/YJWmE28YGZsQNC39gPt8S+2I
 pZaBzMsKSPaORkVFj3HoXFt6r7RrNiRPZrwnpc/30KD2O+0AJSJ8W0VyT8SSPrbIOa05h6
 FrxubodWIpy3Jw5NuzdrngUEtNevcDM6npY6J3amVxxSVyQfXr+Frof+IlgScAHzGoxlhj
 LavUhlx5O9pRmbBPeCsX7qsEO0CyYdOPZDKkaOwhFyESNgzwvvTJEfl7gqy032FdjMwDAA
 syfjV9bkSwOZjU9j60glYxUn6dxHfkHChIHCY6hX42QrgYFx8Am8fSJ7pyxw9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mS+XX7ZY
Subject: [Buildroot] [PATCH] package/ngrep: fix implicit function declaration
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: https://autobuild.buildroot.org/results/20b/20b924c5c96b3f43e381d87e59fb160ba8d3dcd0//

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
This patch can be backported to 2025.02.x as this issue is reproducible
on the current version of the LTS.
---
 ....h-and-tcpkill.h-to-avoid-implicit-functi.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/ngrep/0006-Include-err.h-and-tcpkill.h-to-avoid-implicit-functi.patch b/package/ngrep/0006-Include-err.h-and-tcpkill.h-to-avoid-implicit-functi.patch
new file mode 100644
index 0000000000000000000000000000000000000000..6d596bfe3791a33994179494e8c08ec7a9439975
--- /dev/null
+++ b/package/ngrep/0006-Include-err.h-and-tcpkill.h-to-avoid-implicit-functi.patch
@@ -0,0 +1,44 @@
+From 52515bae377f221b5473d9040f5f43ab1c672672 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 19 Dec 2022 11:49:06 +0100
+Subject: [PATCH] Include <err.h> and "tcpkill.h" to avoid implicit function
+ declarations
+
+Implicit function declarations are a historic language feature that
+were removed from C in 1999.
+
+Upstream: https://github.com/jpr5/ngrep/pull/28
+
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ ngrep.c   | 1 +
+ tcpkill.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/ngrep.c b/ngrep.c
+index 3df9389..b2fcceb 100644
+--- a/ngrep.c
++++ b/ngrep.c
+@@ -98,6 +98,7 @@
+ #endif
+ 
+ #include "ngrep.h"
++#include "tcpkill.h"
+ 
+ 
+ /*
+diff --git a/tcpkill.c b/tcpkill.c
+index 5388ec5..ac8fd2e 100644
+--- a/tcpkill.c
++++ b/tcpkill.c
+@@ -14,6 +14,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <string.h>
++#include <err.h>
+ #include <libnet.h>
+ #include <pcap.h>
+ 
+-- 
+2.50.1
+

---
base-commit: f5101638b9f917dc4c569828ff3fee0c486ba8f8
change-id: 20250802-fix_ngrep-59ab75bf5919

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
