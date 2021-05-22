Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882A3C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:21:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4845260C3F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4845260C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24FCC60868;
	Tue,  3 Aug 2021 21:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ei11YensPtTs; Tue,  3 Aug 2021 21:21:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 805856061A;
	Tue,  3 Aug 2021 21:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 141CC1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3273835C9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iFSUXlozBBQk for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4746D8350A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 91D0185F62; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 May 2021 18:56:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e326fcff64bfb5df5409440bcde7954c4e734c34
X-Git-Newrev: 8d8f456d59ca5b1e70e37f899743b8d41514cb40
X-Patchwork-Hint: ignore
Message-Id: <20210803210943.91D0185F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/llvm: include limits
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8d8f456d59ca5b1e70e37f899743b8d41514cb40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure:

In file included from /data/buildroot-autobuilder/instance-0/output-1/build/host-llvm-9.0.1/utils/benchmark/src/benchmark_register.cc:15:
/data/buildroot-autobuilder/instance-0/output-1/build/host-llvm-9.0.1/utils/benchmark/src/benchmark_register.h: In function 'void AddRange(std::vector<T>*, T, T, int)':
/data/buildroot-autobuilder/instance-0/output-1/build/host-llvm-9.0.1/utils/benchmark/src/benchmark_register.h:17:30: error: 'numeric_limits' is not a member of 'std'
   17 |   static const T kmax = std::numeric_limits<T>::max();
      |                              ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/68581aad7c622a1fc74bb5556799e3c681425b2a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/llvm/0001-nfc-Fix-missing-include.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/llvm/0001-nfc-Fix-missing-include.patch b/package/llvm/0001-nfc-Fix-missing-include.patch
new file mode 100644
index 0000000000..62111ca138
--- /dev/null
+++ b/package/llvm/0001-nfc-Fix-missing-include.patch
@@ -0,0 +1,24 @@
+From b498303066a63a203d24f739b2d2e0e56dca70d1 Mon Sep 17 00:00:00 2001
+From: serge-sans-paille <sguelton@redhat.com>
+Date: Tue, 10 Nov 2020 14:55:25 +0100
+Subject: [PATCH] [nfc] Fix missing include
+
+[Retrieved (and backported) from:
+https://github.com/llvm/llvm-project/commit/b498303066a63a203d24f739b2d2e0e56dca70d1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ llvm/utils/benchmark/src/benchmark_register.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/benchmark/src/benchmark_register.h b/utils/benchmark/src/benchmark_register.h
+index 0705e219f2fa2..4caa5ad4da079 100644
+--- a/utils/benchmark/src/benchmark_register.h
++++ b/utils/benchmark/src/benchmark_register.h
+@@ -1,6 +1,7 @@
+ #ifndef BENCHMARK_REGISTER_H
+ #define BENCHMARK_REGISTER_H
+ 
++#include <limits>
+ #include <vector>
+ 
+ #include "check.h"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
