Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63801C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 19:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C0A8416F;
	Sun, 29 May 2022 19:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1CkKtu3b_kh; Sun, 29 May 2022 19:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5A5D840CE;
	Sun, 29 May 2022 19:45:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9B61BF3C3
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 19:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A7E840AD8
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 19:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HuiIn98HQwuK for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 19:45:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B5FA40915
 for <buildroot@buildroot.org>; Sun, 29 May 2022 19:45:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k16so7793894wrg.7
 for <buildroot@buildroot.org>; Sun, 29 May 2022 12:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RkhcdFpwGkrfqNedb9eV3Mo6pEpDZnBSZnwg6PucIW4=;
 b=Cy543GRs+H2sUec3ivDWHnz8GSyPmzJr31wDKpfaRJhHg+wBCEYjWv/6BvjCUUi/Ay
 iUUB6aZB75o7jU883KpnrRlWsrPJ29WmV0Ywf7azOpilaFDxzcfxT0ceGXhzzmRe5jm0
 jRCN/Ejh1OC+5DuwuPftHa9E1vebsuEJfQ4e2kwawexbAncahl/5VspkoeAU2jFn86s7
 Y0tFMoxPFSNE4xbJlJaIb3AAlvBGl8lLaaOdMWbscaz6MTQgvA+Hof3aKowq9D/xNCrQ
 eu9C2h9qXkczEijPpEA6ziZDfIuzT0VrXLxvBdYa8PtjnaG3+rVCy2mSoN5uJCmpw1iB
 0lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RkhcdFpwGkrfqNedb9eV3Mo6pEpDZnBSZnwg6PucIW4=;
 b=lFEK1hRVtqAzdwC3QGQEwtKABQhAuCFvTv+B4vOx2X7W0TQEAxr5KcA9KYaJR/yzgu
 bLsktJKrPhesowDVw59WmRxhVd3ENzYg6WMtAg8as7Fax08DTTtYVh3TwHPEG0HUB9Z8
 8sCs6SY48TMCwfx1PeMnNwW7UYpEH4MSacOoGpSv4bAu2lJi9pQzPHpLpxKgIKcIFBX0
 E6I9tCxcLfSmBb5pN98pzFr6+A5kSvU/UHdwNlHkrtty4JaCM8MF+AQKX3Us4TvBbvzj
 ZjZ9iVeQmzUi09bo1B/VmDbf4iY0BvwWzzpj/DCQnjrs8p0Gdo8xppIU9V71VY3KcKPe
 w+Bg==
X-Gm-Message-State: AOAM530GgKAbgSF0YnOcHzjJMtEx3UlJ+2gbDRuUg272U4NjvWn75hs5
 3KhXGfUzrL+z4+HIw9aIexy6b9UEAWg=
X-Google-Smtp-Source: ABdhPJx0k0J8qxhdwxrMW7Meu1sf7uj58vUy5D/6Iupniftes/kiWDjkyfOOgA5pprodIY/G0BawrA==
X-Received: by 2002:a05:6000:1d93:b0:20c:58f8:f530 with SMTP id
 bk19-20020a0560001d9300b0020c58f8f530mr43388803wrb.254.1653853527139; 
 Sun, 29 May 2022 12:45:27 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 az26-20020a05600c601a00b003942a244edfsm8418754wmb.36.2022.05.29.12.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 12:45:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 21:42:49 +0200
Message-Id: <20220529194249.2391681-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/janet: security bump to version
 1.22.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-30763: Janet before 1.22.0 mishandles arrays.

https://github.com/janet-lang/janet/releases/tag/v1.22.0
https://blog.convisoappsec.com/en/bug-hunting-in-the-janet-language-interpreter

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index aff8e95bb5..a93129cfa5 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  52db8d18f93351256d0731810e8bea95516db8142f51eeb31664f7884bf63088  janet-1.21.2.tar.gz
+sha256  7c6969f8e82badc7afa28aa1054555c1c91d2858f9f45c41a82557f5c5ce85bd  janet-1.22.0.tar.gz
 
 # Locally calculated
 sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 24a0f86032..ad09d47c6a 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.21.2
+JANET_VERSION = 1.22.0
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
