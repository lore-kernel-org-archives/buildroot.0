Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A32EEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 18:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7FF382288;
	Thu, 20 Jul 2023 18:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7FF382288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lv7JTYA7IAro; Thu, 20 Jul 2023 18:54:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A8658225C;
	Thu, 20 Jul 2023 18:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A8658225C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3393C1BF349
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 18:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CDFA40180
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 18:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CDFA40180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfDZGqoWYYBK for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 18:54:49 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E0B94014B
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 18:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E0B94014B
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D2C0FA4C0930
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:54:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37304)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMYnV-0002Lb-21
 for buildroot@buildroot.org; Thu, 20 Jul 2023 20:54:45 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 20:54:45 +0200
Message-Id: <20230720185445.1375987-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689879285;
 bh=4ndiMCwlAygi8SnoIPhUXgUvpjpbm3v38cfBvRu279w=;
 h=From:To:Subject:Date:From;
 b=yZJYXskIC3ofr0/jBuByjSi3Dpcx6x1fxFFKN+GW/q9VnGYiHZEa1p2bflTp/40q4
 N94bz6j3dBlxyR6E5IQungVXeRac9vSaorsnjFC7vI4n/sIZKj6eotqM/s/JPpKWKi
 OyqYtvv4nJ7Dh4sCUwVaLqSRD8nGIHv5PxtGMG7tY2mATk4bcHTx2APabI7cubhr6X
 5OBhYQP5ro2mrCe8gIiPN1MJKF7gNIeQP+XOUJ1Dy1ZGFJSehaTGS7zJ3AI8tvyBVv
 +0kPSv/o3jJpbjCYG1QjrSUrSldb2MCzNPB9itY8kgs+EyJwZkc1riOv4e/u724L/p
 lq4WDpY06TaDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=yZJYXskI
Subject: [Buildroot] [PATCH 1/1] package/opensc: link with -latomic if needed
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

Fixes:
http://autobuild.buildroot.net/results/fb4/fb4c6a97ac666a3a75345229a320769df6c0a909/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/opensc/opensc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index 253b6b26f8..8944b6c7ed 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -13,4 +13,8 @@ OPENSC_DEPENDENCIES = openssl pcsc-lite
 OPENSC_INSTALL_STAGING = YES
 OPENSC_CONF_OPTS = --disable-cmocka --disable-strict
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+OPENSC_CONF_ENV += LIBS=-latomic
+endif
+
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
