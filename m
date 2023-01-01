Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71471C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E95160C2C;
	Sun,  1 Jan 2023 23:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E95160C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZpH9yguQMZS; Sun,  1 Jan 2023 23:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FD7160BFC;
	Sun,  1 Jan 2023 23:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FD7160BFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E43B11BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C02E4402F5
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C02E4402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zx7EeISP8YSH for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17E0C4018F
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17E0C4018F
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:05 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id e205so23800275oif.11
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GUqBMM67gZEdiYNg2HNKXo9UIJtVm8Krm1R8zkM3qzQ=;
 b=g2zydqMYe9XYLkUNOXE2C+v6f9lJ8H8fNuyRrAeuWqRc4N1wYsQieBBDlDkMNf1AN4
 pl9GkcZOdj9ht2TL7lfeJ2cdOLAqAWxbSnVUKnPPF4pXYYl3jQD7owJiDjMvgwSg6fK3
 H4WQWaRelohYFyTiCppfeugmUlK07+iV3X+07Ix4VYoCrUhF+93Pj14cmAWus8xP+1Vo
 /Z5CH4BlijpgyootJpM21C7bczFNMk8yMVdyRAhi4FRl5zlrX/vH089R0onvkyt8MY0o
 ls7MemrgIvAt7qNBWlSp5i80T1CeHjsktIaIuoLB7WvowWkPiammtD3rHN28RBhBClvB
 KYGA==
X-Gm-Message-State: AFqh2koZkRW1CdWvtusV+LcTGaMulSadBGUS17Rmb7ue33F2TUBgjwTd
 AW3/gKUiUaCKCm05rh7nlzpfmmGT0U0=
X-Google-Smtp-Source: AMrXdXvAO7nuCDEPl/c/UAKGQIqpJVdPLEhAJl/xGHpd++jktx80hOpnBmZCQFFgib/PZ6HqTT0lbQ==
X-Received: by 2002:a05:6808:238e:b0:35e:aa28:a433 with SMTP id
 bp14-20020a056808238e00b0035eaa28a433mr23826017oib.25.1672616343953; 
 Sun, 01 Jan 2023 15:39:03 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:02 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:25 -0300
Message-Id: <20230101233653.487175-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GUqBMM67gZEdiYNg2HNKXo9UIJtVm8Krm1R8zkM3qzQ=;
 b=gFpUkKcC75kQZX7GJ2BkZgSxy35m1AUTxek/hbzu7ct8ykFwMogYpLpg6nYejhx0ri
 sjRbOwsrQcfLaTU+GQRVwPnqbuoL4ogln+eDsKU3u2m8nOn6UWDBQ+Agy3xQ0J8CaOF+
 O4djcLYIMCKmUs/2wL0fQdVnsNTkJ9jSd4UoEMY1NCdgRDjGTA4W4Z4kOCCDcaDf+zJY
 PGfCRG3hYSiqFJr6ruoBkWJIlvCPP+ymY0IGUhPzQD8uxGzxqRLzf1/wxaN46+tY+wib
 p7YCumE/AGfMz/Yr7pCy93vpe3fO6b85HJUiNWBFYQHfGgYtWZ+hciOem9BVJg8VYMIM
 N0ZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gFpUkKcC
Subject: [Buildroot] [PATCH 01/29] package/pkg-generic: add check for
 deprecated _INSTALL_HOST_OPTS
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "f6fe8932df pkg-generic: add checks on deprecated variables
FOO_BAR_OPT" introduced checks for deprecated variables, and warns the
user to use _INSTALL_HOST_OPTS instead of _INSTALL_HOST_OPT.

Commit "6a25cec33d package/pkg-cmake.mk: rename _INSTALL_HOST_OPTS ->
_INSTALL_OPTS" removed the usage of _INSTALL_HOST_OPTS but didn't add a
check for the deprecated variable.

Add a warning to change _INSTALL_HOST_OPTS to _INSTALL_OPTS.
And change the warning for _INSTALL_HOST_OPT to also suggest
_INSTALL_OPTS.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f24e03a325..9db86eccea 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1200,7 +1200,8 @@ $(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_OPT,$(2)_INSTALL_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_STAGING_OPT,$(2)_INSTALL_STAGING_OPTS))
-$(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_OPTS))
+$(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_OPTS))
+$(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPTS,$(2)_INSTALL_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
