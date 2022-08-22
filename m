Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8417EC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 07:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFAE74017A;
	Mon, 22 Aug 2022 07:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFAE74017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UY39jC_L_XCV; Mon, 22 Aug 2022 07:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF7BF40169;
	Mon, 22 Aug 2022 07:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF7BF40169
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B60511BF577
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9164A81826
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9164A81826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YvlT_XlRCGRr for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 07:54:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCE0781678
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCE0781678
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 07:54:27 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id u14so11322522oie.2
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 00:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FVm7XxXG8ZoImxgJkhMhmRzAMxoR2T6Fz8v2oCCWUqs=;
 b=lGIKMwyF0e1lXXVc2VR9JfZxRkMag9+souAroBT2FAm5lLJUKg3qS4QpBow7Yfvh52
 +5jlCnaU5HnaZLevtVZqd71S4O5Qe8De0TeL/cPAsJC/ExM26vG+h9OMGuWhiUxLzGAF
 JsLN8ahCAPAcPYoxxRJJaSnYkv4F+8Z8t2ilRi4c9ZhBWea/+jHaFsisYVHi6jYoSutw
 UpptwFmk/5DfXkNyDK3CHwpWHmlzfcuNAw8dR5GRMH6nNfejuCF36+YUicWmXlTBM8GV
 wYRd9P4Oa0X3W2+8FQ1UMq5V5EK3j8FdC8WH79W6GVFRmtbMv/WIf9t7FXMlYG/E01Pq
 qg3A==
X-Gm-Message-State: ACgBeo2dKdLPDYYJSouK0aG0NMbnbPq2CTxgo7h1l0OBIKMbBPXzhBbK
 d34r9PrzoC58iPEI4AQ3hWfgOexg7nY=
X-Google-Smtp-Source: AA6agR7gT83KrAMxJlu9wIif4/LyFeFyrMDQn+3CWk4IfyB6IfkKOVrHW6a7TdRP3p+PSwJfp00+Sw==
X-Received: by 2002:a54:448e:0:b0:344:aec0:5b6e with SMTP id
 v14-20020a54448e000000b00344aec05b6emr8417185oiv.24.1661154866455; 
 Mon, 22 Aug 2022 00:54:26 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 i7-20020acaea07000000b00342fc99c5cbsm2516047oih.54.2022.08.22.00.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 00:54:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 01:54:18 -0600
Message-Id: <20220822075418.903230-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822075418.903230-1-james.hilliard1@gmail.com>
References: <20220822075418.903230-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FVm7XxXG8ZoImxgJkhMhmRzAMxoR2T6Fz8v2oCCWUqs=;
 b=fjRvGGAsFGPemkFWqOOqEhkXD4F+kxh+NxZOk8WVgI7Pq7pag4Y8TbERuHUaZB3HAg
 OlEsK3by0OxaIW5NNfBd9wD9iNDuIl/HgedVBbGObQv64bd9oQBcLFe79/jLr/PV/zob
 Y0NT2RSHDt4WHmKrrXH6TfahKf/ToCQ5l8NtKyPlzN1/mPNRzFlh5vlCMZt6nfb8pou5
 UUWxJJfh03GAJmh8+igRQmt9co+XcVlPbe0Xn1N1hoyUpRGQ0Roqf94MtJ/mSJiCdVRO
 mqrqDWsSWGn+iUJGjfaFEVS2xoAreNm6YxcB45VEu7hbUAw6qwNdn8E8aJO4JQ8lnYr8
 c9DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fjRvGGAs
Subject: [Buildroot] [PATCH v3 2/2] package/pkg-python: clean conflicting
 pep517 packages before install
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python installer package isn't able to overwrite files of packges
that already exist, this causes problems when doing a rebuild or
update without a full clean.

To fix this we can use functionality from importlib to identify and
remove any conflicting python package files before installation.

Fixes:
Traceback (most recent call last):
  File "/home/buildroot/buildroot/support/scripts/pyinstaller.py", line 69, in <module>
    main()
  File "/home/buildroot/buildroot/support/scripts/pyinstaller.py", line 61, in main
    install(
  File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/_core.py", line 109, in install
    record = destination.write_file(
  File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/destinations.py", line 207, in write_file
    return self.write_to_fs(scheme, path_, stream, is_executable)
  File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/destinations.py", line 167, in write_to_fs
    raise FileExistsError(message)
FileExistsError: File already exists: /home/buildroot/buildroot/output/target/usr/lib/python3.10/site-packages/tinycss2/__init__.py

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
Changes v2 -> v3:
  - split out host pyinstaller.py change
Changes v1 -> v2:
  - remove unused os import
---
 support/scripts/pyinstaller.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/support/scripts/pyinstaller.py b/support/scripts/pyinstaller.py
index 6dd9242327..d9b77cac19 100644
--- a/support/scripts/pyinstaller.py
+++ b/support/scripts/pyinstaller.py
@@ -2,12 +2,33 @@
 
 import argparse
 import glob
+import pathlib
+
+from importlib.machinery import PathFinder
+from importlib.metadata import DistributionFinder
 
 from installer import install
+from installer._core import _process_WHEEL_file
 from installer.destinations import SchemeDictionaryDestination
 from installer.sources import WheelFile
 
 
+def clean(source, destination):
+    scheme = _process_WHEEL_file(source)
+    scheme_path = destination.scheme_dict[scheme]
+    context = DistributionFinder.Context(
+        name=source.distribution,
+        path=[scheme_path],
+    )
+    for path in PathFinder.find_distributions(context=context):
+        if not path.files:
+            continue
+        for file in path.files:
+            file_path = pathlib.Path(file.locate())
+            if file_path.exists():
+                file_path.unlink()
+
+
 def main():
     """Entry point for CLI."""
     ap = argparse.ArgumentParser("python pyinstaller.py")
@@ -58,6 +79,7 @@ def main():
     )
 
     with WheelFile.open(glob.glob(args.wheel_file)[0]) as source:
+        clean(source, destination)
         install(
             source=source,
             destination=destination,
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
