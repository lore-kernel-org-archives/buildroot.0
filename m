Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D5BC36010
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 00:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D21831F8;
	Wed,  9 Apr 2025 00:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kHO3ZJeOg0p; Wed,  9 Apr 2025 00:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1490783083
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1490783083;
	Wed,  9 Apr 2025 00:03:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA44D256
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 00:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C086E401FE
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 00:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7Uat1FLr6Ft for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 00:03:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A52B740125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A52B740125
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A52B740125
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 00:03:15 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-afc857702d1so3479531a12.3
 for <buildroot@buildroot.org>; Tue, 08 Apr 2025 17:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744156994; x=1744761794;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wTB3TjLuu+UsBksyfBUS47PceWtvbBrTFr0FGPrqS/k=;
 b=B8lHtZIswxHYhtGka9/WM+D5GxNCPK0MVhnNECdY0lyx+rmKPKlRNgkFWNUDfxCch0
 CHDoABf78KLd+Xcj3C+OpX3u3uK81MYq4mLCBbGHtPjLRpgdS5NF2abfmjw5jUlWpGb/
 8YHC7YmMb0bDDJ4a2idf9CEu6mg2/UsEFVME2x6WTdl9fhIOS0YpjkPT+dJxr4PliYh0
 QNiJxqsY3T0Zo+S7vmQrSspcuI9S6Dcp65OlswDqP5IYWk8wsx5RFlEyR1Z4LyCwV72Q
 pbwiJfSr8TKt+1lO5EDb75xM35pvnTCGEZIBX3wI4x4m//YwigQ3uQwOins1LVM03vXh
 Bsrg==
X-Gm-Message-State: AOJu0YyuAm4YhK4iTKcn6ssToVxKLZ6b4bzlouD0T3pXmDjtxyWXeEDO
 I7L5xJpwHjgBpOAgVK7vGpgGJ9RgstlJsbaDxR7unzG3N5JZWpw5A8BTbJ0DP+T4vmKJD6qRoDS
 W
X-Gm-Gg: ASbGnct82q3JQoHbep7XlM25+h/GPqYdrA78qrzDQi7wP2HyWF+T+dG3GGyY7unBOiN
 51Y4CGN+4JLJuZi66c0zKK+EEa/P70hfVP0FLFKGyWgvSUXoPOVqVM5q1qCW5OW6ZwYPizM8RSv
 5uuYSNWSpZlFXZxnWutRDTtOuMsiggHW94BGmx3XbtobgRnc5KrXRgIt8w0Z+YwHA6igTwxcN58
 KMlWlwgKR763FkU+vKNA3OHg5vl+zXBG8K5WLxiRBD6ii4utBX1Hywi5TfGqZi9TSj4JVLBFuvW
 15C0RlczJZfC36jd+yG6k0orbJgBwDMNG7N7R99aaxkSArvlewjhncXXU/y6
X-Google-Smtp-Source: AGHT+IEyTtuZqbjFQXnPOHHQG0Pf03a0HXdBejWZEXeWkRdx6EsyCW12Ri7XizuqCHI+nx1UJRz+nQ==
X-Received: by 2002:a17:902:ccce:b0:216:644f:bc0e with SMTP id
 d9443c01a7336-22ac29bc06dmr17467765ad.24.1744156994081; 
 Tue, 08 Apr 2025 17:03:14 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229787764e9sm107191465ad.243.2025.04.08.17.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 17:03:13 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 08 Apr 2025 17:03:05 -0700
MIME-Version: 1.0
Message-Id: <20250408-fix_e2fsprogs-v1-1-cc814171907a@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIADi59WcC/x2MQQqAIBAAvyJ7TrDFMvpKRISutpcKFyIQ/550H
 JiZAkKZSWBWBTI9LHydDfpOgT/2M5Hm0BjQ4GCscTryuxFGufOVRI+TdSYihskHaM2dqQn/b1l
 r/QAdQBXOXwAAAA==
X-Change-ID: 20250407-fix_e2fsprogs-68470f22d8cd
To: buildroot@buildroot.org
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=TvaTbkFBdpCOUWUgX7ZQvsl1SCUFSQjozOpbkomCHGU=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rXndYaOj1hk27uyThqteCJaQZPhHTrDKV5QjPKFGQVz
 2q8PbK4o5SFQYyLQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgInErWBkOP3Ws1cj1Pwsk+Kz
 E3F/qmRk66de2fcoUzB81+Tt8peuHWRkeHte9cLfdZEKb3TXmt1fzs3A/HEbT9FGfuH2mPlzvY/
 rsQEA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744156994; x=1744761794;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wTB3TjLuu+UsBksyfBUS47PceWtvbBrTFr0FGPrqS/k=;
 b=JSx+CeiNJVboSVgbSkm3Z91AFf9aYfFvTzRkRlfF8aA7ppL1TJlKbr/4Mu7rltomeP
 HmsFFmm9KVPbay71fJbK4pFuGpFpc1LXoJWUrPV/gxouT+JYX/Q8Q3I4LKwg5/QW1cKE
 BpsjvZ1VBO5lTqVzYaYMWYTgLQjKotawC4lsoj8t75AbuSEMKS5f+m1GbgZot1A0wnB0
 InMtE6HFs6n+afJBE/pUiYZKAJXemFVhVbgrm93PwuqivR+7VjTbWOTNqXq7woiWGOzX
 JvfzWCniciqLHJPawzCVOP946X/hAxIE+ojywuM4VBn5yT9LiZg6QGM4C+Adt6mPSQCU
 9NNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JSx+CeiN
Subject: [Buildroot] [PATCH] package/e2fsprogs: Don't build docs for host
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

texinfo isn't provided for the host in buildroot, but e2fsprogs always
attempts to build the documentation. The error that gets printed is as
follows:

/usr/bin/install: cannot stat 'libext2fs.info*': No such file or directory
make[3]: [Makefile:363: install-doc-libs] Error 1 (ignored)

This error is ignored but it is unnecessary.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 package/e2fsprogs/e2fsprogs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 7f33b256c2626430a4578a9d8ffd8258df364a43..ad65d5189e75808af011ec87f0bee9d252f53767 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -56,6 +56,12 @@ E2FSPROGS_CONF_OPTS = \
 	--disable-rpath \
 	--enable-symlink-install
 
+# docs will fail to build for the host because buildroot doesn't provide texinfo
+define HOST_E2FSPROGS_REMOVE_DOCS
+	rm -rf $(@D)/doc
+endef
+HOST_E2FSPROGS_PRE_INSTALL_HOOKS += HOST_E2FSPROGS_REMOVE_DOCS
+
 ifeq ($(BR2_PACKAGE_E2FSPROGS_FUSE2FS),y)
 E2FSPROGS_CONF_OPTS += --enable-fuse2fs
 E2FSPROGS_DEPENDENCIES += libfuse

---
base-commit: af094ed137d6967afb6270b69c516a22eb9d8091
change-id: 20250407-fix_e2fsprogs-68470f22d8cd
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
