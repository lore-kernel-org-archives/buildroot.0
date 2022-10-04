Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A8FC433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 11:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CB0F832C7;
	Tue,  4 Oct 2022 11:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CB0F832C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tK32z3c-hb0w; Tue,  4 Oct 2022 11:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 785658329A;
	Tue,  4 Oct 2022 11:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 785658329A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8631BF863
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DABAB60B46
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DABAB60B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOUK2ajGuG9I for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 11:04:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3B5860B2A
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3B5860B2A
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 11:04:38 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id au23so7295682ejc.1
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 04:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+yQkyNh99w3m87kHimxHu2uuMBMHMhSzzJ7m3IlPdpU=;
 b=x6ov3cs4iloMfFkQgQBDZEPho6NnQ/yLL4xdBTLyBlNk1185v8yAe8kdheGKbblEKA
 lH8rLrXNcdWJMfriAJ5mksnMt2oDIzy4I30wCUZ8GDym0Mf+InFuNDUnuagNj7IcZ/lc
 9x78idRGdyP42N7j5nOCDtgx8cyVJquKtJ21BXuNoWE8TlfRNjq3DddFTEqmFJHjJRaY
 wOC0bEw+xiTk680RfEE1mvsSxsC7vFqFA+9EEpnw0fwmplIeRa2+ZOU+INX2WRUUjs0W
 zRigSc+pt4K+bI6WMSaQgff122F4xQ60d+PVc9iQwTBdTaWGCH3vXp7gFj7S+H+Leptd
 coPA==
X-Gm-Message-State: ACrzQf0R2XPCuEnAhgJe956IKxC5nttQK2sBVdu7p8grzkL9cJd99480
 LaIzGKxZqcMr7rDNMemDnlHkaZM1hL5zig==
X-Google-Smtp-Source: AMsMyM6G/tVplJazfHe7XL8ea+8OltP9oPAVyFXNUSQyWcozE3PtBpO5/6F2pCnY2g2Ia1ez6+PjHQ==
X-Received: by 2002:a17:907:74a:b0:77e:9455:b4e3 with SMTP id
 xc10-20020a170907074a00b0077e9455b4e3mr19061425ejb.471.1664881476912; 
 Tue, 04 Oct 2022 04:04:36 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 p24-20020aa7cc98000000b00456d2721d93sm1427714edt.64.2022.10.04.04.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 04:04:36 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 13:04:21 +0200
Message-Id: <20221004110421.137795-6-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004110421.137795-1-angelo@amarulasolutions.com>
References: <20221004110421.137795-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+yQkyNh99w3m87kHimxHu2uuMBMHMhSzzJ7m3IlPdpU=;
 b=Ew4BbC04LXc4oDbMoKPsw8eZvyrtNpK7Ww6XGKEBqdhUjkwQ5BOgzZo/VzX8DetDdH
 YDLZRwf7X1dMYf+zKsUDG3DkuhB9Yp5riMb9CyZVOOtO5B33y9GxAVxFqZa6JgpKBAl4
 NmmkN0I+c+JQbD/NFULeKGPtkBD8tK9pDLR1M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ew4BbC04
Subject: [Buildroot] [PATCH v4 5/5] package/initscripts: add service to load
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
kernel module drivers by reading the /etc/modules-load.d/*.conf files.
The modules files matches the one used by systemd, which in turn has
a builtin mechanism to load a module at boot, therefore making systemv
init on par with systemd features.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v2:
* Moved script to initscripts (Arnout)
* Moved script to S11modules, after S10[mu]dev (Andreas)
* Use /etc/modules-load.d/ to share the same setup with systemd (me)
v4:
* Select only .conf file (Peter)
* Better ouput: printing module name only when loaded successfully,
  print a FAIL when at least one module fails (Peter) 

 package/initscripts/init.d/S11modules | 59 +++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/initscripts/init.d/S11modules

diff --git a/package/initscripts/init.d/S11modules b/package/initscripts/init.d/S11modules
new file mode 100644
index 0000000000..dcc2e79135
--- /dev/null
+++ b/package/initscripts/init.d/S11modules
@@ -0,0 +1,59 @@
+#!/bin/sh
+
+MODULES_DIR="/etc/modules-load.d/"
+
+[ -z "$(ls -A ${MODULES_DIR} 2> /dev/null)" ] && exit 0
+
+load_unload() {
+	for module_file in $(ls -1 ${MODULES_DIR}/*.conf); do
+		while read module args; do
+
+			case "$module" in
+				""|"#"*) continue ;;
+			esac
+
+			if [ "$1" = "load" ]; then
+				modprobe -q ${module} ${args} >/dev/null && \
+					printf '%s ' "$module" || RET='FAIL'
+			else
+				rmmod ${module} >/dev/null
+			fi
+
+		done < ${module_file}
+	done
+
+	RET='OK'
+}
+
+start() {
+	printf 'Starting modules: '
+
+	load_unload load
+
+	echo $RET
+}
+
+stop() {
+	printf 'Stopping modules: '
+
+	load_unload unload
+
+	echo $RET
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
