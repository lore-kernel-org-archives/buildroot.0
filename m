Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD52C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CFFA8142C;
	Wed, 22 Jun 2022 20:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CFFA8142C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gGKJTh04WkoZ; Wed, 22 Jun 2022 20:42:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A2F4813EF;
	Wed, 22 Jun 2022 20:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A2F4813EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E4FC1BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48BAB400D8
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48BAB400D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFurH8IIhgzt for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:42:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF44A400D6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF44A400D6
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:42:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q9so25051391wrd.8
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 13:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RclDbRqpiFCT7gs1THPZmXI2CLRUGP8jn/bnZRuzevA=;
 b=2VySL3j/Wy9eHZILuBdaGTvZKtVaXuQFN9frWlN+jlDPvFR6rHfwrksrWUXqtox3J2
 TgCDyeZ/SCsRG/c1prGoFP8TUIJZAvNLY4uphOcHrdIEIjhwYHufio+luCa4PTWZok/8
 M46jlcTO+ajCdsjbeURF+wCV2rQNWNBccr9uSHlC++Dn+iaQ9Tzh5cBoWok0PtdI1UwS
 K/yxKkiKVajDghBpYqgLlwl8PGBrSHvPt5N4Z8+WRlbxRhvFkmBDo3G5ahgjARms2JpN
 GHQEJaWq12t2JuvUWRtP3HcdRCT51UA2a3Lkfp2AFHXwQXSc3AjbSsNypFbN8aSVigZM
 KcEg==
X-Gm-Message-State: AJIora/pG0QSCSkHUBYmxXFRBr5k/TCIvVEHHIHbvKxyHmTbZWSkg1x3
 9y2GjUD7nsoPQ4/4QnfT/4Io/DE4nDE=
X-Google-Smtp-Source: AGRyM1vGUKPWV5eY5pySUw0AAek+aTxq4lmCBZb2frCRqqJwRc9AgpHnCOBjLo49ub69EheCu3cMyQ==
X-Received: by 2002:adf:e9c4:0:b0:21b:8397:860b with SMTP id
 l4-20020adfe9c4000000b0021b8397860bmr4799704wrn.546.1655930563868; 
 Wed, 22 Jun 2022 13:42:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b0039c84c05d88sm674275wms.23.2022.06.22.13.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 13:42:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 22:40:00 +0200
Message-Id: <20220622204000.269660-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RclDbRqpiFCT7gs1THPZmXI2CLRUGP8jn/bnZRuzevA=;
 b=HClkakIQGRtQhKjJf9s/DcZ3Qa4HGziL9zBjNthPneCd7RdwcioAuqsNtox8qnHflp
 zN2LCqxGFl8WmAFNlAjXgFQKky/v1/Sebr6QcnWhOxhoZ+lIOSlwVPNzmE1mD8HtSt9x
 tkbR98rIItzww7IttFP4J30mjMlA5kxTDUg05aDFRBFdYPOAytTHhAN8AhZyvqS4y032
 /wCAdIz3RapH2LrMiUTmmApGIf7CyMcGJ13uqc45ZMExlUtQeomYmfly0vbv+1Fd1zw1
 x+LA2RSFmxw3OkBuc3CzkMwixgo+4BHUwPFbcsU3v+LXGvSEcRblhVKpSgpREOivyqTL
 p+hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HClkakIQ
Subject: [Buildroot] [PATCH 1/1] package/dos2unix: bump to version 7.4.3
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update hash of COPYING.txt (update in year)
- Update indentation in hash file (two spaces)

https://waterlan.home.xs4all.nl/dos2unix/NEWS.txt
https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 493011fce4..a16c1aecac 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.2.tar.gz.asc
-sha256	6035c58df6ea2832e868b599dfa0d60ad41ca3ecc8aa27822c4b7a9789d3ae01  dos2unix-7.4.2.tar.gz
-sha256	db8888b7d1454348aca0c6ca851327245ef60e57afa8a6555761c8b95d24af77  COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.3.tar.gz.asc
+sha256  b68db41956daf933828423aa30510e00c12d29ef5916e715e8d4e694fe66ca72  dos2unix-7.4.3.tar.gz
+sha256  275ce1371734904b275e83bf760e3e6d2a520614545a3850c9568d1892b940fd  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 1f3e79ec4e..f16a527f2e 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.4.2
+DOS2UNIX_VERSION = 7.4.3
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
