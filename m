Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFA1C83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 16:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E2D81E49;
	Wed,  9 Jul 2025 16:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F83Xxpoqxvlz; Wed,  9 Jul 2025 16:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECF4E81E7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECF4E81E7E;
	Wed,  9 Jul 2025 16:36:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2512169
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 16:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1625740958
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 16:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWfywQO8GsRC for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 16:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F344440953
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F344440953
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F344440953
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 16:36:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-450ce671a08so290335e9.3
 for <buildroot@buildroot.org>; Wed, 09 Jul 2025 09:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752079011; x=1752683811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uv8fqZdRjoo7eiflbfDiTgkPrnFeJQys7dB/PrSANFE=;
 b=Luso8TFECbGV3JlSB/UD4EaepTYMdru2p4lsjUPXq/xEARczzaXmA5qhnlMTqR6axX
 SbRCnd6Zt/hwPinsB33rIBQMymZzAMynXsdBfE97YwYPpGJ+RdhqFv1F/YOnZwo4voQM
 L1WJ80mFXghxaFVPXU6FiwJDmn0VgVC+HPQUdUuVAxSn23EERnIhwDTLviCSLeO7ZQ+/
 N1rKkP1RtK2OSUdVMug1HdDOwmgv0pE+v0UdXGvA69wZcGCDDY8hNWkbbjspl0MXpNWz
 bCFFSl0e7LfNCF54FoLZwbk/76h7Mlcnawx1PJjUV7+hkP0sgsv4qQAYd8lWJgHXY5FE
 mX5Q==
X-Gm-Message-State: AOJu0YwftnHfxIWedUu+2CHXuGdK0vQYnCxiZJ1RmBjytM2QZAJfUiT8
 v1izAsbZ1N8YKCsw8xrCFkVglycnW1J7cp1OEBV+nN9zSluJuHO0bnyitJw6hJYwXFjq1HZV43i
 ho+gw
X-Gm-Gg: ASbGncvig12nMVzpV0/+L6Sz0swqqtnm6O+5kTTDgmeK8KEjsrXzXvghcRbot8hxPbB
 KLBgoIW5A78ZtDzo7U3WwS3PxRayUHA2LVakebQNlwonGxgsc5GRdJ4McY/IP9Lt0JcQw989sKN
 pF1/R3n41kpzaluDfQ4+S53pJ16iuDyVa2jBhdj4yaG/vPGjOLqgQhRgehdtWDduslf7qJsEypl
 qlZFshHrGlEfClWM5fGPymITXCSlE4lqn3UPxmDQ4o7sW3iGVoOL6on3en7i3Ecldfx+W7t5kQ5
 m4o0fRLxY06k4PoAbDsRpviUJqULQ2cnUP8e+cckQAwHMLe5RimtRb6RgjlDgLtZT4estcGAFYk
 8trlSMhTMRCB5pdKnGA==
X-Google-Smtp-Source: AGHT+IEEBQpZCdSB2Zlo26OifT7Ld7IFTv0GlMrni8T3Y3ku+uUbK5uvb7XUjryYO9Wy5kv4TmLlCQ==
X-Received: by 2002:a05:600c:4e41:b0:445:1984:247d with SMTP id
 5b1f17b1804b1-454d532eecfmr30779665e9.7.1752079010596; 
 Wed, 09 Jul 2025 09:36:50 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d50df5e0sm30762715e9.26.2025.07.09.09.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 09:36:50 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	thomas.perale@mind.be
Date: Wed,  9 Jul 2025 18:36:47 +0200
Message-ID: <20250709163647.115213-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752079011; x=1752683811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uv8fqZdRjoo7eiflbfDiTgkPrnFeJQys7dB/PrSANFE=;
 b=caB5OdKla1RDtck0TilcmS4dLcJC+11iP5R1VoVKamzRHz0SCIto5iWzaVZhYXpCtj
 EJzDSyWZEHDULoXKTpME5SInBwBCf//ASUKOvSOmHVL3IG4QmWWPiyB46f0sQGpM9HKj
 xNpk8VvGXHvPI0uVdByK22lo11K9XpzDkg+t5PBZBCCFW+K1J0hBdvZicqHgorDvd+un
 Twcxmh524OzHPXCCG/DzGSkAsOPUQnvwlvxiDrF68oh+t54T69hs351qoeHCQ/abvqt4
 ZHb8Hy4A6EWyJisdJAgpOclnbYYdsCsb9XJLmNBO1oRtPxN2Yd/tNxTdWpNMjYhgB3Kz
 +LZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=caB5OdKl
Subject: [Buildroot] [PATCH for 2025.05.x] package/git: security bump to
 v2.49.1
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Read the announcement: https://lwn.net/ml/all/xmqq5xg2wrd1.fsf@gitster.g/

This fixes the following vulnerabilities:

- CVE-2025-27613 (Gitk):
   When a user clones an untrusted repository and runs Gitk without
   additional command arguments, any writable file can be created and
   truncated. The option "Support per-file encoding" must have been
   enabled. The operation "Show origin of this line" is affected as
   well, regardless of the option being enabled or not.
   https://www.cve.org/CVERecord?id=CVE-2025-27613

- CVE-2025-27614 (Gitk):
   A Git repository can be crafted in such a way that a user who has
   cloned the repository can be tricked into running any script
   supplied by the attacker by invoking `gitk filename`, where
   `filename` has a particular structure.
   https://www.cve.org/CVERecord?id=CVE-2025-27614

- CVE-2025-46835 (Git GUI):
   When a user clones an untrusted repository and is tricked into
   editing a file located in a maliciously named directory in the
   repository, then Git GUI can create and overwrite any writable
   file.
   https://www.cve.org/CVERecord?id=CVE-2025-46835

- CVE-2025-48384:
   When reading a config value, Git strips any trailing carriage
   return and line feed (CRLF). When writing a config entry, values
   with a trailing CR are not quoted, causing the CR to be lost when
   the config is later read.  When initializing a submodule, if the
   submodule path contains a trailing CR, the altered path is read
   resulting in the submodule being checked out to an incorrect
   location. If a symlink exists that points the altered path to the
   submodule hooks directory, and the submodule contains an executable
   post-checkout hook, the script may be unintentionally executed
   after checkout.
   https://www.cve.org/CVERecord?id=CVE-2025-48384

- CVE-2025-48385:
   When cloning a repository Git knows to optionally fetch a bundle
   advertised by the remote server, which allows the server-side to
   offload parts of the clone to a CDN. The Git client does not
   perform sufficient validation of the advertised bundles, which
   allows the remote side to perform protocol injection.
   This protocol injection can cause the client to write the fetched
   bundle to a location controlled by the adversary. The fetched
   content is fully controlled by the server, which can in the worst
   case lead to arbitrary code execution.
   https://www.cve.org/CVERecord?id=CVE-2025-48385

- CVE-2025-48386:
   The wincred credential helper uses a static buffer (`target`) as a
   unique key for storing and comparing against internal storage. This
   credential helper does not properly bounds check the available
   space remaining in the buffer before appending to it with
   `wcsncat()`, leading to potential buffer overflows.
   https://www.cve.org/CVERecord?id=CVE-2025-48386

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 6235a8aa0a..d965d061c2 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  618190cf590b7e9f6c11f91f23b1d267cd98c3ab33b850416d8758f8b5a85628  git-2.49.0.tar.xz
+sha256  310831de967f1c8c5e8ff55f92807dea89f83dc3d3d2a5d16c209bd01a31def1  git-2.49.1.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 68a0fff65f..0461285664 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.49.0
+GIT_VERSION = 2.49.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
