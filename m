Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E455AF588E5
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 15:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A00CD610F1;
	Mon, 20 Apr 2026 15:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZdv3Ssf2GiY; Mon, 20 Apr 2026 15:46:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B22360AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776700012;
	bh=hpm+kYyYNlOKGa7HZnCb5f8vuOmJsm6uQImZc6Bmez4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=A7jcMw0A/MlSbPzx72OfFsvx/Gy0IPo8PdXhUvJfnYGsj+xoPLFkaYXG0ywECNyjC
	 MUt2wH04vO4fPwMTR2RRTNjF4MCT6jpFPctqwq0Oq31XlHgyFBmZ0JxcP2SI9yvlG0
	 OqpFbYLng2iFDjo6jexlHB6ZAUYjcQ1MxOTS715gdTC75bLoxZSuLL6nLEz+kSm+4B
	 GdFmSdr5L5q0jC+fxynqvL14pLPomunOopZdtRPJr0u1ogOtJknK9PzFGngpXEGAbH
	 WHwti92He9DXNG867Ts8GmkTj5TSG2d9qeLaUhXGy260J6P1bjIZTyIsDtCMXZfV9O
	 Dg28mMOJvuAzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B22360AA1;
	Mon, 20 Apr 2026 15:46:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2DBD259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 15:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 893D8410F2
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 15:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1F95049NMXzF for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 15:46:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8635E410B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8635E410B2
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8635E410B2
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 15:46:48 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43d7a5e77b1so2266142f8f.1
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 08:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776700007; x=1777304807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rkq8/XmSRTJRGDeKIvOke4PFvwH8Rcr2xJbdy2fxs4I=;
 b=G1vdVukZVcCm1fDtPxrzzgSGr/p+/KApnI8Wvvd1iefZghBnhgAJqOPsR8ZxkmrGp0
 uiEbsyp56BksWndsRkukoBlAENKkEubVFEN+iea75bbIik5GYgZd6yJ+GhyEKJYKZL4j
 89hDA2seJB1sOl4ZD39pGJt3BeCwaXhodufBNWaaNUuuRA17hvI2tPJmO/BR3xisz+IW
 IV0uSjfri2q48tPaUjoLPhw6ystpB2JfcNMB7UPTFQ8ogvuzSbfrjoNGX6ynmeh6M3Xo
 PbEa8SLje39n5jp5ydDyM9EgsyhzLNnEEoTLBNtfJYRZy1shu4msE9hlaB5D88ifucFO
 iZzQ==
X-Gm-Message-State: AOJu0YwM5sR2ygZe2uiRtIaTAD2gNL9zmzCL4Lw095CXrTBvQZYDvyNr
 uDq3OE9HHleKmxpxafBwqpxTXJMljYBDpTwCub74uL/hwVNoX8g3cq6QzxN4ntfE8FbE/vvDhz/
 V+fiR
X-Gm-Gg: AeBDies76t1Qsea3s+cctrqzjqJWDFC1wo9mM14s5bCXRQDS5V1CCtwz7b/ACmLQNC6
 yYKOUhnFaQRddMCQxL7ESNMmZ0G93Lufk8nGSxh0T87Ke9W+JIGDlfLPX4UupMi+nJOGZZnPLTF
 9TzeXY2wKLbC58YUvuEouJ/XOTj32i9Aiu7gtBorqks1qLV7LnAMXpwUcSkBhfctDc43eFmkVn6
 4gl8uN98UkuLvSW+JKOO4K1Yq4fusqN9PHS3Cx/qFYmg9Ht8FmEkY1ei39H0Nnafv+W6bo5IBKJ
 aElXOYWv5UO9zKpnDqkbHdmX2m1kJwK7EPdww46jH698FvbRJatSdLFk0JlrRiEuhdC9JgKSzy4
 DCdEtN0wdkKtBh8vCKiOq95De8ZYwfrwJoy7dujqeguwGL2dku3xABckWfUa5h/LKIERfie8MpZ
 rdQNhM3UyCrfg0btS7EkHjxQFG0rPb38hX9NZI4XmdxUOv23m9DasG3QCJoGJHFi86eZk3VYXDj
 /OVIprJiw5KYqA=
X-Received: by 2002:a05:6000:1846:b0:43b:5091:39db with SMTP id
 ffacd0b85a97d-43fe40737c5mr23582004f8f.13.1776700006735; 
 Mon, 20 Apr 2026 08:46:46 -0700 (PDT)
Received: from dragon (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1405sm29238383f8f.4.2026.04.20.08.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 08:46:46 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 thomas.perale@mind.be
Date: Mon, 20 Apr 2026 17:45:59 +0200
Message-ID: <20260420154559.2707314-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776700007; x=1777304807; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rkq8/XmSRTJRGDeKIvOke4PFvwH8Rcr2xJbdy2fxs4I=;
 b=DiS6/Tdld0vKzO3AHJ4DAb3RtQNqYqutpz2rVJp9Wryy3HQuzOb7pFh0m6DML7maiM
 rIDhOAjg3VPEmdCQFduYFF8dZ0UqCtlLCeQBujeSRdDxPTuen2jYs7U4BfQGq+pFEuhD
 PsD8JQES4kvmepm1jYhO2gmV4KBvWb9mLSsXKx5UsujCH5RlfSZk2Z1ZqLRLvhbfnRnd
 8GLbHccl084gWQ74b4i2B9dj9YpO0lOWShp/tRoj4moNHWQ9Jr0kX/yWA5A5VH0d3fvH
 tdnwPhWpCaltjlvk+5+r6jjPRaJRnq/kPBHVnNnne1kENve3MkaQOhL8yRnLJsRR0STt
 KahA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DiS6/Tdl
Subject: [Buildroot] [PATCH for 2025.02.x] package/systemd: add patch for
 CVE-2026-40226
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This backports the fix for the following vulnerability:
- CVE-2026-40226:
    In nspawn in systemd 233 through 259 before 260, an escape-to-host
    action can occur via a crafted optional config file.
    https://www.cve.org/CVERecord?id=CVE-2026-40226

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/systemd/0001-Fix-CVE-2026-40226.patch | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 package/systemd/0001-Fix-CVE-2026-40226.patch

diff --git a/package/systemd/0001-Fix-CVE-2026-40226.patch b/package/systemd/0001-Fix-CVE-2026-40226.patch
new file mode 100644
index 0000000000..250b6aff33
--- /dev/null
+++ b/package/systemd/0001-Fix-CVE-2026-40226.patch
@@ -0,0 +1,90 @@
+From b3131f63747db53ad76a9aab2d21da1ce9d59b9d Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@mind.be>
+Date: Mon, 20 Apr 2026 12:04:45 +0200
+Subject: [PATCH] Fix CVE-2026-40226
+
+This is the concatenation of the 2 upstream commits:
+
+===============================================================================
+[1/2] nspawn: apply BindUser/Ephemeral from settings file only if trusted
+
+Originally reported on yeswehack.com as:
+YWH-PGM9780-116
+
+Follow-up for 2f8930449079403b26c9164b8eeac78d5af2c8df
+Follow-up for a2f577fca0be79b23f61f033229b64884e7d840a
+
+Upstream: https://github.com/systemd/systemd/commit/61bceb1bff4b1f9c126b18dc971ca3e6d8c71c40
+===============================================================================
+[2/2] nspawn: normalize pivot_root paths
+
+Originally reported on yeswehack.com as:
+YWH-PGM9780-116
+
+Follow-up for b53ede699cdc5233041a22591f18863fb3fe2672
+
+Upstream: https://github.com/systemd/systemd/commit/7b85f5498a958e5bb660c703b8f4a71cceed3373
+===============================================================================
+
+CVE: CVE-2026-34155
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/nspawn/nspawn-mount.c |  4 +++-
+ src/nspawn/nspawn.c       | 18 ++++++++++++++----
+ 2 files changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/src/nspawn/nspawn-mount.c b/src/nspawn/nspawn-mount.c
+index 874d54e734..cba69cf0a9 100644
+--- a/src/nspawn/nspawn-mount.c
++++ b/src/nspawn/nspawn-mount.c
+@@ -1311,7 +1311,9 @@ int pivot_root_parse(char **pivot_root_new, char **pivot_root_old, const char *s
+ 
+         if (!path_is_absolute(root_new))
+                 return -EINVAL;
+-        if (root_old && !path_is_absolute(root_old))
++        if (!path_is_normalized(root_new))
++                return -EINVAL;
++        if (root_old && (!path_is_absolute(root_old) || !path_is_normalized(root_old)))
+                 return -EINVAL;
+ 
+         free_and_replace(*pivot_root_new, root_new);
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 459caa7c58..8692c771ba 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -4626,8 +4626,13 @@ static int merge_settings(Settings *settings, const char *path) {
+         }
+ 
+         if ((arg_settings_mask & SETTING_EPHEMERAL) == 0 &&
+-            settings->ephemeral >= 0)
+-                arg_ephemeral = settings->ephemeral;
++            settings->ephemeral >= 0) {
++
++                if (!arg_settings_trusted)
++                        log_warning("Ignoring ephemeral setting, file %s is not trusted.", path);
++                else
++                        arg_ephemeral = settings->ephemeral;
++        }
+ 
+         if ((arg_settings_mask & SETTING_DIRECTORY) == 0 &&
+             settings->root) {
+@@ -4795,8 +4800,13 @@ static int merge_settings(Settings *settings, const char *path) {
+         }
+ 
+         if ((arg_settings_mask & SETTING_BIND_USER) == 0 &&
+-            !strv_isempty(settings->bind_user))
+-                strv_free_and_replace(arg_bind_user, settings->bind_user);
++            !strv_isempty(settings->bind_user)) {
++
++                if (!arg_settings_trusted)
++                        log_warning("Ignoring bind user setting, file %s is not trusted.", path);
++                else
++                        strv_free_and_replace(arg_bind_user, settings->bind_user);
++        }
+ 
+         if ((arg_settings_mask & SETTING_NOTIFY_READY) == 0 &&
+             settings->notify_ready >= 0)
+-- 
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
