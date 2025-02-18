Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECD6C021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 07:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EF2641319;
	Tue, 18 Feb 2025 07:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mw6XEWkV2YF; Tue, 18 Feb 2025 07:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D05412BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D05412BA;
	Tue, 18 Feb 2025 07:57:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C07FE05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53EEC60F8C
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ay6H1lVkub7C for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 07:57:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8072960F86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8072960F86
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8072960F86
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:57:41 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so53476005e9.1
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 23:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739865459; x=1740470259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6Qn87d3y5fnBGj6DhpKlnQDyACb2JXzMTwx1FO4Wq5Y=;
 b=AqadjxAyWya206qCFFK1lWy4l9CZZeOH+QVYpmguASUuEnvlqTGHCjjNbA7aJ+0SXZ
 hRaBwf+l/is1aNn1/HpHTKNJ+k1ndzKMQ9EYLv9UXKBRIYc/splfbL8OmF0vENOuLQz4
 0ViVLlEV/kPLhhbm25J12vxtcBo/TbvVxukZkGeRazbVnRSsWh7NVbaMKKR9C9JOjVY7
 +PASnI+ioBsqKsuTmOhAs6d7UPxARAMGtB/AdmxhTE50yyOzi/kAFWTKtiCyw/Wm5/Tm
 42ri4MPSduqe5Z325uPZwWT/Stuy1lX0NgnCTTPg2I0cQm4O3oWBPOtrPtFJyQGLS5Cx
 VaAg==
X-Gm-Message-State: AOJu0Yy+sAp5vmU1gzWd4/gug/j61mk+SkIQyBDnwARMq0uLCvtmcwog
 4iuzBlepvmAzG74C4ETq8dh+/Vx42KjHUj1EFzVD3bEkxC51jKIDQ39gWw==
X-Gm-Gg: ASbGncsrVHKnJzgD3sEW370I+idLKd27+hB5UQ4ZLfDGb5cYfvMYrk+7oLWL7dYw/Un
 UEC3v6x2zlD116FRnw2OgjGeq32Pl4VUXd9W/RLUCJ2T6jv9HwPzokASor0VE48RGsdh+xNNKKy
 2YyySj4oks3v0p4rFvU74n0EL5Nghz4pnniP1Okc46JVUrjt2aujdYmzFMWxa1jiiRF/aQk4ctI
 HAQO14ZmJw4iTeZ9ZnVjnMMqaK8TiE9lmmNmHNoGyiAaTeqmEGHv/Zyno9Z9jT3AEKwBU2ySYty
 M/3HMP4dcfFiZOlUth5QHRyaCw==
X-Google-Smtp-Source: AGHT+IFel5Y8BiXeJQ4USx+zMMIvi6uei98r5ezC6nAmSFzUKl12b7q4kZ5ufpQpu0FepuzTup7+Aw==
X-Received: by 2002:a05:600c:5254:b0:439:38a1:e49 with SMTP id
 5b1f17b1804b1-4396e6d7c38mr122701895e9.6.1739865459190; 
 Mon, 17 Feb 2025 23:57:39 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm173722215e9.36.2025.02.17.23.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 23:57:39 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 08:57:37 +0100
Message-ID: <4a834fd5953e048e156f2cba5161c9db464258a3.1739865449.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739865449.git.yann.morin.1998@free.fr>
References: <cover.1739865449.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739865459; x=1740470259; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Qn87d3y5fnBGj6DhpKlnQDyACb2JXzMTwx1FO4Wq5Y=;
 b=GTAhJNVpYV/BIybQ02u4lD4lcPv/e0b32zUykL+dpa3RJxT6ezBUE5jETKEDjCbd/K
 QHaV/cxJ6Vo8c4ra1UD2SePiZKS+SuPq8TZXJyH8YPPwc2hko4BLtoVCO3dTPLeDwWN2
 mlz5YWj2CAoCxZkgDgp5Vv7V3k9oflNPoiSfuYPH2jE6uGNrdFXw7/4Gj5NTut9pgJJN
 J2SkpOzeKpXW05TCog/w5GYHwRFGBtBuSnTCYiSJcTepoiQdVmCjJqVvJklC1EXga9l/
 +AaX5yVAD0GkYfujsh4p+sUp7ATXFZim/eKx3AteYWZlLhMx/Cye4QciPrnlKNEVDAeQ
 QRiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GTAhJNVp
Subject: [Buildroot] [PATCH 2/3] Revert "utils/brmake: add option to run in
 docker"
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All our documented uses of utils/docker-run, besides running it
standalone to get an interactive shell, is to use it as a prefix
to the otherwise standard command to run, e.g.:
  - ./utils/docker-run make foo_defconfig
  - ./utils/docker-run make menuconfig
  - ./utils/docker-run make
  - ./utils/docker-run make check-package

Commit 8aad67f1575f (utils/brmake: add option to run in docker) departed
from that usual convention, by hiding the call to docker-run inside
brmake, conditioned by an environment variable. The only reason is that
brmake internally used ubuffer. This is no longer the case, so we can
now use brmake together with docker-run in the usual manner.

This basically reverts commit 8aad67f1575f1d8a9c90ccd70302e9a6823cf794,
after resolving the conflict due to the removal of unbuffer in te
previous commit.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/brmake     | 8 +-------
 utils/readme.txt | 3 ---
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/utils/brmake b/utils/brmake
index e5437d8f2c..4b9179e415 100755
--- a/utils/brmake
+++ b/utils/brmake
@@ -7,13 +7,7 @@ main() {
 
     start=${SECONDS}
 
-    if [ -n "$BR2_DOCKER" ]; then
-        docker=("${0%/*}/docker-run")
-    else
-        docker=()
-    fi
-
-    ( exec 2>&1; "${docker[@]}" make "${@}"; ) \
+    ( exec 2>&1; make "${@}" ) \
     > >( while read -r line; do
              printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
          done \
diff --git a/utils/readme.txt b/utils/readme.txt
index abff659d4f..b5862f1fb9 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -7,9 +7,6 @@ brmake
     front of each line, redirects all of the build output to a file
     ("'br.log' in the current directory), and just outputs the Buildroot
     messages (those lines starting with >>>) on stdout.
-    To run this within a container using docker-run (see below), set
-    BR2_DOCKER=y in the environment, i.e. call it as
-    `BR2_DOCKER=y utils/brmake`.
     Do not run this script for interactive configuration (e.g. menuconfig)
     or on an unconfigured directory. The output is redirected so you will see
     nothing.
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
