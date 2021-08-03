Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCDAC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:44:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1C360FA0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B1C360FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D64218305A;
	Tue,  3 Aug 2021 15:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vsJwWhRoz6BZ; Tue,  3 Aug 2021 15:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C772831AC;
	Tue,  3 Aug 2021 15:44:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7ED0A1BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DFE3404BC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pl8-GiTbDBbX for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:44:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71C4F4028E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:44:52 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id i6so805165edu.1
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=01yiH6rWttU0hctLaNgy3fH0n/MEgyCJjK1Ihc7GMqg=;
 b=QMiXIRxCRKNBU5YSLl/DTzjuRRFX1tiaHX+BUmbNYjq4BuiAUZ42gfBuZo3wv6sDEA
 lTtwnwX656QKhW05PZOqgWJGgt5q6I7RvgPi6w8jKYzWJDf7PO+0AzutPsylziDxFB4Q
 qm2x+b4Aq+ilq4J1uqIHLnL89FqfmR1JdkE0UoDJtRzXuCpm06Z/xt1l+MabxYxzLL4o
 FsbJSOroWLWiNzoyEOmWNHmwwk7U6UYs/gysVqB6hcVPKqnLkckeXoKGLHWwr7J0LkFi
 uiZzN9nNDwc6WdBDvvg48mg40JKzYiVV6nc6pjlgLi2Qm+SwX9N4Qcr+g4d2KgBkDG0s
 gPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=01yiH6rWttU0hctLaNgy3fH0n/MEgyCJjK1Ihc7GMqg=;
 b=uAevpa+iWwnTYWC1Ui9BlJhz7QYt+3O07lVWV7ke2fc6jMO2AQZrfahPtrPlbT7F7r
 LzuN4W1ND7RGN9tXLMqqflc/MbA4vJoXjHIQE8UGa1OTogG7QvI0v/utJFllyXMw4Ijz
 5SSx3JVI64HJKsBDQIpzLnEHdHS9gvSGzpiAmmoty9NBKccsPESTfpegGKNrRHxLtde6
 a7rwhrzi3SGPDhR2uJ77wrqY/PpLIIxFQbtuJjGZ1Vn1qtFUfIk5NRtoWDOZ4GWPZWBq
 EN0dUGlG2lFtNGNKYLGzM20DxS4WWa2mf0QdCPp4slz/9v55J+i+9m09GSPycSDMBzmx
 QlaA==
X-Gm-Message-State: AOAM530i7Rd19lYMBc1G+L6ftHXL1dxAzlYiNz3xWhSYnepd6ooI8Rx4
 PpSAH7wKlM8QWOf4DkMMhQ/v87CTKbzjhbYABiI=
X-Google-Smtp-Source: ABdhPJwduKrK/pC826S9O7ClmvoPSM7SUjq72NgzUgAMlgUHKWRp9KVtFNjAKLSNyQpeS9KSsVqa+g==
X-Received: by 2002:a05:6402:95c:: with SMTP id
 h28mr15983203edz.199.1628005490537; 
 Tue, 03 Aug 2021 08:44:50 -0700 (PDT)
Received: from localhost.localdomain
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id k21sm8338290edo.41.2021.08.03.08.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:44:50 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 17:44:42 +0200
Message-Id: <20210803154442.647813-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] docs/manual/migrating.txt: add section with
 general migrating tips
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This is based on Yann's and Arnout's experience with migrating
Buildroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
v2: (after review by Yann)
- Run 'make graph-size' in the old environment, and save
  file-size-stats.csv instead of packages-file-list.txt.
- Run 'make clean' in the old environment.
- Split "Update Buildroot" as a separate, explicit step.
- Add a step to review the commit log for relevant packages.
- Drop review of the CHANGES file - the commit log is sufficient.
- Drop second patch ("individual packages") - the commit log is
  sufficient.
- Compare file-size-stats.csv after the build; also look for new files.
- Drop comparing defconfig - it's already covered by comparing
  file-size-stats.csv.
- Include Yann's experience in the commit message.
---
 docs/manual/migrating.txt | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
index 92e487c71e..89860c0940 100644
--- a/docs/manual/migrating.txt
+++ b/docs/manual/migrating.txt
@@ -8,6 +8,36 @@ Some versions have introduced backward incompatibilities. This section
 explains those incompatibilities, and for each explains what to do to
 complete the migration.
 
+[[migrating-approach]]
+=== General approach
+
+To migrate from an older Buildroot version, take the following steps.
+
+. For all your configurations, do a build in the old Buildroot
+  environment. Run +make graph-size+. Save
+  +graphs/file-size-stats.csv+ in a different location. Run +make
+  clean+ to remove the rest.
+. Review the specific migration notes below and make the required
+  adaptations to external packages and custom build scripts.
+. Update Buildroot.
+. Run +make menuconfig+ starting from the existing +.config+.
+. If anything is enabled in the Legacy menu, check its help text,
+  unselect it, and save the configuration.
+. Review the git commit messages for the packages that you need. Change
+  into the +packages+ directory and run +git log <old version>.. --
+  <your packages>+.
+. Build in the new Buildroot environment.
+. Fix build issues in external packages (usually due to updated
+  dependencies).
+. Run +make graph-size+.
+. Compare the new +file-size-stats.csv+ with the original one, to
+  check if no required files have disappeared and if no new big unneeded
+  files have appeared.
+. For configuration (and other) files in a custom overlay that overwrite
+  files created by Buildroot, check if there are changes in the
+  Buildroot-generated file that need to be propagated to your custom
+  file.
+
 [[br2-external-converting]]
 === Migrating to 2016.11
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
