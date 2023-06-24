Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6211EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 15:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1DC0611BD;
	Sat, 24 Jun 2023 15:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1DC0611BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQNRtB29jl7Y; Sat, 24 Jun 2023 15:21:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1952A611CE;
	Sat, 24 Jun 2023 15:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1952A611CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF5651BF420
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 15:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88044611CE
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 15:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88044611CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vfHkEAhV8eJS for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 15:21:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B85D611BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B85D611BC
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 15:21:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75EF3A4C0780
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 17:21:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55244)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qD54i-0000Hx-0U
 for buildroot@buildroot.org; Sat, 24 Jun 2023 17:21:20 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 17:21:20 +0200
Message-Id: <20230624152120.2879074-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230624152120.2879074-1-bernd@kuhls.net>
References: <20230624152120.2879074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687620080;
 bh=xufJU7eEucO26TE5vMRHhTxMaC6IFUd0KPExTYZVLNg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=izPDGtiBEBJYgO039D6loUQOekcyIX7dm18+bc9Y/ldoNfbnlypxUsOcfb/e2Q8xn
 6SN2Q1Yp9NuM6DR7dL4rVQ6r85bR6j9xojBQF0VjmAlHFbbEX287z1kTr18Kc3UHDP
 xJGMl1b/rke9wf/wq0binyKF3ksc6KmTWo0ykzK7JbRzj5wfAAScApbaXEh1z+ZQUJ
 RtBstgT3T8XjQrhPYL0RJ6b28KHitI3bk/u71szs6YgJd7OLndMdNHOX+1XDWwBzLk
 Hu/j6XOKWnoadbNX++uKXQNQvQfZSka62Naj5a/RVmbJWCKZVqd5X/2dcEdJt2jfYJ
 gmPQLfGGbuxAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=izPDGtiB
Subject: [Buildroot] [PATCH 2/2] package/iwd: bump version to 2.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog

Depends on ell >= 0.57:
https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/configure.ac?id=464f5c25db8150dc8cea21042a5bac09a8880edc

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 1647f93d9e..4eea644842 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  b0506d797a8bfb88f3c3eeea5e49dcf4ee8e6cef118f57c118e587eeb377ac64  iwd-2.3.tar.xz
+sha256  f7ac93aeef672604f5b5194ca038035ae222925be392c4345873c9742f477797  iwd-2.6.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index c54031b102..f20427114b 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 2.3
+IWD_VERSION = 2.6
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
