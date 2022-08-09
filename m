Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D37CC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 07:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFF92818A7;
	Tue,  9 Aug 2022 07:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFF92818A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DsrLr_JJO7Dn; Tue,  9 Aug 2022 07:59:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 295EE81351;
	Tue,  9 Aug 2022 07:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 295EE81351
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C10931BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AA56408B7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AA56408B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k2FIkMFiz6dM for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87E484085F
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87E484085F
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:30 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id qn6so8991365ejc.11
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yIuFsiSEILE2elDzN8CZL7F/DWBHbbLyK9szwcw7uak=;
 b=fuouQj5lxzHcEN2Bu34KMuAzwwBs6G6r32M8SXvH2b24JwYwBSu7xj7UZyiyeRwpQZ
 wxBdiso/RrK2Zd9AWsggb2JqNJNCUuNSniS76G+tXSCwipC8T6X4q9XYgy4sgKbsOYRQ
 qMLVkR9ph1fqBb/pB0jvt0cyL7EUqh3+Iaj/Ov4aRAGBZ803EAhOkZy4cNhkagSQVzA6
 b85gU9KMrubdivEveRukLrdiAST46N7Qt7s066uO38QOfmR0uLeidKyvPdGzE381ipRk
 /X0gseWLQ9yPgm1Guxvo3ud/bLY+lU2RwNkRgM/ZGwbIm/jAfmkbHKg92ghxmZ82TMwo
 AKqQ==
X-Gm-Message-State: ACgBeo2L/mIVwHEqhxgo99HLsKPsPz+aUwLukcVL3tnKX7Rw46gccCei
 kYxqYYjJtXdw7INBr77POwnCW+Xy828=
X-Google-Smtp-Source: AA6agR7liyOeQvV0ITSfDl68Jph85X+F/e2+VYKBLvLTbp2ubpK6ky3nXyM6W+8MR4WalV2naJH5Pg==
X-Received: by 2002:a17:907:1c0a:b0:730:9a59:3891 with SMTP id
 nc10-20020a1709071c0a00b007309a593891mr15999899ejc.453.1660031848559; 
 Tue, 09 Aug 2022 00:57:28 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:28 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:56:58 +0300
Message-Id: <20220809075704.86472-8-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yIuFsiSEILE2elDzN8CZL7F/DWBHbbLyK9szwcw7uak=;
 b=fgqMuNyZlwSg+f661fw8O6SF/2hJyk1nZUVnOCLkmixsbteJeMitlPLBqote4b13JY
 WQtuadDHNXE2WLuANzSpR+0JVDuZkUwn6YgDdue7i65HDYmiGnd2LTw+ltwNz7zu96j4
 pgsxfSYTTgP4je5Jxq9hthxIvjvUCV7iVbV54UV/jWlzHGGNlqedpDT1TtPITnF5Jy+p
 KhT+fGyRMj7yUHsicYhUiIXL+Gs2U2M4LsF0mS1fXQJgJSVEnj9Z08I9XJKs3FbpVxAQ
 ljVpZlO2xvZ9hY4jNoEAMsB4fRgtASQiqRPoWRqFLfdilvJi5Ho4mfMaoCKDTXGY4AbT
 XNyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fgqMuNyZ
Subject: [Buildroot] [PATCH 07/13] package/nodejs: don't install nodejs
 host-tools
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

The target-build should build these host-tools now.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/nodejs/nodejs.mk | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 4713971169..e07e958407 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -114,13 +114,6 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--ninja
 endef
 
-NODEJS_HOST_TOOLS_V8 = \
-	torque \
-	gen-regexp-special-case \
-	bytecode_builtins_list_generator
-NODEJS_HOST_TOOLS_NODE = mkcodecache
-NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)
-
 HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS)
 
 define HOST_NODEJS_BUILD_CMDS
@@ -133,10 +126,6 @@ define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_NODEJS_MAKE_OPTS)
-
-	$(foreach f,$(NODEJS_HOST_TOOLS), \
-		$(INSTALL) -m755 -D $(@D)/out/Release/$(f) $(HOST_DIR)/bin/$(f)
-	)
 endef
 
 ifeq ($(BR2_i386),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
