Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF0FC83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 16:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0B7381EDE;
	Wed,  9 Jul 2025 16:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnU48ZzBl5Ve; Wed,  9 Jul 2025 16:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDE5781E3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE5781E3F;
	Wed,  9 Jul 2025 16:36:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE87A15F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 16:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A042C81E3F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 16:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6P56e_LDcYJ for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 16:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C17781E3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C17781E3E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C17781E3E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 16:36:49 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-453634d8609so312085e9.3
 for <buildroot@buildroot.org>; Wed, 09 Jul 2025 09:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752079008; x=1752683808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8bTRywLUi+aq0mIxp+AdejzxPeKCAvJ+PG5v2SkDQp8=;
 b=d59VTbuPGU3JNS5wU04HmldwnEnEOVLND1XuIz86h6uIpELi1ytL9CJZ0fNVAIaj4+
 DnUfWb9kAuF1EhzL52P0wj1H34f5lMpnlnV6+hcDfi4GucsZoYKQ+DV9EAHh+tw1UpYh
 yRVE0dBDJD6NW9QEr39FgFfyyZl17S0BV6rTAWkRft1G0IUa0/US0TIAHpagnTB1W/vd
 YLTlhDdKZd4iCRlxKBTUmn0xVjmZKNHUiY4DJ3kFXLB/VExUPF8BuUsG993uC/CeNV+w
 kWNYb1KiO85dx8H4myynQH/TuxyoNcnREMar/8tLRHkM3FevZsRXrWsi3UMK+wiwPf4k
 OgNA==
X-Gm-Message-State: AOJu0Yw/4BPxi4tka8KAQLr3XMGF1Cp+Nijd3C8VMRhyLOUW6G631d/8
 wcXnrawTJOPaI2AZqm+PuW5QRoPQnOh2k0XYniPy+B1fy7WsEJWq1NVUeYg/6glS5OHxq2Qo504
 xPjVI
X-Gm-Gg: ASbGncvgKMRjFUm8qQ7Y/yDXJST6ZC0EuKwtAlAqL9cgrfw4QVVXaDFjYMG4n2GR5zk
 PoOchvpbWi0FLM3sWSAy5gH8axiX5jBdgEYDgOnV2mbWCy1VdHn5xtaA0HVJsrUMULsipxeri3o
 ejrQz632u5ryQf3FtkRBWldQDMkPg4erlJyTfA6oDZ8MIUfNIs8WnqsadfRKVWqClKVMgnTr65t
 30jvEZY2qXu1f9HttLdCQKyQmwwvj98xy3+Pz32sWZPKy54RthAkDaJsAAyIuYHW4ydax945n/F
 GzbnWb9r84s0ngXmNnKz2EBetVWOKeQWy6rhKZN3jJu35VxFiEf6vyoJgDHsM7FnebBExqDmUlm
 XG79/jcvyfsOVKILEOQ==
X-Google-Smtp-Source: AGHT+IE7zcM4rRJUK4YhRXA9DCFONtVctlH377SUqQ/+zlNuzbBgakUhc8FULamlwT1SoPC2wKoBiQ==
X-Received: by 2002:a05:600c:358a:b0:450:d00d:cc with SMTP id
 5b1f17b1804b1-454dab9e5b2mr10155635e9.2.1752079007644; 
 Wed, 09 Jul 2025 09:36:47 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5032e17sm36911795e9.5.2025.07.09.09.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 09:36:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	thomas.perale@mind.be
Date: Wed,  9 Jul 2025 18:36:24 +0200
Message-ID: <20250709163624.115141-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752079008; x=1752683808; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8bTRywLUi+aq0mIxp+AdejzxPeKCAvJ+PG5v2SkDQp8=;
 b=OEhuAwjvI7nlmqHxY3dLXTHBg9Nj3VzYBY8JjKr7PV6TrxfhEQRXa6YHzFdtrCv4S2
 Ov/BllHlc7cxtD4GGS86si1PabPZLmwOe44bett3/9qe7rRfCaTkPtQMeyhDmCcERVlZ
 Ds9NTkKXhKnww/sXRhrTEgr581Z5PPh8NrCYZoiMCNY2YIRyQgbsZW3VzqhlvZBGlLVo
 3CNG/2v0Myl1UtD0VLWIalv3iUbBvK9nZ6GLUGyhDN6fFoIezteRx8WgokDFNh7zyicn
 wWGwdm5Q/nlY9F8AR8KAxzHRBn5Yi/RHBJihkYNQRpVQg4lbulPqt4Tgm+URLvfJQyVt
 usIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OEhuAwjv
Subject: [Buildroot] [PATCH for 2025.02.x] package/git: security bump to
 v2.48.2
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
index 7608cbe176..24286a8705 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  1c5d545f5dc1eb51e95d2c50d98fdf88b1a36ba1fa30e9ae5d5385c6024f82ad  git-2.48.1.tar.xz
+sha256  30ce5660fc6be0453ab0e15ba3f2b69f2325cde0bb447ad2ee1b559f2999e494  git-2.48.2.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index de3103f4ff..18d768e900 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.48.1
+GIT_VERSION = 2.48.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
