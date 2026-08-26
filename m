Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B57C61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 21:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF3C3406F3;
	Wed, 26 Aug 2026 21:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1j19wgbr6vE8; Wed, 26 Aug 2026 21:00:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787778050;
	bh=XZZDesislJn6Gj3K5Bbw0uiteS6bdOYsCrvOVGuLTZU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DrstgcaEjiaoeTL1d6HGAwt3M5jH8+hUQfWdjT0dmYoOkl7dwTvfpcOaeqCG/nc9I
	 VZxx6M8EHeqcx4EqqkWTulwCZpjJLOJKqM688HLCb4kAJgssXGBIP5n0nmL+Ia9lt1
	 74V2qP6sr7Rrda54rwWkVV+lAQRGQWCEPRe8EblwVjTmMebILOj3rTS+03gp57Y/+i
	 /o/+p+ny3Vmbzfr8Ne4hPzRniUYwr2HFABkSHTFxDRoRJ+Lw002htDKm4VlSBRd0y8
	 FE6agiCpn41n83k0lzuv1YzDnzALCSjcm/qi8/IRy7KxOolUxQmOqKZMdmLfx4XasT
	 +eOTDkMr6trmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C60E2406C5;
	Wed, 26 Aug 2026 21:00:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B59629B
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98CFF80B6A
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9Wmakawv4Co for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 21:00:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DAE980B63
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:00:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-47fe2d179e2so771486f8f.1
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787778046; x=1788382846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FhFdotdtmCTX2I8EtPvvfZH/zvuaG2qMcmxzJm/D8Ig=;
 b=nO1Rvpxv42Dvc1/d3d1/1FOuzULTMpNd+WOwaFkle++1SibZwQ2KDdgdx0/3odc7IZ
 KSmRWbRTVPv+9kqW91xXQEqqBYO50kjnQq9XamimhO8Fsn+iqZyUdop7APFNw2okLJ76
 ZkDCTBYYfAZ3M4V6YkifyiF3fOEragjvXeXUIkYM9uxc03aQzTg7FZBsQkD/TnSg/xVv
 JuEk3ep1hhZ0bHWZtYtymm+bvFWZ4CCJ+AQ9eK6cusHSvURB7IOAt/6HI5r4YzaoQLrI
 JMcP5VvxOzi7JsyTITPCPql+BDVfe+zF0r8zmVZdDGU3aWtRXr0l+pcJ5f+hZu8YkeRo
 pEtA==
X-Gm-Message-State: AFuF++nrcuYKbnCf3XtmzvXs37sO9MwCHChhc38Ts4PhpwQhT4PFg+ST
 0gIBq5oXy5n5tcfHEkvXpHyh52YrEG9uXdMcaKiJLvrEw8VbbgDWM8eo0IU1K3PTAHk7ho5uC8b
 ft3BFPNY=
X-Gm-Gg: AR+sD11kZr6pIUaDfZH1IeinoP5jJBtGPOXF5hB18I7rAsTcp2lMjgYJKKsiNY2vRO5
 1HKn6XYyx8mfMKL6IE2ZUTR8wXBU2sMWIOjVBd+9xklmA8R359jLpqwH8QwgjwX/Lrd1to38vIh
 yWwtobqxrsIZciaT1EQcQoAV1TwY5GzQ6KrvWxJQnT2XTjY71ZLWbdrNNtrYuo4OiQWx8IEZCmv
 N68EovUEzKB2ilKPzfFL8KhjtQKl4IC/3sOVA7Oiij7VLyzj7hF7EEraYdt20UosmiBbR/MfFyT
 csK7KZLaiB0ijUVhJa6f1mUz991ZJvM86JSqYIJdwOxE99CcLRR6sj9vxD7S95CW0rdYT7nQCf4
 O5ryTsgy3y9ezoYvRqfaxQfiBSzRJS54W8OcxxaE0A6uO3cHT3AvPP+0X52zmf5o5jvLh9JAqI7
 kB+Zs78YiUhcdHmYd2oiOyIsiTnx5Sfh/HoVFbySkmaXPaZQireBQolDgVX8kcE8ioxA5ScTU0x
 YokE4hRYBrFXyOHt4g6DBHvuFFK2c6W7bxQvPdYF0YzL8z4fXxAV/7e2rqOqB4groIqfylCXw==
X-Received: by 2002:a05:600d:6413:10b0:49b:c8e:a211 with SMTP id
 5b1f17b1804b1-49b0c8ea368mr30306565e9.5.1787778045652; 
 Wed, 26 Aug 2026 14:00:45 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28dc134sm4020882f8f.20.2026.08.26.14.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 14:00:45 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 26 Aug 2026 23:00:42 +0200
Message-ID: <20260826210042.212245-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qt6: fix c++ static_assert issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the last qt6 version bump to 6.11.1 [1], the TestQuazipQt6 fail to
build due to a c++ static_assert issue.

Backport a patch from v6.11.2 release.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060153667 (TestQuazipQt6)

[1] https://github.com/qt/qtbase/commit/2983318421d623c6c9feff95ff947ca489f4313d

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...e.cpp-remove-is_always_lock_free-sta.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch

diff --git a/package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch b/package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch
new file mode 100644
index 0000000000..3347caa8da
--- /dev/null
+++ b/package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch
@@ -0,0 +1,41 @@
+From 2983318421d623c6c9feff95ff947ca489f4313d Mon Sep 17 00:00:00 2001
+From: Mitch Curtis <mitch.curtis@qt.io>
+Date: Mon, 11 May 2026 08:41:08 +0800
+Subject: [PATCH] qtestsupport_core.cpp: remove is_always_lock_free
+ static_assert
+
+This causes a build failure when cross-compiling Qt for MIPS32 targets
+(e.g. `mips-unknown-linux-musl`, `mipsel-unknown-linux-musl`).
+
+Amends 9b938823776865837901f29082301f5624ac2b04.
+
+Fixes: QTBUG-146670
+Change-Id: I170bd9f93c1ef809f56e5b36835e457bbbe8e16c
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
+
+Upstream: https://github.com/qt/qtbase/commit/2983318421d623c6c9feff95ff947ca489f4313d
+[Romain: backport to 6.11.1]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/corelib/kernel/qtestsupport_core.cpp | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/corelib/kernel/qtestsupport_core.cpp b/src/corelib/kernel/qtestsupport_core.cpp
+index 9bbe1c18e84..5f28cedec68 100644
+--- a/src/corelib/kernel/qtestsupport_core.cpp
++++ b/src/corelib/kernel/qtestsupport_core.cpp
+@@ -8,10 +8,6 @@
+ 
+ using namespace std::chrono_literals;
+ 
+-// Assert that this instantiation of std::atomic is always lock-free so we
+-// know that no code will execute on destruction.
+-static_assert(std::atomic<std::chrono::milliseconds>::is_always_lock_free);
+-
+ QT_BEGIN_NAMESPACE
+ 
+ // ### Qt 7: reduce the default: QTBUG-138160
+-- 
+2.55.0
+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
