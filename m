Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9022FC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39E3A83EE8;
	Fri,  5 Jan 2024 13:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39E3A83EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxajH4bitT7Z; Fri,  5 Jan 2024 13:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E6183EE5;
	Fri,  5 Jan 2024 13:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E6183EE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6B51BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F118436F6
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F118436F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PESyf3sS-4LW for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:27:41 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F47D436F1
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F47D436F1
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d2376db79so11894605e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 05:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704461259; x=1705066059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PHlpP2Hekwbxm0uZbbjt5gNd74sWe9DDbA5C/jHEP5Q=;
 b=Qf+ElGi4PT5xZ4TqXvS6ngxZOqppKvKVbeBt5KwvPrFGvwYf5x68epe1dcPFjy/bVp
 DwAa/IBW4JGnTImK4rFYUSFpSwJY7nfjXDjBD318+wqBzwzX/9MUoY8qA3skV2I7Jbuk
 koPLLynnCkHIWbprczNIe20k7UtExCJZuJMjq5BbAvOa7vRvTpW3Sw/yk7lF5o6zoNMx
 HiEFVI5pbidFV5hxLrFs6Ep5BOUa5XQ893B9Q1N4He7c/vnowBOm7MemhJlIucWlAUCI
 wzcY0FFzX9R6nSkaRx5vtd/JKtNg0R0/tWXzRkFho5+r+N8bxo/AdVxl9vAGcVKwV+ZX
 W+7g==
X-Gm-Message-State: AOJu0YzRLNyie4mqD5yoH8SZMxLC9qA+KLBplQWyYzjGLU+R+5cAVSDX
 1NEPrPdZxWfVD1eBHiMbC0emoBQ7hho=
X-Google-Smtp-Source: AGHT+IEqqE8u5kaaMtkRARNBCPOFyBxYNjIHucZzeiZD2D74a74iO2pzzt0K+dpm/6OXnnGzBAwLfw==
X-Received: by 2002:a05:600c:1c02:b0:40d:5a26:9d56 with SMTP id
 j2-20020a05600c1c0200b0040d5a269d56mr1209889wms.74.1704461259167; 
 Fri, 05 Jan 2024 05:27:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m1-20020a5d6a01000000b00336813bb588sm1390761wru.111.2024.01.05.05.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 05:27:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 14:27:37 +0100
Message-ID: <20240105132737.507229-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704461259; x=1705066059; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PHlpP2Hekwbxm0uZbbjt5gNd74sWe9DDbA5C/jHEP5Q=;
 b=ZDfC29xaSFezB9FZJ8QQEYGWQwJ13rUrHwIchFbunaNy8COAx7eLjeTrTvLg9cMrpr
 7/f9FRrMOWyCuqRIw8a586NW0kiVO7iKK3gvbUqpWsb/mPg64SoudPeICTwT1DdRc/sp
 nMxAQPC5Bs0VVMtHTFd0QRX1tZrL4tibQd4ik85OpWb0wyo7psXPn3sHL1Y1ZE9zY2CK
 PnPijzwAomv9+0ojhCk+sIcrDvN0c+xrPPkh/3N9aeM1LdkphJqhouXU1kSx8lGBOMWV
 7AMixNC4erbHs2A95cUe5W00ep8uUGlm4jKR+pchpFK0wnv2M5kdqQE3mS7ONeM81mfC
 oFxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZDfC29xa
Subject: [Buildroot] [PATCH 1/1] package/stunnel: bump to version 5.71
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of COPYING.md (update in year:
https://github.com/mtrojnar/stunnel/commit/86fdef8fcf07596cdaf333aa318f4d65e0310b4b)

https://github.com/mtrojnar/stunnel/blob/stunnel-5.71/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stunnel/stunnel.hash | 6 +++---
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 19633b3c18..6bfbc6d0b2 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.65.tar.gz.sha256
-sha256  60c500063bd1feff2877f5726e38278c086f96c178f03f09d264a2012d6bf7fc  stunnel-5.65.tar.gz
+# From https://www.stunnel.org/downloads/stunnel-5.71.tar.gz.sha256
+sha256  f023aae837c2d32deb920831a5ee1081e11c78a5d57340f8e6f0829f031017f5  stunnel-5.71.tar.gz
 # Locally calculated
-sha256  f10bcd7ee7b722dce40c9c674761ddb37e7e29a76a6e413e961cd52e361c5d7a  COPYING.md
+sha256  c172514e95e387eb4c77cdfbb55b635bf96e2dfcb85d785d993f64c40c4f89c4  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 95a1530eb8..9e9cf35554 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).65
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).71
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
