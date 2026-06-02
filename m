Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F32CD6E5D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 21:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4A91406B1;
	Tue,  2 Jun 2026 21:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OukTsRzONo3x; Tue,  2 Jun 2026 21:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B6C0406E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780434486;
	bh=/6m+bDmsDCh0MkhHDEWfDzvJSSqsv3gJ2apxI+koDcM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Zrz/WKrHhDO1ibOTpzpyqlD3HR2U21Jvs/DYT3wv/ONZoRHM4nekLhBp6XexdauCj
	 8pDnsu0nYeOjUIWftuKEeUAF//2ZGgH8qxkHVnWd19GyxNJ+6XrsTcaxpYMhsOij3M
	 AA14w0NWgsVk1XsRiJJf8D2O7oYdPGrEiUn686GEycwa1jrOfcUMfn2NxSlEKq0R7+
	 pz55koVsSS89QDEJlzLlcw87dCF9NcLHZ3uzXyE9Ra60UCTVVxzgCoiIF5+0pRvtBw
	 PgRqxYcJw6xy5BMwcPhDAXnCxOOcw8Bg9behPD8YIqJ0yjtLbM0LVityLbi5fUfEXI
	 NWu0PbTxKaNTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B6C0406E3;
	Tue,  2 Jun 2026 21:08:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C66FB381
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B855140871
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBAx6SZ_SBmj for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 21:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2956040128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2956040128
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2956040128
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:08:02 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2113590819; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 02 Jun 2026 21:07:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wUWL7-0000000BuDW-3uw1;
 Tue, 02 Jun 2026 23:07:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 23:07:55 +0200
Message-ID: <20260602210756.2837692-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Kz+jfj+zoudZ8BBsy+SeZmg0rIvLbYOFzWsLekwcC9rzrvaeDuDKLje4zWZHTtimQo7mi2IgdjSMyOzV/QYhxEJ9vMrn1+GTnElMNvbjb0uJktrPy8rOc2jBB7t3752yHvrhG558yhLKDqDps08eY/dWKwBHtLQuGnfAk4ZkaCB8COQgMWtkYXGuSQaKe2UfHLeradQK7z719o2Tdrr+65nV/UoeOp3bYPuyx5YeDaR5YEHU2DxTeR6ms0HkLANALfeEkgoeToXiCZI0Ba/ReZ5clumaijxQh8xXjjazK0kPmvaqswfK1Kdwx6/1GRi06e7E/ou7deqAwFTzxRZZWw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=EpJsjreqB4BU/bpzkRVWsWEEPH3qsrZMor0PmRqKtUA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Kz+jfj+z
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/runc: security bump to version 1.3.5
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues (1.3.3):

- CVE-2025-31133: container escape via "masked path" abuse due to mount race
  conditions
  https://github.com/opencontainers/runc/security/advisories/GHSA-9493-h29p-rfm2

- CVE-2025-52565: container escape with malicious config due to /dev/console
  mount and related races
  https://github.com/opencontainers/runc/security/advisories/GHSA-qw9x-cqr3-wc7r

- CVE-2025-52881: container escape and denial of service due to arbitrary
  write gadgets and procfs write redirects
  https://github.com/opencontainers/runc/security/advisories/GHSA-cgrx-mc8f-2prm

In addition, 1.3.4 and 1.3.5 fixes a number of regressions.  For details,
see the release notes:

https://github.com/opencontainers/runc/releases/tag/v1.3.1
https://github.com/opencontainers/runc/releases/tag/v1.3.2
https://github.com/opencontainers/runc/releases/tag/v1.3.3
https://github.com/opencontainers/runc/releases/tag/v1.3.4
https://github.com/opencontainers/runc/releases/tag/v1.3.5

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 76857afb31..d3132b1008 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3262492ce42bea0919ee1a2d000b6f303fd14877295bc38d094876b55fdd448b  runc-1.3.0-go2.tar.gz
+sha256  72620f9b0e62d8da80c0c08a6265ab10d24330c544115c30713ba1429bde706d  runc-1.3.5-go2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index bdff619751..10ff98c9d7 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.3.0
+RUNC_VERSION = 1.3.5
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
