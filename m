Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1583C3601E
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 02:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98DE46072A;
	Fri, 11 Apr 2025 02:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id La_M4SNx1tUv; Fri, 11 Apr 2025 02:35:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25F0360A7C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25F0360A7C;
	Fri, 11 Apr 2025 02:35:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62D85138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3361A60721
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6a6HtOPN2OhW for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 02:35:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C96F6064C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C96F6064C
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C96F6064C
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:35:35 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-aee79a0f192so1086728a12.3
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744338935; x=1744943735;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JiVSUypu2obBMyglXluOyv//5ZV8VEAUvGAAUMLUv9M=;
 b=bpJQ+qPOyrgyemRZyakIXLyQnVlUeWHB2Lab7bbQXyiLrc5P14j+RuJhyfc8+pA6Z1
 NJDaglxU3w+7tvN5XzoQ3MY5kAvw9byTL0DEasswOZ4KbcwwpHwCmKxiZUpYzj6HmfFI
 gUK1a5QOqYvIYV729zDFGUkve1QR8dRZFC2uosXmwf+Qm0htpODUzC3TJkZ9gvhpM3ig
 k2p8U7OjwIxQTMOHpXhn8Gm71vOlzQSZiu5QtHVhpYJ6RM//pqDIV2Llx/w2KRPCq6iZ
 cnW5OWw7M6e8jTG/4MMkNLr+laYQRTZMtDq3qo4jbnprdULSqrOWjdpWWu/oS0EOtiOW
 RjJA==
X-Gm-Message-State: AOJu0YzXCf6YbQ4K7kPjC2ZiKoOGMruXqoMUK/1CATgFLFrX2A+0DbWS
 sfyVXrC+IOFTjhUuymJK47ST/RRp8mZf429umjdyInkdqftvBxy8725klRfz9VM=
X-Gm-Gg: ASbGnctN7aJFreMYZ+cal0nIudNspVUEIUH1ljzxVGJTf67wG9KyuQ6jA3Nj1sKeJQw
 M/FCTofVG0Ld+h9jTH3zOLLwnPpOLWWgOs6DsuweY/Gyfpxo5Yw61roUmjnNl400zwoIKXkKB7r
 S500uNbXHCGByLyNUtAuwLDS+QM8oMVihVaUoK4IAqpnBoCPLPa3PC10E7zCJSErMH+IinY6rqS
 2Tid/CwOFzLsuFU1PtVzqWM/oiprYEn1EraZ3z3bYuniSEpgmwTjILlR2atU4E0KJ01Q59Ulw65
 iduMew0vhPPG9EsKS0eXrND2+PxsxashvqTEqj+ImztMriqFExrmTlE18mAAl4RvGc8=
X-Google-Smtp-Source: AGHT+IHIwzv7ZKVhMh/fjVXxSlaWWYYw3v+EZB1sj8lN/WaAA3ayTI9ByX+4aDVsR4m9T1OYhBBRTw==
X-Received: by 2002:a17:90b:562e:b0:2ff:692b:b15 with SMTP id
 98e67ed59e1d1-308237f41aemr2056405a91.33.1744338934742; 
 Thu, 10 Apr 2025 19:35:34 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-308218fecf2sm900117a91.7.2025.04.10.19.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 19:35:33 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 10 Apr 2025 19:35:19 -0700
MIME-Version: 1.0
Message-Id: <20250410-improve_merge_config-v1-2-13805f34defd@rivosinc.com>
References: <20250410-improve_merge_config-v1-0-13805f34defd@rivosinc.com>
In-Reply-To: <20250410-improve_merge_config-v1-0-13805f34defd@rivosinc.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=1eBz9KYbxPZscvK6DG7qHT/HOEXdzpVWzB5+UdWEkQw=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qP+k9P4/7UHNouadcWkPenqsNgfffMV6FvTP98EWZiZ
 1r/7P3zjlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACZyToWRYefji8zKJdFntdSF
 q5WVD/zefjfwSHvaSZFjR5d8lUwysmNk6Kva4mYtxpI/Vyfo8KSd/6T1W+yf8r710/32dHPt9kU
 VvAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744338935; x=1744943735;
 darn=buildroot.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JiVSUypu2obBMyglXluOyv//5ZV8VEAUvGAAUMLUv9M=;
 b=I1wDnTKN90pIyx0XHhIXEZ5AMrqh8G+PxdZLYmWsuKY2CT8VCl7Po0rMshLeWJIt8p
 IyqB2+K7d2YuA4ALaDPDSnlT5Ws8iHK+xB1NckC1wU/Q/zPKuwT4Yt5XIKgrQcJu9uB7
 R0GGyNZ7imdyiHrtWPTPbfYov3Si7+knsoAiPx9AcXtd8TglWkYOnVRIVoQWjzIsbjDx
 mpwTRzpHEez1jrrtMnlHgNo3A+Im7Dcyv+zMkd4BpRMrSJfeJXDMP45W2R+7Lax0D4kf
 mhy4aAu0ihOqlAZDvesWerEUXGbUUSiPi7xdm/0DRTRnhiHnxu7bLksLA3wTAneXSshL
 I5Jg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=I1wDnTKN
Subject: [Buildroot] [PATCH 2/3] support/kconfig: Allow appending to config
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

Using a "+=" instead of a "=" when setting a config to be merged, will
cause the value on the right side to be appended to the values of other
configs of the same name.

Note: The value must be enclosed in quotes.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 support/kconfig/merge_config.sh | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index daaa055b70dbe790578148255b490b6010815c30..26bf41cab53ea54993a15b8be4ff40940a62e793 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -123,6 +123,8 @@ fi
 MERGE_LIST=$*
 SED_CONFIG_EXP1="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*/\1/p"
 SED_CONFIG_EXP2="s/^# \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1/p"
+APPEND_EXP="^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)+=\"\(.*\)\""
+SED_CONFIG_APPEND_EXP="s/$APPEND_EXP/\1,\2/p"
 
 TMP_FILE=$(mktemp -t .tmp.config.XXXXXXXXXX)
 
@@ -152,7 +154,23 @@ for MERGE_FILE in $MERGE_LIST ; do
 		fi
 		sed -i "/$CFG[ =]/d" $TMP_FILE
 	done
-	cat $MERGE_FILE >> $TMP_FILE
+
+	CFG_APPEND_LIST=$(sed -n -e "$SED_CONFIG_APPEND_EXP" $MERGE_FILE)
+
+	for CFG in $CFG_APPEND_LIST ; do
+		OLDIFS=$IFS
+		IFS=','
+		set -- $CFG # Config name ends up in $1 and value in $2
+		IFS=$OLDIFS
+
+		if grep -q -w $1 $TMP_FILE ; then
+			sed -i -e "s/$1=\"\(.*\)\"/$1=\"\1 $2\"/" $TMP_FILE
+		else
+			echo "$1=\"$2\"" | cat >> $TMP_FILE
+		fi
+	done
+
+	sed -e "/$APPEND_EXP/d" $MERGE_FILE | cat >> $TMP_FILE
 done
 
 if [ "$RUNMAKE" = "false" ]; then

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
