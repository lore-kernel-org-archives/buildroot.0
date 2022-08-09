Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2354CC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 07:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A503C408BE;
	Tue,  9 Aug 2022 07:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A503C408BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7b9GzY91_U_O; Tue,  9 Aug 2022 07:58:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AD50408BA;
	Tue,  9 Aug 2022 07:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AD50408BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C3C21BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42F91408B7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42F91408B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTI7F5GZ40Rw for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3677C4085F
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3677C4085F
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:29 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e13so14050420edj.12
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WfmDnltwfX6HBILSlv9sJmosjXpHQkf56MSSl3afL/g=;
 b=uyZsN8fDwAjc0V75NzBlFNQamopmSfJEIF6VDQDKAVUIjc7VdtsAKZeilk176bXIZQ
 oAF5DnBP/n8WGPRT22/ENj80k65xx6pZPBvSpgGBM+UMpI2lhHYdUaMmE/JN6r706f8q
 pv4WiFlK1AyzhwTQB2hj2VE1gq9S+aZd72OLPKPcs21AgDyfHqgPUO7dSRXrM7oPYe2f
 m5V4oU1o0psCsmknpgjJINALT1JJ3OM2SSvhDlDF7sfwQG2WwPDrjpMgnbf2eFCZMWow
 YONryWesQoeh1CPqOXuMA7nzjl7w6IBLYKZP3Ae63GJHy7tgAxDJAyHTJtq3fMQkl4R6
 9Kvg==
X-Gm-Message-State: ACgBeo1VfoUpP5mA7mg0bL36gRZSms2lluQa+GQ1pcJjGNZOAfotQsX/
 ZDKjDY8BeMO7rfSad7jMubmyz2o2Tfk=
X-Google-Smtp-Source: AA6agR54uY7yKLPtKSxipXDaNcb43QbdVb5t7JqMk4Sqz1GBu1h/xGnKdFUvFJdm5TuBLcQW70dczA==
X-Received: by 2002:a05:6402:40ce:b0:43d:f8a0:9c4f with SMTP id
 z14-20020a05640240ce00b0043df8a09c4fmr21089872edb.95.1660031847131; 
 Tue, 09 Aug 2022 00:57:27 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:26 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:56:57 +0300
Message-Id: <20220809075704.86472-7-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WfmDnltwfX6HBILSlv9sJmosjXpHQkf56MSSl3afL/g=;
 b=PLHDKMlAiFtdZ/Al8nHh11gb1gqMBjekWQhua54/2Q+3OvW9zXn5h0/JvC4pk4QXCX
 GIdg4W8HUix6EoXbWzwcMoBGOMfSp2tnTHLWgv5oe31hWm3n9iAozYXn+hWD6qyO8wrc
 fUvol1018wElsvFumxuTRCdlp6ByZssdTH1iSBi+xecbZC4npXBp7CNQYDF903YbTIXq
 5JhbQ4tK88JnSb199mFMcFQiauuKXChM0fbFySHi5uCACBNz8FC9fBkY/lvlDX4AFA4C
 E8R9GW3l2U28HbGPQYr90G6bdL0XLwcvWNWeAIAF/PVFg6CjgEwC6SU8auUvyS0umtF6
 BBIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PLHDKMlA
Subject: [Buildroot] [PATCH 06/13] package/nodejs: provide {CC, CXX, CFLAGS,
 CXXFLAGS, LDFLAGS}_host env vars to target-build
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, fontaine.fabrice@gmail.com,
 aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

nodejs has some cross-build infrastructure in place.
When we want to build for the target, we need to use it.
Previously, the logic was trying to use the v8-qemu-wrapper stuff, but that
wasn't working.

The proper way (or recommended by nodejs) is to provide these
{CC,CXX,CFLAGS,CXXFLAGS,LDFLAGS}_host env vars, so that it builds the host
tools to generate some code stuff.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/nodejs/nodejs.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index d15c027c70..4713971169 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -47,6 +47,13 @@ NODEJS_CONF_OPTS = \
 	--dest-os=linux \
 	--ninja
 
+NODEJS_CROSS_BUILD_ENV_VARS = \
+	CC_host="$(HOSTCC)" \
+	CXX_host="$(HOSTCXX)" \
+	CFLAGS_host="$(HOST_CFLAGS)" \
+	CXXFLAGS_host="$(HOST_CXXFLAGS)" \
+	LDFLAGS_host="$(HOST_LDFLAGS)"
+
 HOST_NODEJS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
@@ -182,6 +189,7 @@ endif
 define NODEJS_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
+		$(NODEJS_CROSS_BUILD_ENV_VARS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
 		LDFLAGS="$(NODEJS_LDFLAGS)" \
 		LD="$(TARGET_CXX)" \
@@ -199,6 +207,7 @@ endef
 
 define NODEJS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
+		$(NODEJS_CROSS_BUILD_ENV_VARS) \
 		$(MAKE) -C $(@D) \
 		$(NODEJS_MAKE_OPTS)
 endef
@@ -235,6 +244,7 @@ endif
 
 define NODEJS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
+		$(NODEJS_CROSS_BUILD_ENV_VARS) \
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(STAGING_DIR) \
 		$(NODEJS_MAKE_OPTS)
@@ -242,6 +252,7 @@ endef
 
 define NODEJS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
+		$(NODEJS_CROSS_BUILD_ENV_VARS) \
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(TARGET_DIR) \
 		$(NODEJS_MAKE_OPTS)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
