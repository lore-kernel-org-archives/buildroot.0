Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8F9C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 22:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 664D941298;
	Fri,  3 Dec 2021 22:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BD_tXyaWW8NS; Fri,  3 Dec 2021 22:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BEF841BE3;
	Fri,  3 Dec 2021 22:32:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 798641BF9D1
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6917883C28
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSRp544QnPHm for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 22:31:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47D5D83A47
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 22:31:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a9so8612703wrr.8
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 14:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PCrTX+SqLM7UbMYKXKkejorbGusOLlC4KsG/+WSoWyc=;
 b=iuQsidH5yOJ6ykgHLrvjbK5+dTrFdRWMB+ggiAOzdO4IvQKhhEmR+gJFvPcCjL9w0K
 JxjoWrj1JZ9Jb+A/y2wjFbLikYXgtRP9n3nIWNzzrjlJhUWlhqJMBN27RgOy+cvqeP1A
 fKTvdLj+bB+I+GuE9Z6ljFAMVhZdCPx7FAQGMLLJy451+CVmtHsPLcA+Uz/cdcu4j9ye
 cJtwl0dSop/7R3YpM02QmeFfJkadEejVFOlXK4AJYcxpdI84m7j6T0GE5Ee6SNcUPD1C
 t7/NwlHn1hvZlho4m5MTW5wSCJd+aP1PQsouZiTn3N42hWFaWelHHSq++TDdk74cc3PF
 Nz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PCrTX+SqLM7UbMYKXKkejorbGusOLlC4KsG/+WSoWyc=;
 b=aigLR/ibRsr9LHH7RDk4VQIxGFlq9aPhpQt3GIqMcF//9Itjn0aP1MfDDCP8XY30mv
 wTOrvveqKLKDImRftc6UyF5upEkEuPGst/5WxKlhchecLKueOSep16g3fXIShT3Phiz6
 d8WA6GcYeJtzb5xWtjxSWtb0PAGV9rLkaGNO9MewuUw2ulm0R8ExYf5X3uf03BfYzPcX
 0qwdZefaeTDC8BKsnDfFp85cMEeN+F7A787a+6qyBOgOEIBAoZw2bkYt/bwFLQejoW+u
 eTRfpfWhKq4DrPVFw8rSQx5ZRLZT/r/TYLRYniT8Qp30RBpc/+0ERmwc5wIF4k1bnJCA
 hz1Q==
X-Gm-Message-State: AOAM532ztmSX/e9NYEjYp0+ZdOFsFXoiICpFg2VMWWXygjROWgSwNtSy
 zltmy/AUfrVUAMpo96n32ZN1R0km+ZJB4bgF
X-Google-Smtp-Source: ABdhPJwj6/y8rplsHwws0kcMNBZjx9dgFb3KkW1XEG+NLou3Yo6R81ytOUhnY1MtBngPvx6ZgbMCNA==
X-Received: by 2002:a5d:64ce:: with SMTP id f14mr23815852wri.165.1638570701408; 
 Fri, 03 Dec 2021 14:31:41 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id l21sm3801798wrb.38.2021.12.03.14.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 14:31:41 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 23:31:26 +0100
Message-Id: <20211203223127.274985-4-nolange79@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211203223127.274985-1-nolange79@gmail.com>
References: <20211203223127.274985-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/4] package/systemd: always enable
 systemd-tmpfilesd
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

this tool and service is pretty much expected to be enabled,
making this a certainty will enable future improvements.

The config variable BR2_PACKAGE_SYSTEMD_TMPFILES is still
availabe and always set.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2
-   dont remove the config, instead just set it to 1
---
 package/dhcp/Config.in     | 1 -
 package/systemd/Config.in  | 9 +--------
 package/systemd/systemd.mk | 7 +------
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index e6e70908dd..515040c612 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -13,7 +13,6 @@ if BR2_PACKAGE_DHCP
 
 config BR2_PACKAGE_DHCP_SERVER
 	bool "dhcp server"
-	select BR2_PACKAGE_SYSTEMD_TMPFILES if BR2_PACKAGE_SYSTEMD
 	help
 	  DHCP server from the ISC DHCP distribution.
 
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 6f622c73f3..52c86aad59 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -485,15 +485,8 @@ config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	  http://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
 
 config BR2_PACKAGE_SYSTEMD_TMPFILES
-	bool "enable tmpfiles support"
+	bool
 	default y
-	help
-	  systemd-tmpfiles creates, deletes, and cleans up volatile
-	  and temporary files and directories, based on the
-	  configuration file format and location specified in
-	  tmpfiles.d(5).
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
 
 config BR2_PACKAGE_SYSTEMD_USERDB
 	bool "enable userdb daemon"
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 16202d4ac9..dfe9a1a5c7 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -49,6 +49,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dsysvrcnd-path= \
 	-Dtelinit-path= \
 	-Dtests=false \
+	-Dtmpfiles=true \
 	-Dumount-path=/usr/bin/umount \
 	-Dutmp=false
 
@@ -307,12 +308,6 @@ else
 SYSTEMD_CONF_OPTS += -Dquotacheck=false
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
-SYSTEMD_CONF_OPTS += -Dtmpfiles=true
-else
-SYSTEMD_CONF_OPTS += -Dtmpfiles=false
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
 SYSTEMD_CONF_OPTS += -Dsysusers=true
 else
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
