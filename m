Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4894EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:10:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FEB261056
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FEB261056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69BDD403EB;
	Sun, 19 Sep 2021 07:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6sSkm21rp4j; Sun, 19 Sep 2021 07:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF1240370;
	Sun, 19 Sep 2021 07:10:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC7201BF314
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B83060684
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTl__zUi32hT for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:10:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D72706067F
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:10:20 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id t4so9037469plo.0
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 00:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I099yeabHoXxKfGMnav9GkXAt4i2nWtWft3Kte6AoZw=;
 b=Rbww0FzY2uMLH+YLVsy7sTCHrkd8JU2Gdu67KUFsi8+I3Wu0U9NHH77qwMnEIpwlds
 4VmCead+T6ss+UutuGYGLJQ45fkkbgOOsLc4htYtqjodBHnivkoZt0Ty02+ZrBt+kewv
 JfzCMInWOpseRBZWyBVTbyr7cGzId8V9FmxVWYedYJziqwTOukXdVxxWqctcNgdUSmuZ
 rWk0XNz+gvxB3EuFRxrclsNKvEp7d1qHs9EbLNMizFqLNLvCX6Ho27AoqaaB16qCkIjx
 np8V7ZuIKb7+MVGfwHOHXVH32tas7zHIxH08ZAbnHy9KDirCnafXoX2fOHD+rLYv/gso
 GWXg==
X-Gm-Message-State: AOAM530mTnXgQXT59cQdfbz+KZTdF2WOHFRB8fLk2GuK4sQpG3f8D3xx
 UtB8JiSsH3gD1OjahPsNgdDnkmnnucJhEQ==
X-Google-Smtp-Source: ABdhPJzF4j8BrrI9sCXBGggmzTCq3HDmWdXSTW14e13fSCM8Gjna7NkdY1HHf/yZ2ib5KrFlZZS3YA==
X-Received: by 2002:a17:90a:2bc1:: with SMTP id
 n1mr22035451pje.100.1632035419774; 
 Sun, 19 Sep 2021 00:10:19 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-75-194.sb.sd.cox.net.
 [68.6.75.194])
 by smtp.gmail.com with ESMTPSA id g24sm10786458pfk.52.2021.09.19.00.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 00:10:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 00:10:12 -0700
Message-Id: <20210919071016.3339939-1-christian@paral.in>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v2 1/5] support/download/dl-wrapper: add
 concept of download post-processing
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@lists.buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
