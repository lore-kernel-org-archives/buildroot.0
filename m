Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3924C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 10:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 757CA60BBA;
	Mon, 24 Jan 2022 10:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-QbyW3VNP0B; Mon, 24 Jan 2022 10:09:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD6CC60BC6;
	Mon, 24 Jan 2022 10:09:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 091A71BF3A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 051FA40923
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w8ALIpAr-X-M for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 10:09:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37DE34034F
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:09:24 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BwHpngb6cXfntBwHpnFULL; Mon, 24 Jan 2022 11:09:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643018963; bh=8sZ2KkwgnkVxxQNwOSjpdZ1Qp8s2nKAN1SAznEU8Wn4=;
 h=From:To:Subject:Date:MIME-Version;
 b=C8dNyZh1+L9ih2aTQpFGy7LcbSRHucrNh97a5xbl0IYdzsPBv3WT5y414fZJbfCcr
 /ygbHEOVTRKhbX74boHpHJ8QhDulOGX4jNmS8Kii3M8FgN3N6IjkidG1StuN8+cjNx
 /yddcY01AuzIVQVPmX9vMujwxoG4ChIuZIY2nFTlbw36uVQadMbfYEJy5QgEKd9806
 GRgTrJR7VWQgDG1x5+OqJMLV48xRzLG1o6nlvW5FImAFW4mVfigSHTjVUh4afT8DXQ
 jsJHtPlEg30bezJQJ4Dk5pwA1fcAJLSGdxQe2ZhWQzS8V0alsBTt+qfp/ks8HBXhTJ
 Ni+N7rdDK3htg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 11:09:20 +0100
Message-Id: <20220124100920.3005564-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBd0+5XcxhyBZ0cEntqL30R9w04WmBc0KsiUsPsTGQrLc3pKOw4DYV8Z40Nf1DARPSRi3STUHHaHXi+iVfq4IYFPEhW+XCuxd93AaWQ53T/u8gw5pIcE
 6SSNZsC2Nps8MLzAJY/79wl2snojCn/i9ddcynflsGcyqIj7HS8Q65i+qQapvh7SCyzXIzZbGEfRwhU9i5ETQ/KIasWGsqyOniM2e4WyN+GJvjhfgXxAkF+V
 pb10MVaJRE+nmRnjMQ5OVukZKTOc8/FnsMQy6Xolp3tZjsuqK5n8C14fD8027YNejFGyWLNpTuhNNg3b5JEziQ==
Subject: [Buildroot] [PATCH] package/efl: fix build failure with eeze
 disabled
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Elput depends on eeze, so if we disable eeze we also need to disable elput
by setting the option "input" to false.

Fixes:
https://bugs.busybox.net/show_bug.cgi?id=14531

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/efl/efl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index ed0a8acc1d..c93961475d 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -65,6 +65,8 @@ EFL_DEPENDENCIES += udev
 EFL_CONF_OPTS += -Deeze=true
 else
 EFL_CONF_OPTS += -Deeze=false
+# input(elput) requires eeze, so disable it accordingly
+EFL_CONF_OPTS += -Dinput=false
 endif
 
 ifeq ($(BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
