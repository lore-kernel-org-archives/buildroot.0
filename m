Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D75C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B55EB40360;
	Sun, 13 Feb 2022 11:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ans4SFv_NA_z; Sun, 13 Feb 2022 11:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93FF2401F8;
	Sun, 13 Feb 2022 11:20:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4B21BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 713384033A
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xZZbnEf86YZF for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:20:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C3204030D
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:20:07 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so9126298wmb.0
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 03:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FYMbM9ZGUPqoWIQTSqxLsmYQaQsK7fnCKbsp3jRQoiA=;
 b=Y32lmW/G3v61+RZdjMrUx6dAvoYlZjGY0Q1DPJZ/cigg1anasioBervx6tcnEXoBhx
 jXoOx4GoWE0jAWtjXwW+k7xbvx4zzFkM1J6HHVuEd+aEZtbgz+2krIBV3HojTRaZQiqf
 OYIpC55vd7WNfPaOrO0j46n+9V8pP3w+H31qgad4WRw1stIcPm3G8vgFeoAIkdJxpIOF
 e6adfUUYMV1J2p87XAfMH+JGsho2SoOUjtjm+f8sSFIKM9+nGlTQiKC1s43CBnf/8g/7
 cNzv8thqY2vqQ1U/SCXOQHT+5SfgoRrlSyq2GjAoCXM5sARpUiu38SoyYj3U60q8YFfD
 xm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FYMbM9ZGUPqoWIQTSqxLsmYQaQsK7fnCKbsp3jRQoiA=;
 b=nnu4w8w6wz2wSqltNUdcICOLMNFu2n5OU96tQ4qCCV2y9jQ2zoGfiTEoJK4XiIUqx4
 iAF35oiVwn3IkT3GHKuw5VqwqRQxggKpJLUg1AfeLaUJHn+o+o4D2uZPF14yzKSvy8Dp
 6WsVYbdZQ59vcNQKobvfWyAzgH6fr62yOoq6Hrn+wHMI7a6w2IXXjph7D4t6teq7mNA8
 VuqZ18374/x+yjM5MH0Emo1Ii5lzMFFHkisMrtsUaS9noTuMF0SbRbDsHEvXIg34CQ1v
 bws7LDwTCSHoPhP7TNTEYRhh457NFOnazlggP748fQNOqYWoHruQy4pBINQR273IGKDW
 +K/A==
X-Gm-Message-State: AOAM5324VEiChw3YqVmXqkFirQYMbKFTu7PYtUzXA/r22HamOZrGABUe
 WwqHCaehbb4hjeMIEzX3CaNRJ5HOdXI=
X-Google-Smtp-Source: ABdhPJwUthYLYHy0n/EBv415S+nwvzBybu+tVbSxwXe11H4ItqSyO+2OlofKkGi7WPLKDljgA0nD1g==
X-Received: by 2002:a1c:2584:: with SMTP id l126mr6972915wml.143.1644751205324; 
 Sun, 13 Feb 2022 03:20:05 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id a1sm26782924wrf.42.2022.02.13.03.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 03:20:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:20:25 +0100
Message-Id: <20220213112025.979418-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/safeclib: fix build with gcc 4.8
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

Add -std=c99 to fix the following build failure with gcc 4.8 raised
since bump to version 3.7.1 in commit
cc27267ae41bf44276c63b1e86042c4fae4adf50:

In file included from abort_handler_s.c:35:0:
safeclib_private.h:167:18: error: anonymous variadic macros were introduced in C99 [-Werror=variadic-macros]
 #define slprintf(...) fprintf(stderr, __VA_ARGS__)
                  ^

Fixes:
 - http://autobuild.buildroot.org/results/5c3468585942879b47331e05058d25d324c8cc23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/safeclib/safeclib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index 91b3e26c68..bc58c1a38c 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -11,6 +11,7 @@ SAFECLIB_SOURCE = safeclib-$(SAFECLIB_VERSION).tar.xz
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
+SAFECLIB_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
 # -fstack-protector-strong is used by default. Disable that so the
 # BR2_SSP_* options in the toolchain wrapper are used instead
 SAFECLIB_CONF_OPTS = --disable-hardening
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
