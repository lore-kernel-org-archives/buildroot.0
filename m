Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD17CEE33B
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 18:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4753440526;
	Wed,  9 Oct 2024 18:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0QPTP7Bb2YT; Wed,  9 Oct 2024 18:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00AD340730
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00AD340730;
	Wed,  9 Oct 2024 18:02:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58C921BF3E8
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 490E9812E5
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NezPyyHPYkh2 for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 18:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A608812DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A608812DD
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A608812DD
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 18:02:24 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a394418442so665985ab.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 11:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728496943; x=1729101743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=To6XDgHO3+n86uznibN6ozJ2P+aa62mQr6gyUnBi4TU=;
 b=Yu7Fdq4+Rc0v9qC3QqJ+81kR9rUa32oSn1B4ti2nkQUbkJ8dkqv8IDj/HMRdexiQqG
 dJfqYTzlkd0dfOeFP4/38R1gCGqFrwoKNfn+1S9Vc0FGNPeBlhhlTFxSSP2c/c7N1u0s
 rFapdyE8UhyxgllYwNmod3zW1SczxPiNkBq7thUAAXxrNUlw3qqpA+t7RL8i+ucR6RRI
 1OBnKO2+oNmHqhJXCoqsXhfAGS2yecyxtwD/ZNpQ02LCAhuVH92PuOwX9qfO8PNhn1wm
 IPi89h6cSjeGQXyehyVb/JogXD7BAZgT9M3Z5EqhuD8Niex1s8KcV7RsljJ+F0siPyZU
 1T0w==
X-Gm-Message-State: AOJu0Yyoy6sbmXRpvdO9ID8Rm22WToS5WLp7yqfFWLXKnZAeinuU8bvq
 aTPocPw04wHwGNqJQtDfZ+ta9f45lz5oSu4LKqIF/tNvR3yV4eoSH9X0vH7d
X-Google-Smtp-Source: AGHT+IEh7NlmrGb7xq54cUF5xWjSuzlDPPvcPl1i0d67kGnGc04KFpo3Z3dbvjjpFg6gyxs+rJjJ7A==
X-Received: by 2002:a05:6e02:20c3:b0:3a0:378a:884b with SMTP id
 e9e14a558f8ab-3a397ce85a8mr28522995ab.3.1728496942723; 
 Wed, 09 Oct 2024 11:02:22 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db73da60e8sm1968816173.96.2024.10.09.11.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 11:02:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 12:02:21 -0600
Message-Id: <20241009180221.3871117-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728496943; x=1729101743; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=To6XDgHO3+n86uznibN6ozJ2P+aa62mQr6gyUnBi4TU=;
 b=cODv790oMa0SJrFTRaZm6V/zAAy9yP8gdQ5lNvLer2TIl9r9A0rndRgEJ1X6AXKyrv
 Xeif56f2tBLS0gKwvb7y7MxInTkFIdZ2oQiXqdBr8BbNodolAgwNxtJ2s8+7IBA2Ycap
 TIxv1Zsp0F8/Buh5WsYqrmrn74TGEKA1ueaMQZU0bQLQz5VaJcoNCA+MGzTgkjjT7hQh
 Jsi4MlaIybjnfTU6yonS1NJz3UPG9p9PtFulcu3E2JFMUI1IuWO+oEUSeeqOtw/W9Vf5
 cftwz2OCYYBQ/FC1CzBZqYzVjV6Gbd5rlh/4Vk8x54t+URzK6ScfTaBlB4Qw1x8WzWhz
 Cihg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cODv790o
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.10.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index 2926a5d326..fbaa515863 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  d92da96159f470af8a15da8ddef1975e  setuptools_rust-1.10.1.tar.gz
-sha256  d79035fc54cdf9342e9edf4b009491ecab06c3a652b37c3c137c7ba85547d3e6  setuptools_rust-1.10.1.tar.gz
+md5  755ce9ab3d5e7b9f420992ca891a3965  setuptools_rust-1.10.2.tar.gz
+sha256  5d73e7eee5f87a6417285b617c97088a7c20d1a70fcea60e3bdc94ff567c29dc  setuptools_rust-1.10.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 3520d76052..ab1023ea4a 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.10.1
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.10.2
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools_rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/b8/86/4f34594f21f529623b8650fe729548e3a2ad6c9ad81583391f03f74dd11a
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/d3/6b/99a1588d826ceb108694ba00f78bc6afda10ed5d72d550ae8f256af1f7b4
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
