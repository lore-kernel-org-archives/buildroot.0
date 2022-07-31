Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15179C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA0C140FE2;
	Sun, 31 Jul 2022 19:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA0C140FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vWlDZta3bLGJ; Sun, 31 Jul 2022 19:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A23B140FD5;
	Sun, 31 Jul 2022 19:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A23B140FD5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5C781BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0CD082977
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0CD082977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vGk_jKeURAF for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:35:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF8998294A
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF8998294A
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:35:53 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id l13so456651vka.12
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=NE/8y4roHPjLJilfCJ0nkXdYNSsinessdsLj39qo1W8=;
 b=dG/ue63dRAGK48TNydsP3voQ/6HMGXUQPFCZir/OCe1/RVEn/K7VAS8CMFhlwUtagu
 g4UTMDRs3PGN0rB7Fb4jroe3/8aUs93JB1Mboph/Kojd4K5YKbP2O4pC3J+x9SID+3wj
 q1Ls+vy8coJPLMPztFUOgjmoTxB6tZaPCObXibSSQnZm6bplZZzf2JRl/vIfdrZR5HYa
 R0rggVtBkKE6I8Y8gBsCdxvNfGpR8bRM5naFfOAoKpRf9lY0zNpfKWhnn4+zx33+nzRg
 KQWxPHj+r/n5Fm2T93eqeBj1n5OPvLHmMa5M3JHqF7vDaeQoj9p1BY1rzCQKBFAOhdXS
 KF0Q==
X-Gm-Message-State: AJIora9nuYHWogmNhbGM9f1b4vN4iPBmzN+c24Ph4OaWmWKjoDOnIO5c
 pCWs/zNSUR2YW+hEZgW0D24qdxD5z4w=
X-Google-Smtp-Source: AGRyM1sOpP1RWZ9986IxgRfeku5AyX8T4GvkHXBKJaR2TzGWhsnP+2cD1ImWQIbLZWEDuKr7gHRESQ==
X-Received: by 2002:a05:6122:1791:b0:376:5b12:e54e with SMTP id
 o17-20020a056122179100b003765b12e54emr4811689vkf.17.1659296152731; 
 Sun, 31 Jul 2022 12:35:52 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:35:51 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:10 -0300
Message-Id: <20220731193521.1217825-4-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=NE/8y4roHPjLJilfCJ0nkXdYNSsinessdsLj39qo1W8=;
 b=Dl3Z1lO9krrRWCx028tvuR0YRrFJWkwUY/0/bGnRLJ5ZQq4YpTRV79B72S5A1D/ub6
 PLLcefLPIULFq7w4SwzyKgDgxIfwcNnYQ6vyDzBATRWKJeJ2nD41ql63CBJyTZTRbqRK
 y2C9vt1Y1HRxzSW09Gcdqm6tEcAbmEhODpabwnZYoiGh2/GbX7TVtgjwT3UJpUXZ6/Kj
 ohc9TGFIai+gnP9AOveFtetTnqaM59blQmLokmVvUyO+2rATfsG50hMdCtnRi7oNpGJQ
 LGMztpSMoyqKjSu2rWz65AInRU5gUIwk8qqQ8C3AhkuYoNpTF6qGBCdN/2RQI6XQFK9r
 Q2YQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Dl3Z1lO9
Subject: [Buildroot] [PATCH v2 03/14] Makefile: add target to update
 .checkpackageignore
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When a developer fixes an ignored warning from check-package, he/she
needs to update .checkpackageignore
By running './utils/docker-run make check-package' the developer
receives a warning about this.
Make that change easier to make, by adding a helper target on Makefile.

Add an option --failed-only to check-package that generates output in
the format:
<filename> <check_function> [<check_function> ...]
This is the very same format used by check-package ignore file.

Add the phony target .checkpackageignore

So one can update the ignore file using:
$ ./utils/docker-run make .checkpackageignore

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - on check-package, do not return error code when --failed-only is
    used
  - add a target to the makefile
  - completely rewrite commit message, in order to clarify why it is
    needed
---
 Makefile            |  5 +++++
 utils/check-package | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a743e42f91..e49080b110 100644
--- a/Makefile
+++ b/Makefile
@@ -1244,6 +1244,11 @@ check-package:
 	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
 		-exec ./utils/check-package --exclude=Sob {} +
 
+.PHONY: .checkpackageignore
+.checkpackageignore:
+	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
+		-exec ./utils/check-package --exclude=Sob --failed-only {} > .checkpackageignore +
+
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
 
diff --git a/utils/check-package b/utils/check-package
index 00be29d02a..d896e8b117 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -72,11 +72,17 @@ def parse_args():
                         help="do not run the specified functions (debug)")
     parser.add_argument("--dry-run", action="store_true", help="print the "
                         "functions that would be called for each file (debug)")
+    parser.add_argument("--failed-only", action="store_true", help="print only"
+                        " the name of the functions that failed (debug)")
 
     flags = parser.parse_args()
 
     flags.ignore_list = get_ignored_parsers_per_file(flags.intree_only, flags.ignore_filename)
 
+    if flags.failed_only:
+        flags.dry_run = False
+        flags.verbose = -1
+
     return flags
 
 
@@ -230,6 +236,11 @@ def check_file_using_lib(fname):
                   .format(fname, should_fail, IGNORE_FILENAME))
             nwarnings += 1
 
+    if flags.failed_only:
+        if len(failed) > 0:
+            f = " ".join(sorted(failed))
+            print("{} {}".format(fname, f))
+
     return nwarnings, nlines
 
 
@@ -268,7 +279,7 @@ def __main__():
         print("{} lines processed".format(total_lines), file=sys.stderr)
         print("{} warnings generated".format(total_warnings), file=sys.stderr)
 
-    if total_warnings > 0:
+    if total_warnings > 0 and not flags.failed_only:
         sys.exit(1)
 
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
