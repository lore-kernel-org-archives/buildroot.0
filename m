Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAB2E9D403
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B779607B3;
	Wed,  4 Feb 2026 15:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pp_fEmuAFrCM; Wed,  4 Feb 2026 15:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F23E5607DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770219846;
	bh=B10nbA/3U32tCef5E0f/3YZocjImqckOEiUKK6O23OI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ZuTA1G+ysuKwaTOHNHTVfeLbkamZey19gMY8Lv0sByvWWtdznGQf81ej13AHpGtF5
	 nu/paDPOc3ReuECW+aVRSXYBtMPYOZqcIVwzemvemSIQ/hZh31KjUHoaHn7vB2/KeG
	 Iadsv6VHuu5rkBM1nX40bSXMAK1i3NejjNPciVeyfnHm9KlXezG8ztkwxRz4tdFfbi
	 gpALTfuhF9DYmpSqR3E5/sRzgqhlvpi1DnH9QjpO4IekMFYj+PcUCrhTgm8vkVzHwS
	 ZjKHyEX1Xx+InJipr+oqdAszATEf/HXK2xxTlekgZ0IGCgabYY8hnMhTsagLv4Y53x
	 0FqB6AvTRSgkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F23E5607DF;
	Wed,  4 Feb 2026 15:44:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F969F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E0E660C23
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TDGxpiNJ6fd for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:44:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93674607DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93674607DF
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93674607DF
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-481188b7760so7959525e9.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 07:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770219841; x=1770824641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=trmGo7ZgDJGl9ssMY5KGsN6tLKZk6IfwJaC3F38SMlg=;
 b=xCaYNxdtRQPrXWOyz0NzHmvDEHUBon3zVoB6rnyB7NLqfrKOwQTM2R2jXxjAQBkrSW
 Um8jiX7XgUJYCThiyi2QlNF/Su8bhwzoK9SzjD1dJBNl9tKWKzeMRXsc4fYSJM7kjGTg
 EsNeg/i32j7OokcnA1+xF2r+iI1I9Q9Jz74uXqnS226xbXm6C/9K07+Hdb+SPplY8eHc
 uZX5nnF3xPBs2+FODfF+CKeouRw4eKqaXxm6oTOQZ6nKn0dok6xX4LcTWA+AICm+x7ai
 9KQtlW9mKEdpKUk1qqavE+Ztu+HbuNNLHyPPMgZ9HPpfa31H7uIZlrLbh77UeH4R/N7P
 ycsw==
X-Gm-Message-State: AOJu0YxIX92FjbpfhN0DJe8znixCqW2mjI24OpCl5KdNuQXt06btCpvJ
 wjPQrL27xNwOenCCeq1b6H1QOe4cN4ucScQ5prD+Qkz1w3LjWo5CvzMwaJ30AqjAS2/As+ppJwb
 JlYwJL7Q=
X-Gm-Gg: AZuq6aKeqdlOwc2yaI51lFdXXjgVoRl64C6MDmuES66P774p6wuxvIfmel9R0rZnvZm
 CfSzF3wkK878WrkzH0M5TnUnyPMDqQDsdN1nUwYzVy57SyzBMthDvr9VRbGAMZvcM5icdsLMbw2
 /H3oytuqABpjLHmrCXU3LwNwWCPEAVlLco3wGhNA2iLyV4Bt7LqCxIffuzcJNFExwlynH1piqER
 ymkaBmwlauzVXEmXYezuVgKAuTNwCvUkPChIzb6QpEeHOal2pTfL5QU1RM5O2CSGdrjPUHi17eB
 rVVbEWpLzxIAi38bn20+cx/jD4+eipQb8xm0SeVHopqQqE/LAvFdZ5kP4kcPvsF6tUvsx/YOX5T
 fbCCoS9rqwHEeIWwiyiNUwHdHIiEklk+IzIKJSJrYll85MUjb6DIQBtmxmV3vB9NGkMRqWpjrrB
 LifjpOW6DR4eZteOg2bxE27vNI4AbzXjielZfvYY7YrNicWTFW
X-Received: by 2002:a05:600c:a088:b0:47e:e7e5:ff32 with SMTP id
 5b1f17b1804b1-4830e98388dmr39452225e9.34.1770219841445; 
 Wed, 04 Feb 2026 07:44:01 -0800 (PST)
Received: from dragon (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483108d79d5sm55222545e9.3.2026.02.04.07.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 07:44:01 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 16:43:28 +0100
Message-ID: <20260204154340.766528-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204154340.766528-1-titouan.christophe@mind.be>
References: <20260204154340.766528-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770219841; x=1770824641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=trmGo7ZgDJGl9ssMY5KGsN6tLKZk6IfwJaC3F38SMlg=;
 b=BUICsusTz3Oxv6ukBmIaLJUu70TCZma3xQ3q/YPOxVcSpSUqAUfkx8352wekjrk4nC
 h0ndWqokJo3qB/IKzUiLPK3f7E2xoEZZMKUH2PlncDbb2295tRaxmwhiwG3R+ia5MFiC
 wmiottmh/OWeSUjMWSN5D5zcJeqNv/a6FOk8E0Xj5C+75qt6YkderhvvGdz5Q31nQN5M
 ZI4mtu/XqIFFR3f5o5eD2MghLB4BojE+NxoB0pvyYuCD6wPkafEQVFuUpQKqZ2jBMYDl
 1J14F0ZTLeyFyRoMXma9QKFmvGtiZH5rCVuZIUKTyvNRx+D5Pti2ebNhFTxjOO8j/2NG
 3q6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BUICsusT
Subject: [Buildroot] [PATCH v3 1/7] support/kconfig: fix invalid filenames
 in patch 23
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All file paths in patch 23-kconfig-mn-conf-handle-backspace-H-key.patch
have a leading "kconfig/" prefix, unlike all the other kconfig patches.
Therefore, it does not apply or unapply cleanly.

Let's therefore remove that prefix so this patch can be applied along all
its siblings.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...onfig-mn-conf-handle-backspace-H-key.patch | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch b/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch
index 6e32115f70..502c708034 100644
--- a/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch
+++ b/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch
@@ -11,15 +11,15 @@ terminals.
 Signed-off-by: Changbin Du <changbin.du@gmail.com>
 Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
 ---
- kconfig/lxdialog/inputbox.c | 3 ++-
- kconfig/nconf.c             | 2 +-
- kconfig/nconf.gui.c         | 3 ++-
+ lxdialog/inputbox.c | 3 ++-
+ nconf.c             | 2 +-
+ nconf.gui.c         | 3 ++-
  3 files changed, 5 insertions(+), 3 deletions(-)
 
-diff --git a/kconfig/lxdialog/inputbox.c b/kconfig/lxdialog/inputbox.c
+diff --git a/lxdialog/inputbox.c b/lxdialog/inputbox.c
 index 611945611bf8..1dcfb288ee63 100644
---- a/kconfig/lxdialog/inputbox.c
-+++ b/kconfig/lxdialog/inputbox.c
+--- a/lxdialog/inputbox.c
++++ b/lxdialog/inputbox.c
 @@ -113,7 +113,8 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
  			case KEY_DOWN:
  				break;
@@ -30,10 +30,10 @@ index 611945611bf8..1dcfb288ee63 100644
  				if (pos) {
  					wattrset(dialog, dlg.inputbox.atr);
  					if (input_x == 0) {
-diff --git a/kconfig/nconf.c b/kconfig/nconf.c
+diff --git a/nconf.c b/nconf.c
 index a4670f4e825a..ac92c0ded6c5 100644
---- a/kconfig/nconf.c
-+++ b/kconfig/nconf.c
+--- a/nconf.c
++++ b/nconf.c
 @@ -1048,7 +1048,7 @@ static int do_match(int key, struct match_state *state, int *ans)
  		state->match_direction = FIND_NEXT_MATCH_UP;
  		*ans = get_mext_match(state->pattern,
@@ -43,10 +43,10 @@ index a4670f4e825a..ac92c0ded6c5 100644
  		state->pattern[strlen(state->pattern)-1] = '\0';
  		adj_match_dir(&state->match_direction);
  	} else
-diff --git a/kconfig/nconf.gui.c b/kconfig/nconf.gui.c
+diff --git a/nconf.gui.c b/nconf.gui.c
 index 7be620a1fcdb..77f525a8617c 100644
---- a/kconfig/nconf.gui.c
-+++ b/kconfig/nconf.gui.c
+--- a/nconf.gui.c
++++ b/nconf.gui.c
 @@ -439,7 +439,8 @@ int dialog_inputbox(WINDOW *main_window,
  		case KEY_F(F_EXIT):
  		case KEY_F(F_BACK):
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
