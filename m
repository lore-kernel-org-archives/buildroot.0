Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E6DE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 13:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D23AD600B6;
	Sun, 28 Dec 2025 13:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAFifcYVDdNt; Sun, 28 Dec 2025 13:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C27576075E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766929543;
	bh=B1FPAd7f0Wuu9cABEwWwKb93LpdqXdQn2jQWsPK/LwM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CxEuj7a8xwzp2BdpQ3BN8vYnpDMx91aabAfGt5lsvW9YzuPUbgxM9HR1qCePDQ9s9
	 zdo7Q1wCbInLe77GEr6UN3+INI7tZ8L6Dbfsah7HIstnx+hFb3owQTlImnVT20P9Hd
	 sfF3gJJBed5hgORAUK4rWgmeq/E37ZfFBHx6yQbmabQTMkaG+jrWx55IhAeuI65i6/
	 S2TYpRSfHUrDqjndhYk7YW8RQvpeM/YZC8QL/UQn+7zDUeqyrRMHlVSMoOVPh4t2Bf
	 oGAYHwoMdlyvM34kLBNKCBPEpGn1m3bOiUJlGpJvLjIln5dH8If4bje6hgkMF+bs/+
	 j3Dkxw2eya5JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C27576075E;
	Sun, 28 Dec 2025 13:45:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FF2FD8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F361181274
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHc5gbkZfIDD for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 13:45:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D6E5811B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D6E5811B5
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:45:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D788878FB; Sun, 28 Dec 2025 13:45:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 14:45:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adc2d87190e264b9c55474f56994bf36db92e191
X-Git-Newrev: 62db5ae5675a512812f8b183cb9a0216e688a621
X-Patchwork-Hint: ignore
Message-Id: <20251228134542.3D788878FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xvkbd: fix build with gcc >= 14.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=62db5ae5675a512812f8b183cb9a0216e688a621
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://autobuild.buildroot.net/results/86f2ba051e864375bda620dd92e01cb7b8532ac3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
