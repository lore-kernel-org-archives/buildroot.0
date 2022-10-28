Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3719DC38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 16:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9852F818CA;
	Fri, 28 Oct 2022 16:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9852F818CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oXJZBemK9NNY; Fri, 28 Oct 2022 16:58:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9A1681871;
	Fri, 28 Oct 2022 16:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9A1681871
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D61B1BF299
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 16:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 460B781871
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 16:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 460B781871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hFdljsW7A5u for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 16:58:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D9208186E
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D9208186E
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 16:58:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id o4so7406434wrq.6
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 09:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AiYVWJDoZWqbcKuOLNmQzuzshpGqDorvho5k2qvGDrk=;
 b=L7a3sRcbeXLq7QamD4gNUgiMfwWmKhhHYbEgRy6Pru4OTYQipa/gTkWid7uIJXPvzq
 tKiFCMIDTi+Jn6AFk5H0uIk4Sv2H1JgIa46qAecCVEFcO6OFab61wfae6i2fgCVMJFLy
 Jtb0TMaJ1xTlRjLJ4blDTd0s6efXDLnKvYcsvK02M4x6qAx17Y/XvNyc+VMLp0yxSymY
 ZTFz3y1dR1C6shviNSbajgUURQ3FJru81quoh6A9YFYXlvY7bPzVunIEoW3MVKM0apC6
 FilneYLlJjZ78yjBGT7DKHNyuNHWdAVYTkBhVvqeYyGKR+fA6fH4n2K8Abq6VkSErqEt
 9f3g==
X-Gm-Message-State: ACrzQf05z/k+09D/txv3cWXjO2vg7PFe/Tok7/zIZBJdvDbCXwyCf27p
 DdGSP/5d0wH3WdAfZX/HrBu8McCZQKw=
X-Google-Smtp-Source: AMsMyM5Hm97HMj2E+dN5ewhfTdclkaOM9e0Ks3r8R4y6+e1F69hW5ntc/8jUXgTcf6ewWibnonFEFQ==
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id
 c14-20020adffb0e000000b0021a34a25ca9mr191032wrr.472.1666976298045; 
 Fri, 28 Oct 2022 09:58:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l2-20020a7bc342000000b003c6c182bef9sm9248826wmj.36.2022.10.28.09.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:58:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 18:57:48 +0200
Message-Id: <20221028165748.47166-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AiYVWJDoZWqbcKuOLNmQzuzshpGqDorvho5k2qvGDrk=;
 b=SSATNtWoshD1paKXbysBWU39BiuDvd9CaTMZO8MJ+5mQv5eW1j7qB8RL/APGRsXG84
 CF1Aeq+P9sJtUy796fT4azBqqbI2FYiGETDQCBIlYNdCtSTbx6061IZpr0T0/JnfDxPV
 ScBWZ96gvyj6JWF9ad6R4B8WqEwWRpuks8eYd7QLo68Lacl4RHuJPCnkdDRSYVzH7fP+
 GHgucVFxi3iwSioeDnkM423X+Ac2sao0hQCkZ32eqvelXqWK5MhmRisyNGYIuFQsvIYt
 0ZHbmcWaO/BETzWy/LZd5JEODdhLwMT9CBayTsWb8USwPSqrboT+KFgfb2mPB2pFGIuj
 XSKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SSATNtWo
Subject: [Buildroot] [PATCH 1/1] package/atftp: bump to version 0.8.0
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

- No configure script in official tarball
- pcre has been replaced by pcre2 since
  https://github.com/madmartin/atftp/commit/5739ed9507e441dd4f699bfe19401544d393b5ef
  https://github.com/madmartin/atftp/commit/fdf479c31bc626013bc673e2493348b4993bcbae

https://github.com/madmartin/atftp/blob/v0.8.0/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atftp/atftp.hash | 2 +-
 package/atftp/atftp.mk   | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/atftp/atftp.hash b/package/atftp/atftp.hash
index 6b0d9a5879..b335456f33 100644
--- a/package/atftp/atftp.hash
+++ b/package/atftp/atftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  93c87a4fb18218414e008e01c995dadd231ba4c752d0f894b34416d1e6d3038a  atftp-0.7.5.tar.gz
+sha256  df2aa089c7670f9eab40e5598e5d2cb6a582dc5182926ea50b4d690e4e37f316  atftp-0.8.0.tar.gz
 sha256  86dc744860e6dfacfeba2f33fea908db03fe67c7e37a878285b7aae8e4596735  LICENSE
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index 70ef4c0fae..288501bc11 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-ATFTP_VERSION = 0.7.5
+ATFTP_VERSION = 0.8.0
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPL-2.0+
 ATFTP_LICENSE_FILES = LICENSE
 ATFTP_CPE_ID_VENDOR = atftp_project
 ATFTP_SELINUX_MODULES = tftp
+# No configure in tarball
+ATFTP_AUTORECONF = YES
 ATFTP_CONF_OPTS = --disable-libwrap --disable-mtftp
 # For static we need to explicitly link against libpthread
 ATFTP_LIBS = -lpthread
@@ -27,8 +29,8 @@ else
 ATFTP_CONF_OPTS += --disable-libreadline
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-ATFTP_DEPENDENCIES += pcre
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+ATFTP_DEPENDENCIES += pcre2
 ATFTP_CONF_OPTS += --enable-libpcre
 else
 ATFTP_CONF_OPTS += --disable-libpcre
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
