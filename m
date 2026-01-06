Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33B4D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C886780CD5;
	Wed,  7 Jan 2026 17:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80TTwyBi5l5T; Wed,  7 Jan 2026 17:47:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D241A81B14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808057;
	bh=yDvvUJBcFAvsXvrERoL/sMEgCR4U022BBf5u/SCFvR4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W+Xb1EEpmcfXAVhi5UcxpD8+t+YxJ6RZHxCz6BcHFoguZORih0BMwnSFqXo1yJYY+
	 IrZ4nGhC52KAFnQABXq1iVabc73TAuvx06rDMAQo9fEVvtshMxTZjAD/MRzP3+d/ON
	 M3VerhauRi1doUkNSr/k93oM67EhjXKEUNPecJBuDfIbGElkOkni66LH4r1pFglRzx
	 wdflbIXmvDhnDMvsp0UOm6n8BMIdycjX6n2CFxhyyRLoI5682su7LDItK03TUXoC7A
	 xdKqG3vXmurEs6eWeUTiDYiXrYQK9cIRkPEKaAkL/CunyQSciSuOKXpxXzr6V1XJyY
	 CV76/bMcJbY9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D241A81B14;
	Wed,  7 Jan 2026 17:47:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA69D9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABF6060B67
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQz-ZjlPrWfB for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 465E66085F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 465E66085F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4600486FC2; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:03 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 008b47bd6b214be278b569743788a7ecea232175
X-Git-Newrev: a9ae8f020d35c9eb6fe8cdd66fcb4381cde029db
X-Patchwork-Hint: ignore
Message-Id: <20260107174642.4600486FC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xvkbd: fix build
 with gcc >= 14.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a9ae8f020d35c9eb6fe8cdd66fcb4381cde029db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes:

  https://autobuild.buildroot.net/results/86f2ba051e864375bda620dd92e01cb7b8532ac3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 62db5ae5675a512812f8b183cb9a0216e688a621)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xvkbd/0001-gcc-14.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/xvkbd/0001-gcc-14.patch b/package/xvkbd/0001-gcc-14.patch
new file mode 100644
index 0000000000..6ecce1327e
--- /dev/null
+++ b/package/xvkbd/0001-gcc-14.patch
@@ -0,0 +1,19 @@
+Fix build with gcc-14
+
+Upstream: https://sources.debian.org/src/xvkbd/4.1-3/debian/patches/gcc-14
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xvkbd.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/xvkbd.c
++++ b/xvkbd.c
+@@ -15,6 +15,7 @@
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+  * See the GNU General Public License for more details.
+  */
++#define _CONST_X_STRING
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
