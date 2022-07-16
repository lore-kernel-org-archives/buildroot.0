Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488A8C43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 21:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA89460F34;
	Sat, 16 Jul 2022 21:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA89460F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 91INgffe06QA; Sat, 16 Jul 2022 21:19:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAF8F60F3A;
	Sat, 16 Jul 2022 21:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAF8F60F3A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4EBA1BF487
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 21:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCD92418A2
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 21:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD92418A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTYWsbcdz2Mq for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 21:19:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 473974188C
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 473974188C
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 21:19:35 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d16so11586522wrv.10
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 14:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o3+y8nlABN0HDBu1dCB3xrmht9vG3ce8a7WjogKcvlo=;
 b=Cg7bs4nmkPyFRd+7D/ntdYKSYx8MRvENK+HOIrFjDZljK/GZNEuJhlXqL3/1WnazU5
 +cf+EFzdEG4UMaT1t2nB0GvHjbG18PNOKSE/sBlfEq3wnYq6sPfXo57en73hdGZAd8iC
 zMDhWp3qsn3vgWau81Iy87OEFUt9TbYuRrxEp3ixuTb2/+dF3UrAaT9zuFya5CUN58qG
 Ew2eYDbXqJHXwU9WQZlGp07KnZokSo66NJaVNjRLZFIrM2UZmPC0fOKiAG8CCJa/305v
 vRtlCCnWoV1tiF7zipz4iRVl4/PpF4p0nW4X1mG4q6BIW5PQxMxT7HsoMvCR8PEnFfRR
 KHqQ==
X-Gm-Message-State: AJIora9l7B2J88ivl+7XfDNRjoZJ6uDmH3FimWdfRuHXijwmfEB4YSXb
 FsX0ONUypoUqM/ScQYK9tmsD3+JvKxw=
X-Google-Smtp-Source: AGRyM1tjf23asWZ210OoA8iTHWA0ZOvr0BnmXwnQxt5luu8AxlUd+IvAYD9G0sG87W/JDz7b1fm0sw==
X-Received: by 2002:a05:6000:1547:b0:21d:9252:3f72 with SMTP id
 7-20020a056000154700b0021d92523f72mr17125126wry.600.1658006373017; 
 Sat, 16 Jul 2022 14:19:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d10-20020adfa34a000000b00210bac248c8sm7109517wrb.11.2022.07.16.14.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 14:19:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 23:16:05 +0200
Message-Id: <20220716211605.1650338-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220716211605.1650338-1-fontaine.fabrice@gmail.com>
References: <20220716211605.1650338-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o3+y8nlABN0HDBu1dCB3xrmht9vG3ce8a7WjogKcvlo=;
 b=KTJY5xf4ZDtcyrePxU9puzNX+htDeX7Ydffg0qY9wzbxg0xP3Yo8n9W+2HkDMpLRVX
 W/2Ac2F9PrVZ5SGPUPqbeChvvmgCZQpstiS9lxJ5Z1UQ0pDenrO9KmKCCl1b+sG0D1p0
 Om7qrQ+FtkEwVn2PYE/X4oKBn8C6v9YpnbUo5IPY1fgptMK7XQinrgO/+Ek71U9Y48fb
 aFZrY51zUb03YouvyK8/DlWp8MhpM6AlWXuJ1drZPbvLxhHoMZsNQq5XTElEgXZYKc0G
 avx8ROsJq6TVNZ+qvGxV5BaCM1tvzjOLtiuX7PWlTYliebVqMvpHcG20H8r5OW7TQ+Mv
 i72Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KTJY5xf4
Subject: [Buildroot] [PATCH 2/2] package/libwebsockets: fix openssl build
 without threads
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

Fix the following openssl build failure without threads raised since
bump to version 4.3.1 in commit 3a9cf51ab38b6a3a095241b8e87eab7e5b5bd617 and
https://github.com/warmcat/libwebsockets/commit/471dbf5280b2d0770cdf2803642586cee37a335d:

In file included from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets.h:661,
                 from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/core/./private-lib-core.h:140,
                 from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/plat/unix/unix-misc.c:28:
/home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets/lws-genhash.h:85:18: error: field 'ctx' has incomplete type
   85 |         HMAC_CTX ctx;
      |                  ^~~

Fixes:
 - http://autobuild.buildroot.org/results/2ae9e3249b6fcc9e6c30e7783e264fc6599e61df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...eLists.txt-fix-build-without-threads.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch

diff --git a/package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch b/package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
new file mode 100644
index 0000000000..ae46602a53
--- /dev/null
+++ b/package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
@@ -0,0 +1,47 @@
+From c83cf48b9095a6914a0844bec4439763bb0c9138 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 28 May 2022 23:15:40 +0200
+Subject: [PATCH] lib/tls/CMakeLists.txt: fix build without threads
+
+openssl can be built without threads resulting in the following build
+failure:
+
+-- Looking for HMAC_CTX_new
+-- Looking for HMAC_CTX_new - not found
+
+[...]
+
+In file included from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets.h:661,
+                 from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/core/./private-lib-core.h:140,
+                 from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/plat/unix/unix-misc.c:28:
+/home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets/lws-genhash.h:85:18: error: field 'ctx' has incomplete type
+   85 |         HMAC_CTX ctx;
+      |                  ^~~
+
+To fix this build failure, don't unconditionally add pthread if openssl
+has been found through pkg-config as openssl.pc will contain the
+appropriate dependencies (i.e. -lpthread but also -lz or -latomic)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2ae9e3249b6fcc9e6c30e7783e264fc6599e61df
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/warmcat/libwebsockets/commit/c83cf48b9095a6914a0844bec4439763bb0c9138]
+---
+ lib/tls/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/tls/CMakeLists.txt b/lib/tls/CMakeLists.txt
+index 559be9abb..a2b78c252 100644
+--- a/lib/tls/CMakeLists.txt
++++ b/lib/tls/CMakeLists.txt
+@@ -311,7 +311,7 @@ endif()
+ if (UNIX AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
+ 	set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} ${CMAKE_DL_LIBS})
+ endif()
+-if ((CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX) AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
++if ((CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX) AND NOT ((${CMAKE_SYSTEM_NAME} MATCHES "QNX") OR PC_OPENSSL_FOUND))
+ 	set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} pthread)
+ endif()
+ 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
