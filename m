Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC099CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CD8560887;
	Sun,  7 Apr 2024 12:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHXGvn75YgLC; Sun,  7 Apr 2024 12:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FF0B60899
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FF0B60899;
	Sun,  7 Apr 2024 12:45:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8787E1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EE5C407E0
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qH294-Z8sqEH for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:45:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F55D407E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F55D407E2
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F55D407E2
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:45:55 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4155819f710so27407655e9.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 05:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712493954; x=1713098754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=giPKX4SgkvgmWbVmO3gXMIcAG4OyGKe+m24RsZDgfO0=;
 b=jb3WM+ykDI+hCauDKRzoaAgzKhmev6K2QQLaFK3J6hjVPcHXntINFYCJcHjNSuh2Te
 vU3O+jHp+nC7qZIB6THhUMFnJwyTLs6bvger0MaB9+PPScuII/IhHqwRDZ3oadsgt2Iz
 pjpUPrk0x+ltGL2ahFVLeKiEZpbFKtL0M6xE+KzT0Eih/xj0PFFYlahH/ay8oCwCWmFn
 2OSdARC/nearWXV1mvmnEsqvuk6wxWjNUkookZ8SASvLqn73c/7RrKwURp+MDf8Ah98i
 Y4G5J4e4xnF73jxLkn8GxSZ7Y59VC9xIrGpQBKWOk2Phc7Dx1swmACBoyk183FpgNjQN
 FChQ==
X-Gm-Message-State: AOJu0YwFIl93IJg68JvOAJSnF548uMlNWNCs/77xLyJuyy3zX9Yk5h2O
 aBRWvVd5DXoKJFF+KGDtwhJAOMlQEMvhhI9FMhyRqIS2DhKF5UgELz/Pypia
X-Google-Smtp-Source: AGHT+IEsUaCe3V6Bo7PXlq3ITjY5W/aP1ViLb3erlO7t1O3Hr8zMNrgfS5TDv3mkMfAICnE57CX4Ng==
X-Received: by 2002:a05:600c:3551:b0:416:6344:895c with SMTP id
 i17-20020a05600c355100b004166344895cmr813469wmq.32.1712493953583; 
 Sun, 07 Apr 2024 05:45:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a9-20020adfed09000000b00343d33ac824sm6631252wro.78.2024.04.07.05.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 05:45:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 14:45:50 +0200
Message-ID: <20240407124550.1282517-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712493954; x=1713098754; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=giPKX4SgkvgmWbVmO3gXMIcAG4OyGKe+m24RsZDgfO0=;
 b=QRraR2S9EwT7xoK3uphyOGsqHkZbQ2cexujiTSDSnGMHVi3+uj2NCtza8ey8HiH/7t
 vDFqEs+49ox0qGtQSTG9rhMcQCKiDK7tjIOzVizuTyRuFGSOIuOpZtD8JRrLRaRaf3p/
 sxJ0qCwqRedDlzXg9xKjI5sOL/YRy+RJQVsyfeVlHJ+ooda03UEaW+NujaJqG+NlN6wv
 gTsU7buidfgNNOfFLYNmXEVxY5cGAZhUALVxJ9zcZRgskJfpxdIt0AaSGIaFgpKt9fId
 GuVDVSDEm6bjmPLDFxHfX4WlnQBzXQwtRkkaH7ygzUztQxCUDeULoLZujR1KKnX/m67C
 Qn+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QRraR2S9
Subject: [Buildroot] [PATCH 1/1] package/perl-net-ssleay: bump to version
 1.94
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

This bump will fix the following build failure with libressl raised
since commit 9d8f9c73a2fd087dd2e8d8853a80da605fa64e4b:

SSLeay.c: In function 'XS_Net__SSLeay_X509_policy_tree_free':
SSLeay.c:17730:9: error: unknown type name 'X509_POLICY_TREE'
17730 |         X509_POLICY_TREE *      tree = INT2PTR(X509_POLICY_TREE *,SvIV(ST(0)))
      |         ^~~~~~~~~~~~~~~~

https://metacpan.org/dist/Net-SSLeay/changes

Fixes: 9d8f9c73a2fd087dd2e8d8853a80da605fa64e4b
 - http://autobuild.buildroot.org/results/974b7cdd275249c888fc6205f6ca31a3cf28b18f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/perl-net-ssleay/perl-net-ssleay.hash | 4 ++--
 package/perl-net-ssleay/perl-net-ssleay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index 9caff68edd..219edd4e0f 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  c73821e9790b3bdb3471d9b8faf48bbb  Net-SSLeay-1.93_01.tar.gz
-sha256  876d022fbc719631b11d6bb4b6e78db3c19bbca578093c376c8f9900a4432aa3  Net-SSLeay-1.93_01.tar.gz
+md5  1b22c764e5a094c6261e37a4b1f148ce  Net-SSLeay-1.94.tar.gz
+sha256  9d7be8a56d1bedda05c425306cc504ba134307e0c09bda4a788c98744ebcd95d  Net-SSLeay-1.94.tar.gz
 
 # computed by scancpan
 sha256  685e534b60d4e2b4fbb1a259a83b5a86e877a919bbb9efc95994276f706a3a71  LICENSE
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 8b7b2b973b..7f58093082 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.93_01
+PERL_NET_SSLEAY_VERSION = 1.94
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHRISN
 PERL_NET_SSLEAY_DEPENDENCIES = openssl
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
