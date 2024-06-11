Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E58C27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE33260A55;
	Tue, 11 Jun 2024 18:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Hemzz5IEkT9; Tue, 11 Jun 2024 18:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23ABB60B2D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23ABB60B2D;
	Tue, 11 Jun 2024 18:02:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7BA1BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8531C81F8E
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a08U9kNAiHWE for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:02:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FE8281F81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FE8281F81
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FE8281F81
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:02:13 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-681ad26f4a5so920481a12.2
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128932; x=1718733732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtH+2Z+Z6ofLdU7pZEnAbSCTKRaC2XQ0iGlR+Ah8sq4=;
 b=t/t7z7hZJI9ZyYV6A+BuHVDt6OSp6n7VHIE7b4iQPG/9IPkljA9qw/q5Zb9sFRXLWA
 n0jCxRoU9X0K7OhDcx5Yx7CLz/vBLyXMSuJ7PnIMSI+XwsBq6A0nqgOahqagThkNoX5u
 uLPZe2MTnfWY2Azob4N3lH9+Ed/20qlaRPrV5xy5bTlV1IZ5oLN/VCf5DhKfI2vbNEgm
 gBpPneopTfZguY7MDV7okMNhDynHS/kyjGwpK72qqem+SI+zpMPnahTUhBlMWCQmCuWe
 5jhoW6wQeeTZ+TMGnM2S/Jt+6l5K9ZO8S4iQXETUj51rMwMPm8N8xzT5qDOiOCQtyfzc
 mT9Q==
X-Gm-Message-State: AOJu0YyxsfURpfwp3lWw17ciau8oowf12hbKuvYyjPR+Y5D1BfSYo3U0
 6P42MPPSBfHbrrot4FTKEEqJA87839x3PDbP8Pv9OFf2hFFDyszrndKcRfBA
X-Google-Smtp-Source: AGHT+IHu+SOKLEiy2p0IELHI7SBtDh3h7GVPEmxsE9MknB7WsoCyu5fn5l5TV7xdg1tPaT2LGM+zeQ==
X-Received: by 2002:a17:90a:ea92:b0:2c2:dfbe:7327 with SMTP id
 98e67ed59e1d1-2c2dfbe779bmr7461722a91.45.1718128932338; 
 Tue, 11 Jun 2024 11:02:12 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c2fbde41ccsm5673927a91.11.2024.06.11.11.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:02:11 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:02:00 -0700
Message-ID: <20240611180207.2138847-2-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180207.2138847-1-cdimich2188@gmail.com>
References: <20240611180207.2138847-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128932; x=1718733732; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtH+2Z+Z6ofLdU7pZEnAbSCTKRaC2XQ0iGlR+Ah8sq4=;
 b=GEk/yHOwvvn4gQjpEHeKUWhARkYKG4osBSzZIa1lfipo8TAgyvD9awWGaDxmPQTTOn
 qLcGJnf4sla7mR7bZ8uMyFHcwKivtJdRwjK7/wwbjjxetIvEfHmKLagP2/liLj4DbKy9
 gtmYj+cTe1FgpbwJcCl8cTZMD0BaHCLjW+ce2ldgUs7BXQ8R/MNR9Vs1MHEeQiaoxSSY
 jJ8vXFRoWRKv0UqeksHSShQv/RXM5S4WQ3UtaWPH53Fim+vISNJSHa2FCEcTuijEWg3d
 d7iohePUQ0l7XteB8v92Ewo9vwzK7ks2rmN8l0Rp825ZuqA8xZIXpJHnHpPV1iNfL8cC
 2djg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GEk/yHOw
Subject: [Buildroot] [PATCH 1/8] board/boundarydevices: update boot scripts
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Add support for i.MX 8ULP and i.MX 93.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 board/boundarydevices/common/boot.cmd    | 111 +++++++++++++++--------
 board/boundarydevices/common/upgrade.cmd |  11 +++
 2 files changed, 85 insertions(+), 37 deletions(-)

diff --git a/board/boundarydevices/common/boot.cmd b/board/boundarydevices/common/boot.cmd
index 2f2bd8d045..285cab7b20 100644
--- a/board/boundarydevices/common/boot.cmd
+++ b/board/boundarydevices/common/boot.cmd
@@ -1,10 +1,13 @@
 setenv bootargs ''
 
-m4=''
 kernelimage=zImage
 bootcommand=bootz
 a_base=0x10000000
 
+if test -z "${imx_cpu}"; then
+	setexpr imx_cpu sub ".*(..?..?)$" "\\1" "${soc_type}"
+fi
+
 #grab 1st 2/3 characters of string
 setexpr cpu2 sub "^(..?).*" "\\1" "${imx_cpu}"
 setexpr cpu3 sub "^(..?.?).*" "\\1" "${imx_cpu}"
@@ -18,10 +21,10 @@ elif itest.s x8M == "x${cpu2}"; then
 	a_base=0x40000000
 	kernelimage=Image
 	bootcommand=booti
-fi
-if itest.s "x1" == "x${m4enabled}" ; then
-	run m4boot;
-	m4='-m4';
+elif itest.s x8U == "x${cpu2}"  || itest.s x93 == "${cpu3}"; then
+	a_base=0x80000000
+	kernelimage=Image
+	bootcommand=booti
 fi
 
 setexpr a_script  ${a_base} + 0x00800000
@@ -36,36 +39,72 @@ if itest.s "x" == "x${board}" ; then
 	exit;
 fi
 
-if itest.s "x" == "x${fdt_file}" ; then
-	if itest.s x51 == "x${cpu2}" ; then
-		fdt_file=imx51-${board}${m4}.dtb;
-	elif itest.s x53 == "x${cpu2}" ; then
-		fdt_file=imx53-${board}${m4}.dtb;
-	elif itest.s x6DL == "x${cpu3}" || itest.s x6SO == "x${cpu3}" ; then
-		fdt_file=imx6dl-${board}.dtb;
-	elif itest.s x6QP == "x${cpu3}" ; then
-		fdt_file=imx6qp-${board}.dtb;
-	elif itest.s x6SX == "x${cpu3}" ; then
-		fdt_file=imx6sx-${board}${m4}.dtb;
-	elif itest.s x6UL == "x${cpu3}" ; then
-		fdt_file=imx6ull-${board}.dtb;
-	elif itest.s x7D == "x${cpu2}" ; then
-		fdt_file=imx7d-${board}${m4}.dtb;
-	elif itest.s x8MM == "x${cpu3}" ; then
-		fdt_file=imx8mm-${board}${m4}.dtb;
-	elif itest.s x8MN == "x${cpu3}" ; then
-		fdt_file=imx8mn-${board}${m4}.dtb;
-	elif itest.s x8MP == "x${cpu3}" ; then
-		if itest *0x30360800 == 0x00824310 ; then
-			fdt_file=imx8mp-a0-${board}${m4}.dtb;
-		else
-			fdt_file=imx8mp-${board}${m4}.dtb;
-		fi
-	elif itest.s x8MQ == "x${cpu3}" ; then
-		fdt_file=imx8mq-${board}${m4}.dtb;
+if itest.s x51 == "x${cpu2}" ; then
+	dtb_prefix=imx51;
+elif itest.s x53 == "x${cpu2}" ; then
+	dtb_prefix=imx53;
+elif itest.s x6DL == "x${cpu3}" || itest.s x6SO == "x${cpu3}" ; then
+	dtb_prefix=imx6dl;
+elif itest.s x6QP == "x${cpu3}" ; then
+	dtb_prefix=imx6qp;
+elif itest.s x6SX == "x${cpu3}" ; then
+	dtb_prefix=imx6sx;
+elif itest.s x6UL == "x${cpu3}" ; then
+	dtb_prefix=imx6ull;
+elif itest.s x7D == "x${cpu2}" ; then
+	dtb_prefix=imx7d;
+elif itest.s x8MM == "x${cpu3}" ; then
+	dtb_prefix=imx8mm;
+elif itest.s x8MN == "x${cpu3}" ; then
+	dtb_prefix=imx8mn;
+elif itest.s x8MP == "x${cpu3}" ; then
+	if itest *0x30360800 == 0x00824310 ; then
+		dtb_prefix=imx8mp-a0;
 	else
-		fdt_file=imx6q-${board}.dtb;
+		dtb_prefix=imx8mp;
 	fi
+elif itest.s x8MQ == "x${cpu3}" ; then
+	dtb_prefix=imx8mq;
+elif itest.s x8ULP == "x${imx_cpu}" ; then
+	dtb_prefix=imx8ulp;
+elif itest.s x93 == "${cpu3}" ; then
+	dtb_prefix=imx93;
+else
+	dtb_prefix=imx6q;
+fi
+
+if test ! -z "${mcore_enabled}"; then
+    if test ! -z "${mcoreboot}"; then
+            run mcoreboot;
+    fi
+    mcore_dtb=1
+fi
+if test ! -z "${m4enabled}"; then
+    if test ! -z "${m4boot}"; then
+            run m4boot;
+    fi
+    mcore_dtb=1
+fi
+
+if test -z "${fdtfile}" ; then
+	if test -z "${fdt_file}" ; then
+	    bn=${dtb_prefix}-${board}${board_rv}${board_carrier}${board_modifier};
+	    if test ! -z "${mcore_dtb}" ; then
+		    if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}${bn}-rpmsg.dtb; then
+		            fdt_file=${bn}-rpmsg.dtb
+		    else
+		            fdt_file=${bn}-m4.dtb
+		    fi
+	    else
+		    fdt_file=${bn}.dtb
+	    fi
+	fi
+else
+	fdt_file=${fdtfile}
+fi
+
+if test ! -z "${mcore_dtb}" ; then
+    setenv bootargs ${bootargs} ${mcore_bootargs}
 fi
 
 if itest.s x${distro_bootpart} == x ; then
@@ -79,13 +118,11 @@ fi
 if itest.s x${console} != x ; then
 	setenv bootargs ${bootargs} console=${console},115200
 fi
-if itest.s "x" == "x$vmalloc" ; then
-	vmalloc=400M
-fi
+
 if itest.s x${consoleblank} == x ; then
 	consoleblank=0
 fi
-setenv bootargs ${bootargs} vmalloc=${vmalloc} consoleblank=${consoleblank} rootwait fixrtc cpu=${imx_cpu} board=${board} uboot_release=${uboot_release}
+setenv bootargs ${bootargs} consoleblank=${consoleblank} rootwait
 
 if load ${devtype} ${devnum}:${distro_bootpart} ${a_fdt} ${prefix}${fdt_file} ; then
 	fdt addr ${a_fdt}
diff --git a/board/boundarydevices/common/upgrade.cmd b/board/boundarydevices/common/upgrade.cmd
index a26bacd9aa..ca23648cca 100644
--- a/board/boundarydevices/common/upgrade.cmd
+++ b/board/boundarydevices/common/upgrade.cmd
@@ -9,6 +9,10 @@ qspi_offset=0x0
 a_base=0x12000000
 block_size=0x200
 
+if test -z "${imx_cpu}"; then
+	setexpr imx_cpu sub ".*(..?..?)$" "\\1" "${soc_type}"
+fi
+
 #grab 1st 2/3 characters of string
 setexpr cpu2 sub "^(..?).*" "\\1" "${imx_cpu}"
 setexpr cpu3 sub "^(..?.?).*" "\\1" "${imx_cpu}"
@@ -27,6 +31,12 @@ elif itest.s x8M == "x${cpu2}"; then
 			offset=0x0
 		fi
 	fi
+elif itest.s x8U == "x${cpu2}"  || itest.s x93 == "${cpu3}"; then
+	a_base=0x82000000
+	offset=0x8000
+	if itest ${env_part} != 0 ; then
+		offset=0x0
+	fi
 fi
 
 qspi_match=1
@@ -228,3 +238,4 @@ echo "---- U-Boot upgraded. The board will now reset."
 sleep 1
 reset
 done
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
