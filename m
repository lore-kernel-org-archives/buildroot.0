Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0282ACCA47C
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 07:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D93C40A19;
	Tue,  5 Jul 2022 07:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D93C40A19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_RUF-7FSyJv; Tue,  5 Jul 2022 07:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B89340A09;
	Tue,  5 Jul 2022 07:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B89340A09
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 968541BF2B3
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 07:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EB32605B1
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 07:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EB32605B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvUlyAhWkL9u for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 07:32:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6B07605C9
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6B07605C9
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 07:32:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g1so6517011edb.12
 for <buildroot@buildroot.org>; Tue, 05 Jul 2022 00:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qvi6hB5jpDDJ8wVe4EmHtFbcs/mkSh/0stDdeDDPLNM=;
 b=0AtNzj6UaplyyfK6tpX63LeiRogDlLpgNPpI8CE8C3IsJ7ZxpfhMgIDzF6Gk2gPm/p
 gShvRjctIJd+QWiBywoigJ/quQF+fcqaSS/7XueeWiqVUPEb64mWaNsfvzz82/c+rYjX
 sN9AiGr2guIqCVfgk70dnO52YK7tTxQNmqZYfmVLU1x15OjcnoGBLDnJzVL0W+RtNwGK
 EIcR8hkSEQZA8ZjckDX/mZ595pptQJt0zvi8dkfcAzsQi4LC8fUJT5lDLqZHXGioJNjK
 n9nQJMVzLxMT49AGlbxguXGr28TMbO/RFKIu7ZheznhgQEpWy9yL5P0RTO3NGTxaV5dv
 F26g==
X-Gm-Message-State: AJIora/ImtofFZhcGpwy7A1sV/D2WaFE0x5rh67krMaO43y46kCQinYr
 WQYbrwsgE8x0JWR2dL75jyNrEQcN24WtdQ==
X-Google-Smtp-Source: AGRyM1tPsSgFTiS3v/BGU315bAU63CsdCaypoy7f1mNypM++KjFA8BFr3G+OMuPiVvm7LUfdr/oWPw==
X-Received: by 2002:a05:6402:5188:b0:437:618c:c124 with SMTP id
 q8-20020a056402518800b00437618cc124mr44187847edd.233.1657006337886; 
 Tue, 05 Jul 2022 00:32:17 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 t27-20020a17090616db00b0071cbc7487e1sm15274562ejd.69.2022.07.05.00.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 00:32:17 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 09:32:06 +0200
Message-Id: <20220705073206.1442280-6-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705073206.1442280-1-angelo@amarulasolutions.com>
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qvi6hB5jpDDJ8wVe4EmHtFbcs/mkSh/0stDdeDDPLNM=;
 b=Z6tNuRw5n1gJh4eBIl1LudDZ6NAn9UOx4PQpiPqxa0SQUf4JsrKil27HnX8bPeT1V2
 i2hk4Kx+oCaYMSqc7DhIomkZW5h4GIqJK0SbzfIHIcOV6lr7+ol/RukCQsMkdiBnCFe7
 nK8y3HENVWMB8XvIe/WbqG6a+8jVq/246Uhwc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Z6tNuRw5
Subject: [Buildroot] [PATCH v3 5/5] package/initscripts: add service to load
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
Cc: br015@umbiko.net, Angelo Compagnucci <angelo@amarulasolutions.com>
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
