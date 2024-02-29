Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAB9C54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 17:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A1E41B41;
	Thu, 29 Feb 2024 17:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GZN8M-KR3RU; Thu, 29 Feb 2024 17:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EFB041B42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EFB041B42;
	Thu, 29 Feb 2024 17:13:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12E2C1BF2B0
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 17:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C0C582B5E
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 17:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_Gp4a72HnSf for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 17:13:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A69DE829AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A69DE829AF
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A69DE829AF
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 17:13:05 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-51322d27fd2so1282813e87.2
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 09:13:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709226783; x=1709831583;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ggswn51nD6YIMpaW+IZvh02O3RUlXk0O1FN0XYs9eBk=;
 b=Bm7Vf6X/uUEOvaymHK7H9Qt8RJDMzFC2hYEPt8zn/7iisP7PzwkwhPKqsSihfuA5Ey
 CAiUg/F+twE85cx16Ua4cCvFDVPs+HfQUk6qHAeMWjx4b6R21PkTvf14LLsE+R4bwyRv
 pd+YRh+yTowFZ10cSDIQ2nj+/NHh0AFfdumj44rZxwCG2EOrkvdqJk3E/Wrhub+XtT+m
 qBN2UHmfNRvWoZKBC/k+aqcp+JX2Km7a9+W/vHF8QAcKiPDQIVpG+wjmGixQsrpEYErt
 xQLVrSbhbNAU3b8qBCwDHteP6ecaFr82d5xs8zaHbtSfoI5IBYCABklIo55dwMEy56e2
 5S0A==
X-Gm-Message-State: AOJu0Yw5qFw9wy1uSh59+vpPbrtFcMoHTR2FtUprqMlECRa517Eh0jSr
 56rqQ8LkbMl+DLDnjoOEnyDIcqm1yfJr5+zVSCaI7GJmzqeoN074bwCQFdiR
X-Google-Smtp-Source: AGHT+IHUsRRNNjtumeW7kCEi6xN9qDun+265sfwHmtk/lqUPFv5iGePknrpbWyzp6F/7ROYhRjr8YA==
X-Received: by 2002:a19:f707:0:b0:512:fd8a:d0d0 with SMTP id
 z7-20020a19f707000000b00512fd8ad0d0mr1958997lfe.28.1709226782944; 
 Thu, 29 Feb 2024 09:13:02 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a05600c2a4100b00410dd253008sm5672507wme.42.2024.02.29.09.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 09:13:02 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 18:12:57 +0100
Message-ID: <20240229171302.2565579-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709226783; x=1709831583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=ggswn51nD6YIMpaW+IZvh02O3RUlXk0O1FN0XYs9eBk=;
 b=dxLHQgR77u8pjbUEkimlI/lzsfv8xLn861sRUt3UE1GqWphhpdsk+xlMG5W77klgAo
 sbSqWv3rHxfpYJObIVEaNYmFRC/TI6bHrRLNIK2Upr4lUB8cHH4JIG5KGwtdnuHcxvwI
 4z2OmENiuJ4I5G6m19BGsYPmc1RQqxRzrjOkY8Si4a2OEdt3CIt5jFF4rbDlLw32D6wA
 jW48pwQTE+S6noykykBlfj7IcLgWOn8fPb5yYNRO2TQeC9WDE0rCSWI3o/KwkjO9sp10
 oHw276wIZcVf4WYzLuYzgBLMwhb/JFiyAOLuSK9u6atY19k/uGHKOJTwkkhlJjjCnD6I
 bJVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dxLHQgR7
Subject: [Buildroot] [PATCHv2] support/scripts/cve: fix running on older
 ijson versions
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

Before version 3.1, ijson.items() only accepted a file-like object as
input (that file-like object could yield bytes() or str(), both were
supported). Starting with version 3.1, ijson.items() also accepts that
it be directly passed bytesd() or str() directly. subprocess.check_output()
means we are now passing bytes() to ijson.items(), so it fails on ijson
versions before 3.1, with failures such as:

    [...]
      File "/usr/lib/python3/dist-packages/ijson/backends/python.py", line 25, in Lexer
        if type(f.read(0)) == bytetype:
    AttributeError: 'bytes' object has no attribute 'read'

Ubuntu 20.04, on which the pkg-stats run to generate the daily report,
only has ijson 2.3. More recent distros have more recent versions of
ijson, like Fedora 39 that has 3.2.3, recent enough to support being fed
bytes(). Commit 22b69455526f was tested on Fedora 39, so did not catch
the issue.

However, the reasoning in 22b69455526f is wrong: there *is* the lzma
module, at least since python 3.3 (that is, aeons ago), which is able to
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
Changes v1 -> v2:
  - reword commit log to explain that bytes() and str() can be passed
    direclty, and that it is not about whether the file-like object
    returns either
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
