Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BC7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 23:47:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98E47603E9
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 23:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98E47603E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E774401B6;
	Sun, 10 Oct 2021 23:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eo39jhNwB3ua; Sun, 10 Oct 2021 23:47:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FA4A4028C;
	Sun, 10 Oct 2021 23:47:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71BEF1BF3E8
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 23:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60CFF403A2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 23:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8rnF5XlS_JxE for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 23:47:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E794240398
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 23:47:00 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id e7so9134614pgk.2
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 16:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QWMpUokjC3qnOa0cDzE4fDNq1EgXoEhr+2Mx6K6XmwA=;
 b=XAj2HM4Fwj1fTo9kcO/o8eJMWFWpCA8pIJwvcUx/NM/4k7eR0APlNk8vKRB8uVpCTx
 JbuLupKSG8S0a+MMk1ZnZwlCEluO4UO9zXpnwLmNDRTUPNaRZyUBxQj8h4SjkSOzESvr
 zngqDEENvJb5Z6/RyXs62rdCpTNK0BnSxZVZkCCBnDSUIIGGear+vzaweq0dqL/Usbft
 PRpBqmSWku+ONCuDjJsGGsn4qFswli7fBq91AnMnr+Dn2GRcqOV+2+Gm3+6rxC7nmGMF
 jpSm2WqJSmwuRwbOoX6VvRP0DVUYtc8O49sLpWhzXCLIJegpnMFHoTsi+GWoOgJJPAkC
 rn7w==
X-Gm-Message-State: AOAM5318PkyD97AFTLKviYYky7fZTT9IoJTT1Rm6RqDj9SUvy5t5BDcR
 N1mmA1XJcFqbZ9Dh2MqpHNqrHMPqbiSmqw==
X-Google-Smtp-Source: ABdhPJzVJOTExYWm9YvKk/JNnlMdtcWMtSzidwycLRB9xpHTe375kzWwYQEqL58YkfXDGHVuPH1Oig==
X-Received: by 2002:a05:6a00:148f:b0:44c:fb1b:b3eb with SMTP id
 v15-20020a056a00148f00b0044cfb1bb3ebmr8799450pfu.11.1633909620123; 
 Sun, 10 Oct 2021 16:47:00 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id t6sm5662547pfh.63.2021.10.10.16.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 16:46:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 16:46:52 -0700
Message-Id: <20211010234655.585526-3-christian@paral.in>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211010234655.585526-1-christian@paral.in>
References: <20211010234655.585526-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v3 3/6]
 support/download/post-process-helpers: add helper function for post process
 scripts
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

download post process scripts will often need to unpack the source
code tarball, do some operation, and then repack it. In order to help
with this, post-process-helpers provide an unpack() function and a
repack() function.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Christian Stewart <christian@paral.in>
---
 support/download/post-process-helpers | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100755 support/download/post-process-helpers

diff --git a/support/download/post-process-helpers b/support/download/post-process-helpers
new file mode 100755
index 0000000000..b3231207a6
--- /dev/null
+++ b/support/download/post-process-helpers
@@ -0,0 +1,26 @@
+# Helpers for the post-process step to re-pack vendored archives.
+
+. "${0%/*}/helpers"
+
+unpack() {
+    dest="$1"
+    tarball="$2"
+
+    mkdir ${dest}
+    tar -C ${dest} --strip-components=1 -xf ${tarball}
+}
+
+repack() {
+    local in_dir="${1}"
+    local base_dir="${2}"
+    local out="${3}"
+
+    # let's use a fixed hardcoded date to be reproducible
+    date="2020-02-06 01:02:03 +0000"
+
+    # use the helper to create a reproducible archive
+    mk_tar_gz "${in_dir}/${base_dir}" "${base_dir}" "${date}" "${out}"
+}
+
+# Keep this line and the following as last lines in this file.
+# vim: ft=bash
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
