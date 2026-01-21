Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC072D2ED0C
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 14:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56235429AF;
	Wed, 21 Jan 2026 14:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AA7wgzMgzBgt; Wed, 21 Jan 2026 14:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 758B1429B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769006626;
	bh=8goAAjze0dzep+acwcTTrtW2WPABlEOmTWX2p98ajF0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=diqQnYlIEvifgtKBRN8hJLmR1gZiW956Tb8yUb7FxIvExWQ0vn3PJxNG1q1koWUrz
	 iZOQlTpA4sFfzFKEf0AyCAQrk0aYhERrd5o20xihsy1hxhbBwgqD3swJnLsBEgGPeP
	 SkOdsIrXNotKuCxChZrRlqhFb+y529xq0Y98Odzd7eTckGXGej0WzKL1t6/u36D/Ls
	 H2t/5NEUTRPCWhlSu3R5psRmG9mtKGvqQvSSNSQenoOU4TwZhaOHDyotB3btlB16Yt
	 MusFr/E6SHtUDVElxGjWfOpqlzSgp9vNWseHxp8liUOf66XpL5DRu9aSVcc9JRvoHM
	 5JBCXjNRNWdAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 758B1429B0;
	Wed, 21 Jan 2026 14:43:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5353C122
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 14:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42605429B0
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 14:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIdUXqWluJ4a for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 14:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=nolange79@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72E75429AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E75429AF
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72E75429AF
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 14:43:43 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4359a302794so540957f8f.1
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 06:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769006621; x=1769611421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Itydtsq8vlSuo7XVS4IvPpCHnXzrByP4wxCSjNHFU9A=;
 b=pBiV2CGHCORKTYZJthkUqpbo6PIG8cRa/gcHxowQ+lb1qai+DX9ElZWMfvHCYqapF9
 IbBDsBEBTA17fUk9XzY4xKu1vTKXBrYxnmumpYdFWsCWkc9KGAKqMghYTm6hDWPj9ZtG
 j8tj0shOezcaQQkhvOJueLOjmoYuvckIVcHSTu65WtVDE4JP5yHEQgGVzj041G8U/HL1
 qn7DxB3uFD26YqdRq/g9m//pyyX+dIvAWgbrZCe9ytzR2FNtztzzVJ/lG5/rauhWFuFX
 bPScQCb7Hw5O/FyZeksrCRs8+e0yv9Pgiw311NwLobW77RMrY7db0xeTq1KA2ynksiJj
 v+rw==
X-Gm-Message-State: AOJu0Yx7kJP7LIEN+/0eR1ZIo/rmaSMo36uQ/Oncv4325roNk+Yvt0i1
 dZfOG/bYQO45zEKrfzpvNuQIGc9+u/k3EbWUZhNMKWw5mYi6GEzLwwOFHoQi9Q==
X-Gm-Gg: AZuq6aK/Kv5Oq7dZ7S+VOqpuWLgvQnITNOizo62sIfioIi0ChBbxH3kRyTekWoMk+Mt
 aB73EnUHMPuTEpC6QCsf7B7vGsr+4hFnfUEYWfoMEzVfoXaogvrI4MqFlB3ZqV+BwZuherd3Bh7
 uxCgo6+uA93E0bJZlFCzv31/ihGMjq2xpYwM/JELpr5KRoxYYNCRsTcKFx9kHdMzlhhdHbhKYac
 6YdQCJXkERYM0ri13OPQn7UQLqDzU5P6jYuIVQLzsPC/oG3SSMOpiBCSSZv0KtGpUaZQgK2tvY9
 taSyERT+1sy1rC3yvnhbT+KJny7nzpYnile/8YCyI/TuugBm7pdaMH/7qfUk5jZHZqDkFg8E1BQ
 LyVkevSgfwZiT6JqLEf1Du3KemYeL/3Wjx0jRBJ2vWexFxeW4xQWTBfxlEB8RbWoCTZLNvpx+56
 wxg5u8VmB7OD1kAgUC+ktiPN9Ar+JyG79SHYiUq5bcV3Q=
X-Received: by 2002:adf:ea88:0:b0:435:8d02:b9d2 with SMTP id
 ffacd0b85a97d-4358d02c853mr8417817f8f.60.1769006621135; 
 Wed, 21 Jan 2026 06:43:41 -0800 (PST)
Received: from vcllano-01.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4359f4a7ac7sm4036423f8f.20.2026.01.21.06.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 06:43:40 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>
Date: Wed, 21 Jan 2026 15:43:21 +0100
Message-ID: <20260121144322.1587729-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769006621; x=1769611421; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Itydtsq8vlSuo7XVS4IvPpCHnXzrByP4wxCSjNHFU9A=;
 b=GuT8yzEfRFkKHoO5TvbIwKGc2slIhVnAgPnaPYgOg6QL1ZCny9rtjEhHR9o10dWX+E
 eWoPfuqxra2Bwyi9SDaovx0HIjFJqgf4hE58wO024xNco5IKyzQ38yiT3YtiRqNmNe/L
 TgnIoQwV8lQUvbC9R/9M/oOmYuHBst8dFQ4qU4JZ5aeZDov1t23zPwFqaQvIDYVnkNE9
 jEIByoI+b/j0l25rUy51TNIEsgwlw4UBZ0XnYzDVlvjoK2yztjCOUWjEtT5lWYthZEbS
 5V+QjAK8WRqCsyvhe77PUE2jOgZXcJNAXqJSQ3LwJTVp4vkxRD8IPjLGRX3Y6d0jcNnD
 poow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GuT8yzEf
Subject: [Buildroot] [PATCH] package/linux-pam: include pam_systemd for login
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

pam_systemd ensures the user's processes end up in the
correct cgroup and scope.
It should be used, even if the full functionality via logind is not enabled.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/linux-pam/linux-pam.mk | 8 ++++++++
 package/linux-pam/login.pam    | 1 +
 2 files changed, 9 insertions(+)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 23b09efbae..cb3c47739d 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -64,6 +64,13 @@ else
 LINUX_PAM_CONF_OPTS += --disable-lastlog
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+define LINUX_PAM_SYSTEMD_TWEAK
+	$(SED) 's/^# \(.*pam_systemd.so.*\)$$/\1/' \
+		$(TARGET_DIR)/etc/pam.d/login
+endef
+endif
+
 # Install default pam config (deny everything except login)
 define LINUX_PAM_INSTALL_CONFIG
 	$(INSTALL) -m 0644 -D package/linux-pam/login.pam \
@@ -72,6 +79,7 @@ define LINUX_PAM_INSTALL_CONFIG
 		$(TARGET_DIR)/etc/pam.d/other
 	$(LINUX_PAM_LASTLOG_PAMFILE_TWEAK)
 	$(LINUX_PAM_SELINUX_PAMFILE_TWEAK)
+	$(LINUX_PAM_SYSTEMD_TWEAK)
 endef
 
 LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_INSTALL_CONFIG
diff --git a/package/linux-pam/login.pam b/package/linux-pam/login.pam
index 21d2afb61e..570593f26a 100644
--- a/package/linux-pam/login.pam
+++ b/package/linux-pam/login.pam
@@ -8,5 +8,6 @@ password	required	pam_unix.so nullok
 session		required	pam_limits.so
 session		required	pam_env.so
 session		required	pam_unix.so
+# session	optional	pam_systemd.so
 # session	optional	pam_lastlog.so
 # session	required	pam_selinux.so open
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
