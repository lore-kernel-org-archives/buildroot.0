Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57479C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 17:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E436F60760;
	Tue, 21 Feb 2023 17:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E436F60760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6JGBA-vjGq83; Tue, 21 Feb 2023 17:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 315E9612AE;
	Tue, 21 Feb 2023 17:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 315E9612AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20C3C1BF956
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA51782B3E
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA51782B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JxBeEQeBgOHM for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8B1482A72
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8B1482A72
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 17:22:19 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 6DA7B2087C;
 Tue, 21 Feb 2023 11:22:18 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 11:21:55 -0600
Message-Id: <20230221172205.2450111-5-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221172205.2450111-1-vfazio@xes-inc.com>
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1677000138; bh=bTLBo8HX8M4Qcb4u3tvMEILcuF9qAc56ZiSQSzPgJLg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NjoD6dBw1MLH53MrdMefR7WuUJ9Hx3bvkZsL5oug4J30276TJWQjf6YaQUSKOm6fB
 frJPdhXDwJGzgbhhApwP1J5d2qsWecBkOeaeVqYy3OPaagf4HvPGuPJ2tu68QnyRRZ
 RDEb9nffB/zk32Pyt/eCSLtnPIG3WTuuvyVe/vYo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=NjoD6dBw
Subject: [Buildroot] [PATCH 05/15] package/aumix: migrate to new autopoint
 flag
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 package/aumix/aumix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/aumix/aumix.mk b/package/aumix/aumix.mk
index a4001f5bbb..03072d5d35 100644
--- a/package/aumix/aumix.mk
+++ b/package/aumix/aumix.mk
@@ -8,7 +8,7 @@ AUMIX_VERSION = 2.9.1
 AUMIX_SOURCE = aumix-$(AUMIX_VERSION).tar.bz2
 AUMIX_SITE = http://jpj.net/~trevor/aumix/releases
 AUMIX_AUTORECONF = YES
-AUMIX_GETTEXTIZE = YES
+AUMIX_AUTOPOINT = YES
 AUMIX_LICENSE = GPL-2.0+
 AUMIX_LICENSE_FILES = COPYING
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
