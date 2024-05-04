Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A680C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CDBA41EF3;
	Sat,  4 May 2024 21:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9L-sJc_-g9BE; Sat,  4 May 2024 21:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E227841EE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E227841EE2;
	Sat,  4 May 2024 21:41:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BFAF1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64B6482CE4
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwL28TXDOFDw for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A389682CC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A389682CC7
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A389682CC7
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:39 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55ffso3834605e9.1
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858838; x=1715463638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F1xJf1aXSBPd0o4IJNX4MDoq8l4iMJDDsBjxVBUzPCo=;
 b=whAfDVSCEs8novNuOej4eDqLhqzxBijeuTwGxXmpa7xHZggSKb6Iop5D6nmObnWJfT
 0N3gyG7lneZYVp6Y4nK/lvPdhGyW7nokkQMti4s2wKXYmJFNslmw0A5zroBygWVexzim
 XUkfoH6ILiphHXwJOlO4Mh8XoFY4UsMBqV3zgYR+ZyvpK/o3nsC0TM9wmOr3KfqzL31g
 i1ZrnQqilZSuFfB5BsN9lKt6yvGEZK9zHReM0WB5GsjLv2xUxgF4sZbWQERy36LtJ10i
 UHuZj7maWkAqC6NXW7ON2EuOVXZUmC7YHUeEJOnGqPLkQcx93icaR6pqXUnXGxUR0ajt
 bXFA==
X-Gm-Message-State: AOJu0YxMwmEMhWfiIkQqFjKahvkTjtv4PPhC4bH9Thcq6CZAbJIU0Nrr
 ZPJSdeteK6msy9yRdbJRZzAz2JG/J1hmmEp5FDwPDhvj90oOBV332yewCg==
X-Google-Smtp-Source: AGHT+IE72As58frtwMnjY6UKNkB6rcnzCan2/Pucrkqi7xgsRZeU9VrqABRBhF+JzZZ722/a3qAE1A==
X-Received: by 2002:a05:600c:3103:b0:41b:f24a:b590 with SMTP id
 g3-20020a05600c310300b0041bf24ab590mr8185909wmo.3.1714858837818; 
 Sat, 04 May 2024 14:40:37 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:37 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:23 +0200
Message-ID: <e79a13c69b3717a5a56d0af58d2e905c98af1c2f.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858838; x=1715463638; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1xJf1aXSBPd0o4IJNX4MDoq8l4iMJDDsBjxVBUzPCo=;
 b=Cf70gO4/oxOyxtobq9aALmX2W7aUk/A+QKdDaUystdRuGXr+pmEeyrVk3j6VudqNDk
 lt0IDu0hB0JVqkfEQEBvFe9UnRjCXV1HODmtd27CwGMQHdqGcH6Vli5UMYrfmkgYsRa+
 JxceAM36oIzugPcPBNfLuHxwFSg7m54dNordNDcVIvIFPzbkcaBlOkfGbk7iFiWCA1Ld
 BMiqSCB+fHZcqs5GV+HCd0G0AL7fGNEO8aGuQgC+TB5g4PbfuAGOJjNpd43VTCCWnkDt
 xXNzuf9ykh8n5mOETN520km8Rht6fhU7XwiL0P0TSpfUVYf77Dv+U5yQb3TYqHP/bZTT
 ameA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Cf70gO4/
Subject: [Buildroot] [PATCH 22/22 v3] support/download: force fetching tags
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Our git download backend switches the remote of our local clone, and
fetches all refs and tags from that remote.

When the local clone has a tag fetched from another remote, and the new
remote also has a tag by the same name, and that tag points to another
commit, then git refuses to fetch the new tag and exit in error, as it
consider that the new tag would clobber the existing one. This is a safe
and sane behaviour when run interactively with a human that can take a
decision.

However, in our case, we don't care what tag is eventually used, as
only\the last one makes sense in our case: the one from the remote the
user has requested for the current build.

Tell git to forcefully pull tags, even if they woudl clobber existing
ones.

Note that, although this changes the git backend, it does not change the
content of generated archives, so we do not need to bump the suffix
version.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 8134c07214..d49016e90c 100755
--- a/support/download/git
+++ b/support/download/git
@@ -132,7 +132,7 @@ _git remote set-url origin "'${uri}'"
 
 printf "Fetching all references\n"
 _git fetch origin
-_git fetch origin -t
+_git fetch origin -t -f
 
 # Try to get the special refs exposed by some forges (pull-requests for
 # github, changes for gerrit...). There is no easy way to know whether
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
