Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3A5C4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 17:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D45E281521;
	Sun, 16 Oct 2022 17:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D45E281521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3LDMgAVqraU; Sun, 16 Oct 2022 17:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CC578146F;
	Sun, 16 Oct 2022 17:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CC578146F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72CBF1BF46A
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 17:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57E8160BF7
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 17:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57E8160BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BpKzdHFtPpUc for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 17:13:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62D156060A
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62D156060A
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 17:13:01 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id u10so4835737ilm.5
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 10:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RBSLH2u7tqTd17nYxvZ+897s0JW24A5ikyAyZS8oGmI=;
 b=0iZPMrLpEAmQR+UT5ioxDXK+rie/adEglL3m6t8A04GD5CJUp7lDXTeZH/LUXcEFb4
 Eb9Qpo+9YkZE0ddr/hS/Du+7iWF76EMMG+YSqgd5dORrogXEu5UPEdfbGWcwd/ixBbap
 ijJe4wtKcBQ2/o8CxffRnsdoZdyIygF1OeDsCun+xfpn1x0emTv2GMVUzOdZkPqmHg8B
 26DaVTZ30ld44eq2P9C22rcIqSk8DDdu4Yjv3CIXZeEbsWzO0MCzFLXyofl8QWTQvcBa
 NCSooisIzaz41u1WV/ra2a4ESjoxeHxn8rLp8GvrFFi1n8Iy6H9UW6sUrRIktFO5uKIp
 cdrg==
X-Gm-Message-State: ACrzQf3wrTeiP6hnQTfRM+6eGYyyLyfQe/d3wTAf8O9PfQO1i1Cr6ALB
 TvZegK7d3MTzbXCQo8gi4RzM8KlBtT0aZg==
X-Google-Smtp-Source: AMsMyM5pIZKAwb4hRdQ035DF2qEVyS70/GAh4g/jHkrBbswV+NZV46xdeMC0xV2bw7lNJQ8ZXu7D7w==
X-Received: by 2002:a92:cc0b:0:b0:2f9:f3a9:c3e7 with SMTP id
 s11-20020a92cc0b000000b002f9f3a9c3e7mr2917589ilp.253.1665940380077; 
 Sun, 16 Oct 2022 10:13:00 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 g13-20020a02a08d000000b00363e6b793d7sm3598317jah.28.2022.10.16.10.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 10:12:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 11:12:57 -0600
Message-Id: <20221016171257.1278757-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RBSLH2u7tqTd17nYxvZ+897s0JW24A5ikyAyZS8oGmI=;
 b=ledIw4zGdtRMA7weWNE6iNoKrk47IiiMlaB4DNccKo9y8xSv/uXnkTmBYNsJld3oVj
 C4BDyHIHW5uGsOVv3T/aEzgLGq0kDRviHyIUxn8JppH3XCrN65aTfnrBGOHnzmb3z5b5
 Xl+YZExKS4kVV7JPo/Wd9zI30ea9STS8a4F0u5wQ4mRtQIURcFaObsAUzxxBrPLgV5IL
 D3hG904Fey72zGu2F7mcdwZx6dTI0NvPzTA6FMUrLlgiCDMMW63sJVF5NR8dw+P3mcEY
 5z9gHBQGnYs/VXpgseSL2BEGFDkH2kF7Rao13kRDIkYf6flgUjSar4QNjT4lAd6PonXA
 Z5LQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ledIw4zG
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.59
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable new unsupported bluez5-codec-lc3 feature.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 21c3119945..9bead47bd9 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  da1fd2e6ee088aa22f5398caca76ff879e398ec9216fb6b9400c1177b8c68115  pipewire-0.3.57.tar.bz2
+sha256  32a6db3f42f00eb95a07369160a614420443ca4f4e90ac628db8ca508e08538e  pipewire-0.3.59.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 1aad4a3c5c..d7ae07170d 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.57
+PIPEWIRE_VERSION = 0.3.59
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -20,6 +20,7 @@ PIPEWIRE_CONF_OPTS += \
 	-Dspa-plugins=enabled \
 	-Daudiomixer=enabled \
 	-Daudioconvert=enabled \
+	-Dbluez5-codec-lc3=disabled \
 	-Dbluez5-codec-lc3plus=disabled \
 	-Dcontrol=enabled \
 	-Daudiotestsrc=enabled \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
