Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF7CD10F30
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 21:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF134614C3;
	Sun, 17 Nov 2024 21:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8etgOQzfCva1; Sun, 17 Nov 2024 21:13:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74A78614A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74A78614A1;
	Sun, 17 Nov 2024 21:13:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2914BDB3
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 21:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16E5642AFE
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 21:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYnE5SOkE0pe for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 21:13:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6136742ABA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6136742ABA
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6136742ABA
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 21:13:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-431695fa98bso28516225e9.3
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 13:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731877987; x=1732482787;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ByFVV7wfxKxJOjGodZHSTF/256ee5bgBHu847HZDN4Q=;
 b=PsUgh0RdPINhDmvkbslGdb5bVMVBq5UtofTC2AWWdMZDScZxvwPJYns4Was1qP2stb
 1IHUj7Mx8w52eYKcFKd3cbsWGC0ipNzFy0ZBJoXMN2OpgeU0PrxPghkQoPPPt5yOx4zA
 qyZDWEUgxatTvAZtXQCdyIkZqGuU0iPQPMOLvH4Ho48MBDdg7WAuicPhNCbLfNqOafJz
 A4SKZeSb2K3G/0kWKUgggBke/D+PWFuh8i5NzfwA9N3e3sf4KV7PwcxLn5ApF+EG2D+C
 3DuFwLGNIk2ZnZP3MNuYZ0KvGj2YWVo7eEhUHXaUgS7RVnx+1X5h8Haj+lZdB3uUDHTT
 qovw==
X-Gm-Message-State: AOJu0YzKlYQh1KzPYLcXt4YFmMnvF3gMoFGKQtcRtRyR0SPx1LfZP7IO
 mGefDd6GkefrxH+xAwQVC96DtiH3tZ1hYwZP2Zs+iwMAXWrmKcj0nZH8h2CDMm/BllzgpTrryS/
 4
X-Google-Smtp-Source: AGHT+IGKXi1C7uhUI77Vcb7tTJTNPBRsHMvCsgOpARLhB4oMLlS8AUwI3VFJhIY29Pwi3w3nh+JkBg==
X-Received: by 2002:a05:600c:4e8b:b0:431:4f29:4a98 with SMTP id
 5b1f17b1804b1-432df77c605mr80267655e9.20.1731877986969; 
 Sun, 17 Nov 2024 13:13:06 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da28ce85sm133162435e9.33.2024.11.17.13.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2024 13:13:06 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 Nov 2024 22:13:04 +0100
Message-ID: <20241117211304.2195084-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1731877987; x=1732482787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ByFVV7wfxKxJOjGodZHSTF/256ee5bgBHu847HZDN4Q=;
 b=EmsO1qINRZum1+KUs4UOQSXhmKMuFKy2KSAO7RCtr9jwaMmBvA1Ts4wwexDHS31qU0
 W/40/XYp+iyZtnvMwZ+qjIwlwZeZyGIKD9w2lUfi7Waddk9/7gO+CHwhvniQIbVw6d60
 rs3jcoIEN0u3WSN5996C0GnDu2M58suO1U+co=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=EmsO1qIN
Subject: [Buildroot] [PATCH] package/python-sip: disable parallel install
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

{host-}python-sip may fail to install on fast machine, so disable
parallel install.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8350440972 (TestPythonPyQt5)
http://autobuild.buildroot.org/results/8f2/8f24656f3a66d21f2d3c6d6b1adc6bb5f1c0c801 (2024-10-15)
http://autobuild.buildroot.org/results/6e6/6e6bbee714b10e0f04c9d17b7e0ecce057d21d2a (2022-07-15)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-sip/python-sip.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 392928f01e..f71724f68a 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -21,8 +21,10 @@ define HOST_PYTHON_SIP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
+# Race condition on fast machine between sipconfig.py install and
+# {sipdistutils.py,mk_distinfo.py} scripts.
 define HOST_PYTHON_SIP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) install -C $(@D)
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE1) install -C $(@D)
 endef
 
 define PYTHON_SIP_CONFIGURE_CMDS
@@ -42,8 +44,10 @@ define PYTHON_SIP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
+# Race condition on fast machine between sipconfig.py install and
+# {sipdistutils.py,mk_distinfo.py} scripts.
 define PYTHON_SIP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) install -C $(@D)
 endef
 
 $(eval $(generic-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
