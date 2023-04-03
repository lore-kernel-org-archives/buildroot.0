Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A19C7619A
	for <buildroot@archiver.kernel.org>; Mon,  3 Apr 2023 01:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4940410D4;
	Mon,  3 Apr 2023 01:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4940410D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HcuHG_tdSFyR; Mon,  3 Apr 2023 01:35:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBF6E410D1;
	Mon,  3 Apr 2023 01:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBF6E410D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C927C1BF36C
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 01:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0E51410D1
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 01:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0E51410D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLa4Lj8_9o0s for <buildroot@lists.busybox.net>;
 Mon,  3 Apr 2023 01:35:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89206410CB
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89206410CB
 for <buildroot@buildroot.org>; Mon,  3 Apr 2023 01:35:44 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id w133so20658478oib.1
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 18:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680485743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xfa5ANU+B4bNLy5Cy5TmBWEEyXNOGXDlpM1XJElYzNU=;
 b=djQ3XVmoVwFJeZtOHi5jr/NHjL1a/3zbmwnbsSGG57O/gL9wzq5PzA0kzLnCvE9k9I
 F/UpEMjXMUteFf/cUp6cYh9IqunbMqtfA1RnOu9MuqMZbyQnM6cwv/FfaN0FbFtjBRD2
 aRS/EApSVfGvqWUXU/NhfGk/tm5FuBIx4UxOFJrJunVllIlWpR914zyZKbSdNsLz8gdF
 37M5/CFaz4cTO4brAOKzM48+EHyLubfnZO2j9i2eB/YGjqzdYElWfYVqt/gXgtydb6k/
 /Jm3CXJaieTcAsaqZP/a3mSVaHjDvsH31Oa55ZSxA7CM/rTlq24+J9hDNK+uD3tdSAct
 GO1g==
X-Gm-Message-State: AAQBX9fohDC2+ZVnmAJxZ0fY1iE9trkEhwvDXKxWm1nj2x6RowQMl1WV
 Un7GDE3Eq4xO3aNSO2yPq4OD5QK2CZ0=
X-Google-Smtp-Source: AKy350YFOtkgDHoAnjKx9zozIWz1UvZAef5CjcZ3e7p2FJ/3A3SCKt0pNVqhsdGlaZA8GdFMsam64A==
X-Received: by 2002:aca:1201:0:b0:389:234:6117 with SMTP id
 1-20020aca1201000000b0038902346117mr11202919ois.22.1680485743316; 
 Sun, 02 Apr 2023 18:35:43 -0700 (PDT)
Received: from localhost.localdomain
 (76-250-43-185.lightspeed.mdsnwi.sbcglobal.net. [76.250.43.185])
 by smtp.gmail.com with ESMTPSA id
 o47-20020a4a95b2000000b00524f47b4682sm3479517ooi.10.2023.04.02.18.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 18:35:42 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Apr 2023 20:35:30 -0500
Message-Id: <20230403013530.3502-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680485743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xfa5ANU+B4bNLy5Cy5TmBWEEyXNOGXDlpM1XJElYzNU=;
 b=pHmIeMfshRX3+vR7YNKkrTXxMAEVa/6r1QEBfQ1jkc11xYq/HcZ6XNCXPfulctUHJA
 j/EByCqOs2xdUzWmPenOodm+iCJ46JUL/2dU2+GOyyg+VQ5EiX9wl7d1iaQqinhN8mVi
 7HTEU4m8PWB6q9tB1mSyl4ZIZWxotqPKFNIY0WZBJ6m5qV2mi5kEPzoCbzmRJ3Js/Zu/
 opz8RgiVQ9z2XNnhI4MFIg25km8XagurwEw9YVJdzIfUuYo6z1kPxV+/QEMFh5IL67rK
 nzHyPcSVlzf/4ukbjvbNLefUHV+jGPthUhMMCEY3Yc+L1WAcsHtQKw+mhQKb9Zs8OG+Y
 WoSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pHmIeMfs
Subject: [Buildroot] [PATCH] utils/check-package: drop six usage
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
Cc: Vincent Fazio <vfazio@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The shebang in check-package now defines python3. There is no longer a
need to maintain support with python 2.x.

See-also: 02b165dc71 (check-package: fix Python3 support)

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 utils/check-package | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index 98a25bd0b2..46f2897b51 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -6,7 +6,6 @@ import inspect
 import magic
 import os
 import re
-import six
 import sys
 
 import checkpackagelib.base
@@ -218,12 +217,9 @@ def check_file_using_lib(fname):
         if fail > 0:
             failed.add(name)
         nwarnings += warn
-    if six.PY3:
-        f = open(fname, "r", errors="surrogateescape")
-    else:
-        f = open(fname, "r")
+
     lastline = ""
-    for lineno, text in enumerate(f.readlines()):
+    for lineno, text in enumerate(open(fname, "r", errors="surrogateescape").readlines()):
         nlines += 1
         for name, cf in objects:
             if cf.disable.search(lastline):
@@ -233,7 +229,7 @@ def check_file_using_lib(fname):
                 failed.add(name)
             nwarnings += warn
         lastline = text
-    f.close()
+
     for name, cf in objects:
         warn, fail = print_warnings(cf.after(), name in xfail)
         if fail > 0:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
