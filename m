Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A72BC48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 17:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B71D1415A1;
	Sat, 17 Feb 2024 17:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FOc3_4jaraav; Sat, 17 Feb 2024 17:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A70415AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A70415AA;
	Sat, 17 Feb 2024 17:29:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 612771BF5A8
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 17:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E74480B8B
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 17:29:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WinkMPpMRT7J for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 17:29:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D90780B6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D90780B6C
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D90780B6C
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 17:29:25 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4125cf71eecso3049785e9.1
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 09:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708190964; x=1708795764;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z4XHHzwsX30CiSum0aC4ivR2B5H1vSeozlc6gBR2IgM=;
 b=jcns8ck9tFnjeM5CHHyza4LJjUcWPuz5gmEdO55lkcw2A69eoghPQBFdikQ3Tkuh5W
 yQgH7R8R645lHEDaFMhCvhMyaccRNtBLQhGyjMWhkkq30LyBWfaQcxF6npSZvvtPpJGD
 oMkNJu2LRTciQvEqAb+mjzj8SP6fSwLRoeaOrssOkhJX5QjRuezzh/ZBbiHxWU4dThya
 gOHx0hjRrZ1WQCcCJwL63mXf6k8rbmhgxbnQi0JQa552fiNaxVaO1Z+mUJ/Gr6SSieig
 KKnsnaVZ5qbpy+qRPJeo3BCVLuszvW8hU7B2oLLMWrlEV9mB7lWQ3zhQrj90uxQHzZju
 1U1A==
X-Gm-Message-State: AOJu0YysTG2DDKGqKqwC2qqq15+3OwhXQp7ENPT0FuiP9kDVlJm9y3hp
 kRL2A7pMxsjHOrT3QUPcAgDMNqEukkY4SarA3GhSK0QfMewjDPW9ZDLs+BiP
X-Google-Smtp-Source: AGHT+IF8xWBoAQrFrCniln6CXkk1OWqHh5DlJPkL1Gkwri32vV7gqIHs7re0tYjm5qcYWtpeqFpy1g==
X-Received: by 2002:a05:600c:4f0f:b0:410:e830:24 with SMTP id
 l15-20020a05600c4f0f00b00410e8300024mr6634866wmq.7.1708190963971; 
 Sat, 17 Feb 2024 09:29:23 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c020d00b00410dd253008sm5700104wmi.42.2024.02.17.09.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 09:29:23 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 18:29:23 +0100
Message-ID: <20240217172923.3629905-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708190964; x=1708795764; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4XHHzwsX30CiSum0aC4ivR2B5H1vSeozlc6gBR2IgM=;
 b=GqubcFnoqaLb+pnZaO8E38G6UtV28FuuDS3PtnLfx+RiyjCC5f0g5MxIwhgoLL9SfG
 T8HlX6ZhZN/QNRHC9xc/ygl4Zz8pRIOS5+sJqHq0IdO+nND9BMpRBE9GwGnGw6nrM4GE
 jqzXUFzc9fw47U7GAf0bsAMI0H2m5/Isu0eCobZ+Hcyme6r+JUa3Wc+blSYvP+P/fkA4
 1O7itasHZSFgMapt65ycRL1/NvgvBVPnGHa6n4msoNU+IU5S+6+vYIgMmvvwJH7sro0G
 rwvvYyjA+iCWvdv1mHvw4pQjhs7kFbNg/71d7C/HL82YxQjdAAb6XFSRjmhWdEoj1cws
 v0wA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GqubcFno
Subject: [Buildroot] [PATCH] package/sudo: drop legacy, useless,
 and broken post-configure hook
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b9e89b340e27 (sudo: bump version) introduced the explicit build
of mksigname and mksiglist as host tools, as they were required to run
on the build machine, to generate C code then used to build the target
program.

This is now failing to build since the bump to sudo 1.9.15p5 in commit
c87746afefe7 (package/sudo: security bump to version 1.9.15p5)
(lines manually wrapped and slightly elided for ease of reviewing):

    /usr/bin/cpp \
        -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
        -I../../include \
        -I../.. \
        ./sys_signame.h \
    | /usr/bin/sed -e '1,/^int sudo_end_of_headers;/d' -e '/^#/d' > mksigname.h
    In file included from /usr/include/features.h:394,
                     from /usr/include/sys/types.h:25,
                     from ./sys_signame.h:4:
    /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
       26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
          |     ^~~~~
    /usr/bin/gcc -I../../include -I../.. -I. -I. \
        -D_PATH_SUDO_CONF=\"/etc/sudo.conf\"
        -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
        -DDEFAULT_TEXT_DOMAIN=\"sudo\" \
        -O2 \
        -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
        ./mksigname.c -o mksigname
    In file included from /usr/include/features.h:394,
                     from /usr/include/bits/libc-header-start.h:33,
                     from /usr/include/stdlib.h:26,
                     from ./mksigname.c:27:
    /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
       26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
          |     ^~~~~
    make[2]: *** [Makefile:263: mksigname] Error 1

The core of the issue has not been really identifie, but it turns out
that neither mksiglist nor mksignames is used during the build. This has
been tested with a minimal sudo with no option, and with a sudo with all
options enabled (linux-pam, zlib, opensldap, and openssl), with the
three types of C libraries (glibc, musl, and uClibc-ng).

Digging in the sudo buildsystem did not reveal an obvious reason when
those would be needed either.

Drop the hook now it seems it is no longer used and is atually breasking
the build.

Fixes: http://autobuild.buildroot.org/results/72f/72ff18fb9b41394a29006f881ee1fbea67a66a09/

Note that there is a second issue in there: the call to the host cpp
fails, but since it is on the LHS of a pipe, the error is lost, as the
RHS of the pipe (the sed call) succeeds; a fix for that will be send
in a separate patch.

Reported-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index a4e838dd94..7961a99002 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -58,15 +58,6 @@ else
 SUDO_CONF_OPTS += --disable-openssl
 endif
 
-# mksigname/mksiglist needs to run on build host to generate source files
-define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
-	$(MAKE) $(HOST_CONFIGURE_OPTS) \
-		CPPFLAGS="$(HOST_CPPFLAGS) -I../../include -I../.." \
-		-C $(@D)/lib/util mksigname mksiglist
-endef
-
-SUDO_POST_CONFIGURE_HOOKS += SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
-
 define SUDO_PERMISSIONS
 	/usr/bin/sudo f 4755 0 0 - - - - -
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
