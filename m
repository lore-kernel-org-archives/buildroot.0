Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BB7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 11:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1100B41D6D;
	Sat, 21 May 2022 11:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9jh0_5-QGte; Sat, 21 May 2022 11:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3221D41715;
	Sat, 21 May 2022 11:53:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE8E41BF5F6
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 11:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD4CC605D8
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 11:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TAKiTHcU-3mi for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 11:53:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C5F2605B7
 for <buildroot@buildroot.org>; Sat, 21 May 2022 11:53:56 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id bg25so5756279wmb.4
 for <buildroot@buildroot.org>; Sat, 21 May 2022 04:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tp5PjRRbQXCbJ58o2eE6WZp56iwOJdGp6N9grqSwZUw=;
 b=FlZV4QIoEvqZ+d4EqRYzSc/WcobBQqucTrLgpwL9+ooM0xXigFlh6/nf//JFTiWSHB
 fjpujyOjNkJXwNWtiE+2NTLScZKWWY6xAY1Sn/LW/QSlzXlJsfH0VlCgKBOEt3pxYAiq
 JyjHQ2YiG0qwMZJ/yJpzjjBTNgro1pzAXGoR5j7TI/lG3qAKS3lXivPV39Ixv/hm09m6
 USV7UqHodLHQytyqbPT5y9E+VRDbDKw4StsJrhygzdoG8ANYlc3SvhIEAZ6B+9wHSqrh
 DEpEwVP4ffuX2pF7wlNlGtSfe3lwvl3FLDESChGLF8nR4b+QYmEkjNeArF8nw4Ek8f55
 OMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tp5PjRRbQXCbJ58o2eE6WZp56iwOJdGp6N9grqSwZUw=;
 b=kM4eDnBsi3r2ezjhIeGqBwtjoB/3o/Y8Ymve8ZJ/Qy79mRVc9ZcFB8QJsQI5dHroYh
 7LrSNpLSYFgduu2ew3qiWakgkx53LCKDLp9qUFab4YI4fM5kSdT74GHdkVCCs/v5xdpu
 Azejg3n340p/F+uYXC9dLqBl3uUoe3CniUgnOyfCvwpGZArIYNzGWPXMZbSEb+3FTI0Z
 6z1AZd7trJuBvaAn7klAsJdHNq2/2yurlbTEiMs1TYsayKUXLLW6fvu+aNcp5XPFJIrl
 4Tkcah86EJTvitNdXQ0Ibuvhk79QxkA9WOzBrjvpsQ6jNtX1lj/KZUiT2MO0Qr2GxVe0
 yRXw==
X-Gm-Message-State: AOAM5333AwetEijgjf6yvXQ/7cIL/aTiic0UWO3egr5gyKMGqL1Flgra
 SH2Q+ZfrrtoHsPDZzgJVlPm+LVw/HS4=
X-Google-Smtp-Source: ABdhPJyPDKloOM0FVDiX0s9VvcQDj3dIAfEH6X05ai2VW1M3aRURBJ+W5+IxvqqonjUIIbl3TpWUOA==
X-Received: by 2002:a05:600c:1d17:b0:394:646d:fd73 with SMTP id
 l23-20020a05600c1d1700b00394646dfd73mr12509590wms.103.1653134033815; 
 Sat, 21 May 2022 04:53:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s2-20020adfa282000000b0020fc1e8b654sm3075021wra.43.2022.05.21.04.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 04:53:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 13:50:55 +0200
Message-Id: <20220521115055.33789-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcec: fix build with gcc 10
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 10:

/nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h: In function 'bool LibCecBootloader(const char*)':
/nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h:175:14: error: converting to 'bool' from 'std::nullptr_t' requires direct-initialization [-fpermissive]
  175 |       return NULL;
      |              ^~~~
/nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h:184:12: error: converting to 'bool' from 'std::nullptr_t' requires direct-initialization [-fpermissive]
  184 |     return NULL;
      |            ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/e34bd78cc81e6da12a85c1e4ee76931818d91073

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-cecloader-h-fix-null-return.patch    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/libcec/0001-cecloader-h-fix-null-return.patch

diff --git a/package/libcec/0001-cecloader-h-fix-null-return.patch b/package/libcec/0001-cecloader-h-fix-null-return.patch
new file mode 100644
index 0000000000..424e41c0ae
--- /dev/null
+++ b/package/libcec/0001-cecloader-h-fix-null-return.patch
@@ -0,0 +1,37 @@
+From 452b2049b2ee3e73968c603e5524b2d349ac0c3e Mon Sep 17 00:00:00 2001
+From: psykose <alice@ayaya.dev>
+Date: Sat, 9 Apr 2022 17:59:11 +0000
+Subject: [PATCH] cecloader.h: fix null return
+
+returning NULL is invalid for a return type of bool when NULL is defined
+as `nullptr` instead of 0L
+
+[Retrieved from:
+https://github.com/Pulse-Eight/libcec/pull/599/commits/452b2049b2ee3e73968c603e5524b2d349ac0c3e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/cecloader.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/cecloader.h b/include/cecloader.h
+index be76468f..550f598e 100644
+--- a/include/cecloader.h
++++ b/include/cecloader.h
+@@ -172,7 +172,7 @@ bool LibCecBootloader(const char *strLib = NULL)
+     if (!g_libCEC)
+     {
+       std::cout << dlerror() << std::endl;
+-      return NULL;
++      return false;
+     }
+   }
+ 
+@@ -181,7 +181,7 @@ bool LibCecBootloader(const char *strLib = NULL)
+   if (!LibCecBootloader)
+   {
+     std::cout << "cannot find CECStartBootloader" << std::endl;
+-    return NULL;
++    return false;
+   }
+ 
+   bool bReturn = LibCecBootloader();
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
