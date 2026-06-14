Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286E1CD98C5
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB1CB60653;
	Sun, 14 Jun 2026 15:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zz2XJWC7qV1K; Sun, 14 Jun 2026 15:54:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E64C860EE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781452443;
	bh=TgT2lgK1exq+35Nv9T4vCAr1A08FZiDCMuPLRMJjluQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lPsMp52Y8usNB+nvfx0NgL88eazgg7cz1yRk5A8dLNd9lWyNMSmtXuozHF8vus731
	 HXLfw0JtSu3gmOyg4zv6fzjREZLk0L1sc8PhESUfnLBHmWapPBIyTDBpqAq76wgvum
	 uJiB1x0/ekSMIuwAaqC84RONKz9flVDaFi6oY+Dyk2Z5ZlSD80U6RZ7fh4O38OV2AU
	 iClBSNiX/YmWx3iy1Y1Q+JNb7OoMs3kyblbJymX0wIopMTqEW/ouelefXnJSUGxlqi
	 BiMn9MEyMwL6TXWP/e8P+hd5LxUIno9NNQSPMo4iD0wd94UCtG+o5Vi03ygIIsenzE
	 zwXSgnlWY8M1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E64C860EE3;
	Sun, 14 Jun 2026 15:54:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2F602EF
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5B0E40680
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XP-RM45FdgoW for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 15:54:00 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF7C04039C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF7C04039C
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF7C04039C
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:59 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3967725a77fso22611611fa.1
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 08:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781452437; x=1782057237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E6S/J8eLZtxQ+yY8U2oC4Be78Onvj+p0BQ0qmqYQsic=;
 b=Yh1ih/B650e21KJogbC+DTeyc/g0Rdn8owoDc1jBxm2/0gCTdcO1RdMk33XMv7Ar+K
 LP2HjtdzYCLB3s84hk8SaPCp65gmbYG0QhGYX1/3/dO3NKtcrQzzs9bOC9mVOahJ8CPE
 NSmJvICK7l0+wp42rmRK25ISV9i3y5yBNDkzj/OjzgMM7oGX0x0rSalynxAXeB/fwTZ3
 CZJQpIWR7TBCRO0kkhoRpw/1hJHB75YYnITftdMJySRvu48uJNZHXrI3RFtHJfywTyEE
 yDE1g57hyi6rDiGGZiXqSN9mv/Xg5lqJLT2veL1NGxVoS7x2ff1jkUiUv+3D40hrCFYc
 U/zA==
X-Gm-Message-State: AOJu0YzeC1V5aKLI37J6HLiEJ4CAEyNg5w7pYHvfnPIm+xDNtC7zqV+C
 x+eDg0lU4HbyLzZOgH2Vnp25kTBEusl+qi9HVh9nbdowCZhKU82UrU65DDRbNco78fn/1jR9Tj1
 UO0wVh0PVmQ==
X-Gm-Gg: Acq92OF/wFhirB8gKQBX55viGRXTTuzrmTEn5tAIkQtub4eJ/DAY7bNm6KLRX6FcOOA
 9/T5/efF+mMVjpj6zUQunbJ0l4v4omNNmvSyi4oDBG1F31qh/EC9C6hM/NlujYVsN/tLbxUowbv
 c3pyEdCX3RSwhec9TRiZ5bDM3UII/XbC/FM1HHu0VbMjU8fpc23iJ3o99RQ6/87ipOE+RPHo14h
 AXc0GssYyEYzBQiSz3qVQSrHRubJ1QxQFkM5IkU3xJOMEFo7miXR6HmFjjQ3cXZuxbRPkok+idK
 eL0AM7StVQf8DTk6cfhSAN6d+K8kHrguDIUACbZ/mv9d8byQChGwxn7K1jh3dIrW3/mmjyG9eWF
 5xfIqYlAAzJ7m8cZqF4puukjaBpDOWdhw7lAkt83aFUoAVBF5ervLmJpiq6xF85bbHS9gyalagx
 S5ISx//Dw418Qqa0T6SHEbAderJGEkwEQi2KHgvSWry6IlU+0M6U6AmA==
X-Received: by 2002:a05:651c:50b:b0:396:78b8:27e3 with SMTP id
 38308e7fff4ca-3992b2692d6mr28654461fa.17.1781452437478; 
 Sun, 14 Jun 2026 08:53:57 -0700 (PDT)
Received: from localhost (81-226-112-165-no2360.tbcn.telia.com.
 [81.226.112.165]) by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-39929c2979csm20053421fa.3.2026.06.14.08.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 08:53:55 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 14 Jun 2026 17:53:26 +0200
Message-ID: <20260614155328.304282-7-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155328.304282-1-j@j-ernberg.se>
References: <20260614155328.304282-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1781452437; x=1782057237;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6S/J8eLZtxQ+yY8U2oC4Be78Onvj+p0BQ0qmqYQsic=;
 b=LNY70VjDWfNiQ7rmoxSURIFgawwe4XiKtZXM3WnIRFlqYR6Sjz87fT2L49F4ddQh0j
 bpn0Fu5c4NyE8EHA9jDs8HFGB+5MdP8c6/58P795kHzpIoCNCWVRs6lvRd5IZ5X6ruPR
 S/M9zmvCSdEh+mpwhPBkbWZXx+UCFrgWcKkNtSxjsXBgBlwJJEWav6xuMQ8+MMI9mUws
 oi3i6jd8tJFMlluW62PF1SbAlRHEZNPrQXOjrLqGlZj1n2QwiNzkOF8RrW/3i6aEDeWG
 +tGPjA3ZQ/tu5Z/XaPIpXLnR9esKFENuzzBa/nzROncN2j+EflyWve7ygYBI4WEbsplC
 5SIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=LNY70VjD
Subject: [Buildroot] [PATCH v2 6/8] package/util-linux-libs: Do not install
 to target
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

util-linux-libs was introduced as an intermediate package to help break
circular dependencies with util-linux, and therefor only exists to provide
more basic versions of the libraries util-linux provide, to break these
dependency chains.

There is no need to install these to target as they will never be used
there.

Under all circumstances the libraries are built and installed by the main
util-linux package.

This only solves the confict for target, the conflict will remain for
staging as that conflict is much harder to solve.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

v2:
 - Add a note that this only solves the conflict on target. (Arnout)
   (see RFC discussion for longer explanation)
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 6716a656d2..d434a8f461 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -24,6 +24,11 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
 # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
 UTIL_LINUX_LIBS_AUTORECONF = YES
 
+# This package is only used to build other packages that have a depdendency
+# on util-linux libraries which in turn may be dependencies for the full
+# util-linux build. The libraries that are actually used on target are built
+# by the util-linux package.
+UTIL_LINUX_LIBS_INSTALL_TARGET = NO
 UTIL_LINUX_LIBS_INSTALL_STAGING = YES
 UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
