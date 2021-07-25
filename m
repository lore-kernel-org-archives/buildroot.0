Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D850CC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:31:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DB8960F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DB8960F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A426065D;
	Sun, 25 Jul 2021 21:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3OIUpXzM25z; Sun, 25 Jul 2021 21:31:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE38D60590;
	Sun, 25 Jul 2021 21:31:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FB491BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39C5D600C7
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hnniHs52lEz8 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:31:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 531C7600B6
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:31:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id n11so4112313wmd.2
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WY404SPW4ZdhLpdsnseEvrf6NejjnLmg+Ytf2/ACdno=;
 b=FdSunuIYGlRvXlCYDL68SGP8Rj6wWniGdaT82VimlN93MN80YNyrOseRQJNEHdeqOx
 8zJlg0J3HGGjhV2KJji7feWWYP9p8RzY6foRHLN8W5qu2B6z6ZvnM+aeR68Nf7vYPBPZ
 xHvv+I6mndulo0Jl0ORz6NAHztUg3jM/Fp5aN4Jau9CqK8JD3rKv7ozWI+tb+jpvUYaq
 vpHrSkNmyp4N7CfSSN2ctDYDG2VXDoKhhkW/DINbPulJa+AxUApcvZKbpWVYeaF9LVEx
 2jFgLv1HsYqj8SEI+LVumtU3gqeaYLxm9nvyynN+m/Su0ALQgCh0n1yHQ9NmZ4lP4U2d
 s2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WY404SPW4ZdhLpdsnseEvrf6NejjnLmg+Ytf2/ACdno=;
 b=k0qIsFcPsZtG/k0JD2J0OGGl0z35DOIAWyYgTuhFVFobyby5FWAqIMmmKstAAVDnf+
 062BDdz5Zt620VGy1nife97hBXbq7H4IwNzxQw5fWzDutaq5ODlFScwXkPegpo6Anh3p
 qu4uUQFU+ys+qR6XOy0qifkQD1AyD5VzmmS8UPXOvira3oG2papMVEO+v8esbVztSdmC
 s7/KjrOs0qs4+/q3fJSeJdweQ/jmDDfWvWLiJr8u0A3ZHWDfMOvVHBKdasfwKtObr+49
 uazyn9XEWmZf+AhwESXcUTmSJghXtc+1iqsvgKjFsyitA/KUIm3YQ9sk0WfoViYZGxbJ
 mqMg==
X-Gm-Message-State: AOAM532Gh4VndjJbYw2Bgcg6sPF9q02msZMfOcXSmbPXNJsDAGgNoPcM
 Y3sJSD8esEmv/zWT6QQF6EFKRhLTurxjag==
X-Google-Smtp-Source: ABdhPJyC7nF8x/x0jtMRuKiGwIgkoIVAHjI8SPq43w9FT9c6NpCD7XscpE5R7fkCWXQTWYxJWNdsrA==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr6550449wmi.82.1627248658303;
 Sun, 25 Jul 2021 14:30:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id m14sm1590671wrs.56.2021.07.25.14.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:30:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:30:48 +0200
Message-Id: <20210725213048.1005931-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/atftp: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ryan Barnett <ryan.barnett@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for atftp is added by the services/tftp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atftp/atftp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index a2df4af056..3db966c169 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -9,6 +9,7 @@ ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPL-2.0+
 ATFTP_LICENSE_FILES = LICENSE
 ATFTP_CPE_ID_VENDOR = atftp_project
+ATFTP_SELINUX_MODULES = tftp
 ATFTP_CONF_OPTS = --disable-libwrap --disable-mtftp
 # For static we need to explicitly link against libpthread
 ATFTP_LIBS = -lpthread
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
