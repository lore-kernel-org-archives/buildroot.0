Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30409C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 17:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD709611D2;
	Tue, 21 Feb 2023 17:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD709611D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvA9hlQ4wzwY; Tue, 21 Feb 2023 17:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AF5F61003;
	Tue, 21 Feb 2023 17:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AF5F61003
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 417331BF42C
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B54F820AD
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B54F820AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b202-s4JCQiD for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 17:28:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDECD82076
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDECD82076
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 17:28:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id j3so1887953wms.2
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 09:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IwLAMFhe5JXvDFivKc1DbU/ADwQdkOpYPhBBXMaJYIo=;
 b=uEjYIoK2PaEX2NxxmYkl/Qa9p6ZLl3KlhbicubsK/oZK8Eyk00xMnge/tjW+CYwHPe
 tweLcZab7PUDPScJ427pOJ9dEM2x4Z0myL9JIMxdeGZXWGQ7AEDGIEnjftFUagT9yynm
 KQnwARVE6ZDse0KYx2G8s8OoCY5T2H3oj9sYezvp4Hb84bdcUqJLeydufKEMXzL/piaf
 SGBwzBzYn60hCEZIfm8+0MAUQ10IgiAun/Zwf27bfTUDFI95nWoAtcRAa1qEyBIZdidd
 44TKy+0nMmIg+uHhTzrnBtgm8HPCrN+zDnai9NPC6JC0pruB4zMVyxH1xx1jUQd76MRZ
 /Ybg==
X-Gm-Message-State: AO0yUKUxKYMJJg7KQtl630WBmXNmvbEH46fuwwv+0YEtxbWOm2DIVadk
 wyfNW7tflvMi0xq3nvyC/qvFxrvn1EE=
X-Google-Smtp-Source: AK7set9RHlQODnZ6EduSt/ruawz6dgC8+CBpf2dPHg476sFlI9CEjEpU6YW6+NcsDl+5zFs9DFgp7A==
X-Received: by 2002:a05:600c:1656:b0:3e0:c75:7071 with SMTP id
 o22-20020a05600c165600b003e00c757071mr10690718wmn.5.1677000511543; 
 Tue, 21 Feb 2023 09:28:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j29-20020a05600c1c1d00b003e783ee3784sm3661389wms.46.2023.02.21.09.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 09:28:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 18:28:29 +0100
Message-Id: <20230221172829.3407641-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IwLAMFhe5JXvDFivKc1DbU/ADwQdkOpYPhBBXMaJYIo=;
 b=PlZAAouoONfRWR8Nfz05gVWWhb2RUF3faulVUYa/a3G1733NRCXbgSJeySWROjGN1g
 X8coFmB1gFl4fc0CT1Lkc5O1F50UwhmXvLJAa4EyFizQHXUoFMR1npJm55nA5L257L9w
 pBtM4wpbErFk3XgBq7mbQaGBCC4/7UwyTgznMccLJiH4EtWWJ3h1OQaGZ6kyB3dY6f5n
 Cr/L6+mu4zlDuYEAKExI3VSlb+uq5RYlQaC4+n/MenVWFLK1numaAZHEC3dy5MRgFWtg
 LQhYGTdZNYkheqZtM1dWd2lpE856WdJJOeWnPFNCrahedgAtAETzbqMZpb4ONv9RVD5b
 MsJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PlZAAouo
Subject: [Buildroot] [PATCH 1/1] package/mutt: fix build failure when host
 provides an old gpgrt-config
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

As already done for gnupg2 in commit
d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8, apply the same fix to mutt to
avoid the following build failure:

/home/thomas/autobuild/instance-2/output-1/host/bin/i686-buildroot-linux-uclibc-gcc -DPKGDATADIR=\"/usr/share/mutt\" -DSYSCONFDIR=\"/etc\" -DBINDIR=\"/usr/bin\" -DMUTTLOCALEDIR=\"/usr/share/locale\" -DHAVE_CONFIG_H=1 -I.  -I. -I.   -I/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Wall -pedantic -Wno-long-long -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -c -o txt2c.o txt2c.c
i686-buildroot-linux-uclibc-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'

Fixes:
 - http://autobuild.buildroot.org/results/98010be4ef70e58819ea2d17315bdac66a619b23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 0a98396d88..5cf1b6bad2 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -37,6 +37,10 @@ MUTT_DEPENDENCIES += libgpgme
 MUTT_CONF_OPTS += \
 	--enable-gpgme \
 	--with-gpgme-prefix=$(STAGING_DIR)/usr
+
+# Force the path to "gpgrt-config" (from the libgpg-error package) to
+# avoid using the one on host, if present.
+MUTT_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
 else
 MUTT_CONF_OPTS += --disable-gpgme
 endif
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
