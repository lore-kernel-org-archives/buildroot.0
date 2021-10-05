Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03189C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 06:21:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A38C360FC1
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 06:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A38C360FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F67405B5;
	Tue,  5 Oct 2021 06:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cd9F1-D8ym9w; Tue,  5 Oct 2021 06:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A29AF405AE;
	Tue,  5 Oct 2021 06:21:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 597E01BF3C9
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 06:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4862C405AE
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 06:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DuJhys-gf0u for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 06:20:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 584A9403EE
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 06:20:58 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 a131-20020a1c7f89000000b0030d4c90fa87so1988024wmd.2
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 23:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QW2p97xDybUWcI0sTbD04iBhxMjgHCd7gJxbobu9yTc=;
 b=Hdft9CphpHQkSEoPm45iX/JvQ7eRFcjMQVoekSpzUIQaqypIHa0oaIrB/eYfW8K8CN
 L18R/wwHkQ35eRCEwIe25u/kqF7nvfbZpoZBjRC8q+2AG3qGPlNdv9ogqk36KLY4f4UC
 9aMAWyhXylojODo5TwiqJwjeH7ya4jH3e31oU/N2nULfGiC7U742ylYSNlHnPJPtf93U
 wD5kjrJNRJF0WMNMsREfvhtjnDMjbuhh2Nwf5e60duLovcP4gcyS0xLgBO9m2gnA7E5a
 Vq8joOituZHqMRjH4jVI04Re8xwt5EKwPNX/VdR9b+ZkMiOAwgJCrXhQqNtu6VMwJjMn
 FEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QW2p97xDybUWcI0sTbD04iBhxMjgHCd7gJxbobu9yTc=;
 b=nQ6UZgFYIjHePp/aqZ8u/sxQKdFOniYQ3uoP1tjItd8+UZ3B+jSHyEim27456cYESb
 Eie/0leTuDcomHHiCgPAFzckkN48qDWff3Sj6XsxqocX+EiSexcKfqQqlKPwlwd/j2Gp
 8gDChLTLNZlW5t4KTS9KYyVUGaCvxD1KFW294JmDGnS5HhYx0BDJ8ZX2JgSmLTnquwaa
 kITFUz0AbWU8M0OY7SANvRKneztfw5AxMY7yg4Xs7FTeplQOhAdDBqjlUOEN0PuJZ/yh
 Y0GT1wowPF/971cQN8GzxCy2IiPznxQajJgitLpiqi0FC0KI4Ph6DVAOUQ+pvtD/EeZo
 yDIA==
X-Gm-Message-State: AOAM532j3S1WWibRO5DkzD9UplpCwRYxS3Kfp/e8vTU832Lg8WWL10pt
 gOiFnjJQVjQGLTtBVp2ynCvckmWAN4w=
X-Google-Smtp-Source: ABdhPJxWIF1EI6C0s+i2tnjisT6cBbuPCtHXZlQ9sOxTuNaaJyraSDLDY8lSRUNkyU9W5wAmLpkhFg==
X-Received: by 2002:a1c:2785:: with SMTP id n127mr1406777wmn.155.1633414856044; 
 Mon, 04 Oct 2021 23:20:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id c204sm763441wme.11.2021.10.04.23.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 23:20:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 08:19:05 +0200
Message-Id: <20211005061905.731418-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ndisc6: bump to version 1.0.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

https://git.remlab.net/gitweb/?p=ndisc6.git;a=blob;f=NEWS;h=e0281e4f98149f25bf6d91fbf790bf8371c9f875;hb=b706f5f01aa82aa0db678fffd15a1527f330c507

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ndisc6/0001-Fix-musl-build.patch | 34 ------------------------
 package/ndisc6/ndisc6.hash               |  4 +--
 package/ndisc6/ndisc6.mk                 |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 package/ndisc6/0001-Fix-musl-build.patch

diff --git a/package/ndisc6/0001-Fix-musl-build.patch b/package/ndisc6/0001-Fix-musl-build.patch
deleted file mode 100644
index 6a13a435c5..0000000000
--- a/package/ndisc6/0001-Fix-musl-build.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 12787f5936c79b56b24ffe0a92f4370804070223 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Thu, 7 Nov 2019 21:41:34 +0100
-Subject: [PATCH] Fix musl build
-
-Fixes
-src/trace-tcp.c:67:24: error: 'TH_SYN' undeclared (first use in this function); did you mean 'TH_CWR'?
-  packet->th.th_flags = TH_SYN | (ecn ? (TH_ECE | TH_CWR) : 0);
-
-Musl guards TH_SYN with if defined(_GNU_SOURCE):
-https://git.musl-libc.org/cgit/musl/tree/include/netinet/tcp.h#n82
-
-Patch sent via email to upstream.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/trace-tcp.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/trace-tcp.c b/src/trace-tcp.c
-index 5aba9d4..1b367ae 100644
---- a/src/trace-tcp.c
-+++ b/src/trace-tcp.c
-@@ -21,7 +21,6 @@
- # include <config.h>
- #endif
- 
--#undef _GNU_SOURCE
- #define _DEFAULT_SOURCE 1
- 
- #include <string.h>
--- 
-2.20.1
-
diff --git a/package/ndisc6/ndisc6.hash b/package/ndisc6/ndisc6.hash
index 381667c2cf..d76e831208 100644
--- a/package/ndisc6/ndisc6.hash
+++ b/package/ndisc6/ndisc6.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 abb1da4a98d94e5abe1dd7b1c975de540306b0581cbbd36aff035118b2f25c1f  ndisc6-1.0.4.tar.bz2
+sha256  36932f9fc47e2844abcda7550fa1343b3af4b4208dfb61e0c9d9224aad5df351  ndisc6-1.0.5.tar.bz2
 # Locally computed
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 9845aa2c9a..ff6439e310 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NDISC6_VERSION = 1.0.4
+NDISC6_VERSION = 1.0.5
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=c11" LIBS=$(TARGET_NLS_LIBS)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
