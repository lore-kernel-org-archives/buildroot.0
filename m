Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98723C636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48FFF40A82;
	Tue,  7 Feb 2023 16:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48FFF40A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wKga_gV4OCwt; Tue,  7 Feb 2023 16:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98E4540168;
	Tue,  7 Feb 2023 16:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98E4540168
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9ED71BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A13C0402AF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A13C0402AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTppg2TNH8rz for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:31:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 986A940287
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 986A940287
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:31:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id B84004000E;
 Tue,  7 Feb 2023 16:31:24 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Tue,  7 Feb 2023 17:31:17 +0100
Message-Id: <20230207163119.292389-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230207163119.292389-1-thomas.petazzoni@bootlin.com>
References: <20230207163119.292389-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675787485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihpeHPSRos/DpC3HNfq/RoaKVcxxKmkgt8ggss4H3lo=;
 b=JQUev8QGzQ7rwe+dXCFTHpx3210LB4ZG9sUTUjvhp5L/ryiEKEMWM7O2Xw7VCg46ArNjRX
 FDSdbLRo+CnWO4ITV871dOSdWAriEZZp6TAnaJw+Lt9coPTyLyl+bU7590sYwakQ77JUwa
 A9b+llKWdU9aVs6y/rsaOrK+GiY2zF/4ZkBpj0awSsr9llXkNrBKySUqGEEeH6B83Lft53
 KXc9w5GPqVyjMvJNv1NMvb7d6gVvxl7SQsO0ZWhjgSMvsuUVfW6mdYBy597ZUQkaHygYyB
 sLE3He1fXPgWGkJTmFmrSMPNzhE1DF9utHJw60OVf4/+s3rpsMHU+YW0iHe7ZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JQUev8QG
Subject: [Buildroot] [PATCH 2/3] support/docker: use APT::Retries in apt-get
 calls to retry
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

snapshot.debian.org is notoriously slow, and quite often leads to
timeouts when downloading packages. To give us a better chance of
succeeding, let's retry 3 times before failing.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/docker/Dockerfile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index de1534e77a..a16c1e3849 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -20,8 +20,8 @@ COPY apt-sources.list /etc/apt/sources.list
 
 # The container has no package lists, so need to update first
 RUN dpkg --add-architecture i386 && \
-    apt-get update -y
-RUN apt-get install -y --no-install-recommends \
+    apt-get -o APT::Retries=3 update -y
+RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
         bc \
         build-essential \
         bzr \
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
