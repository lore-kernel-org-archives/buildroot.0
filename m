Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1C7C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E16EF81404;
	Sat,  8 Jan 2022 17:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvJ10Lpe2I1N; Sat,  8 Jan 2022 17:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B1DE813C0;
	Sat,  8 Jan 2022 17:27:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 530181BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DA3E40127
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zjaEgkBqtqKg for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:27:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EDE5400BA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:27:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q8so17653094wra.12
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 09:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSu3efJ0MYLtiSQDLK9gVqk3eccHNe8DK5S5o5DZAio=;
 b=W4SYig7LICRfXmNmQn87OPF2NslyIFtYLyfLzHRUreuDTq5dA5HPWfXBl4fA+gCHgg
 OQuQIKADZCDXkVr9wk0dsy8k/cX9ymsRoeGQBQH4MycHQ0/4mmYCpU0qitYQqaReHStU
 12UmeBeFG66xTtYui5JQCgwcvVLDZY6Ke27+hfKZgZYvjgaqrbUnY3qszg+KVwrWa7Km
 KmH3O9KAV1PgjRl2cJ0ChqLTRewv0x6q89cNCPihxixxVvnkr1sGg2ln6aNqy69pE1aL
 AtqzH7GoUX2lTt9XWyVC6bQdHLvrCpaD9btdwFoROnRDCycAVsg8PEiJOTAus9vtJXLg
 ha9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSu3efJ0MYLtiSQDLK9gVqk3eccHNe8DK5S5o5DZAio=;
 b=NfwYxX3IzBJ7Dip82Vc6MG5k9Uf8JNjLgWTk6WLjkGZOnUV/o8ngsCo4B3jHd8Abzo
 1N049/PG+v1qs32QLQb/+0h7Fx6+EJkNu8Z22+ph20hPiDL31mvN59ENfBfysV3YnA0g
 BMNzs3UboEZSaXFuhR1vQOhRcX+oaouAlELmlu0456wcFGE0SuBjtRQgSiEhXQyQ2mIF
 KkwSZ/lawZ1I1ZkYoplIk3p3WRvdTVwp2fN2B8kTfgYMPmLYZk0NIJDdEbO6jTiQz2fa
 oV7033K1AR4TPEPbbJ7fmWxk9OeC8XMqIQFlb673/wP/+Vywt/6zYnCgx7PcrqQ/6kkm
 2x8Q==
X-Gm-Message-State: AOAM532lRg6FJPZusEr78sdohYrNt4M751v7ikkAVdsJ5aV3Qhya0QbM
 fbLDpv+u2HWNVHIdL9zyT+NBX1XkvbE=
X-Google-Smtp-Source: ABdhPJyrDE2LINzna0rnmfusiODbLqi5VFSN+aCejXviqoW6KB0qRbkrSPL659m6U+Oys8Ietdt+Zg==
X-Received: by 2002:a05:6000:1567:: with SMTP id
 7mr59354026wrz.513.1641662826151; 
 Sat, 08 Jan 2022 09:27:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id c16sm2085507wrp.109.2022.01.08.09.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 09:27:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 18:24:41 +0100
Message-Id: <20220108172441.2819559-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/safeclib: bump to version 02092020
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

- Update indentation in hash file (two spaces)
- This bump will fix the following build failure with libest which was
  added with commit f6f0e1e58168dfa9194db2e073efd20a98c15728:

In file included from /home/buildroot/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/include/libsafec/safe_lib.h:43:0,
                 from est_server_http.c:39:
/home/buildroot/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/include/libsafec/safe_types.h:42:9: error: unknown type name 'size_t'
 typedef size_t  rsize_t;
         ^~~~~~

https://github.com/rurban/safeclib/blob/v02092020/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/5a12f1cb4153834078522b6068ff24ac0300d51d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/safeclib/safeclib.hash | 6 +++---
 package/safeclib/safeclib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/safeclib/safeclib.hash b/package/safeclib/safeclib.hash
index 7e1c6794e4..af732f93fd 100644
--- a/package/safeclib/safeclib.hash
+++ b/package/safeclib/safeclib.hash
@@ -1,5 +1,5 @@
-# From https://github.com/rurban/safeclib/releases/tag/v08112019
-sha256	bc2f25875522c50a3a5901981020d906db0b6a7d365619b8d72412c126be3923	libsafec-08112019.0-gad76c7.tar.bz2
+# From https://github.com/rurban/safeclib/releases/tag/v02092020
+sha256  d374bdcbfcdc4c9a76abed3707667372ca212fd87a369e7bcaaa54e716d27c0a  libsafec-02092020.tar.xz
 
 # Hash for license file
-sha256	c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b	COPYING
+sha256  c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b  COPYING
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index 3af8fbb167..032a73bf67 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SAFECLIB_VERSION = 08112019
+SAFECLIB_VERSION = 02092020
 SAFECLIB_SITE = \
 	https://github.com/rurban/safeclib/releases/download/v$(SAFECLIB_VERSION)
-SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).0-gad76c7.tar.bz2
+SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).tar.xz
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
