Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EFFC43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 10:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C1724109F;
	Tue, 28 Jun 2022 10:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C1724109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZctRjFbNyYR; Tue, 28 Jun 2022 10:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDF8C409AA;
	Tue, 28 Jun 2022 10:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDF8C409AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2F71BF9D1
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 10:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 131A982B97
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 10:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 131A982B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSlebIQ35hkh for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 10:14:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ACCA82C99
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ACCA82C99
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 10:14:15 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id e2so16866145edv.3
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 03:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qvi6hB5jpDDJ8wVe4EmHtFbcs/mkSh/0stDdeDDPLNM=;
 b=M0/PTrrbdZDPkev04aCKrD4Kp5qtS3yLVWzY97zv1BOcT9szwN7Pcg8rbdVLxwyrTs
 7BUiZR/KofXwSAlyPK4D/a2szEHtTZ28M8MUaWZsYz73griCDf+Ci8bIqPosEhKyVukf
 Ig4pIC7mUGUY4hvq6ZOrcJi9aEOJVB8VCXmzPDDICmTpeRT5IRgqQmxbCn7ePsC4QLGx
 1C396G9ZyXkumZ2lEXuO4EEGkzYI/gmOJKG4aCWqD2QWRWMQd1Sfah4nRZKeSMLqDWqN
 5Wm+OJYRsZSx0vZpAYnSWulxFIk5Y2LAiJQZ7GoCm/cBBf2EoV2Knk+jJrWAuHIT6eml
 wNFw==
X-Gm-Message-State: AJIora+iiLaBhEf5y4wqyphLU7pMnhr2pq1+JD3pt0tnF/bqa8UaD23N
 wX91rzgfQ9Zv1GofA4agGQs6KJkc5EtrtQ==
X-Google-Smtp-Source: AGRyM1uOYkh2ZCoINFlqrQhySPHGfUQ6b5BBaY2NFhVto7i4aMgNMMFu7RfZQQ4nKjixDp/cxqraRQ==
X-Received: by 2002:a05:6402:398:b0:435:6df7:b7e4 with SMTP id
 o24-20020a056402039800b004356df7b7e4mr22361548edv.306.1656411253515; 
 Tue, 28 Jun 2022 03:14:13 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm9308401edb.56.2022.06.28.03.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:14:13 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 12:13:52 +0200
Message-Id: <20220628101352.1786434-6-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220628101352.1786434-1-angelo@amarulasolutions.com>
References: <20220628101352.1786434-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qvi6hB5jpDDJ8wVe4EmHtFbcs/mkSh/0stDdeDDPLNM=;
 b=rGx8D7q0b6i24UJ3UffwzujR4ZffCSk27VL4s3iurErRYQVqkKcxd30L8iMoRpBK24
 jiSMFiCx3xE/DwwDC/fJgT9IoMHDdoC/ktjS1RIBlOZ29v1HyUdmwRMaaL5snMLbCLvC
 GcF0m5q2AHA5UUx7MfJeC4FWQzAjPuqv7tmwY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rGx8D7q0
Subject: [Buildroot] [PATCH v2 5/5] package/initscripts: add service to load
 kernel modules at boot
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In cases where no hotplug is available (by choice or by the lack of a
proper hotplug method for a device), this service can be used to load
kernel module drivers by reading the /etc/modules file.
The modules files matches the one used by systemd, which in turn has
a builtin mechanism to load a module at boot, therefore making systemv
init on par with systemd features.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changes

v2:
* Moved script to initscripts (Arnout)
* Moved script to S11modules, after S10[mu]dev (Andreas)
* Use /etc/modules-load.d/ to share the same setup with systemd (me)

 package/initscripts/init.d/S11modules | 59 +++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/initscripts/init.d/S11modules

diff --git a/package/initscripts/init.d/S11modules b/package/initscripts/init.d/S11modules
new file mode 100644
index 0000000000..3937945596
--- /dev/null
+++ b/package/initscripts/init.d/S11modules
@@ -0,0 +1,59 @@
+#!/bin/sh
+
+MODULES="*.conf"
+MODULES_DIR="/etc/modules-load.d"
+
+[ -z "$(ls -A ${MODULES_DIR}/${MODULES} 2> /dev/null)" ] && exit 0
+
+load_unload() {
+	for module_file in $(ls -1 ${MODULES_DIR}); do
+		while read module args; do
+
+			case "$module" in
+				""|"#"*) continue ;;
+			esac
+
+			if [ "$1" = "load" ]; then
+				modprobe -q ${module} ${args} >/dev/null && \
+					printf ' %s success,' "$module" ||
+					printf ' %s failed,' "$module"
+			else
+				rmmod ${module} >/dev/null
+			fi
+
+		done < ${MODULES_DIR}/${module_file}
+	done
+}
+
+start() {
+	printf 'Starting modules:'
+
+	load_unload load
+
+	echo ' OK'
+}
+
+stop() {
+	printf 'Stopping modules:'
+
+	load_unload unload
+
+	echo 'OK'
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
