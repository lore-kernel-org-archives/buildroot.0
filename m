Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F04C46467
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E68A6812E2;
	Sun, 27 Nov 2022 13:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E68A6812E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cd_1HpNNG6fi; Sun, 27 Nov 2022 13:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12C948144F;
	Sun, 27 Nov 2022 13:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C948144F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7200B1BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E190400D0
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E190400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABFzcfJGxSSN for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78D0B400B8
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78D0B400B8
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:25 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id h132so9033968oif.2
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A8yll0irFcKidjDx9shXry21SMl8cILBTTNyIp9otbg=;
 b=LjcZ+LAzoXzI06PdPpkB7T5hvbOclMnMQZHlu20v4eKmXtxYsphCWdpgEJjGOZyrb4
 4KmUd1heAlchTRmFcmr8Hl0BHZVCiJLIkcmsqgGIyISgEDOitEqxKU+5vfNT3/Tu3j5l
 Yc/NO+lFYrM5fzK1qcLLWJ+LQXn8aoCQo539IrTxwvOA8GKGgO5CxU4NM6bA0seM+B/6
 t9ubnLHo+ryG7wn2QiC8GiGWdUcR9ijm7je7rn06VvnphOnHi2oKfGT07N+294lv8ZlB
 tnMMns0G9OSzQPtZBWWC9zvan2x7mQe3U7NU7bS/ZT0hpPaIii8BMxgx7r2s+WsrzD7y
 Nq/Q==
X-Gm-Message-State: ANoB5pmMQVOG6l1jgdytlbY1ZiGYwBbZU8d6KmaQqcLKz4St6s4ySx3h
 olr1DEa+c0bF3QUC5QXGW4aX3n2G0ms=
X-Google-Smtp-Source: AA0mqf6RYPxS4uoTDI+Qmim3LDxVVIKEQZYq0dGSh8Iyyt7aip/v3SH9hnd+phhJymdbGV/3M7tXoQ==
X-Received: by 2002:aca:180c:0:b0:35a:13a4:c1e3 with SMTP id
 h12-20020aca180c000000b0035a13a4c1e3mr13598954oih.200.1669554504476; 
 Sun, 27 Nov 2022 05:08:24 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:23 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:24 -0300
Message-Id: <20221127130739.1862398-11-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8yll0irFcKidjDx9shXry21SMl8cILBTTNyIp9otbg=;
 b=BiG+qW/EV1nbnyUbV3C+iH2MaaPBr1ii7kB/JJTLVmoT/5XG96Dk+TzFv2qvT4qXMB
 Rv50M+TGSxkJJnwR7rCq67zs+zoBI+ovMweDgXbzAIYB0B7J/V+Qmo1laitvLn6eakkr
 BdRw6y6G3mni2GTgSRPR2R+hVn94EzYlhC1x497Txpw/zoeLmHAfQ1lajMSdBvn4ITqV
 0SFLhDw5jVwlUyyOzNeY2lqammxxc9oy+9etM/AZy3zodeWOnErwWFB8WeaFDHRALxXV
 Wtw+1GIp56EgmRjvlGuyOAfoKOlInkaOT5OAkv3W2AYlGuK4qqhJdWUAdfwgUllfOojd
 r8Cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BiG+qW/E
Subject: [Buildroot] [next 10/25] package/pugixml: use explicit build options
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit upstream 986b7ffd01aedcd4f2aa16e78e4cad9313b6d7b2
"Add Cmake options for pugiconfig.hpp" added feature toogles to release
v1.12, including PUGIXML_NO_XPATH and PUGIXML_COMPACT.

Commit upstream 5f49f2c6575cc2b7d343f8d41581fe92d69d7b52
"Mark advanced options and removed redundant ones" removed CMake
specific support for PUGIXML_HEADER_ONLY and PUGIXML_HAS_LONG_LONG, but
they can still be provided using PUGIXML_BUILD_DEFINES, starting from
release v1.12.

So use the explicit build options PUGIXML_NO_XPATH and PUGIXML_COMPACT,
but keep using PUGIXML_BUILD_DEFINES to set PUGIXML_HEADER_ONLY and
PUGIXML_HAS_LONG_LONG.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Theo Debrouwere <t.debrouwere@televic.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
local build tests to check size:
pugixml-compact/graphs/package-size-stats.csv:pugixml,165216,1.9q
pugixml-default/graphs/package-size-stats.csv:pugixml,152928,1.8q
pugixml-header-only/graphs/package-size-stats.csv:pugixml,13660,0.2
pugixml-noxpath/graphs/package-size-stats.csv:pugixml,95532,1.1
pugixml-compact/defconfig:BR2_x86_i686=y
pugixml-compact/defconfig:BR2_TOOLCHAIN_EXTERNAL=y
pugixml-compact/defconfig:BR2_PACKAGE_PUGIXML=y
pugixml-compact/defconfig:BR2_PACKAGE_PUGIXML_COMPACT=y
pugixml-default/defconfig:BR2_x86_i686=y
pugixml-default/defconfig:BR2_TOOLCHAIN_EXTERNAL=y
pugixml-default/defconfig:BR2_PACKAGE_PUGIXML=y
pugixml-header-only/defconfig:BR2_x86_i686=y
pugixml-header-only/defconfig:BR2_TOOLCHAIN_EXTERNAL=y
pugixml-header-only/defconfig:BR2_PACKAGE_PUGIXML=y
pugixml-header-only/defconfig:BR2_PACKAGE_PUGIXML_HEADER_ONLY=y
pugixml-noxpath/defconfig:BR2_x86_i686=y
pugixml-noxpath/defconfig:BR2_TOOLCHAIN_EXTERNAL=y
pugixml-noxpath/defconfig:BR2_PACKAGE_PUGIXML=y
pugixml-noxpath/defconfig:# BR2_PACKAGE_PUGIXML_XPATH_SUPPORT is not set
---
 package/pugixml/pugixml.mk | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index c54148d98f..1cf81c45f3 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -12,6 +12,18 @@ PUGIXML_CPE_ID_VENDOR = pugixml_project
 
 PUGIXML_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_PUGIXML_XPATH_SUPPORT),y)
+PUGIXML_CONF_OPTS += -DPUGIXML_NO_XPATH=OFF
+else
+PUGIXML_CONF_OPTS += -DPUGIXML_NO_XPATH=ON
+endif
+
+ifeq ($(BR2_PACKAGE_PUGIXML_COMPACT),y)
+PUGIXML_CONF_OPTS += -DPUGIXML_COMPACT=ON
+else
+PUGIXML_CONF_OPTS += -DPUGIXML_COMPACT=OFF
+endif
+
 # Pugixml will automatically enable 'long long' support on C++11 compilers,
 # which means gcc 4.8+. As gcc always supports the 'long long' type,
 # force-enable this option to support older gcc versions. See also:
@@ -19,12 +31,6 @@ PUGIXML_INSTALL_STAGING = YES
 PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
 HOST_PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
 
-ifeq ($(BR2_PACKAGE_PUGIXML_XPATH_SUPPORT),)
-PUGIXML_BUILD_DEFINES += PUGIXML_NO_XPATH
-endif
-ifeq ($(BR2_PACKAGE_PUGIXML_COMPACT),y)
-PUGIXML_BUILD_DEFINES += PUGIXML_COMPACT
-endif
 ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
 PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
