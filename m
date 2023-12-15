Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA13C4167B
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 19:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85BD04175A;
	Fri, 15 Dec 2023 19:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85BD04175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYPugaFrhDEF; Fri, 15 Dec 2023 19:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A0784175F;
	Fri, 15 Dec 2023 19:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A0784175F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 230C21BF83A
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 19:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FDC580BE3
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 19:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FDC580BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AeNsRRsu7fnJ for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 19:50:23 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1286A80BE2
 for <buildroot@busybox.net>; Fri, 15 Dec 2023 19:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1286A80BE2
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c39ef63d9so10836845e9.3
 for <buildroot@busybox.net>; Fri, 15 Dec 2023 11:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702669821; x=1703274621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1pK5NXRwY3Fr8yWFKPO+jJ6fazmmLBQgi336gebLSVo=;
 b=I2BR39J4UBjIweO14WZMAuxe8DA5H8Zp/XTk0BBH+8G4aQTQ84TLO53mdVkyB8KT9S
 aYjAjh6Y+W2Y9CcFILGgU6OXVL6xRKF9jbacscple3ocqpXqnBqE9dtCm2jefRpJroyy
 RiFT+TuV+b9HvrtQjjf1FMNQn/I/C229UJ4ghrRwpVxJqOqR9Rd4echZW9l0BD1rbK0N
 0Sac6U/o4ELUhWXhIpg52prXItR6lQTJpBu7sYpB5chDjTRDladU8l7ZWsAhuoumm4a+
 MROQX5Zz6ZaTO1hjlmxT6Dn4vmAYXlKH+MQIqgUZsPb+BVkW66qo/OzxfI2F8HV/bDUU
 8eCw==
X-Gm-Message-State: AOJu0Yx+Bm2AXbZlhWi30oljtvXqVosnEFKfQjojJWj6hkwR2QFLfm2/
 j/j3TlDoGkuUbL0v5OJsFB8wUvrm5F8=
X-Google-Smtp-Source: AGHT+IGamGG+SO5DInbUafEVeEkLAw5PS55OJAJkISxx1J5FQeHUhDlkQ7HY0x9wLew1g2f0U+wH0A==
X-Received: by 2002:a05:600c:3542:b0:401:b2c7:34a8 with SMTP id
 i2-20020a05600c354200b00401b2c734a8mr6641224wmq.7.1702669820870; 
 Fri, 15 Dec 2023 11:50:20 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 f10-20020adff8ca000000b003365951cef9sm1314939wrq.55.2023.12.15.11.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 11:50:20 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 15 Dec 2023 20:50:15 +0100
Message-Id: <20231215195015.2356-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231215195015.2356-1-francois.perrad@gadz.org>
References: <20231215195015.2356-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702669821; x=1703274621; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1pK5NXRwY3Fr8yWFKPO+jJ6fazmmLBQgi336gebLSVo=;
 b=jlkEC9DaIM0dO5YxuzjqWKbaGXQDlrXx//v72MroPnlD6huxKlOxwhGqRNEiLVuNgr
 J83FwP/P8hVCiS7Cu0+9pv05J9WPDQiaXWJHEY8WJ1pZ4puY8yFx02iDwmblwQrLNdQI
 +V7UhV0JD0w6odqLzhfRsbjbj/LU1OptxXFh10LVgitHbmnA5CYtjqxdYixWCDKBYB4C
 9m6qN0HJlbsVAdrJUU4/DoWviybSUQpM7NBS4/wwRxXcqTwZGeCVbLiYjxyRKfNgeqRw
 2I95wf78/mD9HSGmBvFTRA0s1Ysd31MoVlyoL3lDzTw1xB/HW+5SU+PpNB4DAtsNAT4W
 Sq1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jlkEC9Da
Subject: [Buildroot] [PATCH 2/2] package/lua-argparse: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                      |  1 +
 package/lua-argparse/Config.in         |  6 ++++++
 package/lua-argparse/lua-argparse.hash |  3 +++
 package/lua-argparse/lua-argparse.mk   | 12 ++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/lua-argparse/Config.in
 create mode 100644 package/lua-argparse/lua-argparse.hash
 create mode 100644 package/lua-argparse/lua-argparse.mk

diff --git a/package/Config.in b/package/Config.in
index e52360448..6cb53affb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -717,6 +717,7 @@ menu "Lua libraries/modules"
 	source "package/lsqlite3/Config.in"
 	source "package/lua-ansicolors/Config.in"
 	source "package/lua-argon2/Config.in"
+	source "package/lua-argparse/Config.in"
 	source "package/lua-augeas/Config.in"
 	source "package/lua-basexx/Config.in"
 	source "package/lua-binaryheap/Config.in"
diff --git a/package/lua-argparse/Config.in b/package/lua-argparse/Config.in
new file mode 100644
index 000000000..503a001c9
--- /dev/null
+++ b/package/lua-argparse/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_ARGPARSE
+	bool "lua-argparse"
+	help
+	  A feature-rich command-line argument parser.
+
+	  https://github.com/luarocks/argparse
diff --git a/package/lua-argparse/lua-argparse.hash b/package/lua-argparse/lua-argparse.hash
new file mode 100644
index 000000000..c573ba579
--- /dev/null
+++ b/package/lua-argparse/lua-argparse.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  ea30d0643586a20aeb6349ca8cb7db63aefc21d9aa007c7b7168a7c564817879  argparse-0.7.1-1.src.rock
+sha256  9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.1/LICENSE
diff --git a/package/lua-argparse/lua-argparse.mk b/package/lua-argparse/lua-argparse.mk
new file mode 100644
index 000000000..77f6550fa
--- /dev/null
+++ b/package/lua-argparse/lua-argparse.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-argparse
+#
+################################################################################
+
+LUA_ARGPARSE_VERSION = 0.7.1-1
+LUA_ARGPARSE_NAME_UPSTREAM = argparse
+LUA_ARGPARSE_LICENSE = MIT
+LUA_ARGPARSE_LICENSE_FILES = $(LUA_ARGPARSE_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
