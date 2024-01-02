Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EC3C47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF3E0400CB;
	Tue,  2 Jan 2024 22:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF3E0400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jiP23hsBJiWa; Tue,  2 Jan 2024 22:13:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B91C8404C1;
	Tue,  2 Jan 2024 22:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B91C8404C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB7E41BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0FC4409C4
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0FC4409C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SO9EIGI0v1UE for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:13:55 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F19740997
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F19740997
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d89446895so9838335e9.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 14:13:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704233633; x=1704838433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IedFQGHqentPDFOWCfOGXg82NaY5W3arUgjouULUggE=;
 b=f8cQ2EoRAfVhe/LJUU3lG48NUO/n1SuFOUbWexG9WBwsvwC/Js6SK2lH/UvR1tIw6E
 Qfe4bX/Lr/wxUSIkqJJZxxv0oFzEcVq/6kMRckVyfnU6beEENePVKIY5HcOTJxgPaCzN
 U8GCfQ1ZlPz5IobDMAVt7XR5lI9PU+53FZO+tMzdZe1W+GHsG3bEG4U8sm3/GJl+uYip
 PygMunCxzYGPmZlmYLlLUC7rtG/ZdyKicyNEHgf49kN60AxpZGY/UQP3qRLxD3uCHPgt
 OlcB5uXkwLKsgyT07BD76mlO2UvlEb4M7gaJ8hqlz+oaohRP1BVJRjINfPoCM4QNbnDL
 Sy8Q==
X-Gm-Message-State: AOJu0YweDupv4gqzctqHcNI5I2vqp01CV40dVeWJ1JSA0MMJGWCibzXg
 y+JeFYGNJCM0HBmTJzt5sKk4kGE5pyY=
X-Google-Smtp-Source: AGHT+IHqe3sBwF2eiSfdJYI62va6HumDkmC6a/F0ioobGfixXjqFpsoUup9QUs+YdlE7yScmQZQWzg==
X-Received: by 2002:a05:600c:4b1a:b0:40d:62f7:3097 with SMTP id
 i26-20020a05600c4b1a00b0040d62f73097mr41773wmp.130.1704233632875; 
 Tue, 02 Jan 2024 14:13:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c469400b0040d85a304desm277295wmo.35.2024.01.02.14.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 14:13:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 23:13:50 +0100
Message-ID: <20240102221350.2438550-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704233633; x=1704838433; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IedFQGHqentPDFOWCfOGXg82NaY5W3arUgjouULUggE=;
 b=BzjXKYRKFNEdhFhmyt1HBN8M/xs8OehDoGU9gSMrHaddBdXsEejACWq+08AHyryy8K
 VN8QfFtE1BQtHZ39ANd1zeLffBdDZlcflHmVikym4RNWOXMoPFveBUIrH/UYTu7LLkQ0
 07QqUl57KyAJaf/n3GQrnjjHFe4hyRKDW8FQa2x+55Qc/lZ9Oxl5ydKlMWtAPVAQTswh
 BlD+p7RS9UdQZyNgOH8NBsExqua+VeC9/BFPXttdSW3kCiOD5OKTWRISr/ftiY+Y8NPa
 +0BWzVsEoA4X0ieXyCLRUtIvw5HLwNXKx+Tt37EA1fzcNyaNlG73cikuaIkguPcASNS/
 LY7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BzjXKYRK
Subject: [Buildroot] [PATCH v2,
 1/1] package/irqbalance: bump to version 1.9.3
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
Cc: Karoly Kasza <kaszak@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.3
https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.2
https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix tarball hash

 package/irqbalance/irqbalance.hash | 2 +-
 package/irqbalance/irqbalance.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
index 3dd83a017f..bf33e71e48 100644
--- a/package/irqbalance/irqbalance.hash
+++ b/package/irqbalance/irqbalance.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  883d3f6296f7e4a17e09dc2c91bd972e110fe574c119d9e45ec0c4e35c7317bb  irqbalance-1.9.0.tar.gz
+sha256  8d698799251ea8518f342f36be26f2f092df51189f6777db33116d40cf0dae6c  irqbalance-1.9.3.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index abd64e6b9e..5d1bd48002 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = 1.9.0
+IRQBALANCE_VERSION = 1.9.3
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
