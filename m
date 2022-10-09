Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432E7C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 21:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FF02416F7;
	Sun,  9 Oct 2022 21:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FF02416F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NooYTNRPDQqc; Sun,  9 Oct 2022 21:49:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1302B41695;
	Sun,  9 Oct 2022 21:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1302B41695
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 868621BF376
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 616B1403D6
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 616B1403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XcfHiandc-_o for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 21:49:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CDA1403AA
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CDA1403AA
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 21:49:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w18so14535467wro.7
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 14:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lltofmP0WJrjoCDKxD+OEX0U7lpw2QCb/PbtkgN+i1I=;
 b=yXBu62StYwgpPraML5dw/ifpXdlPIlQYDE0V3zKsJUh8HlC04CrNJf+fS7FKtgi5WS
 gsF1HGNMFDHMqDdHXsqX4AHa6tMfaXn8cylpiPAaUjVpNnth56YdkRTiZqpgr9+26CZ8
 TcJpfYLaA4wBH/0aY/Ni7NzfiUVfsL2IwrV64Ps29A7YF4qbyDM05gDRPywIMj+lOJLy
 JdAq+/x41bVRraRv1qvB4Da+RwYbT65bgHSdh+7+K96ajqTKTh6LfUC7DsXywRkVe9ux
 ujHpjRfpRVG5yoqGpJHKBRUrKsV2JMopVfh7CQVx1SAiaDaWDNltu38pgwXRs8T3gxRV
 Czbw==
X-Gm-Message-State: ACrzQf07EfnhMjFXSqMqHAu67o/r16D1ZLQVBXjE4iVEvUKnCgYM1dWX
 y+sZy+4WaFrb0VRhiqAMQ6Jx8XCmnS0=
X-Google-Smtp-Source: AMsMyM5ICW90OBEWjzFbYldMIHKM5qSo+7p6+A+nAEE6dkZLwqjdhPr/iZZK9otQ7yceCHZYXBaujg==
X-Received: by 2002:adf:fa10:0:b0:22e:4b8d:81f8 with SMTP id
 m16-20020adffa10000000b0022e4b8d81f8mr9646132wrr.135.1665352187929; 
 Sun, 09 Oct 2022 14:49:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 ay34-20020a05600c1e2200b003b4de550e34sm2213192wmb.40.2022.10.09.14.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 14:49:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 23:49:45 +0200
Message-Id: <20221009214945.128155-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lltofmP0WJrjoCDKxD+OEX0U7lpw2QCb/PbtkgN+i1I=;
 b=cmKet/22s7r3BPUVkdGzIYKJkXHo0q+ERZZqW/Mpo4LBvkl/mcRCjxgSkZ8f0GLRGq
 wlj7vPQN4maITzSu5bC+Swgs5XMXCTOULQjbnSlm8amdlGmwsBl9EkseE4ETumXBjoJM
 dePUs0SzO2yvTnvimdQJ22mfIZ7uFAmPFv16SwjUyS00XwG9CPwXrGAV9dyQez69yKLF
 yHkRNyoMCnrII6OaEtZgr+KtNKAY/fWC801y5r3kpatNPhxynvLCYCer2t2iGndfkKQX
 R4/SXlQDJc+aQa30Sn8uGC8OjG5oZq/1HMaQLowNCRnTw+nMBCKTHEwIIaMwmEoKYK/z
 7LqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cmKet/22
Subject: [Buildroot] [PATCH 1/1] package/gesftpserver: bump to version 2
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

- Drop patch (already in version)
- Replace rjk_cv_python24 by rjk_cv_python3 due to
  https://github.com/ewxrjk/sftpserver/commit/6c0b4852a3654747e88f457a37b20530c5e426ca

http://www.chiark.greenend.org.uk/pipermail/sgo-software-announce/2022/000070.html
https://github.com/ewxrjk/sftpserver/blob/2/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...v3-attributes-according-to-draft-iet.patch | 30 -------------------
 package/gesftpserver/gesftpserver.hash        |  2 +-
 package/gesftpserver/gesftpserver.mk          |  4 +--
 3 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 package/gesftpserver/0001-Change-order-of-v3-attributes-according-to-draft-iet.patch

diff --git a/package/gesftpserver/0001-Change-order-of-v3-attributes-according-to-draft-iet.patch b/package/gesftpserver/0001-Change-order-of-v3-attributes-according-to-draft-iet.patch
deleted file mode 100644
index 3697d0e525..0000000000
--- a/package/gesftpserver/0001-Change-order-of-v3-attributes-according-to-draft-iet.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4b5c7eb63894bd2b1fedeb2a8e9bd16bf3c8c555 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Bernd=20Holzm=C3=BCller?=
- <bernd.holzmueller@tiggerswelt.net>
-Date: Mon, 11 Feb 2019 23:57:01 +0100
-Subject: [PATCH] Change order of v3-attributes according to
- draft-ietf-secsh-filexfer-00/02
-
-[yann.morin.1998@free.fr: backport from upstream]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- v3.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/v3.c b/v3.c
-index 57cc31e..1fd86ad 100644
---- a/v3.c
-+++ b/v3.c
-@@ -121,8 +121,8 @@ static void v3_sendattrs(struct sftpjob *job, const struct sftpattr *attrs) {
-       fatal("sending out-of-range mtime");
-     if(a != attrs->atime.seconds)
-       fatal("sending out-of-range mtime");
--    sftp_send_uint32(job->worker, m);
-     sftp_send_uint32(job->worker, a);
-+    sftp_send_uint32(job->worker, m);
-   }
-   /* Note that we just discard unknown bits rather than reporting errors. */
- }
--- 
-2.14.1
-
diff --git a/package/gesftpserver/gesftpserver.hash b/package/gesftpserver/gesftpserver.hash
index 790cbe97c2..6d910a84dd 100644
--- a/package/gesftpserver/gesftpserver.hash
+++ b/package/gesftpserver/gesftpserver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4963b85787de3485085a5356c671c58b8b33125f528ff1b2fe8b534ed8a0c1bd  sftpserver-1.tar.gz
+sha256  b18b10405ef2b05c45450aafd6803f69efb4d2138e4e07fd186c1618027ee169  sftpserver-2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 20ad92d25a..b47ec1c5d3 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GESFTPSERVER_VERSION = 1
+GESFTPSERVER_VERSION = 2
 GESFTPSERVER_SOURCE = sftpserver-$(GESFTPSERVER_VERSION).tar.gz
 GESFTPSERVER_SITE = http://www.greenend.org.uk/rjk/sftpserver
 GESFTPSERVER_LICENSE = GPL-2.0+
@@ -25,7 +25,7 @@ GESFTPSERVER_DEPENDENCIES += \
 
 # Python on the host is only used for tests, which we don't use in
 # Buildroot
-GESFTPSERVER_CONF_ENV += rjk_cv_python24=false
+GESFTPSERVER_CONF_ENV += rjk_cv_python3=false
 
 # openssh/dropbear looks here
 define GESFTPSERVER_ADD_SYMLINK
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
