Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E44AEC142D
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 11:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 358E161099;
	Tue,  3 Mar 2026 11:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzUit4V9dY83; Tue,  3 Mar 2026 11:04:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20F8F6137E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772535892;
	bh=a3itFG77EP5jcEBg0Q8mFG+vRVhm4h1zIENhizNrl5I=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=CVLXo7S9NyrSKHjx+/sU78ALLoL9YKgBk3MCQZG8PCz2jnn2MeeWz3cW7sUIctv9H
	 hOrnOUmWH99Ypj998YxhqzyfWhsgSISTILaV6YCKJoid+9ZnehlKzG+xaLwzzd3Uvb
	 DOldvXOdXGt8FHTymQ6BGNUIdzA48KLq5joqzsTQ1RhonzYcv/cUiWiXvQVY9kyrtK
	 TJTMaKTGsumVRAUNDZd1y2mzug44hjqhC3jrnZ5QExwdMmPzSjxB2DFdzZo9TaEO0L
	 mdPrQl3eV6Mmbad8ug32Q9m0ZiW4vRBJz5H0PCAhSzFDNdZ7OUEhen2ZQHFv6kUzci
	 K2+xufpjG+csg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20F8F6137E;
	Tue,  3 Mar 2026 11:04:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C6D3231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 11:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79AAC83D4C
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 11:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hPTx8wjlhdK for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 11:04:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 57DB983D3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57DB983D3C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57DB983D3C
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 11:04:48 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so33487525e9.0
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 03:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772535887; x=1773140687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eosQhkG0bkrh8Ix13c7Z0lYtc+ARNb8UoO+Sbz9Rq1g=;
 b=LQNjhOljlxDKqwHACG/Suiau4Am5+qqyt6sOzsSAWmB1felT+vTtRlqJF84Nl2NzP1
 kWEStXDkGoqstudQg7C9+qK6Y7sRD0UwnSY6sb/5Q8CuGtpPsJqYcKQzbw3YfZzvpRXx
 iLk9+nfsrXSku469910zX/SNHQsaJSXYhPwSmj7y07wY7Ly+ouBqssUL6OmFv11AWGUM
 2bD5tkZ/EySwKYoHHFv9rn2jEV+imbw7jBHmWj1lhxUcYVzBqLt746v5zD5h9AR1gBiF
 wSsjixEIIo4jt7T/6f3keIA4E/h40m8g8Kx+v/Zga/grVf5hZf9KU6YFlB01fva1Wu7d
 tDfg==
X-Gm-Message-State: AOJu0YxWvRH+2Jrj3ozbS18/sdHHPgjssj4UoZUeZ3xAVFkCcXf1HKoS
 lSGp3dnBugrb52BOesk6lb8WktszGQ9of9vRoTESbzng8triN3KXpnvdRiokrbK4fypNmZfdQDk
 Wexuu
X-Gm-Gg: ATEYQzwsFK9TN6tLW1jfdOYam4YgozyYb2AxM+TgosB3UnLUho6XS4Ykvigjb8q+ple
 re+waDQHClY50nENAyyTxwDAhUWeruS47mLYMRiEKe7YicnFikS7XCheKjVQSYOp56JnIiPJomX
 M7LG/Oshm2CxkyyCf2BlFqg/P/U1sl0HICBu4gIrKdQIV41PZ0UYkPkpLGUfO8HgtNMvGPhvxLp
 lkx0v5DpyBj8tYnHAdVHIBA3onD4dhk3EY21tXBARu5bBzW9IhcTNKF/SIb9kJmrSchHpU/p6wR
 OrjP+ilZ80am7mz7wSDvAAbcIu+LSoo4BeFH8omUA+IyZZ68ZXjLIQ5k47diCX2k0iFAffcN4XJ
 SPBCi6icvydswy+JyIzrnr9B9DmcV3Vcvr/8ZVXtvJ7GVQ3MFneBgHFE28plkHmGYduBdI/U2d+
 CdYipdxH5JXSujUlo=
X-Received: by 2002:a05:600c:6217:b0:476:d494:41d2 with SMTP id
 5b1f17b1804b1-483c9bc5c06mr266347075e9.29.1772535886696; 
 Tue, 03 Mar 2026 03:04:46 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135b6900sm13056435e9.22.2026.03.03.03.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 03:04:46 -0800 (PST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  3 Mar 2026 12:04:45 +0100
Message-ID: <20260303110445.306426-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772535887; x=1773140687; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eosQhkG0bkrh8Ix13c7Z0lYtc+ARNb8UoO+Sbz9Rq1g=;
 b=Y5KKfi/i9IRpwaF/+Peous787maqp8OvBE6d3Kc0pw5Etfrgxr/mcom0IQd89ONRAI
 CSWsbOIWWqj6MYLGKy9/t0gwTg0ZVR5RNIa483P5DpbOLs0HRDZUPGhXUaZ8CRfW8Mup
 GEwmCqZFDiu/l/JCtyreUckD5cAHaGS7rZgKM81dnIFOYrsLNKx6U9wk+R2s+589wOux
 CyOgykiC5NDhlISsQTIIC/B5FemZutlCc+mz2vMS+6PxhHZ2neURa8fLrDsOj3h8kG6W
 6DcduH7bvQxombTgGJVVRM1AFFScDTermMoA62O6gFt8U9O9qLSIHPwr6lURmj8Bh5kk
 SoBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y5KKfi/i
Subject: [Buildroot] [PATCH] package/vim: security bump to v9.1.2148
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For changes, see:

  - https://github.com/vim/vim/compare/v9.1.2017...v9.1.2148

Fixes the following vulnerabilities:

- CVE-2026-25749:
    Vim is an open source, command line text editor. Prior to version
    9.1.2132, a heap buffer overflow vulnerability exists in Vim's tag
    file resolution logic when processing the 'helpfile' option. The
    vulnerability is located in the get_tagfname() function in src/tag.c.
    When processing help file tags, Vim copies the user-controlled
    'helpfile' option value into a fixed-size heap buffer of MAXPATHL + 1
    bytes (typically 4097 bytes) using an unsafe STRCPY() operation
    without any bounds checking. This issue has been patched in version
    9.1.2132.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-25749
  - https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9

- CVE-2026-26269:
    Vim is an open source, command line text editor. Prior to 9.1.2148, a
    stack buffer overflow vulnerability exists in Vim's NetBeans
    integration when processing the specialKeys command, affecting Vim
    builds that enable and use the NetBeans feature. The Stack buffer
    overflow exists in special_keys() (in src/netbeans.c). The while
    (*tok) loop writes two bytes per iteration into a 64-byte stack buffer
    (keybuf) with no bounds check. A malicious NetBeans server can
    overflow keybuf with a single specialKeys command. The issue has been
    fixed as of Vim patch v9.1.2148.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-26269
  - https://github.com/vim/vim/commit/c5f312aad8e4179e437f81ad39a860cd0ef11970

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...src-Makefile-create-links-with-ln-sf.patch | 78 -------------------
 package/vim/vim.hash                          |  2 +-
 package/vim/vim.mk                            |  2 +-
 3 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 package/vim/0001-src-Makefile-create-links-with-ln-sf.patch

diff --git a/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch b/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch
deleted file mode 100644
index 54d423aacf..0000000000
--- a/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 5686ef63f81fcac2ca6ec6e7160829b295ad4e79 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 28 Dec 2025 15:01:38 +0100
-Subject: [PATCH] src/Makefile: create links with ln -sf
-
-Running "make installlinks" twice towards the same destination
-directory will fail, as symlink will already exist. This is not really
-expected as "make install" is normally expected to work again and
-again towards the same destination directory.
-
-Fix this by using ln -sf.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/vim/vim/commit/6df5360691266b5eca49380e94f3e21fa48e5e0b
----
- src/Makefile | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 6fb1eb95e..39f798260 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -2746,40 +2746,40 @@ installvimdiff: $(DEST_BIN)/$(VIMDIFFTARGET)
- installgvimdiff: $(DEST_BIN)/$(GVIMDIFFTARGET)
- 
- $(DEST_BIN)/$(EXTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EXTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EXTARGET)
- 
- $(DEST_BIN)/$(VIEWTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(VIEWTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(VIEWTARGET)
- 
- $(DEST_BIN)/$(GVIMTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIMTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIMTARGET)
- 
- $(DEST_BIN)/$(GVIEWTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIEWTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIEWTARGET)
- 
- $(DEST_BIN)/$(RVIMTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RVIMTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RVIMTARGET)
- 
- $(DEST_BIN)/$(RVIEWTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RVIEWTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RVIEWTARGET)
- 
- $(DEST_BIN)/$(RGVIMTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RGVIMTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RGVIMTARGET)
- 
- $(DEST_BIN)/$(RGVIEWTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RGVIEWTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RGVIEWTARGET)
- 
- $(DEST_BIN)/$(VIMDIFFTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(VIMDIFFTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(VIMDIFFTARGET)
- 
- $(DEST_BIN)/$(GVIMDIFFTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIMDIFFTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIMDIFFTARGET)
- 
- $(DEST_BIN)/$(EVIMTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EVIMTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EVIMTARGET)
- 
- $(DEST_BIN)/$(EVIEWTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EVIEWTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EVIEWTARGET)
- 
- # Create links for the manual pages with various names to vim.	This is only
- # done when the links (or manpages with the same name) don't exist yet.
--- 
-2.52.0
-
diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index f7c883b929..ecc41be702 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  be1d60091d27bbdbc090e0bb19798baeea378aa29645fd47dc4c222dc14efcaf  vim-9.1.2017.tar.gz
+sha256  f9ec31df8f1a78e130dd06c395e6626c2a8a8ec2705d8e7b7667bd3ecd499c6b  vim-9.1.2148.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
 sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index fa7d47d67d..9201587a8a 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.2017
+VIM_VERSION = 9.1.2148
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
