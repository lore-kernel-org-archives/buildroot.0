Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3E0C05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 23:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B08CA417C9;
	Thu,  9 Feb 2023 23:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B08CA417C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ob2M65th-wUV; Thu,  9 Feb 2023 23:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA066417A9;
	Thu,  9 Feb 2023 23:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA066417A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F12901BF842
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 23:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D844F417A9
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 23:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D844F417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QUWqAuxwSF7Y for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 23:15:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAB8D4179E
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAB8D4179E
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 23:15:24 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id d2so3513536pjd.5
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 15:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j+mDgSqOetJ8op4ecWqRpB9pNOopJmtHcXvS0VXLJ20=;
 b=QHJHpGwXG6laV49arrUw/WP4MxAXpW6yjw3Wtj5lDAFJgvIvtRhXT3+8SAxBc106BF
 bc1zMu0FIhOPU6XthibChU+wC1whSj5jBUCYheTA7A0S4txwxY08QwuVUm9lZAN6ePQU
 HsPxLNrB7VHb0YGlUYbL/XoGZw5YueEThk3fDyUyylVFfs1zMLdsJnlGC1E7gqvaE5zB
 eXYj3EMlmnooJXkrl1fhc54dFXcKSCXQPiS0o0mFSuYkKL3G5cj/UCB6jNA7ayXNrnZd
 lcdsecVP5HS8SlnisgNMQwejC5LbbpFqKxO+JuwNJLNT/ATfUVEm3TNQWBxNq38CUygK
 7+Ow==
X-Gm-Message-State: AO0yUKXFacD8YYFnUHX2Fb1QOF16O6KFoiPwquIXWh18gV2UyUChYQBi
 4pgjK5UVpB1NHT0EpMVFVZ8hrWB4VE8=
X-Google-Smtp-Source: AK7set/X/aNce0gPkAdMLQMnW1MdQ8eU0H6KB9+R23gHLxRlVeS091HfvrQJsgnSBeni7yphd3RPJg==
X-Received: by 2002:a05:6a21:6210:b0:ae:47a6:e6d9 with SMTP id
 wm16-20020a056a21621000b000ae47a6e6d9mr10634243pzb.6.1675984523933; 
 Thu, 09 Feb 2023 15:15:23 -0800 (PST)
Received: from localhost.localdomain ([12.125.190.90])
 by smtp.gmail.com with ESMTPSA id
 c4-20020aa781c4000000b005905d2fe760sm1970067pfn.155.2023.02.09.15.15.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Feb 2023 15:15:23 -0800 (PST)
From: ckhardin@gmail.com
To: buildroot@buildroot.org
Date: Thu,  9 Feb 2023 15:15:15 -0800
Message-Id: <20230209231518.9458-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j+mDgSqOetJ8op4ecWqRpB9pNOopJmtHcXvS0VXLJ20=;
 b=GrpzYMopsEjjof/qE7dSP74v2cWSP3QcH3f2SsmoM7n7ihLuE0ZKwsAC8xKDmK/r7s
 sYu0TNlYj8hQK9oreywK7pqWmbfN5parBne5nvNcQlWT2eUlfXkPNJQ1m0Cz5KRvN/Ob
 j0cqCQQ62YFDTlUyDreKy8eQyJyYIEy+me6tWqfZzc7r3Y8TgOyHIzihdldM/YhY9CtZ
 WXLI+t2X948RDvQSHpUR61LkJpkpabfBU/BvcS6XSE+EAZW+3kTRDMNPmoqKQ/mEQx7I
 wD76sUcaKxxW7MacdNzSKgTmo9+NL3AxqIb5tp5M00FyqnGXx3j+L/RLXkOqym0QcXhd
 ZQ7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GrpzYMop
Subject: [Buildroot] [PATCH 1/4] linux: create a scmversion file based on
 the custom repo variables
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <ckhardin@gmail.com>

When using the custom repositories, the archive creation will
omit the source history to get reproducible hashes. This has
the side effect of making the setlocalversion scripts within the
builds to not create the tracking information as expected. So,
just generate a .scmversion so that kernels will be labelled
with where buildroot referenced them.

For example (line wrapped)

    #define UTS_RELEASE "5.4.70-repo-version-" \
                        "92c23d10d0031e0a13244a1a97e7530d3b53fc6e"

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 linux/linux.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7645b5f507..0b27c8dee2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -596,6 +596,20 @@ endif
 ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL)),)
 $(error No custom repo URL set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_URL setting)
 endif
+
+# Create a custom scm version file to reflect the source version since the
+# archive will omit source directories like .git to maintain reproducible
+# hashes for the archives
+LINUX_CUSTOM_REPO_SCMVERSION = \
+	"-repo-version-$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION))"
+define LINUX_CUSTOM_REPO_SCMVERSION_HOOK
+	(cd $(@D); \
+		if [ ! -f .scmversion ]; then \
+			echo $(LINUX_CUSTOM_REPO_SCMVERSION) > .scmversion; \
+		fi)
+endef
+
+LINUX_POST_EXTRACT_HOOKS += LINUX_CUSTOM_REPO_SCMVERSION_HOOK
 endif
 
 ifeq ($(BR_BUILDING),y)
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
