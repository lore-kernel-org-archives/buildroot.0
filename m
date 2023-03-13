Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82680C61DA4
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 08:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22EC54018B;
	Mon, 13 Mar 2023 08:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22EC54018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qVVE6BawAQ-x; Mon, 13 Mar 2023 08:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BFEE405E7;
	Mon, 13 Mar 2023 08:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BFEE405E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2501BF3E0
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 08:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43F4240297
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 08:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43F4240297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9w59Seuei0r7 for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 08:17:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3409440287
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3409440287
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 08:17:15 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id C0324163C;
 Mon, 13 Mar 2023 09:17:12 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 09:15:49 +0100
Message-Id: <20230313081549.493823-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230313081549.493823-1-michael@walle.cc>
References: <20230313081549.493823-1-michael@walle.cc>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1678695432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SEKd2U4sYa97PyyVzquThQ9qzyX3cZzZzz0zDnk+sX4=;
 b=zsocS94bTJnqbHNccTp5ZWeOwEPCU2hc2Tu91FPt3WzO1ZkrA4G7C/wT/p/RETwQf/RZCl
 xFOm8Mt3bSxW8+svhwh7z742XBHwyxNNfqiefHDGP1plekfMns7AmWF/y5NBOJvLtZYVhO
 AgCAP0H0RcRN9TlB+XgkRM9PT+i7AN5ki9X0h4p88urr9DqgGlvJPn23HbDQDqrnVw53sJ
 aPFYj1rTevqusCkeKg+Gv+Xvax8f7oysF3YS2S6J1ZT6pQQW/N8o99XH5gka6iU4HWgJlr
 xgQd4uf4VmUxOhMl26cEjCMOGZO45Yfi9jeB5PILz0kMXmraatQaLqtc7FUO9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc
 header.a=rsa-sha256 header.s=mail2022082101 header.b=zsocS94b
Subject: [Buildroot] [PATCH RESEND 2/2] package/buildroot-initscripts: add
 hwclock initscript
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <michael@walle.cc>
Cc: Michael Walle <michael@walle.cc>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a new initscript to save the date and time to the hardware clock
on shutdown.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 package/buildroot-initscripts/Config.in       |  6 ++++++
 package/buildroot-initscripts/S20hwclock      | 21 +++++++++++++++++++
 .../buildroot-initscripts.mk                  |  1 +
 3 files changed, 28 insertions(+)
 create mode 100644 package/buildroot-initscripts/S20hwclock

diff --git a/package/buildroot-initscripts/Config.in b/package/buildroot-initscripts/Config.in
index 8e84e975fa..b30c91b646 100644
--- a/package/buildroot-initscripts/Config.in
+++ b/package/buildroot-initscripts/Config.in
@@ -7,6 +7,12 @@ config BR2_PACKAGE_BUILDROOT_INITSCRIPTS
 
 if BR2_PACKAGE_BUILDROOT_INITSCRIPTS
 
+config BR2_PACKAGE_BUILDROOT_INITSCRIPTS_HWCLOCK
+	bool "hwclock"
+	help
+	  Initscript to save the date and time to the hardware clock on
+	  shutdown.
+
 config BR2_PACKAGE_BUILDROOT_INITSCRIPTS_URANDOM
 	bool "urandom"
 	default y if BR2_PACKAGE_INITSCRIPTS
diff --git a/package/buildroot-initscripts/S20hwclock b/package/buildroot-initscripts/S20hwclock
new file mode 100644
index 0000000000..3e6ea98fe8
--- /dev/null
+++ b/package/buildroot-initscripts/S20hwclock
@@ -0,0 +1,21 @@
+#! /bin/sh
+
+RTC_DEVICE=rtc0
+
+[ -r "/etc/default/hwclock" ] && . "/etc/default/hwclock"
+
+# Quietly do nothing if /dev/rtc0 does not exist
+[ -c /dev/$RTC_DEVICE ] || exit 0
+
+case "$1" in
+	start)
+		exit 0
+		;;
+	stop)
+		echo "Saving the system clock to /dev/$RTC_DEVICE.."
+		/sbin/hwclock -f /dev/$RTC_DEVICE -w
+		;;
+	*)
+		echo "Usage: $0 {start|stop}"
+		exit 1
+esac
diff --git a/package/buildroot-initscripts/buildroot-initscripts.mk b/package/buildroot-initscripts/buildroot-initscripts.mk
index 098113bcbd..980a5fe1e4 100644
--- a/package/buildroot-initscripts/buildroot-initscripts.mk
+++ b/package/buildroot-initscripts/buildroot-initscripts.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+BUILDROOT_INITSCRIPTS_SCRIPTS_$(BR2_PACKAGE_BUILDROOT_INITSCRIPTS_HWCLOCK) += S20hwclock
 BUILDROOT_INITSCRIPTS_SCRIPTS_$(BR2_PACKAGE_BUILDROOT_INITSCRIPTS_URANDOM) += S20seedrng
 
 define BUILDROOT_INITSCRIPTS_INSTALL_INIT_SYSV
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
