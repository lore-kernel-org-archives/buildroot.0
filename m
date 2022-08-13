Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42847C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 19:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFF3482948;
	Sat, 13 Aug 2022 19:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFF3482948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3YbTZqSo1S3t; Sat, 13 Aug 2022 19:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC5AC82779;
	Sat, 13 Aug 2022 19:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC5AC82779
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BA6D1BF215
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 19:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3104C40122
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 19:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3104C40122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5E7jTlbTqtE for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 19:59:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1777D400AF
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1777D400AF
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 19:59:49 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id bv3so4616066wrb.5
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 12:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=colAiuegEi/T0AdK1cvWSg1KR/1DOpZpKZrHMWIUdyg=;
 b=19V0eVBpVP0gYDiPkBkqtC+DL/A0vYbkppT5/egYbteMAevH2CqYsPVIcTpmvu50jU
 Yy7AuDgxwVDCGtTIXnAjTi0Xl9wz7UD6z7dPfnPvo/cJuSYIQCxNxlprwSzOlHrNJA7z
 xAZP7+ibNNWJI6XW8x31IL+kXwIsefZrBU0c5upPOW9Lq40jwLlww6xTs7oREpdZ/k4D
 pI239hupUdB1bfUKM6wazRVgx+AbA1qzcb0nCBVLZheCiSKSuRQh/PX0h+fnc211i7ZO
 czGDfnqlrE2mgrV4CLBBM4sIWcS3Lkz7g1nXNu3om9twIW2NRsFif+fmQL5Ujfj2QfC9
 z6DQ==
X-Gm-Message-State: ACgBeo0rYwkQiKKaKOXpfMjDBsZC57AbbR1PpEckBJsoGfArR6MFt1jg
 yIpSKe2rmG+UMEVQnvXbDewng9SR1kE=
X-Google-Smtp-Source: AA6agR56oUq2IXsHK9zVNjVanDycr55ulPypltirrdURvix3oYB0nIJ7x8JACOwEP7/j63Fz+h9P/A==
X-Received: by 2002:a5d:59c5:0:b0:223:808d:51bb with SMTP id
 v5-20020a5d59c5000000b00223808d51bbmr4987189wry.454.1660420786791; 
 Sat, 13 Aug 2022 12:59:46 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00f2efd4a33b7d07e8.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:f2ef:d4a3:3b7d:7e8])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a05600c145700b003a529b7bc27sm3898971wmi.9.2022.08.13.12.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 12:59:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 21:59:43 +0200
Message-Id: <20220813195943.2411510-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=colAiuegEi/T0AdK1cvWSg1KR/1DOpZpKZrHMWIUdyg=;
 b=g08yZzWkl60SxRIpSkOwC4vTO/UXYE57oV6cPdvvI/20ShRU+TT4i2QGsLpRrIsDFw
 eGnMNfJhkNHcqE9L4IqDSRtKW6C7UgEpZPO5XyCHpURlQdA82lB/p6ZTZfGyMmGZUFgT
 cabBRZmgAYOhcQCfyRF94a9AbkBE1rqg6Bifp+msJ4W94cZyrBa8lcy++WoH9eMnXM0k
 Ecaky3wnOBhWhGuNv9v2OsG5MZPg01O61ChGUHiLA1okR15xUxK/23jfGFcST4cc56Hs
 lTl4BbxdFrRwlZh56/+zfYODfDpZENKWupFHU5rH2rIvCiFXH3xP+nKFAt+z/RruHcRN
 veMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=g08yZzWk
Subject: [Buildroot] [PATCH 1/1] package/udpcast: fix musl build
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

Fix the following musl build failure raised since bump to version
20211207 in commit ecf85b4ef58873e9acf749adedfbaa90baaaf3c0:

receivedata.c: In function 'findSlice':
receivedata.c:348:2: error: unknown type name 'ptrdiff_t'
  348 |  ptrdiff_t pos = slice - clst->slices;
      |  ^~~~~~~~~
receivedata.c:17:1: note: 'ptrdiff_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
   16 | #include "fec.h"
  +++ |+#include <stddef.h>
   17 |

Fixes:
 - http://autobuild.buildroot.org/results/30208c6f175967fed6de690447a09e0c86547b24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/udpcast/0001-fix-musl-build.patch | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/udpcast/0001-fix-musl-build.patch

diff --git a/package/udpcast/0001-fix-musl-build.patch b/package/udpcast/0001-fix-musl-build.patch
new file mode 100644
index 0000000000..0e213b2793
--- /dev/null
+++ b/package/udpcast/0001-fix-musl-build.patch
@@ -0,0 +1,31 @@
+fix musl build
+
+Fix the following musl build failure:
+
+receivedata.c: In function 'findSlice':
+receivedata.c:348:2: error: unknown type name 'ptrdiff_t'
+  348 |  ptrdiff_t pos = slice - clst->slices;
+      |  ^~~~~~~~~
+receivedata.c:17:1: note: 'ptrdiff_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
+   16 | #include "fec.h"
+  +++ |+#include <stddef.h>
+   17 | 
+
+Fixes:
+ - http://autobuild.buildroot.org/results/30208c6f175967fed6de690447a09e0c86547b24
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/4MBES2CPUSUNIZTC7NXCQYS2GAE4DQSG/]
+
+diff '--color=auto' -Nura udpcast-20211207.orig/receivedata.c udpcast-20211207/receivedata.c
+--- udpcast-20211207.orig/receivedata.c	2022-08-13 21:48:06.226588614 +0200
++++ udpcast-20211207/receivedata.c	2022-08-13 21:48:40.242992238 +0200
+@@ -1,6 +1,7 @@
+ #include <assert.h>
+ #include <sys/types.h>
+ #include <unistd.h>
++#include <stddef.h>
+ #include <stdlib.h>
+ #include <sys/time.h>
+ #include <errno.h>
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
