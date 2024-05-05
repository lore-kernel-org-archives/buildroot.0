Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18571C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 14:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 982E582125;
	Sun,  5 May 2024 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5m7OgxmE5xIJ; Sun,  5 May 2024 14:18:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D2EA8212E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D2EA8212E;
	Sun,  5 May 2024 14:18:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C04E1BF616
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 14:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44C528212E
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 14:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXX5lSQyuVFs for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 14:18:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6FEA82125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6FEA82125
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6FEA82125
 for <buildroot@buildroot.org>; Sun,  5 May 2024 14:18:07 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2dac77cdf43so14682661fa.2
 for <buildroot@buildroot.org>; Sun, 05 May 2024 07:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714918685; x=1715523485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j4dFt+9V8sQKGFhqGB06aDkoadm5EVV2mHqwpmSXJ0w=;
 b=aZp4j5FkEpuc7ySBYqQZm+reh7rKtRF3NDECX7sU/Ce+oQEh0iTKy+TUYU3Uu6qBUc
 YBZLIiyVhCmvWZ8w1eOI8Fw641cxz2vtpG/VChkDYW5DEln8ybW47bgZ00qDNfgbySpT
 4IufLx/yp/4v8LHYaWHUQePzAkK7MgR2iuvuPqKN/GkJdjyr+WCmn5IiOCUr1OwGn8j+
 52vsIPVRakn9R8EMc163sk/eO/NXZioqs9/X8TMlS7nYBOtYg+DNQ6twgteIfJqr8WY8
 sDa4FUklxWkNOBkM0aAb1qpYBLGol+VrnEakSA1xfnwraw0iQab4g9COnxQ3obOoKQ0C
 0Npw==
X-Gm-Message-State: AOJu0YxR53CYxoJk7qP7MJsPLTXcQZOQKcrvo39m5xOtaB+K06/2KUuF
 oc5Q1lZLZZsbHJoMvPAm1oo8q33gjw0iVno88gYRMfHgxlMOyu/wCKo4Ig==
X-Google-Smtp-Source: AGHT+IF3YALB8KC/AfoqFKALX8QZG0jSqZJfSIW3Q8q9RzSW8toIhn4sfiS76yVXW5+5f99Dwfq82A==
X-Received: by 2002:a05:651c:104d:b0:2de:1457:9d27 with SMTP id
 x13-20020a05651c104d00b002de14579d27mr5321894ljm.0.1714918684906; 
 Sun, 05 May 2024 07:18:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 bg4-20020a05600c3c8400b0041bf29ab003sm16476137wmb.30.2024.05.05.07.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 07:18:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 May 2024 16:17:59 +0200
Message-ID: <20240505141759.872371-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714918685; x=1715523485; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j4dFt+9V8sQKGFhqGB06aDkoadm5EVV2mHqwpmSXJ0w=;
 b=Ey44krV37fJSKBR0/SCc/+2AjsXUTtxiKWcXC1dPz2He1yIzMwZaOgWopmYVS4szHF
 9yC/5AsKOzvc1nxGkQulT8fVk3FoNZh1rOABOl+tr1kufeX1ksXJim9XGV8EYsOCeyXz
 4/H9GaBODSZzmLIkrtdNa0MwGFTEp7RcSHOWiTYu9QyIOPvO3nPkRCmITwcT+nPQM1ox
 E6oWj9DndE1WFu4PB8fOyimQrqb5HFXlCHBTAukz47uKSRikq6rLXIKGONXkOuQ116pF
 seCSOG0uROGRXsjvAtTC8+/ZfOzZ7LEWml7oaGNQ/noap4saqlH7kGfewM/8JWQ8HIz1
 TLlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ey44krV3
Subject: [Buildroot] [PATCH 1/1] package/shadow: fix NLS build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NLS is an optional dependency since the addition of the package in
commit f78c5cb5cae93a9e63dad4361d78e1787759382f:

/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/12.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: ../lib/.libs/libshadow.a(libshadow_la-alloc.o): in function `xcalloc':
alloc.c:(.text+0x7c): undefined reference to `libintl_gettext'

Fixes: f78c5cb5cae93a9e63dad4361d78e1787759382f
 - http://autobuild.buildroot.org/results/9f604d09745ffa1f4db3bdcfe0326c236effac0c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/shadow/shadow.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 491f271330..e4d8b67b8a 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -10,6 +10,8 @@ SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
 SHADOW_LICENSE_FILES = COPYING
 SHADOW_CPE_ID_VENDOR = debian
+SHADOW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+SHADOW_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 SHADOW_CONF_OPTS = \
 	--disable-man \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
