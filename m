Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F374C27C5F
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7E0A427E2;
	Fri,  7 Jun 2024 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEf6QlA8P1Ac; Fri,  7 Jun 2024 17:06:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3E7D427F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3E7D427F5;
	Fri,  7 Jun 2024 17:06:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 342BD1BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D43C884C8B
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hoQ8quBiZpo for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 273D284C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 273D284C87
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 273D284C87
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:04 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-35e4d6f7c5cso2164880f8f.2
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779963; x=1718384763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gXzEtc/Ruyflv/s7nHqAB3x0wgNuwk0WaxN+ap22Df0=;
 b=jTkrwDMcZyI16n55NKEiCRHRPc0C3nlrHz3SnPsgChboMQ3UldfZ+JomKbP0DR5Eun
 C9ac9oOMHEaMDaMu5PdpPXDNm++gHnOChiKopQoGy9Z6mXRm0swaI/ajq7tlgO4fcStg
 rxqrG2Yx4HYMWslQrWlgugxpNndDv+2QnmM/zIOlBVgT+kuM0MZ95J1WbWbUjc5vRQeL
 V6YRRhFDyl8/Osyq0lu7HVTDequm394Swckk5e385AVGazltVbUEAunFgTjdBQZIQLmw
 MLze+wHQxc1C03RunTIMC89+C28JGhsUMYish8eUJ2pM08LRzZ6jlF827o/xtlld12Xr
 B4rg==
X-Gm-Message-State: AOJu0Yxk/Av6+8mr+NkNTmM77tepCmVYlA3jpSCCfrOox0/3Jf7sC2CC
 TlaOyfkzmIutV+yUreKQ+YhqA15jnu0N0EPZKsxqXaaQZgdH5PJc7EOpHw==
X-Google-Smtp-Source: AGHT+IFuAhoRVYpEacIXz2IJk1U13M0cEP/vl3anrN4emCKS422pYLHzPnBQtaVH93DGoTIBNvHSqQ==
X-Received: by 2002:a5d:648c:0:b0:354:d052:e485 with SMTP id
 ffacd0b85a97d-35efee48f85mr2800091f8f.63.1717779963142; 
 Fri, 07 Jun 2024 10:06:03 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:02 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:44 +0200
Message-ID: <6bf853bc8b61fed824a99148786105fc038a5894.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779963; x=1718384763; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXzEtc/Ruyflv/s7nHqAB3x0wgNuwk0WaxN+ap22Df0=;
 b=IHZ77iGSby3Gk1jpWr6UvijF0bvwASGh0r0OsBhV2MdeH++xVy+YtsW2KYWM06MMHF
 ZYvuy1Hl37vr9gd5lIulaVrGwRNErcdU+4ssGPs1jDcuVLHoIGwD/7eeIw0xJJS8CjXb
 YDgvbVuFd+MtGnire14uuxwViixE9ixDvayfVxpP8I8ZpPM3OoPpBZVQMhL0NeGN5df4
 jNJYUMcTDz9Q8e5Uwy00LbAuDJ/Kajnc86LXEDRfTqDnZLxfxeZi7lo4T4Unk53IOqlT
 LBwT5OI3T+B4xpxe6+LZg5/QzBTVSLLaeWuYzAk5XwGGEOd1jtfPX1Gy/IUjdJ+HaPvy
 qCag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IHZ77iGS
Subject: [Buildroot] [PATCH 03/20 v2] utils/check-package: add option to run
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
