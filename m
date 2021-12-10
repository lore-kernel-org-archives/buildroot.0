Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5ECC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 18:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DECED614B9;
	Fri, 10 Dec 2021 18:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id azi0ZSzOFfdn; Fri, 10 Dec 2021 18:18:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 502D6614BD;
	Fri, 10 Dec 2021 18:18:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9F081BF2B7
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 18:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9439426A6
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 18:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3dVAcgkyC0s for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 18:18:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15D82426A3
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 18:18:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u17so16361031wrt.3
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 10:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VOSdVY+8MfITbZfOM5JmgdNXlrDDu1yOGcDXPZgt8DA=;
 b=ncpYkw7GGYL0jjKVLgda/7NIhr6k7IGJNWaLRMkdnFWbLwrvJsdSu3as+dMaQEfJSx
 fMGmHK8ot/tc1kTr6UuVYkrTztQjS6QFUrxWahojzNR7woznsoRQCW97IGUVx10n2vvt
 cMRC7qsqqgU5C+Tv4HyBHzkESAWNMz3Hbr7idUdY0fJdmED5AoQ6hy/vrG2hLUpViz6L
 /AEJThq08sAQ/YorrtSt2GTFsq7w9/tktQYDsilrx1b6d0bneDMdf2J0o/Dy1XLyZwBT
 Cecsa9YkXeeSmNnrfwoxyDimNUhimQt+6lZJDIMjhtMEuDIf9ie98ygNQ2SuFxF9bWUM
 YvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VOSdVY+8MfITbZfOM5JmgdNXlrDDu1yOGcDXPZgt8DA=;
 b=VR8JA/bZMlOHNX3TPX6V8hR/jg91j0JFxzb6l+A8f+9GYJj9/zcp0SvVAD+Wd54RdX
 7WUhP1qgz7qvBMcxievHgzEHMCknAtPjCM3xQsqOgUKJvaxNytwwnATPFBGU1zPSec4L
 g0Eu2tjEC4gKCBKit1wDc/38nN2UON+qi73UDszx3l8csx5DfuQByvqOUbwKBde3le+l
 OqBfMjGA6hOXqoYA+ZyGoEPbzDhrUX4ouoHxOa6c4KYvSHpOWiao5iYi3ex6LkqSn7s2
 TMmr4EzUPayzLuaz7engLonw49e4YuSR3EUsM+tA4krROGAJkgkZeIfD4Ll6I1l6qSD6
 BhoA==
X-Gm-Message-State: AOAM53273lUCHvJJR5X+TrhsI5uJKhvH8adjIgAbpeZRQvn04oCJBPmC
 MAm652N0abARLLJ639CmNbW/+sGZAWv1fA==
X-Google-Smtp-Source: ABdhPJztyIuu50Ov8fiNHg9feEvhKudD7FmLeJOAX6q/pLdOEttwpfqA9fEa7SBFavmvFhnVm9E5bg==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr15088955wrt.131.1639160326989; 
 Fri, 10 Dec 2021 10:18:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id a10sm12448250wmq.27.2021.12.10.10.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 10:18:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 19:18:38 +0100
Message-Id: <20211210181838.4013689-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.3775
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

Fix CVE-2021-4069: vim is vulnerable to Use After Free

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 6ab309fd9a..9fb162d798 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  16ff13ea2a11da96080510fdfccf5f3a05f82e2c7027494bd8c98704bbf14428  vim-8.2.3690.tar.gz
+sha256  acddd083c44a3a62194b73bb2fd1327af2adf256b5978c64f97d2656dda24d07  vim-8.2.3775.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 1fd090b4fc..e0079d3468 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.3690
+VIM_VERSION = 8.2.3775
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
