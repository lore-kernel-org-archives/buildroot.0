Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7022E6F075
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 18:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F72605EA;
	Fri,  1 Nov 2024 18:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_LciVVXVYve; Fri,  1 Nov 2024 18:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AED6605EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AED6605EF;
	Fri,  1 Nov 2024 18:06:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CCED979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A106402E5
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WB40ZIIB7oC7 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 18:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C705402EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C705402EF
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C705402EF
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:06:39 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a6adaee7acso5864135ab.0
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 11:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730484398; x=1731089198;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pDdQP70mUP6JSo4xOhhkza4J+U5940P7A4sJ8WIYAaI=;
 b=ELlf/PDm7lDBENjinY0ustwiMOTD6TC688vynKXtcvNLLgEKiJ/IBhCLJKA4sIlUlY
 QZK1+OUZCe4Y1DfoD1WYlqCh7uXqeuubQTCzNXC/+LWdRXbQ04Vrtp801guH1FsL8QOY
 axFs2SuSKwHoCQlnOTpTOuRDHBd/ztesCkrD9fxDmog6KdI0c8x1eAEq2rD5sl80wczp
 NzFUiQNkYWi7JKqIfyrPDlZTlpU0IZQb6grT8ggqdGNIi3rOaqqmzkt1mxbPq+RLjXEQ
 tsvOS31uS1OsM4umLE4MO4Ix04w39wLU4lh8kgMgPbWna8Xap8vzT7jOe1NHbplTTGT4
 cBwQ==
X-Gm-Message-State: AOJu0YwZ8S/JSC2YbDsbH+hSkH3HUHn2aH3cpDvQHuukkpZ5snWGYUCu
 oWEFOPbV/c3kBrFW7haRR08CnG7dXPFzBfH/fENG8/4fwxZP7wqKAIsEVQ==
X-Google-Smtp-Source: AGHT+IF1+DGlxgGhm523hDTDOy+XdrQhPPkgUywL7FWn2ajGhzJqYps2CEcVW0nLZI9a01PlSt7icg==
X-Received: by 2002:a05:6e02:11b3:b0:3a6:abc2:7388 with SMTP id
 e9e14a558f8ab-3a6abc27846mr48426405ab.16.1730484397990; 
 Fri, 01 Nov 2024 11:06:37 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a99cc4c9sm9559785ab.46.2024.11.01.11.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 11:06:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 12:06:35 -0600
Message-Id: <20241101180635.1028681-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730484398; x=1731089198; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pDdQP70mUP6JSo4xOhhkza4J+U5940P7A4sJ8WIYAaI=;
 b=CzXTUI9scTVbgqXgrza706BGsibB34L9VMtgclVzYGCjdYy3e3aF33ctVbHm19ZAef
 7MvTZvWSELWohI/k2ZmbLbB+0YpbmwU8PII8FXQ7E6jzVg4x3Pr9Hb89xpds6woiV9vW
 4acfJVBfGQ1hUE4eMDUnUbJ348Oi0h2NZ57PPwJCwqu0T2KeYPYps8m7dBRM/41k5j5o
 JGZyAl6sG3ZD2Ruaas3O5QhMuxWQA6D2kD/U7/BTtUYM596ZA6JtFVYI8KlwBxR7TuUD
 ruyEJ22TEh498s+XZvguCo6H+yR9eIo2SppyL3v+yhgwOzGt8wI3LtWVhv5VnwXEe0Mk
 oHJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CzXTUI9s
Subject: [Buildroot] [PATCH 1/1] package/swig: bump to version 4.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swig/swig.hash | 2 +-
 package/swig/swig.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 21590c422a..9c1dbcc2fc 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b  swig-4.1.1.tar.gz
+sha256  f7203ef796f61af986c70c05816236cbd0d31b7aa9631e5ab53020ab7804aa9e  swig-4.3.0.tar.gz
 sha256  f53abaeed775018d519a1b9615f0ca17894772bd9ca21c2a156bf340ac41c13e  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-GPL
 sha256  7f50d942373a871211c5efee03f3db2f9efd1cff1002b0ef8e3748baa611a5c2  LICENSE-UNIVERSITIES
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index ad585c3f97..7e84bdd431 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SWIG_VERSION_MAJOR = 4.1
-SWIG_VERSION = $(SWIG_VERSION_MAJOR).1
+SWIG_VERSION_MAJOR = 4.3
+SWIG_VERSION = $(SWIG_VERSION_MAJOR).0
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 HOST_SWIG_DEPENDENCIES = host-bison host-pcre2
 HOST_SWIG_CONF_OPTS = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
