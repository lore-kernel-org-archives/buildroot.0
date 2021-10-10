Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E270C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 23:47:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4875860E94
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 23:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4875860E94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D01A3400C6;
	Sun, 10 Oct 2021 23:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0MnaQLCGbd0i; Sun, 10 Oct 2021 23:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D81B74012E;
	Sun, 10 Oct 2021 23:47:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAAA01BF3E8
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 23:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2F7360648
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 23:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxAGULiWT7FM for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 23:46:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A429960627
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 23:46:58 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id y7so3744054pfg.8
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 16:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I099yeabHoXxKfGMnav9GkXAt4i2nWtWft3Kte6AoZw=;
 b=NcyjjqFStR5+0+mdi2e7aYY899Kp2KMmG/DKxGGETBugmuh6t2pi/NWzrlnlTkdxNw
 CMPSfASteVCIBVSkjFsgwPWaDb6CNNtqxO5GxS5JKTRNqTmhObAwfJZM3cDRAjKpwdJM
 IuJIqkUH1Kf6fyvNseIIgzSoXorW3jxfeH4ne0pTr+SdtpP4nuphjRfsgCoyQQadzsam
 SR69l7TcIgyNcSdgl81cxd+qDhzCgV4wGXCLLEQmTAREWsUirP1kn3AA9lb6yYbvbiMv
 5KpWwD3fmOElQPY0rzv24mi+aV8XGhnlRPZM+G1BhzFUAhJev9Z5VAUAE822BM04H/dk
 ogGQ==
X-Gm-Message-State: AOAM530UbYuBoEDWSgBhYLDLEhigsAlJL3GNc0QApB16LMlK0dbwGA0+
 NqIn7ZJcW3qhP+5eP7Yt38Wxp57M4cfG7A==
X-Google-Smtp-Source: ABdhPJyucaUroBRKuogygF1Nw/feMrtX2aUm7laKT4+4eLoq3eOGxcFvMldWWldjNCDf8ASKzpE/7g==
X-Received: by 2002:a05:6a00:13a1:b0:44c:f60d:5fe6 with SMTP id
 t33-20020a056a0013a100b0044cf60d5fe6mr9531320pfg.48.1633909617927; 
 Sun, 10 Oct 2021 16:46:57 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id t6sm5662547pfh.63.2021.10.10.16.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 16:46:57 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 16:46:50 -0700
Message-Id: <20211010234655.585526-1-christian@paral.in>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v3 1/6] support/download/dl-wrapper: add
 concept of download post-processing
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

In order to support package managers such as Cargo (Rust) or Go, we
want to run some custom logic after the main download, but before
packing the tarball and checking the hash.

To implement this, this commit introduces a concept of download
post-processing: if -p <something> is passed to the dl-wrapper, then
support/download/<something>-post-process will be called.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Christian Stewart <christian@paral.in>
---
 support/download/dl-wrapper | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 3315bd410e..2d74554213 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -25,7 +25,7 @@ main() {
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:rf:u:q" OPT; do
+    while getopts ":c:d:D:o:n:N:H:rf:u:qp:" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
@@ -37,6 +37,7 @@ main() {
         r)  recurse="-r";;
         f)  filename="${OPTARG}";;
         u)  uris+=( "${OPTARG}" );;
+        p)  post_process="${OPTARG}";;
         q)  quiet="-q";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
@@ -135,6 +136,12 @@ main() {
             continue
         fi
 
+        if [ -n "${post_process}" ] ; then
+                ${OLDPWD}/support/download/${post_process}-post-process \
+                         -o "${tmpf}" \
+                         -n "${raw_base_name}"
+        fi
+
         # cd back to free the temp-dir, so we can remove it later
         cd "${OLDPWD}"
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
