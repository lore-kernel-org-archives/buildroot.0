Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7E2CA5FC4
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 21:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F71840A2F;
	Wed, 30 Sep 2026 21:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFe289QmyPuO; Wed, 30 Sep 2026 21:18:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5A5AF40A41
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790803120;
	b=EspJY+Rwi/Irw00Xh/QnkVAfB2lD5CL3Dc6ZsJDMkeqOum5Z+Iq+BV7Ifl55AAxJmZfg
	 3EeBYmjHAQQKcHEEyRGb07Eyq4+r2QJ7G5EnZ0v0FzF+94cIig8sTst+BLlIQNQSj677B
	 bWtTjknYHy4lhvUCEm3gW7OsNKRYUM3qLu/RUAKT8UbDJX1YrU+zBbYts91ipZmMkhxsr
	 Fl3FsduuBqtqmOcbeu7EORLXzhzJ8t0uZLHmV+3mmnX1Iw3a8cELfDd7CbZAtJupA06IH
	 OaD1qF3+DGluKd33MS/TCHLwH+snQ1v+X6KWhATIzVv126FDbC5DHGynnDM3LHzbXBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790803120;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZDxvCIebqzYPRAoq9GWqjYtdtK0m0jFrCWUCldzxAz4=;
	b=VA7iwHoOhrCA3a2lTa1gQULee0ck+1XXvRysdEwndgWM/ml1cKDrB6eRidTqxXSRk8v5
	 FPLxkHTFUbnUQSNpBtXiVdFkQKreUodjFOhuHEugvN3m6mA4BjR+57rcrbEZvaLqbY2FP
	 9Zwzc/JDZYrEZcXHs8tN2OhJ94iSkpjiIU5TZ3EhdCPdLgB0tl7s4lEi5tt13RkuVM2FO
	 /V7t8RuaAWQp1tsjxE1C5MnvxAKDnjuzDZDcliZN/5XxPGQsUTbThdGHBjIpxDWkbzs4V
	 4jjZ3u/bccl+Or81VYW3aMBudILTdYx/U72T6PAgQPtIYbq+qpECYK7BNpcNFDYMQWg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790803120;
	bh=ZDxvCIebqzYPRAoq9GWqjYtdtK0m0jFrCWUCldzxAz4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=EHKYWNy+8KxmAb+Y3MReKx9bnXMDBLeOmxR2ZDsT4KcPa+3BJh4jXPC/VAAL9wvYX
	 GzeGml81cYEDk7+EE/U5HOaZUosuBL/l3v30K4nrSbNvOKCWuDaK4VgHMty3FIlJCr
	 xh28V/Q/lrspglSTjDLUqf07XpE6EGAQGPVYD3ZZE35ZlGa8k5T7vBChM7nFKTd1ux
	 PH6pvTKQsC/avdzpfky5Z1UrUTLYBpYwsBf5qvQeUaoDUvCFTDExgOh7ojp4+ZjknQ
	 2mIYTVI/ub9qg2SYCanor8DcNzDILLzrV5odoKBO2WbCLPBiMzOBAKNmjgStCtkr9k
	 6SP6h9vmQ0dgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A5AF40A41;
	Wed, 30 Sep 2026 21:18:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 277F914C
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 21:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D39D40A41
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 21:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hqcv82Bq2VUo for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 21:18:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CEF9B40A2F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790803118;
 b=REooGwkBpPEADmmjz+Ivc5u73+0t8dosE4JgPEiXjGV4UKvjfnTTrqTmuqbU4cJYouHC
 DGMfH7gUvlk5mEOOlfW83FvVaI2C23YHDHWJcrjSvAtU6GlJ3ZRNdIwaxHBWPph1sVFyd
 Z3DyzN3e4hAEt6FjR44w+jb9XdBqfJYOUk8hQHBisUqRDQ2F/ctBdWoIPVghxGFZ0WWfQ
 NfNPB1GQdWU4V1BzJI7UMT4Oi5VyJ5XdGZ+WoFQY0zMbrsirYxQ6P1QUHQogQCfUk6sf7
 Cm5SOmSM3YPJjHc/LOgWxMKwcNAizbgXlYBEkXEzvVfYYN/fAft2sHmbyOzTsqdqnzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790803118;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=CcXNkl67dOMElEW7NYtBz+pY4hRVK4y/PJsfUrOIzsE=;
 b=WU5SWWVXyoTzVIkppI8koppKWWwXnFfEEcfQDR7e9k0ry3yvE5ChX3nt9mk5/a7aII8F
 BBzwzvFx9x6VwL00llPNrfU9/1/Kw3nnXCxdW3IBpCxDVJxfSUFTnVGA7C7LPhs1ywRM6
 aWnWHHe2hS6dFPXS/k9/rqASGZKiMglkiZGQVaOQ1aV0PQBPvclPRFhpNE8ROSxevmdTe
 /efcy+MGMiY6KW63kxn0hhwZ9WWYsyu1i07QZ8cAx3o6VS/NN3tzpm8Xl+KBm1J9h+hUE
 hgI644GdeiGkiunxSwQh7DUWZ/qjYE/ZaZ1NBydTPaR3cQ6Q2IwWCh2Q/ltE+tY3s7Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=UjOMzsc2; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::d"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:34::d;
 helo=mail-ej2-x0d.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ej2-x0d.google.com (mail-ej2-x0d.google.com
 [IPv6:2a00:1450:4864:34::d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEF9B40A2F
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 21:18:37 +0000 (UTC)
Received: by mail-ej2-x0d.google.com with SMTP id
 a640c23a62f3a-c2e01f5c0aeso221850866b.1
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 14:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790803115; x=1791407915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CcXNkl67dOMElEW7NYtBz+pY4hRVK4y/PJsfUrOIzsE=;
 b=UbsnKmV7FiG54tyH9KaN1qH+mSiw8fZ34N5OPO89rsmpVgDYI2xr4x2COH0Kf3h+/d
 zS/ZkW50SgyZNw6Wjih2IXFKjrS7eg6/2uPATb3hkyvS64ADoXYtqtYRkrpgW83WlP3e
 VdzMHhGrLCfxQCiIgJsRXJNVhEoUiaU6O39qTg/shYv66FjBMJZg3Pp9KF2UHTUkh7o+
 44sdtvbfi7cCnvoUWrMoz9iIXZrLu2iTclyWwYHPJaiVoHtrshn0RhOtre6qM4vO1Yx9
 RLRYYR/8RS+JuJXvmu9FUO6AU6U0VfMDTEK3GodVG+GndjznlrQbhF5l8qzT3BD5aHmf
 YGIw==
X-Gm-Message-State: AFq9FYK7P1zy253h/Gnu2UqzLt0B3C6GWkWA7NmqHYTObqc1Pz2hdpWW
 CkdnY738lu2napkKWMJnk3QtCtgLqyDRw03SUp+kQsQDY592N7/ozVeuBTROOA==
X-Gm-Gg: AYBFou3Q+ypYPPNQB7A9J0r3z+6yx6oOZ9bZl4lnQLh70Tu1a65EIbtLgFQlNfp4j8w
 mcgkic8zgQJ6pQEYhR4RfKdMtbjizAu9Hsz3c1QGzvYnCXUL1SlOfz0anqfO7/HNxwYExtU/giR
 eeZrGUD0PmKa6aq5EH+YYNPjNSnsin7I5oZtOGNMh919Q2HETr+O8oOZuhv87iSnN+W4lLiKRK2
 6pexP1ZY/X/56iKS3yVe9Vny0o7XNYjlYn1zLXQFV7WRnoFHhQUQBweyqWGzN7kUzdOGGzHmf5h
 9PquPuKzeDQHu9RDiim8Htn8552R1Vjih6XpWaLjove8+mgluo8T2Q4Ag/OmYWTmd755caovDJ1
 X0LZboFWX6dt4+40u/VWcF9k3xKiOs1mTyTEJRSt2zGhD9YRxHQkriTNHPp+1wIKLUuf6f3hl2Y
 fa60DvE8ojVyMknDD/35/YAUGfQQu/T2/KNK2yn1QVo2OgWK6ajTutRKdzhR+4TMrO7Dd+A605H
 rxHI5YqS96h3zXL+4C8roRf90VgWZvVW9QQzmtA2ks72og=
X-Received: by 2002:a17:907:6e87:b0:c29:5340:182e with SMTP id
 a640c23a62f3a-c2e2375288dmr232998766b.2.1790803115079; 
 Wed, 30 Sep 2026 14:18:35 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2e31dd9fbfsm55315766b.71.2026.09.30.14.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 14:18:34 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 23:18:26 +0200
Message-Id: <20260930211826.2349920-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/atop: fix musl build
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: chakrabortyshubham66@gmail.com, thomas.petazzoni@bootlin.com,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Since the bump to version 2.13.0, atop fails to build with musl:

drawbar.c:2336:33: error: implicit declaration of function 'waddwstr'; did you mean 'waddstr'? [-Wimplicit-function-declaration]

(Before 2.13.0, the same configurations already failed earlier on
uClibc because _POSIX_C_SOURCE was defined without a value. Upstream
fixed that in 2.13.0 by giving it an explicit value, but the same
pattern remains for _XOPEN_SOURCE.)

ncurses only declares its wide-character API, including waddwstr(),
when NCURSES_WIDECHAR is set. If the application does not set it,
curses.h derives it from the feature test macros:

  #if defined(_XOPEN_SOURCE_EXTENDED) || \
      (defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 500))

drawbar.c defines _XOPEN_SOURCE with an empty value, which makes the
check evaluate as 0 >= 500 and fail.

This only breaks with musl because of the C library's <features.h>,
which curses.h pulls in through <stdio.h> before doing the check.
glibc and uClibc both redefine _XOPEN_SOURCE to 700 and define
_XOPEN_SOURCE_EXTENDED whenever _GNU_SOURCE is set, which drawbar.c
does, so the empty definition gets fixed up. musl never modifies the
application's feature test macros, so the empty value reaches
curses.h and the wide-character prototypes are left out.

Add a patch that defines _XOPEN_SOURCE as 700, matching the
_POSIX_C_SOURCE value of 200809L that is already used.

Fixes:
 - https://autobuild.buildroot.org/results/914c1d8fa0fc8bbef64e4a64d58e5941d0077a3e
 - https://autobuild.buildroot.org/results/b91/b91ea0722202de0d1fdeeaeea167fd1b21b6d5d6

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...xplicit-value-for-_XOPEN_SOURCE-macr.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch

diff --git a/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch b/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch
new file mode 100644
index 0000000000..d526d58433
--- /dev/null
+++ b/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch
@@ -0,0 +1,48 @@
+From 54799216beac63a195cd6d34b22476fc15a80295 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 30 Sep 2026 10:59:49 +0200
+Subject: [PATCH] drawbar: define explicit value for _XOPEN_SOURCE macro
+
+drawbar.c uses the wide-character curses function waddwstr(). ncurses
+only declares its wide-character API when NCURSES_WIDECHAR is set,
+which curses.h derives from the feature test macros:
+
+  #if defined(_XOPEN_SOURCE_EXTENDED) || \
+      (defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 500))
+
+drawbar.c defines _XOPEN_SOURCE without a value, so _XOPEN_SOURCE - 0
+evaluates to 0 and the check fails.
+
+With glibc and uClibc this goes unnoticed, because their <features.h>
+redefines _XOPEN_SOURCE to 700 (and defines _XOPEN_SOURCE_EXTENDED)
+whenever _GNU_SOURCE is set. musl does not touch the application's
+feature test macros, so the empty definition reaches curses.h
+unchanged and the build fails:
+
+drawbar.c:2336:33: error: implicit declaration of function 'waddwstr'; did you mean 'waddstr'? [-Wimplicit-function-declaration]
+
+Define _XOPEN_SOURCE as 700, which matches the already explicit
+_POSIX_C_SOURCE value of 200809L (both refer to POSIX.1-2008).
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Upstream: https://github.com/Atoptool/atop/pull/415
+---
+ drawbar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drawbar.c b/drawbar.c
+index 651a81e..e4db0d6 100644
+--- a/drawbar.c
++++ b/drawbar.c
+@@ -104,7 +104,7 @@
+ // the other.
+ /////////////////////////////////////////////////////////////////////////////
+ #define _POSIX_C_SOURCE	200809L
+-#define _XOPEN_SOURCE
++#define _XOPEN_SOURCE	700
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
