Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4A0C7EE23
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 16:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3BA840BD2;
	Fri, 24 Feb 2023 16:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3BA840BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QgnQIkqov7qk; Fri, 24 Feb 2023 16:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CDDE40CB4;
	Fri, 24 Feb 2023 16:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CDDE40CB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E50021BF33D
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 16:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9C6041954
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 16:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C6041954
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xrdtRn_hVXCo for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 16:31:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81EBD41BE9
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81EBD41BE9
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 16:31:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 p18-20020a05600c359200b003dc57ea0dfeso2647713wmq.0
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 08:31:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X+dEJH8njIRqVcsk2E1tJLy062WYFwes3hdO7eeVohs=;
 b=yDMDWg7KxMZouIRKp0i9n/ed11SDpDHGInrHMFqNLIaE4Wuno0rDolOL1Eeu2n9XWB
 rkqujcCaqAvFknGIZLHwXm+p4JEMW/Zr+z4KrJNLrf/ef9nFDE+AXW9Htd1VpS5WjtQx
 jzefsFXCbDEXVLTPu75EAZdIw3rTDHhk/MT/7lyvWuSqhoXbHBNNDHMFOfH7q8qLECcn
 dVDYWkUFbuRSHi+pO5tRyCklCBeqYDWbCX2pzfIZE5r1DLnkGuI6Qw8M0kiFTkR/LoT+
 +I6mYtCLpzynZHdLY+vcFYnrHnYYQZOWaZGVbuiR1X2tQpKNL97dlEMU4c3/vYNNQl4g
 j/7w==
X-Gm-Message-State: AO0yUKVj6Uz/7QYI1I3G43chFlJAlbvKwcr4ACBQqtA5lj/jm9xXI8dr
 qTNxHhaB1k3ldtC0adF3rF9NRhYM9mQ=
X-Google-Smtp-Source: AK7set8zwJTKaX6lgTMxHva7iZYCd8oEeQ3hUXAUXDOmxCfu+akGWgXD7B4rTCnIwcvT5oEmquWMaw==
X-Received: by 2002:a05:600c:5013:b0:3dc:4313:fd1e with SMTP id
 n19-20020a05600c501300b003dc4313fd1emr12109316wmr.34.1677256279293; 
 Fri, 24 Feb 2023 08:31:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t4-20020adff044000000b002c5694aef92sm13575558wro.21.2023.02.24.08.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:31:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 17:31:16 +0100
Message-Id: <20230224163116.46934-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X+dEJH8njIRqVcsk2E1tJLy062WYFwes3hdO7eeVohs=;
 b=YCRzlNw5Mdf7S0m09OafiU9MBNCC49a4ccxr7miaV06mEfKSO4uIBfZFuOzrD8fdw3
 EJSYlZU3v22/qoTgUl5r5gdpGQgFAwHCKYBnTZKHUbJWIy0oRVqSUlp5168MW2SaodzW
 EeRK/9BwfWd2R/PtNcTIDwXgNk85F3ybaIEU3OtOxO+Wnjv1AENvMDYvKYWOnh3U2P+Q
 SFedRttRU8Zesj1KAsd4swe2sBDV3SNnr4yVk51UrXl1I3Hf45h7jjLDL2QstjM5oKVD
 /xX20l3QlQ9WCOou030q4H8PfZDltxK6QBm76WkI1QPu9jEd5PwA7vCnK3rKQWDlBIy3
 FI7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YCRzlNw5
Subject: [Buildroot] [PATCH 1/1] package/hawktracer: bump to
 3c22b3908912e2ec727fd2ddc5dbfe7464e6b4a5
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure with gcc >= 12:

/tmp/instance-8/output-1/build/hawktracer-2ec19d71923344148928ef45fce549eda67030a4/hawktracer.cpp: In function 'HT_Thread* ht_thread_create(ht_thread_callback_t, void*)':
/tmp/instance-8/output-1/build/hawktracer-2ec19d71923344148928ef45fce549eda67030a4/hawktracer.cpp:1006:28: error: no matching function for call to 'operator new(sizetype, std::thread*)'
 1006 |     new(&th->th) HT_Thread();
      |                            ^

https://github.com/amzn/hawktracer/compare/e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8...2ec19d71923344148928ef45fce549eda67030a4

Fixes:
 - http://autobuild.buildroot.org/results/d18a1b2ee6cdcb289567ae90b2d836844427b5f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hawktracer/hawktracer.hash | 2 +-
 package/hawktracer/hawktracer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hawktracer/hawktracer.hash b/package/hawktracer/hawktracer.hash
index 47a8b35b6b..29d00e29ec 100644
--- a/package/hawktracer/hawktracer.hash
+++ b/package/hawktracer/hawktracer.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  a48e26082fd644222d4a20ecfd5a34700865cf572d41b7eac5b0c8242fef9c5f  hawktracer-2ec19d71923344148928ef45fce549eda67030a4.tar.gz
+sha256  099f76d5be18ad5d714fded0c6f889f588986cdde2b31f2c0058413698a5f35c  hawktracer-3c22b3908912e2ec727fd2ddc5dbfe7464e6b4a5.tar.gz
 sha256  2f377333e64ad08ad3afec8ed6c2c96ced2a6d7d67443eb2784a931bb7b3fd59  LICENSE
diff --git a/package/hawktracer/hawktracer.mk b/package/hawktracer/hawktracer.mk
index fd635e350d..462d073755 100644
--- a/package/hawktracer/hawktracer.mk
+++ b/package/hawktracer/hawktracer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAWKTRACER_VERSION = 2ec19d71923344148928ef45fce549eda67030a4
+HAWKTRACER_VERSION = 3c22b3908912e2ec727fd2ddc5dbfe7464e6b4a5
 HAWKTRACER_SITE = $(call github,amzn,hawktracer,$(HAWKTRACER_VERSION))
 HAWKTRACER_LICENSE = MIT
 HAWKTRACER_LICENSE_FILES = LICENSE
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
