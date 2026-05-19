Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860C9CD4F54
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 20:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37B4F81ABB;
	Tue, 19 May 2026 20:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxKIQXHOqNLS; Tue, 19 May 2026 20:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6530C81AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779223471;
	bh=6DG+ZHpoo8jsAfL3C1XlaE3NVt1Npe2j5Ohi971zmoY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ArPR/dslxcNQMfHX+78yOF540+ne5EawVDCwiNUcjhzNKzMB2amLycfgaeJdAVyb5
	 yD94vZ9ylI21WOz7rTLF7QnE0/4mVLWPmzuLmMrdccqmVD5ANrjmPVALvk/nmXyOhg
	 ndxiv+ZxECnZsd4Z6tA42NkLOmBJbkhVoICyHu5fAJy/ey+Mvqhifet4+U5CJE1K6f
	 i5PSq/7Is8sERAI+B/T0/wOdif4halHdG0V7j325aFKLggLl3tn9Ee2aHeBMKrYR1w
	 hah4cQJtP+Gyff6aOAxoo1dO4H+fRBMSAVIVPmtt/LbOafQ+YEckwM0QtWwjhYsHCz
	 iRt8oYgd9YjqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6530C81AC1;
	Tue, 19 May 2026 20:44:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BCD1265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4EE281AD1
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5LGvDO4qq1D for <buildroot@buildroot.org>;
 Tue, 19 May 2026 20:44:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2CDDF81AC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CDDF81AC1
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CDDF81AC1
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:44:29 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7dcdd23fcdfso2117206a34.3
 for <buildroot@buildroot.org>; Tue, 19 May 2026 13:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779223468; x=1779828268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5nJbDyMSp4Fk9OQ1bA9AKamWtc6q8iMNHyPoI/sOfxU=;
 b=fRsA+30Wf7FGwEknZSAHiW6Flu18joLtcUI1LMEdEdhfjgnzd+nl7uhVt3nr+XOHwR
 EETjUh9dqqxDnRkEBwaS4Oi8/IrGUSIFWPIXGDBrngfau3U8JDVKZLigMpcCfGpavcVa
 mF+fq6ATktVCt+QAj8LUTGbxnMtx2nsjeku4NP8Iui8Xg7kKgLPU6MlYUipxwPncvxuU
 /qlYNqIkgiEcn87JUSZBpTaPasJODg3FKTDFxcsXE6B3xiPP/ltrsZrbywAEvyYGBF0x
 3bXgn2JQP38pCPPf028NGv3PxJ4EZBBfh72DagSMJIJazNofm4bzh5o4suWlMwKf60lD
 j8Fg==
X-Gm-Message-State: AOJu0YzO609bOl20rb7pF4yeAkgWjmWhbYIjVWvE0w2eiiDX009L3x/t
 vrtc1sRwfOIXLMD9i7Ti9Zlb0LHRtuCNlD3c0yTja1ghqFu8R/2ziXmQu+wQZE//
X-Gm-Gg: Acq92OHPzWGrmUvc2La8URa0uuk1CP2BBY6cKvcpgIrv5I5YfXruBikZxqp4ChohZLx
 Vy9Kx+vU/5FhvYEn4PzDeQPiwtUN42FVdfrmFP5oZKJxIdd7O6M0tfRJOykEGxyQjt6XRBxrhD8
 gMP6UBmY2P3MpX8C4MWqPfJz1uCPY1T9SeOrW9y8R7paaX86MTzBOdYK6OmTBOfhtU2xcQ41NSs
 MAxruul9muNL5Vf6YqsHHGiBSEo14aIZlWxRgnwvUsT44/lcH5Pt4+tXzFGDPgCF/7cNbceG76T
 2/OtBaS/ym/G8mVMqsc4jgjfqdlF6dAArhpUevfEbMIV4RiPaozDlKOQQtCuLPxi5eQdP5Q2se8
 e4ckR6pD9f1rDZ7uMbhYUiF2jIeEsX5Plv91yJg1pdTknSwQnVq3zHgTv77j0yNwfLh7bLiWa6v
 COpxWePwM7D2gj628tdEB1zs4/nl9uo+FWTE9J9KYjRweYF5WkoySINiaBEg9KfUmqqOvqWwPlt
 i6cJX3hzdBQagHRKJYkKlOOXuXMeo/HQ9Gq1dG1y4JINaloACQY1DpbHIyC05ypqUKIWw==
X-Received: by 2002:a05:6820:6ac4:b0:69b:5f97:de79 with SMTP id
 006d021491bc7-69c942fe211mr13158446eaf.19.1779223467679; 
 Tue, 19 May 2026 13:44:27 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-146-19.hlrn.qwest.net.
 [184.96.146.19]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69d049384f6sm7971060eaf.14.2026.05.19.13.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 13:44:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 19 May 2026 14:44:22 -0600
Message-ID: <20260519204422.744236-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779223468; x=1779828268; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5nJbDyMSp4Fk9OQ1bA9AKamWtc6q8iMNHyPoI/sOfxU=;
 b=F6D/ZCPs2JxrND45OWbn0ig5Z2JKqPMbxGgbzaBQaQcv1dxA37AhMPpuOYl/Etbxg+
 xM/lCALhghT1HjiLVg8bUylWLPLoEY7Sn9QanOxlHKidhmWh7p2WzyxVGTQ0NyZkFP53
 IucezuyupdOPPZ8x0yGlqcb0hGZ53vBdoNmkaZdgs6C5hbJr8/85549zhqXBOwj9HcKv
 sINPgV/UQHYBAQCa0lww/4BCX6P5DuCpELVs9JzjqOkTxRfx4AsvPt1c/JEpnY1dH95k
 58JhRYTRwc0Ei5H5ukZvxMCxpsg0WPILtCCJBDRStHGFuPej93y6URIgGN0YUGbuTKTl
 8AQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=F6D/ZCPs
Subject: [Buildroot] [PATCH 1/1] scripts/autobuild-run: add support for
 --branch option
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

In some cases it only makes sense to run tests against a specific
branch, such as when testing new genrandconfig flags.

Add a config option to override the branch selection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 scripts/autobuild-run | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index c375f7b..29272d2 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -202,7 +202,7 @@ class SystemInfo:
 class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
-                 submitter, make_opts, nice, toolchains_csv,
+                 submitter, make_opts, branch, nice, toolchains_csv,
                  repo, upload, buildpid, debug, hung_build_timeout):
         self.instance = instance
         self.njobs = njobs
@@ -212,6 +212,7 @@ class Builder:
         self.http_password = http_password
         self.submitter = submitter
         self.make_opts = make_opts
+        self.branch = branch
         self.nice = nice
         self.toolchains_csv = toolchains_csv
         self.repo = repo
@@ -260,6 +261,8 @@ class Builder:
         list. This way, branches with a higher weight are more likely to
         be selected.
         """
+        if self.branch:
+            return self.branch
         csv_branches = []
         with urlopen_closing(urlparse.urljoin(self.http_url, 'branches')) as r:
             for l in r.readlines():
@@ -782,6 +785,11 @@ def main():
                         help="string of extra options to pass to Buildroot "
                              "make, such as specific command wrappers",
                         type=str)
+    parser.add_argument("--branch",
+                        help="Restrict builds to a specific branch. "
+                             "Useful for situations where it only makes sense "
+                             "to run tests on a specific branch.",
+                        type=str)
     parser.add_argument("--pid-file",
                         help="path to a file where to store the PID",
                         type=pathlib.Path, default=pathlib.Path("/tmp/buildroot-autobuild.pid"))
@@ -875,6 +883,7 @@ def main():
             http_password = args.http_password,
             submitter = args.submitter,
             make_opts = (args.make_opts or ''),
+            branch = args.branch,
             nice = (args.nice or 0),
             toolchains_csv = args.toolchains_csv,
             repo = args.repo,
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
