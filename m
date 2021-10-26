Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BCCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 16:32:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08C8C6058D
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 16:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08C8C6058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C639740231;
	Tue, 26 Oct 2021 16:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zUtKzWEHBc85; Tue, 26 Oct 2021 16:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11AF340176;
	Tue, 26 Oct 2021 16:32:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15E631BF4D5
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 16:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04A7381836
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 16:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGols-2vvNsb for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 16:32:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D614281826
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 16:32:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 j35-20020a05600c1c2300b0032caeca81b7so1433390wms.0
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pr6utY/iUz7UsAQ41p3HndK27hboQ7pcDZdoQsAfHZg=;
 b=SSIOtBQ+lfsE2tyLfoazjYVTD2822Alt7/Nc2hq1aaodqkDr3H7lyIC+Bm9I3AEM6j
 hyvpEpTJkvGHk6pBJGvDlcN1kMvlTl8X7ORssOFaYoA5hbcTmA730unrKOGg1itQJRJf
 CTV5jtXP82dmwXOP+b5xFrdGy11sQTZwL4OsG+L3b+ZOaKE+NKXgrITK1CIkqKWwRlg6
 1P83FO/ellS0D0FBnAwbN3nV/Al893VbLLZmij1qvWWy7De2VdgToJxq2qrVmn148FOr
 ureyrUoTqmxUdk7DSZimCtnE/jG2GoFio6vSYZE1a5WqXJM9bqA0OhuhP+Y6QvfQeFtp
 KSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pr6utY/iUz7UsAQ41p3HndK27hboQ7pcDZdoQsAfHZg=;
 b=3mEskWPvjC838sb4uie1CXh92XcXFpBisABl5wL8P0/vYZNw1ZpaF7cFPJPUyZi/e6
 TKOBvfdfwfWNENZ6vBJF9mica/ZaYOtUm1R8tDNGSbrIgVu7ru00SvdsFKkoBdFvQ3K5
 asDCZ0ZtTYxoLm9mq5EjWvFjVbAbUmj5mNbNQLcm9dKM3olSd4Om4QZWs8EgSgcUb5c7
 ymAKvvctAn06Nvc1g3EiPtW8Anj96J2HmzpnUDNs5edJr1PHdIco7Dbt9G/8dY39WS52
 zAyg6GAAPms6IUmb5wpdog0k1W6n53Dbusy9SX3TRtmT925Y5RW/u4LHW/NvuBaPzUm3
 rRVg==
X-Gm-Message-State: AOAM530uASb7pjCRu2uJ/n7gkrBueoE0clR2yDBH06pmdOJGhX3zUIWr
 d52O5Oawa066uAxRGWk7Wf3kzW1+bGs=
X-Google-Smtp-Source: ABdhPJwr4lvkl+rl5zJTSb0R4Ss0Pg/ivGfdK83zNyv7G9l/7y4cNuUdtV6nTts+0PZo/uaXjK9LmA==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr22038026wmf.80.1635265940725; 
 Tue, 26 Oct 2021 09:32:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id o26sm1027404wmc.17.2021.10.26.09.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:32:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 18:30:27 +0200
Message-Id: <20211026163027.3852789-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211026163027.3852789-1-fontaine.fabrice@gmail.com>
References: <20211026163027.3852789-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/vim: security bump to version
 8.2.3565
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

Fix CVE-2021-3872: vim is vulnerable to Heap-based Buffer Overflow
Fix CVE-2021-3875: vim is vulnerable to Heap-based Buffer Overflow

https://github.com/vim/vim/compare/v8.2.3432...v8.2.3565

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 8dad275f49..bbe65c4dda 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  12cce47b81e12779b7d58faf879633be1b668f54a5417a5a24adac50413b3b3c  vim-8.2.3432.tar.gz
+sha256  ac2264c45684218232ec49a6ae8b88b9a68312b664b93b811868d24c39d8dc11  vim-8.2.3565.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index a94dab4bd7..960759aab4 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.3432
+VIM_VERSION = 8.2.3565
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
