Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104E6CD3420
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 08:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EBEC80E8C;
	Tue,  3 Sep 2024 08:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vR324EsOri4Y; Tue,  3 Sep 2024 08:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F59C80E8D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F59C80E8D;
	Tue,  3 Sep 2024 08:57:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4191BF34B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 08:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6919960644
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 08:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urQilbW0veXS for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 08:57:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77B8F6060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77B8F6060C
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77B8F6060C
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 08:57:52 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a429so5271149a12.2
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 01:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725353870; x=1725958670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z/tdhvFiWdgaMAbB6/frfY7NgEMt1w255SEMEObrNH8=;
 b=ZaiFb+urrX2pOAoJmPYmdCb56oUzqlt7s9rT7z1NPX2ajkVTa4EEcjJXzwdxskQAJb
 50B9eyAX61u2To/29PlsRiwUnHEs+xbOBIdo/M87HuOvX8xDhRxH1txgtHmsZyQbEQLl
 62jc4uu0dsatqanj5ADWFcTJQbBDK632G9uj5bcIs6leqGDnSpmDWuz8Zm0KOhq4cvkk
 h6HP7hdME1vb4iS7/0qZQMnhr7yAxle7xM/VIYNp9w5pFWcC6hE3Z01JjDnZaPHpWQVg
 4wA0slHMSCzH/zilJs0nV8HMy266QdkFVwtIku2sZ7IsROa8jSBAw/fDHBq54e2D+X7o
 8rAw==
X-Gm-Message-State: AOJu0Yw5mvbesRHqo7K4l2Gmd5B5ppVvXqlsOILHM2lkNSwOyQDrHY7E
 LGikKNXrSACGxdl45Wnb9jJ7ehvOEdKXimeGoGajYJLvQs1bsppUWaaa17DALC5q2vt/fpsRFCd
 YUIo=
X-Google-Smtp-Source: AGHT+IE3MzlDPEH/vdKy5+4o0DjaZUGTfmtgwS+r+jCrkBUp7/HSMuv/WLQB+g6nksTN3jiTfYqsBA==
X-Received: by 2002:a05:6402:26c5:b0:5c2:4740:939d with SMTP id
 4fb4d7f45d1cf-5c25c4034bamr4762882a12.26.1725353869700; 
 Tue, 03 Sep 2024 01:57:49 -0700 (PDT)
Received: from panicking.amarulasolutions.com
 (93-35-133-65.ip55.fastwebnet.it. [93.35.133.65])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccfeacsm6204487a12.78.2024.09.03.01.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 01:57:49 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  3 Sep 2024 10:57:45 +0200
Message-ID: <20240903085745.2594893-2-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903085745.2594893-1-michael@amarulasolutions.com>
References: <20240903085745.2594893-1-michael@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725353870; x=1725958670;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z/tdhvFiWdgaMAbB6/frfY7NgEMt1w255SEMEObrNH8=;
 b=KLviovTdLIRwTH1lBwZyjux4oh9tLive7hnhQKuEGKhawCfmc9kUpZvCsfRp/Fkw8O
 JvZOviI+hA4MRT3fJCAY7i4xlukhDdXdSNR8y0BaYg2/bhsqkI6ckBXzZn3OeZhmDX40
 taILhhd12EYOMVGpXMQqhfM3Tkf2eeAA4wjlk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=KLviovTd
Subject: [Buildroot] [PATCH V2 2/2] scripts/cve: Restart the clone if the
 pull generate an exception
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If we are not able to pull from the directory, restart from a clean
clone. This can happen for corrupt repository or unfinished download

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
V1->V2: Adjust the commit message

---
 support/scripts/cve.py | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index dcb3a63925..6cd9aab963 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -21,6 +21,7 @@ import datetime
 import os
 import distutils.version
 import json
+import shutil
 import subprocess
 import sys
 import operator
@@ -69,15 +70,21 @@ class CVE:
 
     @staticmethod
     def download_nvd(nvd_git_dir):
+        done = False
         print(f"Updating from {NVD_BASE_URL}")
         if os.path.exists(nvd_git_dir):
-            subprocess.check_call(
-                ["git", "pull", "--depth", "1"],
-                cwd=nvd_git_dir,
-                stdout=subprocess.DEVNULL,
-                stderr=subprocess.DEVNULL,
-            )
-        else:
+            try:
+                subprocess.check_call(
+                    ["git", "pull", "--depth", "1"],
+                    cwd=nvd_git_dir,
+                    stdout=subprocess.DEVNULL,
+                    stderr=subprocess.DEVNULL,
+                )
+                done = True
+            except:
+                shutil.rmtree(nvd_git_dir)
+
+        if (not done):
             # Create the directory and its parents; git
             # happily clones into an empty directory.
             os.makedirs(nvd_git_dir)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
