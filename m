Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13D6C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6814281382;
	Tue,  7 Feb 2023 21:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6814281382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LryWVglnzHg1; Tue,  7 Feb 2023 21:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E8DD81328;
	Tue,  7 Feb 2023 21:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E8DD81328
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92FA01BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76E8881EC8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76E8881EC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFUhdB0HU8dW for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:33:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67D0D81EC5
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67D0D81EC5
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:33:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id o18so14926802wrj.3
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 13:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zQWSucNihx78ucHlryvTTu1jrKKLyb2Haxh45wkFov4=;
 b=Q+o5c65TVhVfw1WLSh9oUIZuuTs/5GQL+WXAJhLro9NbyBLl/Izo7J+nPFXIugDcLV
 u2PwX81oAtRnQs2ocPQ5TNki/VWyEq2x2qSg0NxPfelSstlEEAdN7SCuzqXgJzXLnHHf
 h5WEm/AOze4IgxifMspotdZNsfOfAk0tpbdqzqCLWfwYf47PpwvjttnNDKIEXN7n5vFm
 cgMYeaTGuAjDvGNeb2bFZgVbYZ4+4jkFHjPr3ya0jL+m4kun7UJNaAYwJu9dq3Uhi0uY
 o9irWV8aSHKOcsDpefCh+AreHY2f5crByGavZWf955NOkumtKsLqEYV5oC9IZpWCI2Y+
 B0TQ==
X-Gm-Message-State: AO0yUKV/kAm0o1I94T+2/lxMUFQQLRGAmb4bZ4t9j7+kR2/GhgfzABW/
 xgk9L/O9EwdELvXAX0UVSs5IFN7EKxj+2A==
X-Google-Smtp-Source: AK7set+aW+pehBmhsJsLgy/BNIxncQI3jTtEH1BNOIUpNfWt68db5j/lVNYeYjNm0fkgF3dwHrprDA==
X-Received: by 2002:a5d:6843:0:b0:2bf:dcfb:b58a with SMTP id
 o3-20020a5d6843000000b002bfdcfbb58amr4896164wrw.68.1675805595486; 
 Tue, 07 Feb 2023 13:33:15 -0800 (PST)
Received: from localhost.localdomain (pop.92-184-112-98.mobile.abo.orange.fr.
 [92.184.112.98]) by smtp.gmail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm11987085wrs.40.2023.02.07.13.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 13:33:15 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 22:33:12 +0100
Message-Id: <393e263cc9e0f72b237b6bf5cda86101ded50101.1675805584.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675805584.git.yann.morin.1998@free.fr>
References: <cover.1675805584.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQWSucNihx78ucHlryvTTu1jrKKLyb2Haxh45wkFov4=;
 b=UWGyekMtbjL1Gs/45h3itVHQsTLjIacAZHsCX0+bmkk5qA90rxzndDh7uxuzXvzjRA
 wp39hoXlRG97MtYg6sZD8ZoyZ7hIfJITgKFdcqeFGfFBYgFc9/w2FkcvlX+nrERwKcF5
 h/mbIoYY2BifZXzLsSlRnGkPSj0o5lVoRoZgUEN50IuXa1gR6mRiQ9OKBZDgHr2K7l0l
 Smzq4LVcVqNeV2B0Zi6JlqvLvEbuXl4nb/4p0EvUWsKxorG3liTxWCFkRB2EWiAc3LSG
 /GTzivkSxtjwXGnnBTiYTSrARb5xoEW62bglm7cwq1Ih4yxKlj7HlNOE1Xr8ONcGVLzV
 0voQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UWGyekMt
Subject: [Buildroot] [PATCH 2/2] gitlab-ci: fix pipelines
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When gitlab prepares a job to run, it checks out the repository with a
non-root user, and spawns a container that runs as root, with some UID
mapping that makes the files be owned by root in the container. However,
our pipelines run as a nont-root user.

Commit bde165f7ad (.gitlab-ci.yml: update Docker image to use) updated
the docker image that is used to run in our pipelines.

That new image includes a git version that is stricter about the
ownership of the git tree it is acting in: git aborts in error when the
user running it does not own the repository.

We use `git ls-tree` quite a lot in our check-{flake8,package,symbols}
rules, so they all fail (in various ways).

To fix this, we either need to fix the ownership or tell git to ignore
the situation.

It is most probably impossible to change the ownership of the files: we
run as non-root,and the files belong to root (in the container). So
we're stuck.

The alternative, is to do as git suggest, and tell it to ignore the
situation. In a local setup, this woujld be very insecure, but in the
pipelines, this is in a throw-away container, wehre a single user exists
and is running, so we don't care much (if at all).

Add a global before_script that registers the git config to ignore
ownership issues in the buildroot repository; see [0] for the definition
of the CI_PROJECT_DIR variable. Note: unlike what is said in there, and
in [1], the value actually seen in CI_PROJECT_DIR is already prefixed
with CI_BUILDS_DIR (the documentation is unclear about that point).

[0] https://docs.gitlab.com/ee/ci/variables/predefined_variables.html
[1] https://docs.gitlab.com/runner/configuration/advanced-configuration.html#the-runners-section

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/misc/gitlab-ci.yml.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 9c1faf0d5f..38aca31fb5 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,3 +1,6 @@
+before_script:
+  - git config --global --add safe.directory ${CI_PROJECT_DIR}
+
 .check-check-package_base:
     script:
         - python3 -m pytest -v utils/checkpackagelib/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
