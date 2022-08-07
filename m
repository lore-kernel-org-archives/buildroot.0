Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CC9C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CB9560AC6;
	Sun,  7 Aug 2022 12:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CB9560AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7I6EHLfaHsGa; Sun,  7 Aug 2022 12:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4253660ABB;
	Sun,  7 Aug 2022 12:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4253660ABB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 109301BF836
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED1FB82897
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED1FB82897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sEtpBBBZ3FqH for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:37:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C32988138B
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C32988138B
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:37:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l4so8055916wrm.13
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 05:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=zf5v2erQGHADMSPVj7PE9L0R/lxwhPbf/hbZ2RqCON8=;
 b=wTV/TUmgRk+4XI35bJoJK5MGxnJK/IFDXZeqyp2ZAGbcSVnhQcDTt4BSCUBe9XYnu7
 +32jk9CrMSmICJ9S7feaeeLmgJaI4LhPHd6WoxVqLTIyasvUEiFvVDzi/l6M8pMhcEJ2
 85dpWmO1QsN7UImDia61bDJ+rF9M7p8mqDnpIpYbr/+JhsPYkhP69kq+WnzDCMtfajWC
 rbWWxl7p247RzCS0pigA3PnBqVWJnqMHqGPGwZglG7khGi2dd8m0iC6mU7pjLXBeip8F
 uR0F8Uduh0SyhFiLsJ1YDtZSG4Mal0XuacYQNBBboujCM240+7MhNF0xWdGYorl1yy1b
 hMQg==
X-Gm-Message-State: ACgBeo1e+6Db3ywbmn4GcnpJYZRNsKEyyEr3fPQWq973BCdInKyDqoQH
 p+1+Rjv6pIXzASK2nzSgxqX4mW8NYHQ=
X-Google-Smtp-Source: AA6agR69G4j49WrQm9vYCxpOUpD/X9PN8dh05ij5UDT6OL+29AE5PStdup/wCOCph2QgeNzNZ77D9w==
X-Received: by 2002:a5d:47c8:0:b0:221:61d0:c790 with SMTP id
 o8-20020a5d47c8000000b0022161d0c790mr7316263wrc.364.1659875859770; 
 Sun, 07 Aug 2022 05:37:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b003a31b79dc0esm36758678wmq.1.2022.08.07.05.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 05:37:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 14:36:52 +0200
Message-Id: <20220807123652.3750380-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=zf5v2erQGHADMSPVj7PE9L0R/lxwhPbf/hbZ2RqCON8=;
 b=Hl0ICMIJ1Utp6tQRZ4/eY+WvHvv19xvXg87qC/5L2MV2C8I4BLHnsQXFZqs4J5mXOE
 h/CQAfbOH48diyITvhtyNYAGVnnmpKXOCANOYdMOIiJEQXr8oDzTlv5qMePbiliqQrgE
 232Fm0Ip4gAu+cqJfJBlTN50W07mhrkx2Jenzb1ggXdp8AoxjBjHykSvKmTdha0z7LIa
 yeqE2VvUsVzhrgwXFwfKgl8IL9S4Oxep8ydQNj31OMIVTS0z9rN/r31ifybf7yRXtMLA
 IWXZLz/8M5JNNUeqSS+k9OXl0wjKrsAvD+eLWSh/IWtgqGLczEKigXD5wMQTVPu6zpWa
 YCqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Hl0ICMIJ
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: imhttp needs apr-util
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

imhttp needs apr-util since bump to version 8.2204.1 in commit
bc469ee6329555284b2fe9162597917122fbbe3a and
https://github.com/rsyslog/rsyslog/commit/a8b8d6c1f969286adac3d465e6ac018968550667
resulting in the following build failure:

configure: error: Package requirements (apr-util-1 >= 1.0) were not met:

Package 'apr-util-1', required by 'virtual:world', not found

Instead of having the user needs to figure out that apr-util is needed
for imhttp support, have the top-level rsyslog option selects apr-util
when civetweb-lib is enabled

Fixes:
 - http://autobuild.buildroot.org/results/4454ae5321df0c04c9dee19693f3908e69fbf23d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsyslog/Config.in  | 1 +
 package/rsyslog/rsyslog.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 8c024e69c7..3ba326191a 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_RSYSLOG
 	# even though rsyslog already depends on threads for itself:
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_APR_UTIL if BR2_PACKAGE_CIVETWEB_LIB
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBESTR
 	select BR2_PACKAGE_LIBLOGGING
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index b87ab891da..84fd2d2e5e 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -53,7 +53,7 @@ RSYSLOG_CONF_OPTS += \
 endif
 
 ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
-RSYSLOG_DEPENDENCIES += civetweb
+RSYSLOG_DEPENDENCIES += apr-util civetweb
 RSYSLOG_CONF_OPTS += --enable-imhttp
 else
 RSYSLOG_CONF_OPTS += --disable-imhttp
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
