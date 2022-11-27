Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49464C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF66060B23;
	Sun, 27 Nov 2022 13:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF66060B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZW0yJ2Xv8GVZ; Sun, 27 Nov 2022 13:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31CC3605A1;
	Sun, 27 Nov 2022 13:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31CC3605A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B58B81BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E46181457
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E46181457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IMz5WxeTE_X8 for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0555081419
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0555081419
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:40 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id v82so9038647oib.4
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bL/9Nklc3fpm7dRbc97diMLMLOLpNH116Qk74nmp3bo=;
 b=y97FmCJ+NF6uHm7fMc7Sm05Vmp8Fg5c5or8UBbuCaWrRuBB/VZ/GKIr8LIJ/fli7dF
 hBXQ+WHaDHalnbOKnlLyKOGx3szuRNV2utT8op60r7h/njGaiWtw7oaisrhl5N7lr54y
 AQ8zZDT5h0HCfzRkNnN1FLE4XKcLDBzWiTJzmvA7vgTCmW6g5855bnNjYeySyAgSB0xZ
 97TkL/BwC15WN2kLff/thsR0GoaTyOGn6xtHAN8ApDWzS0kodeBatNQqR2w2TfLj0mLA
 aVfls72MKPayRCap51crvDSXdGU0ilJSOWX5KQe7SCBK98pH/2ddl3GMQWZ43Ph6y/Ap
 4rCw==
X-Gm-Message-State: ANoB5pkiMYAlKIGvVeVFQaH3C0D7rh2vsd690iqUlUftT1v6dEZDcRKt
 sXWb/sqT1q881nZiPuzq2uC69X5UUuM=
X-Google-Smtp-Source: AA0mqf71BNWLGTboL+7FAwJewQq58JGluGmh0QiS8BvBL6h75Hp1MouKJSfufMmDCaFgX5hps0MF6w==
X-Received: by 2002:a05:6808:14d1:b0:35b:92a4:fcae with SMTP id
 f17-20020a05680814d100b0035b92a4fcaemr5057259oiw.102.1669554520137; 
 Sun, 27 Nov 2022 05:08:40 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:38 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:29 -0300
Message-Id: <20221127130739.1862398-16-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bL/9Nklc3fpm7dRbc97diMLMLOLpNH116Qk74nmp3bo=;
 b=FNDRzUWW+UjM+uwfZkQVWm+3qTGoSsjekXu7q364RHXa3NVo9d+/GrdaHHsoyWjFrK
 yJ1UT0qpSCwDJ4ri+1cK4Qzhby/MxDdQCbnRc4n2VERFQfRJ2Y5ohewCw35quK67xXy+
 GmzC317f8s/rtHkDKCiP5wCoj/4aDsEup2Phqm1cgCtU7lysTnaLfK3vf8Sn2Yatns18
 6+hKkPXk6IT1p+KiEf9I51TNL4mcv2lRBp9ku8Oy7SBbIKxpSsZsG7wAvW4u98r8xshk
 iijqZsbtltqOCIyok+qK3VozwwVwRlhVId7HPRxFVUBJXaaiYQFL72kAL5O9URGNJgZA
 c6XQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FNDRzUWW
Subject: [Buildroot] [next 15/25] system: remove use of legacy md5 option
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "bf3626002f system cfg: remove mkpasswd MD5 format option", from
release 2019.02, moved the symbol to legacy handling, but the symbol is
still referenced.

Remove the reference to it.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 system/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index e6dcd25455..bf65b07a76 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -78,7 +78,6 @@ endchoice # Passwd encoding
 
 config BR2_TARGET_GENERIC_PASSWD_METHOD
 	string
-	default "md5"       if BR2_TARGET_GENERIC_PASSWD_MD5
 	default "sha-256"   if BR2_TARGET_GENERIC_PASSWD_SHA256
 	default "sha-512"   if BR2_TARGET_GENERIC_PASSWD_SHA512
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
