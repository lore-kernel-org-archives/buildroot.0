From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon,  5 Nov 2018 09:45:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: add patch to fix build
 failure
Message-ID: <20181105084506.3441-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch taken from:
 - https://patchwork.kernel.org/patch/10654531/

Fixes:
 - http://autobuild.buildroot.net/results/404bfbd095a7b80273391ea36ea81ba496164b80
 - http://autobuild.buildroot.net/results/233ef5c00951b5be10a59408f4a8781ecc658d74
 - http://autobuild.buildroot.net/results/eba3cf4ac21095bca5af2d5d1d69aca0c9098f9b

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 .../0002-fix-overlapping-with-strncpy.patch        | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 package/mmc-utils/0002-fix-overlapping-with-strncpy.patch

diff --git a/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch b/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch
new file mode 100644
index 0000000000..c654d1a399
--- /dev/null
+++ b/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch
@@ -0,0 +1,125 @@
+From patchwork Wed Oct 24 11:00:47 2018
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 8bit
+X-Patchwork-Submitter: =?utf-8?b?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
+X-Patchwork-Id: 10654531
+Return-Path: <linux-mmc-owner@kernel.org>
+Received: from mail.wl.linuxfoundation.org (pdx-wl-mail.web.codeaurora.org
+ [172.30.200.125])
+	by pdx-korg-patchwork-2.web.codeaurora.org (Postfix) with ESMTP id 3105E14BD
+	for <patchwork-linux-mmc@patchwork.kernel.org>;
+ Wed, 24 Oct 2018 11:00:59 +0000 (UTC)
+Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
+	by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 20E0A2A51C
+	for <patchwork-linux-mmc@patchwork.kernel.org>;
+ Wed, 24 Oct 2018 11:00:59 +0000 (UTC)
+Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
+	id 14AF62A5E2; Wed, 24 Oct 2018 11:00:59 +0000 (UTC)
+X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
+	pdx-wl-mail.web.codeaurora.org
+X-Spam-Level: 
+X-Spam-Status: No, score=-8.0 required=2.0 tests=BAYES_00,DKIM_SIGNED,
+	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
+	autolearn=ham version=3.3.1
+Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
+	by mail.wl.linuxfoundation.org (Postfix) with ESMTP id BC7952A51C
+	for <patchwork-linux-mmc@patchwork.kernel.org>;
+ Wed, 24 Oct 2018 11:00:58 +0000 (UTC)
+Received: (majordomo at vger.kernel.org) by vger.kernel.org via listexpand
+        id S1727314AbeJXT2g (ORCPT
+        <rfc822;patchwork-linux-mmc@patchwork.kernel.org>);
+        Wed, 24 Oct 2018 15:28:36 -0400
+Received: from mail-wr1-f65.google.com ([209.85.221.65]:41460 "EHLO
+        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
+        with ESMTP id S1727204AbeJXT2g (ORCPT
+        <rfc822;linux-mmc@vger.kernel.org>); Wed, 24 Oct 2018 15:28:36 -0400
+Received: by mail-wr1-f65.google.com with SMTP id q7-v6so5080352wrr.8
+        for <linux-mmc@vger.kernel.org>; Wed, 24 Oct 2018 04:00:57 -0700 (PDT)
+DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
+        d=gmail.com; s=20161025;
+        h=from:to:cc:subject:date:message-id:mime-version
+         :content-transfer-encoding;
+        bh=tIHlGPgDyddBEWtmgSHVqn9+naMOOYLC+w0Xgy/DFc8=;
+        b=JnK9VJyDWrgdSikj+IF1zNn4ymwLnrTvovJTNoeSuc/WbXaPaehINB+NESfO8RoI/Q
+         DrGoLeU+24j9ONhrVcv0uurLfzezK/Cla0MV5+KUO22oAmvKxxuoyqw6g7OOX+S1G8/+
+         PRTgUQaczdBdGIL3NdABPiKiwZimC5L/26M0Shzo73MJqsQgUwShSV8pCMjDmi9ba6Ai
+         6sc/bYy+1Rdbn/IPJ3qdrAsL8i/wM5yr0Ql7lABXuhm3B+4CI25nOZmYDJ+ffxnoJdmI
+         n+GU2Lc0H6z6sfpKluNE8z6b5Mgyj1sCyn3eX6iJhpbcyxlufUhot3/ghTlr72QLY1N5
+         r1uQ==
+X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
+        d=1e100.net; s=20161025;
+        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
+         :content-transfer-encoding;
+        bh=tIHlGPgDyddBEWtmgSHVqn9+naMOOYLC+w0Xgy/DFc8=;
+        b=fs28QqB53ZKBjalAdVPPocynqDU+plxyQ9fsmG47SLtXf8Vd6xzTg0fRm0/IEnSfjA
+         vZokBEVwxYsHdvFsaokzhQogXGtBdYA/VG1p1rPA6cFN77N+3PD1id+N5+kDkm13NSvV
+         oyVPBhjom2/sUF0ThgBRbz+9g17zgJLEFjfJlZ6iifnpdLLtcaqq+l7OrJyjDXCwc2F7
+         mww9sOA1iIX0+DaJo/pleX41qTbc13k9LpJIb0/KxrVNpdXFbaifWrZsTNVsKIHYCCVu
+         u3J9EK+OwYJel1gI0knod0VJqJ3hX8RPlr6jmLUi8W2f+iyz5MGhua8WeAyMlMi84Q7i
+         NrAw==
+X-Gm-Message-State: AGRZ1gKEYIcUsbLoxcEFyal7YaC7sbRFViARpyoOBInGVrzLSvUwmyOJ
+        eGbnyefdD+ODhxGL8tXjQ3M=
+X-Google-Smtp-Source: 
+ AJdET5ex46kvaNnNGHWO8L5LavRH43RU/n/7AhJhW2Wy4eo+zIMlWK9hhTuXm+HSLMVGFmPvDQTGvQ==
+X-Received: by 2002:adf:8141:: with SMTP id
+ 59-v6mr2197776wrm.127.1540378856365;
+        Wed, 24 Oct 2018 04:00:56 -0700 (PDT)
+Received: from cperon-Latitude-7490.event.pylonone.net ([185.7.230.213])
+        by smtp.gmail.com with ESMTPSA id
+ t194-v6sm6209850wmd.48.2018.10.24.04.00.55
+        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
+        Wed, 24 Oct 2018 04:00:55 -0700 (PDT)
+From: =?utf-8?b?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
+To: Chris Ball <chris@printf.net>,
+        Ulf Hansson <ulf.hansson@linaro.org>,
+        Avri Altman <Avri.Altman@wdc.com>, linux-mmc at vger.kernel.org
+Cc: =?utf-8?b?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
+Subject: [PATCH v2] mmc-utils: fix overlapping with strncpy
+Date: Wed, 24 Oct 2018 13:00:47 +0200
+Message-Id: <20181024110047.17274-1-peron.clem@gmail.com>
+X-Mailer: git-send-email 2.19.1
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Sender: linux-mmc-owner at vger.kernel.org
+Precedence: bulk
+List-ID: <linux-mmc.vger.kernel.org>
+X-Mailing-List: linux-mmc at vger.kernel.org
+X-Virus-Scanned: ClamAV using ClamSMTP
+
+GCC 8.2 warns about an overlapping using strncpy.
+
+Replace strncpy with a memmove to avoid this issue.
+
+In file included from /usr/include/string.h:494,
+                 from lsmmc.c:46:
+In function ?strncpy?,
+    inlined from ?read_file? at lsmmc.c:356:3:
+/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: ?__builtin_strncpy? accessing 4096 bytes at offsets 0 and 1 overlaps 4095 bytes at offset 1 [-Werror=restrict]
+   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
+          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+cc1: all warnings being treated as errors
+make: *** [Makefile:36: lsmmc.o] Error 1
+
+Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
+---
+
+v2:
+	repost with Chris Ball
+
+ lsmmc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lsmmc.c b/lsmmc.c
+index c4faa00..bcb854d 100644
+--- a/lsmmc.c
++++ b/lsmmc.c
+@@ -353,7 +353,7 @@ char *read_file(char *name)
+ 		line[strlen(line) - 1] = '\0';
+ 
+ 	while (isspace(line[0]))
+-		strncpy(&line[0], &line[1], sizeof(line));
++		memmove(&line[0], &line[1], sizeof(line)-1);
+ 
+ 	return strdup(line);
+ }
-- 
2.16.4
