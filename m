Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2B5C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 15:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABD6284634;
	Wed,  6 Aug 2025 15:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w164rAY_Gtvl; Wed,  6 Aug 2025 15:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3BD584635
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BD584635;
	Wed,  6 Aug 2025 15:06:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 411A0233
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 15:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3273160B33
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 15:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0iVja07cD8p for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 15:06:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7EA9F60A80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EA9F60A80
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EA9F60A80
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 15:06:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b79bdc9a7dso4319679f8f.1
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 08:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754492801; x=1755097601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+OQu19H2BMW0tolp/ESOh4UFGTI4IJtjYsmpSMlSQ4=;
 b=SqjovrwMfI+7MPzCBcX4Cp9pTrSrEfORQGdOar6tuWrZIMNGA7wvgu3uomtWKHfKt4
 C6KXoPJU1zAyskUcWVY9Gx9cKsmkCkA7b2hykXoTW+XrvBB0PFSNgmE9Bp4A9pqkpBBl
 2/0J+6BUg8DAvpz0Eoq8opjhI+sfHwlrslz845OqS3p28kPjm/DhfH71olLEN9rspXWk
 d5NGiUa9Of4PkK0yw6sN+pX5D+CI+XLLiAUYSFzaUYJFbCw6o/QSt23bYIaUJ+uF34Sx
 sGiWZGqP/tJ23cgi4D3VF5GGsXDM4xApJquExIEeX2UgM5xZ059wj6tTHvGnANo6Eohe
 LUrQ==
X-Gm-Message-State: AOJu0YweaatkrqduY1ZVnWY7FpJBDMpptFrVL3VMl6kNsj/7hkiu76sz
 h8Uc5AJmt6pzkdRNkBZ4KfQc47L8o5ba0wSROtCuoYZNEqaysdJOglv73IayXQ==
X-Gm-Gg: ASbGncsQDhko3Cv0yXXWHC/FD2xn5GnQMQQYJJZON3uD2/1WibgWFXKn9Joo+XUdzof
 kRYMPdVIgkjd6J7IpYSiCvzibbCweEKd7eRDVz/W7IydFd6WZYWXUb6/Hr3CmBqi8osKNLCKHQ4
 8PKbPs1R9lsYx6HZl0a/Rk/VFOb/2MMl6YytVrfTBchpnQzhuz+ACLDl5L5yuQwYt8lkiVYE5v6
 EtjjySs+7evMwP/ucX3UlRVmDUMnem8hHywJ41rBFTSYQlIH6nrOapw7HVX8o5BE0znVLpR1FrI
 rtBPZkmrOQNxZ7xxtoor+Kyqk2gpw02YMmHJg7u95QEr3zBL+ZE/pys+a6Ujz8huYXdqtvbZjdV
 +qtrB9gzBLgJg4pEsTnLbMJx5fA==
X-Google-Smtp-Source: AGHT+IG0o2maVIXC9efiwheIEuAbkHLSJwhhmiLQ5PtP0KD6TE/8uWmBn1l5yI3CQaC3CLhJdBo+hg==
X-Received: by 2002:a05:6000:4305:b0:3a5:57b7:cd7b with SMTP id
 ffacd0b85a97d-3b8f48dd912mr2671159f8f.22.1754492801413; 
 Wed, 06 Aug 2025 08:06:41 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:5e58:cc24:6853:da7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9160sm23456493f8f.21.2025.08.06.08.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 08:06:41 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>
Date: Wed,  6 Aug 2025 17:06:35 +0200
Message-ID: <20250806150636.20937-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754492801; x=1755097601; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=N+OQu19H2BMW0tolp/ESOh4UFGTI4IJtjYsmpSMlSQ4=;
 b=hChSazihqo7HlV+ocr9k8R6cmeovhoHxs96aqrWDstAZAJPIVqO/HlNl/uTzDHeZVq
 XDT7E5cW3mDioUJ/VopbnKZA43KDngabLE600xL0FNE/Rw4fESSkWwTmD5Phlj2Wr5Jh
 4Rg096vZX6osWa4XPshXgpwtzMTpXK5l+rqdmLLR4bSEv83GlLmkSLu2JRdSY0CpRBzh
 PFrugDjSEyb4c1hTZbYCQ/Kb0CHRhEmogeBeuaVfyBiUpWmXGkDmsh8IL6nc4sCD2kSr
 lOafSoZ/ZsAAlggIF3x+DoIy5udd7HiStio5Sl1k2dkhK1kvp2o0NepKaxxCkMXtPOXk
 Xm7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hChSazih
Subject: [Buildroot] [PATCH 1/2] package/grout: add kernel TUN dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Grout automatically creates a TUN interface at runtime, so the target
kernel must have CONFIG_TUN enabled.  Add a fix-up to ensure that option
is selected.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/grout/grout.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 46d3cf5f0a..53271dd913 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -20,4 +20,8 @@ GROUT_DEPENDENCIES = \
 	libecoli \
 	util-linux
 
+define GROUT_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+endef
+
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
