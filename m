Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C74C83F03
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 16:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EA7D6073B;
	Wed,  9 Jul 2025 16:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLYGl6cYpgbq; Wed,  9 Jul 2025 16:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68B1D6075B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68B1D6075B;
	Wed,  9 Jul 2025 16:37:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24A1C69
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 16:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1329181E80
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 16:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Y8w5SLfSJAb for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 16:36:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8CB681E3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8CB681E3F
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8CB681E3F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 16:36:55 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso416365e9.2
 for <buildroot@buildroot.org>; Wed, 09 Jul 2025 09:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752079013; x=1752683813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/aflpuS+cF5amaeCbeo1RCQsthbiMfB7uAzVW/ErQFA=;
 b=clheIIyXSVL386toWofwKUQesdWxkNtbdrTuxxmVQsYuIDgPn+Rj33hiptyN0soNtO
 cvrBvd6lQt1pygqXjLimy0Jc6K9g8H10F+3+3Tun+iykbjez+yKIoRfbrRqlWAE2guQa
 YPc8ex6r1DdLLAMqvt7iVV4yexqra+cQI3ukLnXJDtpD8qln3MehEwNYbUkCthgQeaAd
 427lvW1noHsE54KogQNYWlFp9/4dvA3tlNpYyz8qt0qj6MarPdUjzXDVaYYMRfIuntcz
 NbdLy8tMTxAkyQ78vvIVdlAvyLU2vW/pxwrmS28UdKxKnYlw4/3hN5S//TAbA/z4AaXS
 DeWQ==
X-Gm-Message-State: AOJu0YzEuqq4nwvibsglRqFNOQymkDCCE4y41Ps2gWglq8yvha3D98fd
 GV6fVvwMbjA1qrosro1TRVlEnpjFLf1LOK5kN3EGmLIsh6GVwskrVY470v9YMnbXZ4rbhKRO1Cu
 4sr7J
X-Gm-Gg: ASbGnctwRDKEOViQrovcz0Ob4EkxwnD+cR2VsrY/SGhbz2Acogel7Gx4H7UEIwWSchs
 aOWcgQJfe/kL+IVwxB063I4DFROIPFJIS8xrIacAHJ1otT5y9DJxPmeVUwigN8OE5KdJlzUgpR6
 sqYkivYXYXBr9GbVXb5EMvFScA4JSsYi6sgZtJj8/gmn69Ue+twPAUl442m4kyvSWIJjfyzOpgk
 UpHM3zX7E5D9CsvQ4sEjI+MeEShAt0VctBvRykm1DXTUpvTQA+6q8nMPwL628NfvIewY7DHJkwv
 5Yfwq0lr/mWvdwStsxNMNesPReAXSKWDi0VZrRZi2uu5LCfSA1BrxK8D0945yBeV8Gz+/sd5/4s
 SFZTeR0fgetSeONPQ2w==
X-Google-Smtp-Source: AGHT+IFaup82AgWHwY2Peq6GeOuS6Vz7IFexx3xawK7aGrHgXMKkAQ2ukQWnofhkw3eLfGqMOBr3Xg==
X-Received: by 2002:a05:600c:4f4d:b0:442:faa3:fadb with SMTP id
 5b1f17b1804b1-454d5c8d41emr29734765e9.2.1752079013399; 
 Wed, 09 Jul 2025 09:36:53 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d68fc1basm24461675e9.10.2025.07.09.09.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 09:36:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	thomas.perale@mind.be
Date: Wed,  9 Jul 2025 18:36:50 +0200
Message-ID: <20250709163650.115228-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752079013; x=1752683813; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/aflpuS+cF5amaeCbeo1RCQsthbiMfB7uAzVW/ErQFA=;
 b=VfC9rrLnDD1JJcVf3m6CX2GgWwTJL1IxDF/ZBr93qIfDhM7UJL5E7qfrG3E5TJ9YY6
 cn1N5ojaOx8pkNFGYN2xVY9AuWnyxTPPprEiZgAuYfbwWlLMt78dBByMVtc2hcY0MTw4
 vjyypGTWPqZVtNXa9uslp23jtpG/v9HWElb9RE7iB1bmt5aV9gvIXsWlxOee6Pxuv+Jh
 H16rDg05hVkC+Ndfz0fODj2Q0UD0Hnvt98NhyXaOjhRTqASZvjB1xqYZAIVzfLfFC5e4
 79QB28emJ6KLhcYOhkfCSMpn9eQqnB1WIrk1U7fHLAO25RuUlefsv6UrV5z767xvEr9Z
 dPaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VfC9rrLn
Subject: [Buildroot] [PATCH] package/git: security bump to v2.50.1
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
index b20fe2de0e..bbd2b4c754 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  dff3c000e400ace3a63b8a6f8b3b76b88ecfdffd4504a04aba4248372cdec045  git-2.50.0.tar.xz
+sha256  7e3e6c36decbd8f1eedd14d42db6674be03671c2204864befa2a41756c5c8fc4  git-2.50.1.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 560590b33b..8cbd2787b2 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.50.0
+GIT_VERSION = 2.50.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
