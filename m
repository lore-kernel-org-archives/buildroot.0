Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEA2C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0240940227;
	Sun, 27 Nov 2022 13:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0240940227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JI6M-yDTwJk; Sun, 27 Nov 2022 13:11:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 138E34017B;
	Sun, 27 Nov 2022 13:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 138E34017B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D72441BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B28A5410BE
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B28A5410BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ppRAq7v7ldvl for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2F61410BD
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2F61410BD
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:47 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-12c8312131fso10197864fac.4
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MNus9pujhGsZsPCW7P7qlvB6M/5DPtopZhhdkQ/xOOE=;
 b=aM8s90X6zlYvnZokZdXvTogLqU6Ir6/lIy6sHU7fpjdTdSkNd5e3BfWE0650ILv/2d
 9ol78V8YKG1fIo/q2n1u+eR0zJxfLZTOATtP+210si3Z8VhS3jVggbZI/F2d0bQEZ+Ga
 pM4Iyy0BipVML7s9YAsyX2oACIoP9Gbcko3uK6zCZPfUQz7Zj6p1hBfWgPRVz3yPj3El
 vdAvDp5oHYsYha1B0qCefvJowzezON5lyzjBs2OqmCeNEVRGVFbEIeqmJaPAkK0wUgYr
 zJVgtuwts9P7vsDeie4ZoAfvwdyg1SdmuN4PAXBKdBK8ZBmHR/vslX2eFkDGN3xpgQtm
 kEFA==
X-Gm-Message-State: ANoB5pnEnS0OaafrNd9Q2A2kWIo6Q6i+AMSDqG3RYO3YBXmSnYNMmjIr
 HVIvu55cN62pjtlkACRwauilfsONZCQ=
X-Google-Smtp-Source: AA0mqf7fljkVDweMaeT8Zk587K2e2nRTQ8Gebxt3s9eME1bNJGmoWpRGnlbsVt+n5ING9cZa2AzYRA==
X-Received: by 2002:a05:6870:f206:b0:142:efb7:23dd with SMTP id
 t6-20020a056870f20600b00142efb723ddmr15625645oao.188.1669554526791; 
 Sun, 27 Nov 2022 05:08:46 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:45 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:31 -0300
Message-Id: <20221127130739.1862398-18-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MNus9pujhGsZsPCW7P7qlvB6M/5DPtopZhhdkQ/xOOE=;
 b=OhEa5/qn1Q9Pnk5lpRzFV/avjeud3RAvpshmJ/TilyzQc2I9LmNl83+4qS4lh4r2ll
 kEaVumYSnHP9TIPXUswFw2GzNgFXbLQgu5A110uxTfnzOz1Pif3i1bV+Yc40RhoJ9pW5
 mi72Yek6FtEEWGGBGnyztmrrKCvScwIXSZQdZ8JWpaCgwB8x7sUXGRMvzlRfREHzcWUx
 tqWKpf2FwDtRlJOGHAGpn+1NF7V75eeKctwdhoPPUGjwgsSstiyyqNxtSVQZ5pSaio9l
 6SkBSRLLq6vYDdnvAzuR2YxYnjI/MJ81KJCMDcKS/hrlhetKEWwHwrxRTa60k+VIrT5+
 IjiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OhEa5/qn
Subject: [Buildroot] [next 17/25] package/gitlab-runner: ensure use of
 LIBCURL_OPENSSL
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
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently this minimal config is accepted while it shouldn't:
BR2_x86_i686=y
BR2_PACKAGE_BEARSSL=y
BR2_PACKAGE_LIBCURL_BEARSSL=y
BR2_PACKAGE_GITLAB_RUNNER=y

BR2_PACKAGE_GITLAB_RUNNER selects BR2_PACKAGE_LIBCURL_OPENSSL.
Kconfig does not enforce a select when the symbol selected is part of a
choice. See similar explanation on [1] and [2].

Doing something similar to [3] and depending on the choice option
instead of selecting it would create a Kconfig recursive dependency.

Just dropping the ineffective select would keep the above defconfig
snippet as an accepted one.

Adding a comment to the menu, i.e.:
comment "gitlab-runner must use BR2_PACKAGE_LIBCURL_OPENSSL"
       depends on BR2_PACKAGE_GITLAB_RUNNER
       depends on !BR2_PACKAGE_LIBCURL_OPENSSL
could improve user experience but it also keeps the above defconfig
snippet as an accepted one.

So bail out the build when gitlab-runner is enabled and libcurl-openssl
is not selected, similar to what is done in [4].

[1] "a44b1c1405 legacy: update the BR2_PREFER_STATIC_LIB option"
[2] "b1d5aa1bc2 package/qwt: Fix selecting OpenGL support in qt4"
[3] "9fc652a373 package/libmodsecurity: needs dynamic library with
     libcurl and mbedtls"
[4] "fda53f0791 package/Makefile.in: add detection for the lack of C
     library"

Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/gitlab-runner/Config.in        | 1 -
 package/gitlab-runner/gitlab-runner.mk | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
index 89e3e87b5c..5b8a6cacbe 100644
--- a/package/gitlab-runner/Config.in
+++ b/package/gitlab-runner/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_GITLAB_RUNNER
 	select BR2_PACKAGE_GIT # runtime
 	select BR2_PACKAGE_LIBCURL # runtime
 	select BR2_PACKAGE_LIBCURL_CURL # runtime
-	select BR2_PACKAGE_LIBCURL_OPENSSL # runtime, for ca-certificates.
 	select BR2_PACKAGE_OPENSSL # runtime
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # runtime
 	select BR2_PACKAGE_LIBOPENSSL_BIN # runtime
diff --git a/package/gitlab-runner/gitlab-runner.mk b/package/gitlab-runner/gitlab-runner.mk
index c7c2da2fe1..c997785d90 100644
--- a/package/gitlab-runner/gitlab-runner.mk
+++ b/package/gitlab-runner/gitlab-runner.mk
@@ -12,6 +12,10 @@ GITLAB_RUNNER_LICENSE_FILES = LICENSE
 GITLAB_RUNNER_LDFLAGS = \
 	-X gitlab.com/gitlab-org/gitlab-runner/common.VERSION=$(GITLAB_RUNNER_VERSION)
 
+ifeq ($(BR2_PACKAGE_GITLAB_RUNNER):$(BR2_PACKAGE_LIBCURL_OPENSSL):$(BR_BUILDING),y::y)
+$(error gitlab-runner must use BR2_PACKAGE_LIBCURL_OPENSSL for ca-certificates at runtime)
+endif
+
 # Don't run gitlab runner as root.
 define GITLAB_RUNNER_USERS
 	gitlab-runner -1 gitlab-runner -1 * /var/run/dbus /bin/false - Gitlab Runner
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
