Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04827C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 18:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A811061185;
	Tue,  1 Jul 2025 18:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrXkc4oLkIqB; Tue,  1 Jul 2025 18:57:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC43D60DC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC43D60DC1;
	Tue,  1 Jul 2025 18:57:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 798D7179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 18:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B5AC402E3
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 18:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgI64oLqZmjW for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 18:57:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1161; helo=mail-yw1-x1161.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 872B740292
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 872B740292
Received: from mail-yw1-x1161.google.com (mail-yw1-x1161.google.com
 [IPv6:2607:f8b0:4864:20::1161])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 872B740292
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 18:57:05 +0000 (UTC)
Received: by mail-yw1-x1161.google.com with SMTP id
 00721157ae682-713fba639f3so59475137b3.1
 for <buildroot@buildroot.org>; Tue, 01 Jul 2025 11:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751396224; x=1752001024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wYdWjB45755ZJ2nGChfETmlNHSyIV3KtfBR2zCtHUys=;
 b=X7mRjEJ13vbCvoWdDLVKdxxHr9b/eU69Pz271u9N6KpP4k7+jfDQEcN5GSzSapJ4H/
 8Vr152lt+0WiFjqFULxzW8uki+7I2bkY9rtfK3A3h+FMiiwdqreLONcW2+9e5DrnnCNx
 G7uoQwACH7zmhv94mgX2FOXPHjgo3a+8yZF/Wh8hDWjHbQreqnDkNjRdXZqMKXoVnXr0
 sMdUUI0Oud/uJhxB55wYcM1Bpkb+z+wgCE/4CyBCFwOlQCQ4NWqjKmICucumRztgNMab
 oVHjSwrH+03tdjHCy7FiG3mIkOdNhdM0yKeo4/07T33Cucm90YV/z0l0ajoCMQlEYq+h
 +z8Q==
X-Gm-Message-State: AOJu0YxrQAnPeDQCuBJ/7zGb4Pgxd2tYHQBw8keSyQ9l5f0os21y5n/F
 jno2pI2qd3pwT0OT36p+InA2aBQMDcQbIKBj+praFj3BwaTZ0qEx/6xw+6UQUuCCmDLx/m88BF4
 Jsu9Kb/zurNnGen4ja5qAPfgTsGesGDxGcliTXip5LHeKixI=
X-Gm-Gg: ASbGncuWtVXxGB1JUlyv0SkBUGVchomcs5eTXAWQShmlp6hlZ5A4uZBmD1b8kf6BujR
 EpzJfRk2W6OyqTHy4uGfD4oK0C7eg2E58I6nE9PtoBqsvt/ICb+5UTAWPT064jnX+eTS/nsMJ2m
 8HslRlWW1jTgUAWh3p77ppBulgi8zyT9CdzE/NtsWxuelVFqhBa3utqB39lJ2LvJeLKvnJF2coh
 WlhJwWV+vtfsCADNGShGQII244QNxahCrTpypP7/I9EBwcXpmdDLNlBwtAceRTsZ+jaxQJH/+Bn
 rdJ6NBClG64mMtT3eOAflcbEoOtdDB4itd29lXjzjpo=
X-Google-Smtp-Source: AGHT+IGeXmGknt4/BmBB3zHrQHoA88dewE+vyUyhH0Qht7rxWJi6luYVEm/wYwFsR6S3rpy4IBCfN9UeiAjT
X-Received: by 2002:a05:690c:60ca:b0:70e:70de:6512 with SMTP id
 00721157ae682-715170c83b0mr264006697b3.0.1751396224035; 
 Tue, 01 Jul 2025 11:57:04 -0700 (PDT)
Received: from localhost.localdomain ([184.144.89.37])
 by smtp-relay.gmail.com with ESMTPS id
 00721157ae682-71515be1a35sm6228027b3.7.2025.07.01.11.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 11:57:04 -0700 (PDT)
X-Relaying-Domain: jdknight.me
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 James Knight <git@jdknight.me>
Date: Tue,  1 Jul 2025 14:56:42 -0400
Message-ID: <20250701185642.2173-1-git@jdknight.me>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1751396224; x=1752001024;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wYdWjB45755ZJ2nGChfETmlNHSyIV3KtfBR2zCtHUys=;
 b=dZIX42DAzhgBgVhJIjjMmcUnWtFRqAnfAlRG73jqSpAm52hFZrw6aHBl5ITkHivujF
 jy8xG0qjTrEdPdv+xM2ET59AQ3GlkCRyAdZZM3TPbZSVisDjL1VbqZ9RKsp5aX8I8wRK
 PBn+zBAxoYt+mTywgJrRJyihMXo1AHutpwO9tXmNKuku114SkEjDiOOGhgU9u6ljKvY6
 +W6T8hh0CPDHDygIbyzfS0UF6+xOmuQxzCdYny45HsMPGsjSsMQxj7qrShM5//lWGsV1
 ZTc+tqEh48vQBe7C9PC9A8isGETLlmpontb9JSXFqkXCpbA3AE+S1BG1G/1Gg6yuRA5q
 K26Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=dZIX42DA
Subject: [Buildroot] [PATCH 1/1] utils/check-package: handle missing files
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

When running check-package before completing commits for a change, if
any files are setup for removal, check-package will throw
FileNotFoundError exceptions instead of generating a warning state. For
example:

 $ utils/docker-run make check-package
 Traceback (most recent call last):
   ...
 FileNotFoundError: [Errno 2] No such file or directory: 'package/.../0001-some-removed-patch.patch'
 make: *** [Makefile:1264: check-package] Error 1

This commit will now catch FileNotFoundError and populate a warning
message:

 $ utils/docker-run make check-package
 package/.../0001-some-removed-patch.patch: missing; unstaged file removal?
 package/.../0002-another-removed-patch.patch: missing; unstaged file removal?
 427843 lines processed
 3 warnings generated
 make: *** [Makefile:1264: check-package] Error 1

Signed-off-by: James Knight <git@jdknight.me>
---
 utils/check-package | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index a5ecc2eed8..8781d21d8f 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -257,18 +257,23 @@ def check_file_using_lib(fname):
         nwarnings += warn
 
     lastline = ""
-    with open(fname, "r", errors="surrogateescape") as f:
-        for lineno, text in enumerate(f):
-            nlines += 1
-            for name, cf in objects:
-                if cf.disable.search(lastline):
-                    continue
-                line_sts = cf.check_line(lineno + 1, text)
-                warn, fail = print_warnings(line_sts, name in xfail)
-                if fail > 0:
-                    failed.add(name)
-                nwarnings += warn
-            lastline = text
+    try:
+        with open(fname, "r", errors="surrogateescape") as f:
+            for lineno, text in enumerate(f):
+                nlines += 1
+                for name, cf in objects:
+                    if cf.disable.search(lastline):
+                        continue
+                    line_sts = cf.check_line(lineno + 1, text)
+                    warn, fail = print_warnings(line_sts, name in xfail)
+                    if fail > 0:
+                        failed.add(name)
+                    nwarnings += warn
+                lastline = text
+    except FileNotFoundError:
+        print(f"{fname}: missing; unstaged file removal?")
+        nwarnings += 1
+        return nwarnings, nlines
 
     for name, cf in objects:
         warn, fail = print_warnings(cf.after(), name in xfail)
-- 
2.49.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
