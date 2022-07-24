Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D669BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 725CF41729;
	Sun, 24 Jul 2022 05:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 725CF41729
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SI8gliYxTsNQ; Sun, 24 Jul 2022 05:51:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3034A41716;
	Sun, 24 Jul 2022 05:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3034A41716
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B80D41BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FBB141716
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FBB141716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1sqT4_cYVbx for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B44F2416ED
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B44F2416ED
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:33 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-10d8880d055so11045643fac.8
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bW62hBhgNX62wudtPg4yAQNmIt/H17UEqV4RnQq3Y8Q=;
 b=ckWyJrLwDJjw3NTHHFE/zXMNM6Kv9VhFVX5DHuT/2JuxaOb5pESx62HQ5FvnxgfmfX
 fbYAriIOuN6wsMj4QRJHyPX22nzEhJV+dlRjIhPj4TrAQiZQ724lmZrwyJdjJywlW6hU
 rfcextlFvRlZZUTC/XhrTySV508Unn6kHT6jEplc2IzlNp2rVUAQUQ7X0NtCeu3Nxg1v
 TjRHOx1lKwSyuE1tYrAm2vQqC/gm7IA517HBNXoLXUIgRjcEIl2agWRGymsWbqgZ60zg
 vz7mc3wsK9FxMrDSLL17CUO5IyCFWS6C0PgkCAmzaHzUDPPoklTnmJ2pL2twH9Sb50fF
 Du0A==
X-Gm-Message-State: AJIora/DAFGg0hIcgG4C/wJyuLQHBj71nemGHkarrvXWzIiAUpAPAHwJ
 D5FVu1m14D2bo5Bl3ETg/wVNkj/F8j8=
X-Google-Smtp-Source: AGRyM1t9QBv7wT9RqUXBTAMX+8o4NSOVFsDf+aVtjSZwBgly4k5J4KvglrLz+oGSmEsJpiMXdeo9AQ==
X-Received: by 2002:a05:6870:1604:b0:10b:77a5:d9af with SMTP id
 b4-20020a056870160400b0010b77a5d9afmr3571288oae.207.1658641832778; 
 Sat, 23 Jul 2022 22:50:32 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:31 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:01 -0300
Message-Id: <20220724054912.2354219-6-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=bW62hBhgNX62wudtPg4yAQNmIt/H17UEqV4RnQq3Y8Q=;
 b=KuX74DMiypi7afhXlwoFbaUlXcA4APXTYlO5JA7hLDdQQAGx55oE78VXOcUX0fp2Fr
 vn12rHmqCndLtXd4fsFtsQm69uvWBlzU1huZGur2bNDXQwQixb+6VSwhfTybIZaIS+dR
 nnozgJHLSPAt8aEd7hWTvt+ekYYPNHQHw7mxVEQd0fX/ANOpkOibAoGzydhdQFg+3K1O
 r7a5vSSo3eoUQm88YNAf280M7Yhz281CUV9eoNg7x/QgV+IV5Y2+kHUdWxKPZ6PrKL/K
 SnXWZDDuwlIx1BtaE51sfBdi6GdjlTqmacZyByBDa/q+XJhg+91SSnB1gvumGzyFPRdh
 //qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KuX74DMi
Subject: [Buildroot] [PATCH 05/16] utils/check-package: add --failed-only
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

Add a debug/test purpose option that generates output in the format:
<filename> <check_function> [<check_function> ...]
This is the very same format used by check-package ignore file.

So one can update the ignore file using:
$ ./utils/docker-run
br-user@...$ ./utils/check-package --failed-only \
               `git ls-tree -r --name-only HEAD` > .checkpackageignore

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/check-package | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 00be29d02a..1508e39c37 100755
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
 
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
