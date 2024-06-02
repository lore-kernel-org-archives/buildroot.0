Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F97DC27C44
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F60B83196;
	Sun,  2 Jun 2024 20:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byjC1qj3AhMm; Sun,  2 Jun 2024 20:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3914C83A72
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3914C83A72;
	Sun,  2 Jun 2024 20:40:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5ED1BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 648A6402F6
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Na2XbD0UFl9Z for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3FCD2400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FCD2400AC
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FCD2400AC
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-35dc04717a1so2786257f8f.2
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360794; x=1717965594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gXzEtc/Ruyflv/s7nHqAB3x0wgNuwk0WaxN+ap22Df0=;
 b=emS3zCEMdPOdU6mKZyOdPQ1CPR05x5+zUMCz0ppFuuqXNYS3VMuKQlJci3R9HvibYZ
 YTQYODKImJWMRkYHsX251J1VOxPEngh189lqi1ntHNoBWuXvmQn4PGJ27iJ9oMtgbEd9
 kAeCnxJpWW+nhC9sH+fNBg0QEBH3qZ0oVKLY0JF/D2qA9fD6YQp9bSs2CGdvxa1DM1O8
 vkeU5c/zbRYYaSLyTGazJ9y+l+/Trx9o1PHeuOH+0/B1RqphvFZp+9KIZqObtR4MpN9P
 ZL5a8QGzRNbkOer5jd5d+LuJAC+VpuXqJJ1tXEt4Lc+XMwgnwNG5HHUf0nuiTztEorxk
 WxrA==
X-Gm-Message-State: AOJu0YwscHfRVOcvqxDDTg+LaRJUW0ePd4EkhFA/wDD5enMgj0HUKzml
 fPD/jsinEE53qQgpUiRsB1Dba3vCqK41LZAaLpQ2BK/T/pfcMO/B2E8KKA==
X-Google-Smtp-Source: AGHT+IHHhK9CSdZIgYjmGVwINyWUV4BQ5DRuV9XcOlzdrBDsVjjPQHueVeikWGMMPg9ZqGOxUBWNug==
X-Received: by 2002:a5d:67cf:0:b0:355:3f6:1ba4 with SMTP id
 ffacd0b85a97d-35e0f32ea48mr5666795f8f.64.1717360794233; 
 Sun, 02 Jun 2024 13:39:54 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:54 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:39 +0200
Message-ID: <35ac1aa10d311fb73287c4fbf95b146581beeade.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360794; x=1717965594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXzEtc/Ruyflv/s7nHqAB3x0wgNuwk0WaxN+ap22Df0=;
 b=E6cX1tQGsfU8ik0u8s1vhQBdy7YUY8kuc3u5M7u/BjGXHaDv7yAzHS0xIwk2pUIdxG
 Rvtj3t8yr4Ggwx9/oEJYysPKYspqZco4pGgjk49bI45VVpzYKGFgqdWN5N/TCnFlfEK9
 6XX+mKiqaZd8iKsn9N/hVryAuz2ZcM/OQv/oBupep/FhFZ/IwbxpkW2WgAkeEynPDXTD
 yOlA4NPSCCOeXNvb4II6izDvKCWdQY1Cq+PvX97T4KvsuNKBxrhvUwDdy3EhA/UwbAgq
 C2R6i0ilhTJmDsCUC5ZcVvVhw/58PmQH3tEa7PWQBw8D1dywHnEymtzwzY7Ho+ACCDt/
 B+sQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E6cX1tQG
Subject: [Buildroot] [PATCH 03/16] utils/check-package: add option to run
 the test-suite
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, how to run the check-package test-suite is thoroughly under-
documented. There is one hint in the commit log for commit fc254881e6df
(utils/checkpackagelib: add unit tests), and another in commit
242e9d72e7d2 (utils/docker-run: new script); the former is hard to find,
and the latter is about an unrelated script, so harder yet to find...

Add a new option to check-package, that will make it run its test-suite.
Since pytest is only needed for the test-suite, only import it in that
case.

pytest will be default create a cache of the tests (not sure what it is
about, though), so instruct it not to (esp. since the tree can be
read-only).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
---
 utils/check-package              | 10 ++++++++++
 utils/checkpackagelib/readme.txt |  1 +
 2 files changed, 11 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index cbb3613e19..f759d88a89 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -85,6 +85,9 @@ def parse_args():
     parser.add_argument("--failed-only", action="store_true", help="print only"
                         " the name of the functions that failed (debug)")
 
+    parser.add_argument("--test-suite", action="store_true", help="Run the"
+                        " test-suite")
+
     flags = parser.parse_args()
 
     flags.ignore_list = get_ignored_parsers_per_file(flags.intree_only, flags.ignore_filename)
@@ -287,6 +290,13 @@ def __main__():
     global flags
     flags = parse_args()
 
+    if flags.test_suite:
+        import pytest
+        return pytest.main(
+            # Disable writing/loading a cache with: -p no:cacheprovider
+            ["-v", "-p", "no:cacheprovider", os.path.dirname(__file__)]
+        )
+
     if flags.intree_only:
         # change all paths received to be relative to the base dir
         base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
diff --git a/utils/checkpackagelib/readme.txt b/utils/checkpackagelib/readme.txt
index 3bfe289607..b3e8c67100 100644
--- a/utils/checkpackagelib/readme.txt
+++ b/utils/checkpackagelib/readme.txt
@@ -23,6 +23,7 @@ How the scripts are structured:
 - lib_type.py contains check functions specific to files of this type.
 
 Some hints when changing this code:
+- test your changes: utils/check-package --test-suite
 - prefer O(n) algorithms, where n is the total number of lines in the files
   processed.
 - when there is no other reason for ordering, use alphabetical order (e.g. keep
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
