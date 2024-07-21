Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22EBC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 15:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B05A980AF4;
	Sun, 21 Jul 2024 15:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kB-YFep4vxLX; Sun, 21 Jul 2024 15:01:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A836B80CB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A836B80CB2;
	Sun, 21 Jul 2024 15:01:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C03291BF2BE
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 15:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC4F680CB2
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 15:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DTiIZBBBw6x for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 15:01:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 834FC80AF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834FC80AF4
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 834FC80AF4
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 15:01:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4277a5ed48bso25807145e9.2
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 08:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721574079; x=1722178879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SSq1J/GazUYyJhOsQ4gt1oSsL3S+O9iOkgsFYe/lBvQ=;
 b=EAJ5WYn6+ah0zb6j44kWQ+n7uw9eTAWAaCL/3pNV29IadMf3kzLTPKG6k0qyAIarw0
 7qrkOUSeQe0r6D491TToZcjqxkyOa8zp/20NqVNugvuO6OU2XzDm3uHhtfwSVAHzzhcR
 Y7YVC5bz59mN0XiHXTl4Phj3+24TWzhg+WgGlFf4bdSTLqadCJQUqs5xdIgM3B4ID0og
 HH+kZAJ9R3ORktHjYAhoMF21raHXPPSpbpi5oqxJQ+xyPuqYrwEL28gqVTmp02+aSQ0L
 2QnDUWtjatUPhA83Mk1T13i9leJzCE+cu9CLkseJvL3/qbZNPIpsdcs+Q0pg+KNaX1ho
 iwtw==
X-Gm-Message-State: AOJu0YwuhfhwPqirxGzplCRxuVvwcGSyFOEw5KKpdGN3+NjL8bua99A7
 oIUUqPh8WMkjcTXwmsgBws6yTHdfZ/+swRJgb/1rtp7rWo6YCb6C1IbD9A==
X-Google-Smtp-Source: AGHT+IF0M213o5LVO+/r7vGJXvW+rDuqvsXkV3xG5ynRxwT+8uzPi0HvTkSZlNZxTH7FX3QLQjpLcg==
X-Received: by 2002:a05:600c:444e:b0:427:d8f2:332 with SMTP id
 5b1f17b1804b1-427dc513007mr25689775e9.7.1721574078806; 
 Sun, 21 Jul 2024 08:01:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427db2a4e3bsm60977415e9.44.2024.07.21.08.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 08:01:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 17:01:16 +0200
Message-ID: <20240721150116.1438024-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721574079; x=1722178879; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SSq1J/GazUYyJhOsQ4gt1oSsL3S+O9iOkgsFYe/lBvQ=;
 b=l/oA4Gc0IwxnyJYJenf/2eID7jGZERBER7lSdsrT7GgSpxSEG+qM8YI+t9GnA4+IMp
 lwLqJOjfgVs+ZZNA/qzSHowNoVgi4ykV6vdWsS8wwu1M7ng9DRQ10KqCfLmjdeS+Xu7I
 KBSTiBD+Em+LG5E9lEcfGitY7HALcHh+nEtkJZEGZh659/m8Sy5b7i1bF5EMvuAr/aOm
 dzJJe0csW1UClglRP3bz9GLbSjGPuCGwpWtdfiYgHCvx86cWOhIBasf+v0fQhIHo5A1k
 73AWV+HpH8ibLMU8js5SzsBu40sX7ampBwA6Qmfp66V5HwqfOJY6ufvvfsL/mDhcbNx7
 URVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l/oA4Gc0
Subject: [Buildroot] [PATCH 1/1] package/unbound: security bump to version
 1.20.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release has a fix for the DNSBomb issue CVE-2024-33655. This has a
low severity for Unbound, since it makes Unbound complicit in targeting
others, but does not affect Unbound so much.
This security release also fixes CVE-2024-1931.

https://nlnetlabs.nl/news/2024/May/08/unbound-1.20.0-released
https://nlnetlabs.nl/news/2024/Mar/14/unbound-1.19.3-released
https://nlnetlabs.nl/news/2024/Mar/07/unbound-1.19.2-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 843026abc7..96ee80b0ec 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.19.1.tar.gz.sha256
-sha256  bc1d576f3dd846a0739adc41ffaa702404c6767d2b6082deb9f2f97cbb24a3a9  unbound-1.19.1.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.20.0.tar.gz.sha256
+sha256  56b4ceed33639522000fd96775576ddf8782bb3617610715d7f1e777c5ec1dbf  unbound-1.20.0.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 5128d0e420..ff0262bef1 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.19.1
+UNBOUND_VERSION = 1.20.0
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
