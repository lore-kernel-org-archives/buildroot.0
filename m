Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3915EFB810
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 07:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E28180E87;
	Tue, 24 Feb 2026 07:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ey8GIdPmhTNc; Tue, 24 Feb 2026 07:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84C0380EA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771919063;
	bh=mgejfVqQwbS+2NMUg7yzny0Z81yzvBgomL0ATlO99vg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O9KXWkQ8YvYjPcFNGLjT1lZQ5mfKJ2Y76a1o4jZUskiwctCPSTVoLvC9uht75wKSN
	 OavMdLZ3a5twhnnPphK7JbCeyI9z9fYC69iDFUao8ki/Ntt44oiv9M2T/QlKGJ7mFh
	 mj5yP56oIdTsb3oIDV+yDV5NnM4+YMNxriBNWdR8fpZ9gvo1x6MWhYjT+8+7PwRFuf
	 djuhazbK14oAdjJyOIKmECyedVZRhJ5IXY9S01+PQd8FqqdiFwlb9E46D0OMajBcCc
	 4pODYt/CH/n5Rt0Xlpl+MDRMQQ+or22bJwgVzNILd1J4dkiRtJfwTAI8NVYMFPwfZD
	 aLtAgXRW45uJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84C0380EA7;
	Tue, 24 Feb 2026 07:44:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27A211B8
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 07:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D7B18446D
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 07:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfhKEqXFJtGu for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 07:44:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA6D182CE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA6D182CE4
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA6D182CE4
 for <buildroot@busybox.net>; Tue, 24 Feb 2026 07:44:20 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48371119eacso60468845e9.2
 for <buildroot@busybox.net>; Mon, 23 Feb 2026 23:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771919059; x=1772523859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z64KLonXJQnJSJWxDG8s2CLbzRv5geS/EepotYAltbM=;
 b=gMkp7XnBllqKVI+lXGbo0qLkBkkKGENMmHEvh94ZvfU4EhUPh2eLvarBUKUPurF+uE
 ieOI9o9KvS6PFi9Sq44FZ5eIKdbzd2J1slalCJGtJ2TFxctRyeK7c2E4mgVX+d3XEVge
 Wtj8IqkU7mvZW72T0rjBHkSMFIltbWEohQRBWpKOdIjCGA+fzgNVZfJTieCg7R+Fr2WB
 HPL09ea3rFN+UEdLM9GX7ZHHPWrId5d1faoOZpfMHW0jt7ZEhfEv92fZxf04bV7ZEByP
 ThnVjKBZx/eOfp5w6TH7aqCoa8pWKlwMQXsTCvL/x0hso5BNwZbIRHY7Q9+fZSgK3ijU
 IwKA==
X-Gm-Message-State: AOJu0YwD05tJM85b+FwfDTdCHS7ioSqt9SKxcOZqpxzsVK9d5os6c0GV
 oO7rjMFiCvI6CRBF3TMAOI5MO2TpNhh6dYrDpeMigKGGZh2iSVNxpxON8ucQoi/Fshpdh3/ihQh
 uuIR4oA==
X-Gm-Gg: AZuq6aIXf1VHRPxTwbyBQ8F9mr2N9urvCzSvuRavi37bYQF09nF24frOHQp8sX6+Gf7
 tJvtxU7KErSklnAysRtrnTU9iKstiixWv6mT7U1LK0eE8lm1TK8zLm8CRZAdL+Qw+UZ+3Ky9ly6
 roEn4qcHP69uLDP2YkO/N0j+bpQMkUDi56m/pEeg9E95Rds3Rnf4Sma+TjXHB9VV5cdo3SfTwji
 SfCfHpbQt5Gn6fdz5hYS8QueQvhclj6kkh65RYN2rwBfHOlNibRMDABkjQLIUXoMHLNVLBlOc1w
 izwP19bsOLPyF2qH+9Q7DjkkYrqlOqsmPHU8dAZNnsE1+LU2ft19ZsUQHeJEyR/tEPuXN+zFWxc
 W982J4zRfu1TLUq98hQNjNMWKrKA5Zvdz9nhFNB+bpDwctSx+paP+fAKMNWlOSK8xNFUbmfQEJ8
 oFVD0DwX6HMU18EalWn8ErOUt4bmuVAPZZdld6PjV2HE84N0orXg==
X-Received: by 2002:a05:600c:c3cc:20b0:483:afbb:a064 with SMTP id
 5b1f17b1804b1-483afbba23cmr104030475e9.1.1771919057460; 
 Mon, 23 Feb 2026 23:44:17 -0800 (PST)
Received: from vm-2404.. (249.184.66.37.rev.sfr.net. [37.66.184.249])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d3fdd0sm25244912f8f.19.2026.02.23.23.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 23:44:17 -0800 (PST)
To: buildroot@busybox.net
Date: Tue, 24 Feb 2026 08:44:14 +0100
Message-ID: <20260224074414.337942-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1771919059; x=1772523859; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z64KLonXJQnJSJWxDG8s2CLbzRv5geS/EepotYAltbM=;
 b=kRtWBHUkEq7sBRAAX9Ee40oGk8fs//3/05MH5lo4G7Qwyzai9yUSYHDKutYeVOO8tm
 LGFzyw8NzTTazWkkDybxqtIRXX3Bxbav/nKBtupGcApqn269tP0P02rUOjt9E+5695ud
 NGV25s0GEjApc5+RENy1YLU+YGSo8xXdFGEIzq4sl9t85PZW7AJUlku95luxkdLHY0xB
 Zd3EZ9SUmgdVh96fgBxIwsYVnIUOE/tsVs1sWaDRciA8ti3Aohg0qzpJPI9i4cjJ1aIj
 xU0Q/xbo2pwZUWDOSbJERpiRwOIBVqgill60W6oX/liY+Q1+07pbv7VRP0WCIU6stZZX
 aHUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=kRtWBHUk
Subject: [Buildroot] [PATCH] package/mstpd: bump to version 0.1.1
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove upstream patch

release notes:
https://github.com/mstpd/mstpd/releases/tag/0.1.1

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...pport-different-versions-of-pidof-13.patch | 48 -------------------
 package/mstpd/mstpd.hash                      |  5 +-
 package/mstpd/mstpd.mk                        |  2 +-
 3 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch

diff --git a/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch b/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch
deleted file mode 100644
index daa591131..000000000
--- a/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 181c453fc1a00573e19f14960dcc54ad84beea7c Mon Sep 17 00:00:00 2001
-From: colin-foster-in-advantage <colin.foster@in-advantage.com>
-Date: Tue, 12 Jul 2022 23:01:09 -0700
-Subject: [PATCH] bridge-stp.in: support different versions of pidof (#137)
-
-* bridge-stp.in: support different versions of pidof
-
-Busybox uses a version of pdiof that doesn't support the -c option. As
-such, this renders mstpd non-functional on any Busybox system.
-
-Just use the standard form of pidof to detect any running instances of mstpd.
-
-Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
----
- bridge-stp.in | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/bridge-stp.in b/bridge-stp.in
-index 47cbe79..3807873 100755
---- a/bridge-stp.in
-+++ b/bridge-stp.in
-@@ -139,7 +139,7 @@ case "$action" in
-         fi
- 
-         # Start mstpd if necessary.
--        if ! pidof -c -s mstpd >/dev/null; then
-+        if ! pidof -s mstpd >/dev/null; then
-             if [ "$MANAGE_MSTPD" != 'y' ]; then
-                 errmsg 'mstpd is not running'
-                 exit 3
-@@ -212,12 +212,12 @@ case "$action" in
-         done
- 
-         # Kill mstpd, since no bridges are currently using it.
--        kill $(pidof -c mstpd)
-+        kill $(pidof mstpd)
-         ;;
-     restart|restart_config)
-         if [ "$action" = 'restart' ]; then
-             # Kill mstpd.
--            pids="$(pidof -c mstpd)" ; Err=$?
-+            pids="$(pidof mstpd)" ; Err=$?
-             if [ $Err -eq 0 ]; then
-                 echo 'Stopping mstpd ...'
-                 kill $pids
--- 
-2.25.1
-
diff --git a/package/mstpd/mstpd.hash b/package/mstpd/mstpd.hash
index 64e946d6d..7c6c482ef 100644
--- a/package/mstpd/mstpd.hash
+++ b/package/mstpd/mstpd.hash
@@ -1,5 +1,4 @@
 # locally computed
-sha256  91a1862548b5b509caa2e96e5fb9912bc98d4d58cc98e99a577824735756c14d  mstpd-0.0.9.tar.gz
-sha256  03d1ff4ca189d54322562cb2891888768af719d2c73ceafa5f1ca96133dffeb2  mstpd-0.1.0.tar.gz
+sha256  6b4a0a721147373f0b22e8f47c0f13942b78afc55348299fe7b056b75adc98f4  mstpd-0.1.1.tar.gz
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  LICENSE
-sha256  c5cfd44652276184374adf454150d436ce958ce50acc4ef9ccb3605a5ca7a9d3  hmac_md5.c
+sha256  69e0a7ba32b016703dea402deae57348f14d028ff4dd9188b2acad607e484588  hmac_md5.c
diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
index 07c41af8d..79f361ee6 100644
--- a/package/mstpd/mstpd.mk
+++ b/package/mstpd/mstpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSTPD_VERSION = 0.1.0
+MSTPD_VERSION = 0.1.1
 MSTPD_SITE = $(call github,mstpd,mstpd,$(MSTPD_VERSION))
 MSTPD_AUTORECONF = YES
 MSTPD_LICENSE = GPL-2.0, RSA Data Security (md5)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
