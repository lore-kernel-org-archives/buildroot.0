Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6C0C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 22:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1DD4400AB;
	Wed, 28 Feb 2024 22:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oABL8b1sQwC1; Wed, 28 Feb 2024 22:37:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B24D4044D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B24D4044D;
	Wed, 28 Feb 2024 22:37:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 382C71BF349
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 22:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25AC6823AB
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 22:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TCyJn-jQvJ_V for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 22:37:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB6D182410
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB6D182410
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB6D182410
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 22:37:39 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5132181d54bso201078e87.3
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 14:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709159857; x=1709764657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8o05UE/eihYICp3XfCwl+sm4vDCTQGie1R6cDSgsRE=;
 b=KjJL2PMzC+oNMFzmD4rTL7RTUU+bx5lwmJuxlCGfW8vm4Nady88mABaI9xnFBQ5Tby
 Nt/f5N/vkOpqfSrqFjPUQjrFxJKO0VZ58XCSr0Rg6SwZpFaHvrrG8cSqlEuHxtZXVq89
 l3H1EWspb+6QUggYe4jrwNLtuGPYIFcshZJc9ABGKIKd5u717hIDs2QVJozcQ/+nXlwF
 RzGjrzef8+A4uETTMc/tX+20gDy9Inv6jO4HDUyg1JpfViOaB7L0WkmlummXgxLuvi4Z
 YpfUF5ewkzq4CeVfRX4q63nQcQtrLVEEMUly0byMQYz0/RUNORPgx0hmm+ctNLXr3vLo
 8RSw==
X-Gm-Message-State: AOJu0YxQxSXeQNIXvTzN1W6XF4us/Vb8SvjGDtn929mfewp04lBjAUYq
 FQx2sMGnTJa6V4JcJ2DtQRTTesXa11lplBgIYHG528urekO8IWmDZz+rp1++
X-Google-Smtp-Source: AGHT+IHLppNsomtQs7acf0x8IaWAkovQ/t90IJB2nhTHiwew/Kx1RP3oWsSIGD+pBfgynO1KXwwW0A==
X-Received: by 2002:a19:f708:0:b0:512:eee2:d8d0 with SMTP id
 z8-20020a19f708000000b00512eee2d8d0mr150911lfe.59.1709159857305; 
 Wed, 28 Feb 2024 14:37:37 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a056000004600b0033d87f61613sm15625557wrx.58.2024.02.28.14.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 14:37:36 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 23:37:36 +0100
Message-ID: <20240228223736.2376826-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709159857; x=1709764657; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=+8o05UE/eihYICp3XfCwl+sm4vDCTQGie1R6cDSgsRE=;
 b=KMU/BhVxww9pVUMScYWJtJP3Mw9pdtugbAHol42eH9UsfIBlZoQ8PzmrqMxSD6bH6X
 S/w8XRViofI4DnaJIICTGkvk7BFNARjWf80RYSxPKiOBEbDMRSRb+dJAfS9RS8yTSPVQ
 R6GRZEBjWHCX0JwD9FDocTXVrwRuZmLZewITejfV3XDbjw5SAVN3uwwkHJCo5Ek//usT
 WGtHxUp5DQ39lWN8/95oTBL2E4J0SHnbFw72qXtDmNlXgBFdnOx92H2DJsMbJQ9cwiZo
 G2H/FSehx8C8EhBgT3gbsYjCS0oO0GnVm3cJldURe586ivIYptw6B5y6gAYo0IZ2j3UU
 AOAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KMU/BhVx
Subject: [Buildroot] [PATCH] support/scripts/cve: fix running on older ijson
 versions
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 22b69455526f (support/scripts/cve.py: switch from NVD to FKIE for
the JSON files) had to change the decompressor from gz to xz, as the new
location is using xz compression.

That commit mentioned that it was spawning an external xz process to do
the decompression, on the pretence that "there is no xz decompressor in
Python stdlib."

ijson started to accept bytes() (and str()) only with version 3.1, and
using a subprocess means we are now passing bytes() to ijson, which it
is not expecting as input on such older versions, casuing build failures
such as:

    [...]
      File "/usr/lib/python3/dist-packages/ijson/backends/python.py", line 25, in Lexer
        if type(f.read(0)) == bytetype:
    AttributeError: 'bytes' object has no attribute 'read'

Ubuntu 20.04, on which the pkg-stats run to generate the daily report,
only has ijson 2.3. More recent distros have more recent versions of
ijson, like Fedora 39 that has 3.2.3, recent enough to supoprt being fed
bytes().

However, the reasonining in 22b69455526f is wrong: there *is* the lzma
module, at least since python 3.3, that is, aeons ago, which is able to
read xz-compressed files; it also has an API similar to the gzip module,
and can provide a file-like object that exposes the decompressed data.

So, do just that: provide an lzma-wrapped file-like object to ijson, so
that we can eventually recover our daily reports that everything is
broken! :-]

Note that this construct still works on recent versions!

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/cve.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 1a3c307e12..7167ecbc6a 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -21,8 +21,8 @@ import datetime
 import os
 import requests  # URL checking
 import distutils.version
+import lzma
 import time
-import subprocess
 import sys
 import operator
 
@@ -134,8 +134,7 @@ class CVE:
         for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
             filename = CVE.download_nvd_year(nvd_dir, year)
             try:
-                uncompressed = subprocess.check_output(["xz", "-d", "-c", filename])
-                content = ijson.items(uncompressed, 'cve_items.item')
+                content = ijson.items(lzma.LZMAFile(filename), 'cve_items.item')
             except:  # noqa: E722
                 print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
                 raise
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
