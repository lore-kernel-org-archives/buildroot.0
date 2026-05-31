Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110EACD6E5D
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 15:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 651C860F9E;
	Sun, 31 May 2026 15:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9t05OeXxoHcB; Sun, 31 May 2026 15:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F7DB60F6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780241785;
	bh=C5wSj/4fLd8N6dUesFzDEUXTgOT1lyg3fb5N/yCIazE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=XG8nbrYOsN5Q7mZDdYIV9dcpLAu4wUlGqccAa1YFMocZutaOTUF6fc74wjCfk9/zD
	 J/DayRYNskv4XfYjDHCjVsJDo7/e0pGJDlV1x0yvx70XYZMYsj0tTn/UC5Awou/iiz
	 d23EZjeFkkWZKjLImIJqYdlTWD5P1HEaYLoHnRfxVfEMmdqOlP3cqXSSHrSyEa8rNW
	 GSpT+5MjqUPZT2TG+Fnoo7rfsf9Buw4JiRpfmbVVJ/kG2fpOgI1NB9icyLPMc23F1D
	 TXOL5g3U7AnR37qjI8z+RmH5Ff1RtKFB5Rbyg0KUVgF695Tb+Va4nzEJTd8A3c8CYH
	 k47SvQanOGKrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F7DB60F6E;
	Sun, 31 May 2026 15:36:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB42B257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D9F2844E8
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xyFR8H5812SX for <buildroot@buildroot.org>;
 Sun, 31 May 2026 15:36:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79F5083A90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79F5083A90
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79F5083A90
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490a765f2feso5879575e9.1
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241777; x=1780846577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZwKxzSYdeiE2LekdUQyyVBfr9Tl32+F5Zu5/0SG0Mzc=;
 b=ALo4VE4w/PaQVKhJbN6VGsKu/qsbe5Ger2jCVdzAzHP2FTJIlTbw3DDk9nxqIjP4AZ
 WMU/n5Z6ybA/N/BcZGa9D/IR9+GDzcCYPH1x1e1y2kCldVxq/GEz0a6EjEz3tEEoJkJ5
 EB5Pp6txFYcurYNjZaj/CCmWkSuXWuRirxlAD/LWWWOjT1gI3D0LcXN/COySPhRcqmgT
 OPhUexNbvVcnSSjY+MC3grE8ITd4dHhTp2yGHxi7q6Q660c0GjxfJrU00p3Y1Ir2jJnl
 SfbfxpQh5OKLFQQshx0i/O2rpsVpDzF5fQbHpcTRKCwjXXtI4x8W19DeOeNvpmB9jqrG
 HwSA==
X-Gm-Message-State: AOJu0YwvuS+jeOWycks6Z6MnTCJZDGxbNYfa3Zf4uhfL5qbupkVu81+D
 Xwb0h3V73MfeO4n/v6IALmdVBwqanktbwIJn5Q5Fn70FjZCydcyALUC9DpCTfpilmsToKtgZp4J
 hB2a9IX8=
X-Gm-Gg: Acq92OHK9V8YO/uhyXTdSN/lwuq9vz3Ybhc+u0O/rh8fw3tf5PVFMD6s+zR4rqHRHQ0
 LmUC42dbYY44uzXL/8N1fLmoBZFnmZCSgRx+GyLZPT3lZykDU8/uvjeudUhea1Q6Kjgkz7BHPxA
 HbS23ioqY3mRogjPNAdCIQg6ThbX0EJsIeYqSpphUe/uvNCS/VyM7L6RtxnczHUgcmEyzgLfKzV
 Sr98vBAvNA4pE495mlZAcw0S6ucVWcRkE8WGYzRiPy55y1JrZP0JJjINSP8fYOOQs8hw8HnGaYR
 z8iVYAWd6i0U2OFw+Qqlsvy0LbSyme6hulru2LpETEg6EJyQZ4L7w2Xkwd+H2+AteSX+kcjEGPN
 1Yx2EDaCKWokp92R65YmfHpwfqiJpF8xzoUzLvlQU1UiEkw8mVcbMePQ3iWI7zyvktWHm3jEP6H
 ZHiK8GOkr+USfFxctNHYPJMXv93wkHlJ3o/+TBgTTkEbALmWGJP4+kbSSlNJpneXck7zy/M+X3V
 0XVXDQIX/vo9pGG+rBcAqbx08u4ZZNi
X-Received: by 2002:a05:600c:190b:b0:48f:f64c:c2fe with SMTP id
 5b1f17b1804b1-490a298f29amr130994195e9.22.1780241777204; 
 Sun, 31 May 2026 08:36:17 -0700 (PDT)
Received: from dragon.localdomain
 (lputeaux-658-1-173-117.w92-154.abo.wanadoo.fr. [92.154.108.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6575csm278098585e9.4.2026.05.31.08.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:36:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 17:35:46 +0200
Message-ID: <20260531153557.2375580-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531153557.2375580-1-titouan.christophe@mind.be>
References: <20260531153557.2375580-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780241777; x=1780846577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZwKxzSYdeiE2LekdUQyyVBfr9Tl32+F5Zu5/0SG0Mzc=;
 b=OBHxw6yTaS9vtOAXht5W3FOvRcLtEGqP9juHEQcgGBSTCpR8VjudXYaDqDMkQwgBGm
 D2mrIsQsANT0nyPR+TquERmYonbjby7Za0UPmLl8c19loS4AXmx8grVBBNd1JeyNi43c
 rTPuDww46WBQRvtJloT+NeDRamYdidx4fq1DFHireUFmu6mZrhzDcfrht8T1yjMMSP40
 ID84B46/gXBcNMAxv4wJqd2EzvAm9wkTQByxjtgA4ja6VL9QphhAhI7Vg+M80hxVD0Zn
 4ixkewhZOD2FeH7Xu86Gd8DWDVv+ZCMW6nAazSF1gow15SqBaRfzimp9uv/sACCnbC/f
 iHxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OBHxw6yT
Subject: [Buildroot] [PATCH v4 2/9] support/kconfig: fix invalid filenames
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
Cc: yann.morin@orange.com, ps.report@gmx.net, thomas.petazzoni@bootlin.com,
 petr.vorel@gmail.com
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
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
