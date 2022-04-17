Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954EDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 21:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F28D241DC0;
	Sun, 17 Apr 2022 21:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGjHNMGHvNiU; Sun, 17 Apr 2022 21:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADCF941DB9;
	Sun, 17 Apr 2022 21:33:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BADA1BF20D
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 21:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57DDE611FA
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 21:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlfnFaX6KpWf for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 21:33:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FA8A611F9
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 21:33:14 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u3so16660198wrg.3
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 14:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gze57hVbnUqsBNmjZVPxecDlKpj9QmKKn1kbujiKdGs=;
 b=kBXhFHzkyTcYi6ZyRi1wNdaLuuHBU928jBEPIEulWUZqXBGt6nc4GzhJGCkD9coUO1
 JgzMQ8mLEP+zPVjLHg5uWXpIg+Acb8I3bmhd+oCuD61Fmk2jv5gQ/tENNk+7TRe+ribR
 o3JqHLxoTLMf9DeujorjyDRvk7+bTW1+0PMhBaKy6mIkqf9spsWbxNI06+p7a+1qNzNv
 AVkAbInquPjVjcPNT/qksqrC8+9LVo3nSkShCkeZSpqIpM96k+SJWhPdFmC6IjDkrsGm
 2lWEOXP3qapaS5wxDHFcMHWaNDMtJaHbK7T34oSGFuZdJqmX9WYv0AW4w/FPCzoppEe0
 j7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gze57hVbnUqsBNmjZVPxecDlKpj9QmKKn1kbujiKdGs=;
 b=re/aJrxKA2emEXtRt/g0Kqn2Pl5n8iJfnRctlvu+KvssVAO0CEVQD/nFqWMRXc3jrw
 WYfbgjMCvXmXs/0w92N6nXUpsnpSvNn/sDKCxZO8iSjpHIhVOgy+5B9BYS45yx3GqU5T
 f9VP5e9brr18Z4zNMJeez+lLLgE5E+06GujzSri4Vqt0Um3abcp2ehh6//ljmLBfUvKH
 bokfN07OVLxUh8/JfAfGJnrSu6Z0n9OUY5Jum1ZUa6WYrYxxx/a2caAsMvuuQ8FDjJef
 EV5z5pUTFXUs/pdOZUWEU7h3Qh2Lahjn5htqG74dPSKRXdwG6/n0px1O3/mUnNIrlYrn
 g7HQ==
X-Gm-Message-State: AOAM532mlutLzmiLKnfg2CU6ZgseiWxaBLXT2KuMO/mbsb1bZcQoqyJr
 jKFF+GNu6jxwWoK96r75S+/OO94eJXA=
X-Google-Smtp-Source: ABdhPJwbUgjWeuD6Z46y8KRHJKtQLDXCmHvJa6MGMh2K35LRzytIxd+y8/2M9vCJjm2yBnrSF+88bQ==
X-Received: by 2002:a5d:6201:0:b0:207:8d91:aaa9 with SMTP id
 y1-20020a5d6201000000b002078d91aaa9mr6237199wru.262.1650231192027; 
 Sun, 17 Apr 2022 14:33:12 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n32-20020a05600c3ba000b0038ed068052fsm11254644wms.19.2022.04.17.14.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 14:33:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Apr 2022 23:31:11 +0200
Message-Id: <20220417213111.664923-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/quazip: doesn't build with zlib-ng
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

quazip doesn't build with zlib-ng since bump to version 1.9.9-b1 in
commit 1f7b12a0b4572d7e763c431a63c22cfb912b8b14 and the removal of
z_crc_t and FAR:
https://github.com/zlib-ng/zlib-ng/commit/4db4cfdb5badc8860f7410732b12c45216d709b3
https://github.com/zlib-ng/zlib-ng/commit/0db1040667b13c0f9405af810f669857a487b08e:

/nvmedata/autobuild/instance-16/output-1/build/quazip-1.2/quazip/unzip.c:196:11: error: unknown type name 'z_crc_t'
  196 |     const z_crc_t FAR * pcrc_32_tab;
      |           ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/02272c154ce58bacf0518dab5fc1ef0084121e1a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quazip/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/quazip/Config.in b/package/quazip/Config.in
index e980297558..a670ed458c 100644
--- a/package/quazip/Config.in
+++ b/package/quazip/Config.in
@@ -1,10 +1,13 @@
 config BR2_PACKAGE_QUAZIP
 	bool "quazip"
+	depends on BR2_PACKAGE_LIBZLIB
 	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_ZLIB
 	help
 	  QuaZIP is a simple C++ wrapper over Gilles Vollant's
 	  ZIP/UNZIP package that can be used to access ZIP
 	  archives. It uses the Qt toolkit.
 
 	  http://quazip.sourceforge.net
+
+comment "quazip needs libzlib"
+	depends on !BR2_PACKAGE_LIBZLIB
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
