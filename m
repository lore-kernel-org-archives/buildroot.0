Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1D1C369A8
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 02:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99CFA83155;
	Fri, 11 Apr 2025 02:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWlJdgr4aSfa; Fri, 11 Apr 2025 02:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B876A83298
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B876A83298;
	Fri, 11 Apr 2025 02:35:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 656F8193
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B55840CCF
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Botec-l0WAWD for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 02:35:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB02340C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB02340C1D
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB02340C1D
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:35:36 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-22435603572so14840195ad.1
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744338936; x=1744943736;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h3/ek9f+07PYaIK63T3qCLw2KWeFpTkv+lQnNsEcxC8=;
 b=Y051pb5o47ykN7SsJPgZpyZY8reLFeyf75Yg/QIqX+4h4YEFiiM3ikoSZWD8AEtYDm
 S4ogz4xyFiwY/5OjY7x1qrpWbf/XRdIFnmH8f8gC/hqrX1Gr/jafCfxCmQDgC239aVpm
 6dFK/GaWChnR+/8EB0NjwmtRkYu2cy/WBg5pWvEfJHylhqn41mOWAChLrOblPk9XNpfe
 xbRsIH8DIIwKZyTxhZS3qtkNi0Oun3926nEo8fOuRmScRaMreoZSLMGp4UOf2weONmmm
 R8gn0/qTlr578BhAJWcT2QKrUeSAvXiHwFbpzeogDnFPh+qxFxM38uSMr2SzkcM8YWvo
 Bb2w==
X-Gm-Message-State: AOJu0YzNreM+xE0/jpIo6YzPcv+c+rFcAIX4pKyhZz+FQnO2+s7erqsn
 eM7lmyQHnjwRFI/dWSe6bZo0Xtkz/Z4ZDUIDENAa3RZNKHFRhtbe9OUdBYreTv4=
X-Gm-Gg: ASbGnctte1yqrWrlqrix8UC8SahFeQ7vy4Jy7TYkL4vKPaM7ydS1hI4RddMOqPrju5m
 2u+tYhVfeQlJZzY1M4+6P4EBJR3GAxDjpSDmNQ7RUWXzuOmO6aQMtUobbGwdPKEG3vkBuI6GO4O
 c1ID/x+e9dfeolWv3K7a8xUFkbKaJQ2BQFfls+9Ly3qtSXf0MjFZJerc7VGu38nYtGnYN2QKzKD
 mq8xjgXPWzuleK6qCA0BCiP8DO5oipo9p7cv8zRiQkBSxKxOb+/nWyELRciX657+SarPhVVHHlA
 AldkSR2k38zaMxzc5RRjQElYumcd2e0rveWL03toxnqYh/S7yEsKSw5O
X-Google-Smtp-Source: AGHT+IFAH6H57ynCumTaeypsIWNAnILUb/g4H2jzRKWMLPrm9sjVzvop2X7+UhNdIwOlfOAFzz6Lgg==
X-Received: by 2002:a17:903:2309:b0:220:f140:f7be with SMTP id
 d9443c01a7336-22bea4eff34mr16197815ad.41.1744338936010; 
 Thu, 10 Apr 2025 19:35:36 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-308218fecf2sm900117a91.7.2025.04.10.19.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 19:35:35 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 10 Apr 2025 19:35:20 -0700
MIME-Version: 1.0
Message-Id: <20250410-improve_merge_config-v1-3-13805f34defd@rivosinc.com>
References: <20250410-improve_merge_config-v1-0-13805f34defd@rivosinc.com>
In-Reply-To: <20250410-improve_merge_config-v1-0-13805f34defd@rivosinc.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2423; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=kCGUryWP+XbCVmLTUBJdItkLcNxA9owD8wC45W/gX2o=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qP+k9OTprSXA7X+2brdPe9c+RZcfhuw7YJJnXPLuUIH
 E57//lVRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABMJM2L47/OMN+feJPP9EW7r
 zbIdl9eJPXX341T8yuVaE1T75OXeG4wM+36pbU0O1pkee8tC/JYEs7jk5gi9+Sk8PovaxFtl5i/
 mAwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744338936; x=1744943736;
 darn=buildroot.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h3/ek9f+07PYaIK63T3qCLw2KWeFpTkv+lQnNsEcxC8=;
 b=pmNfiXSfkrYa/C9qAOP0DNntiGN8T/vNAtBKxr7B7tzMctJlFkNTBK4tjtWgD87u1F
 nJLaJAGXPb1cz8vABSSliqPquXjwtsvFtVDpN1sYy6q/mJNHyhK0AxEx2Zb/FvLcYeNu
 CTBmYrUMxs/m/nf1drOfU1QDozb0SJUVyJkOKffpWiiR6izzsoxE93v4ljfa2yHXH4Cg
 IpHkK+/dNCntNttquDpEPdTaiL57Z16fCJGgu5ta514OEPOxZnwe437N/mJZvNgl9dHe
 VsWZ8gf/VsLyeXupa2Dnrg/P4fWOC/bP/i/nTa+ZKzr2jCcMKowJGBETIMETZoqxqqEi
 VGYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=pmNfiXSf
Subject: [Buildroot] [PATCH 3/3] support/kconfig: Add option to fail
 merge_config.sh on invalid configs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

merge_config.sh will print a message if the value requested does not end
up in the final config. To allow tools to automatically detect if there
is an invalid config, add an option "-f" to fail merge_config.sh if the
requested config values don't end up in the final config.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 support/kconfig/merge_config.sh | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 26bf41cab53ea54993a15b8be4ff40940a62e793..54707438bfc3b763534267d4112c6fa95b48b7be 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -22,7 +22,7 @@
 
 clean_up() {
 	rm -f $TMP_FILE
-	exit
+	exit $1
 }
 trap clean_up HUP INT TERM
 
@@ -35,6 +35,7 @@ usage() {
 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
 	echo "  -e    colon-separated list of br2-external trees to use (optional)"
 	echo "  -C    change to directory before doing anything else"
+	echo "  -f    set exit code to 1 if config values are not properly set"
 	echo
 	echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_
 	environment variable."
@@ -87,6 +88,11 @@ while true; do
 		shift 2
 		continue
 		;;
+	"-f")
+		FAIL_ON_INCORRECT_CONFIG=true
+		shift
+		continue
+		;;
 	*)
 		break
 		;;
@@ -195,6 +201,7 @@ fi
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
 make KCONFIG_ALLCONFIG=$TMP_FILE $EXTERNAL_ARG $OUTPUT_ARG $ALLTARGET
 
+incorrect_configs=0
 
 # Check all specified config values took (might have missed-dependency issues)
 for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
@@ -202,6 +209,7 @@ for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
 	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
 	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
 	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
+		incorrect_configs=1
 		echo "Value requested for $CFG not in final .config"
 		echo "Requested value:  $REQUESTED_VAL"
 		echo "Actual value:     $ACTUAL_VAL"
@@ -213,4 +221,8 @@ if [ -z "$BASE_DIRECTORY" ]; then
 	cd "$ORIGINAL_DIR" || clean_up
 fi
 
+if [ "$FAIL_ON_INCORRECT_CONFIG" = "true" ]; then
+	clean_up $incorrect_configs
+fi
+
 clean_up

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
