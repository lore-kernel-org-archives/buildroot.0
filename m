Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72A1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 16:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BD0660C10;
	Sun, 23 Jan 2022 16:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-ShE_PsLsGG; Sun, 23 Jan 2022 16:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B989360C0B;
	Sun, 23 Jan 2022 16:09:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A46CB1BF3F0
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 16:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A06EE40345
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 16:09:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ev6pAQDlS2Z4 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 16:09:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 107B640342
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 16:09:22 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id bx18so21549409oib.7
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 08:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iw0lYIPc6a8dGx0SWCxmalVPRU9lEdOfS+IrljlLcAI=;
 b=FCz0x9ke8RucbmXJxKjUahF4CZvCBHOKoIVcyDiH8vl0ONysIsy3rD5wo8TlmUxbud
 Y3bnW87w0xc0jV0XIl0C5rDaEi5ABiPM5IdCsWVwZCS6+UEAf6hSZDH83ICGIaPYTbeq
 mtpaIWG5JCP4dZ6OP2qV3c17/WuP+vvjk/L1dGxbPGQ7K76JXuJ4EkR844MYFbut7zSj
 q/HyARC+hw6eqCFVKWydSRxNeoLK4FDL4Jlr679Yx2MkaopR/rqwQ/7Ggx0I5aCQyPpG
 GRj6Q7fmrEbinZCRVXCq83iDGQLZFPs55x+VzMLrowccsAz9ugFlzhUY8Lz00tT1KHiT
 I10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iw0lYIPc6a8dGx0SWCxmalVPRU9lEdOfS+IrljlLcAI=;
 b=qK7IPXOgM9FnpCq10sx47FduMdBQuXq7TmBxbavF4wsdc30QaxjpBGvsWzHGAlqbG0
 mm90wQ4s0xS9huLnE1tAEESKyd52H9hvOTkC38mYFWPaOX9vLiY9FzcvV55nGby3ghWI
 D9bq6cTaNUuc+GX8BtfYoqOL0pvdgA8GvA08J7zNmXNUgpbEnTENqCAXWz46AL7OvX9+
 3mBKSA3eWfPnOfIyuMZYK09Dck/PXaWkMxVMXXd3jTlKhqfXmNExnDf9xsxVjap9YL52
 c/4iOwCO/hOEebFnfIndhzhHzdiYWWbqsgT3g4Mh4YDKQJDe2Ok8lcLykl/ltYfZouqO
 F4gA==
X-Gm-Message-State: AOAM531etzzSzpIvo1DjN6YXqHrfwE+18lIub3Bc05MiT+gE8cwPczx3
 m8R+j1gBf8c57uB77c7OKygXi/tRtF4=
X-Google-Smtp-Source: ABdhPJzYaZwkDt20QUrhsy3V8qDyxzlP+kbaQ51w35GjcsCj5gTzfX39PdiLNKHP9T/2/JyJT3FeMw==
X-Received: by 2002:a05:6808:1a19:: with SMTP id
 bk25mr6816886oib.26.1642954162116; 
 Sun, 23 Jan 2022 08:09:22 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id f2sm4282763oiw.50.2022.01.23.08.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 08:09:21 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 13:08:45 -0300
Message-Id: <20220123160847.2653086-3-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220123160847.2653086-1-ricardo.martincoski@gmail.com>
References: <20220123160847.2653086-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/4] utils/checkpackagelib: run unit tests on
 GitLab CI
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

... so we can catch regressions on check-package.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - none

DO NOT APPLY before applying the patch before, generating a new docker
image, uploading it, and updating the image name in the .gitlab-ci.yml
---
 support/misc/gitlab-ci.yml.in          | 4 ++++
 support/scripts/generate-gitlab-ci-yml | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index be7951b3d2..47e72c3213 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,3 +1,7 @@
+.check-check-package_base:
+    script:
+        - python3 -m pytest -v utils/checkpackagelib/
+
 .check-DEVELOPERS_base:
     # get-developers should print just "No action specified"; if it prints
     # anything else, it's a parse error.
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index bd79807914..aa43aac019 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -26,7 +26,7 @@ gen_tests() {
     local do_basics do_defconfigs do_runtime do_testpkg
     local defconfigs_ext cfg tst
 
-    basics=( DEVELOPERS flake8 package )
+    basics=( check-package DEVELOPERS flake8 package )
 
     defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
