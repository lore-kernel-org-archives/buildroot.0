Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64924C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 10:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B85AD6124A;
	Wed, 20 Jul 2022 10:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B85AD6124A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8z1wyX51-qGY; Wed, 20 Jul 2022 10:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5B8A61257;
	Wed, 20 Jul 2022 10:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5B8A61257
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B06BB1BF2B5
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 10:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 443EE40C23
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 10:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 443EE40C23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KRJhXmldoaj for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 10:13:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5236400AB
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5236400AB
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 10:13:12 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id z22so15816239lfu.7
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 03:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=RvZ2UZ4qZaYUChd6BOHCEVjDC0cISlfgPNz4BHwdaB4=;
 b=g8FMLKlLvSQJEPO8KAJU6chnLeNY4qODTsNoakEq30fssD1Cg6rzszrlqWp2dTRqg/
 xKTDBG1SNHl4mxFvw7iunkhMQpRyDptQqLKMxLB3po/FwDVFGw5BVWQqRg1TXpv+i6zv
 JsRQ5MjWQ5o1B3UeX1CMPxWxL4VdZoO1yHQS86mFFcn8RyHjjNMcPKxMC9TRXdjl4VTc
 UHeCJwa3tls/s16xxklERHZsu8G/CF+UwxD7fwSStx6ItlDwyOIT56bfZms/vP5diYRE
 qhFuh0LMHgeZCP78i8ePI2gxp1eqt9efzA/AoEKG0A9G+aXl5nWshJkGJjTbR2gsk4hY
 Fauw==
X-Gm-Message-State: AJIora80k85WdJhl9KLS4Ulp7sAzzAuHYoAaPg/SrtZynzkhxwMwBPIU
 Sa8JTTla0m6THEt6kIxa/VPx4fDTTug=
X-Google-Smtp-Source: AGRyM1uKMVaSjMz/fZr7LIGoZuB5JJs+agRXW9eMcy8nnztS7WuP1Jlm9xTed/x4CaHLTrynp5qQjw==
X-Received: by 2002:a05:6512:1191:b0:48a:2269:e87 with SMTP id
 g17-20020a056512119100b0048a22690e87mr12679014lfr.122.1658311988470; 
 Wed, 20 Jul 2022 03:13:08 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21f:7700::af3])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a19e30e000000b0047f7bd03943sm3706363lfh.264.2022.07.20.03.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 03:13:07 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 12:13:06 +0200
Message-Id: <20220720101306.669862-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=RvZ2UZ4qZaYUChd6BOHCEVjDC0cISlfgPNz4BHwdaB4=;
 b=WfQkPXLgPVhUYmyQsTwSVJdgWbPudlfgy4Cetu6XR177t7wFAUpc9Tp94KjnQzvDsE
 X68bUcIqcJGaoeMy5vjks7Djnj5/geKYV2mtmHeigPnF8Efl0Gk4bM7wzziDdhATNTAl
 tk+IhIy0hcTgJm7ph25+9JbJQfKuMXuMBcCLq3N09cGMj+hKfHTDNmo7Kl2/To86Hf+4
 3APh/rbPCjnuAJE4VlQO9cgKuv9VsT2P8R15v3qTPpxYAe1e36niHB3+Hd9iCCKpeSoA
 a7XDyIUivP+ZM8UI6wZd0u3bssJGpL8h8nF2KQvJuW4/oOAcoS+Snnwnpb/Ty4tM5NK6
 9e1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WfQkPXLg
Subject: [Buildroot] [PATCH 1/2] package/sysklogd: install to staging,
 provides syslog() replacement
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since v2.0 the sysklogd project has provided an interposing library
libsyslog.{a,so} with a syslog() replacement, including the NetBSD
syslogp() API for RFC5424 logging.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index d6db71e50c..9e5932f8fa 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -8,6 +8,7 @@ SYSKLOGD_VERSION = 2.4.0
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
+SYSKLOGD_INSTALL_STAGING = YES
 SYSKLOGD_CPE_ID_VENDOR = sysklogd_project
 
 # Busybox install logger in /usr/bin, and syslogd in /sbin, so install in
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
