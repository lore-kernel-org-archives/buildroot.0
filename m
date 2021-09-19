Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB35C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:10:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 508CA60F0F
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 508CA60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B623405F7;
	Sun, 19 Sep 2021 07:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4t7pO5Kve-0e; Sun, 19 Sep 2021 07:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90ACD40671;
	Sun, 19 Sep 2021 07:10:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6E281BF314
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5F8B60684
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZq4mtJ9NCTn for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:10:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 319696067F
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:10:23 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id f129so14220085pgc.1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 00:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gb4aPn4xMI5qxVPkbm4Ko0veDOv0SMXd33CjCi/veIs=;
 b=jaSdkM8p3PZRgFbbifNS2cUZGFQ7AkogXVTN97w9uEJw00YgGp3SXgRC6Wrv+gj/8v
 2wrEGrJKd4o+E0DRk5zcjZyRERKQHsIJVLoMHJrxAPVBRkn2yBGjiApJ7ZTLqR8RguFj
 CDCDBhbK8R4i1c4r8A/9PTWS5RuCX2cUSCHr0y0nAFC7e1xKVXLBAFYLoiObN96G8PLb
 CXdlYVf80gNYI4YyixN6W4awJTesW+vpOs+36iROTpeQpQc0MgCEyx1IxbXbxSU4kqNH
 Gxl/qHxikBfg/jGfqKhHxNs9JY5V45GKJTV7xtHm5TKByzO/rJBORltnIi/iwDe4pNa0
 A8rQ==
X-Gm-Message-State: AOAM533Br/2BfFSjcVD6ZtLRn+vJvOdAOwzNGFGC1qZ1lCbH1fW+u4Yd
 JxoxN8nDjQEwiETFISFvTobquZVr9piGpQ==
X-Google-Smtp-Source: ABdhPJzaPqK4Oode6+pXSIJeh4Glk5XOKsfsirH0ssBunzxUghZlQxWstSgEbedWqXPfjtV1gHQqoQ==
X-Received: by 2002:a63:f80a:: with SMTP id n10mr17837931pgh.303.1632035422446; 
 Sun, 19 Sep 2021 00:10:22 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-75-194.sb.sd.cox.net.
 [68.6.75.194])
 by smtp.gmail.com with ESMTPSA id g24sm10786458pfk.52.2021.09.19.00.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 00:10:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 00:10:14 -0700
Message-Id: <20210919071016.3339939-3-christian@paral.in>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919071016.3339939-1-christian@paral.in>
References: <20210919071016.3339939-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v2 3/5]
 support/download/post-process-helpers: add helper function for post process
 scripts
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

download post process scripts will often need to unpack the source
code tarball, do some operation, and then repack it. In order to help
with this, post-process-helpers provide an unpack() function and a
repack() function.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Christian Stewart <christian@paral.in>
---
 support/download/post-process-helpers | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 support/download/post-process-helpers

diff --git a/support/download/post-process-helpers b/support/download/post-process-helpers
new file mode 100644
index 0000000000..bed8df2577
--- /dev/null
+++ b/support/download/post-process-helpers
@@ -0,0 +1,30 @@
+
+unpack() {
+        dest="$1"
+        tarball="$2"
+
+        mkdir ${dest}
+        tar -C ${dest} --strip-components=1 -xf ${tarball}
+}
+
+repack() {
+        src="$1"
+        tarball="$2"
+
+        # Generate the archive, sort with the C locale so that it is reproducible.
+        find "$(basename ${src})" -not -type d -print0 >files.list
+        LC_ALL=C sort -z <files.list >files.list.sorted
+
+        # let's use a fixed hardcoded date to be reproducible
+        date="2020-02-06 01:02:03 +0000"
+
+        # Create GNU-format tarballs, since that's the format of the tarballs on
+        # sources.buildroot.org and used in the *.hash files
+        tar cf new.tar --null --verbatim-files-from --numeric-owner --format=gnu \
+            --owner=0 --group=0 --mtime="${date}" -T files.list.sorted
+        gzip -6 -n <new.tar >new.tar.gz
+        mv "${tarball}" "${tarball}".old
+        mv new.tar.gz "${tarball}"
+        rm "${tarball}".old
+        rm -rf ${src}
+}
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
