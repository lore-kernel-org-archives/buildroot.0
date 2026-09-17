Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A86C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44E3B80EC6;
	Thu, 17 Sep 2026 07:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfeE1UKxcu_m; Thu, 17 Sep 2026 07:44:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 53C8680EC8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631099;
	b=MYUYqALq8apo56j/khi9qJ3CEX536cjUHrHoZULUJ7ZW797UxLbb8PAHTzKVUGc6hO2Z
	 /e0kEBYqIDHs2wgEt0nYqUF3aSPZpF8imnnLbyejtefJIjkkj17rJ+ER8KThanoHdQSQh
	 9wCqa2E/HXF0GcT0T9rqo7QTNKwXIckbLdnNeJGZ8zLkzgzEcLfkIQ519bljVmaZ/dnPY
	 v/bZ84V+NLyJPitlaI3fRgVhBAgFFI69tYhkvoK0yhY+yth8kB0T90WCu07cGjntDAhcr
	 eoF1L5/4HpxJtIBJC2oRWc6Hz/gJx8E15SyD9Ap3GqbpmUeuDcVFY/nbnCdof/m4MUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631099;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=35JVd7JHTplH0kPISXexxmmUu5opaelTLOPTCAo7hB4=;
	b=U3bhIET24Sa52UE6b1KM6kzu+fuYNwhSIN9I1wi6hGAsq4kdA2WwIU6ofcZSLXRZ5JGX
	 jHh/KJ8P8tryst0l+9lZR7yuKB9n9FXpe3+RU6h8RMuwJ0GufrDQlzCuQfCP6mBHw8Rfc
	 FG5/FOgj6ji4KpDiynOCusTEwG1CupXQoPVOfobW17tJg1mJnnZCiz20JSBElRo79zJEw
	 33BpdqG8DXCpRNCBhsCnP7phm8gkgGbd6SmTstL177zz9OsPf/Vkf8LjQQhpvWvOy3Y3g
	 1eKvmlJ47aAveGAnQvjAxRO1Z4Ga3c6ZWpA9aASU4fLB/z2HQ39acBF8a9KXS91AOyA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631099;
	bh=35JVd7JHTplH0kPISXexxmmUu5opaelTLOPTCAo7hB4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dpE92wQs+4br4r+Ds5tbU6txDR9Uh1XyqT3sEa40HMaz3DfLDlBTFgSsfYRK6WQ+J
	 PVljItLqopx1QXthpDhqumGaXKZOHWytWKv7FNuU6ePInVEe5yGULGdhOrW3aL/58M
	 UpPHFPdvH/r7EJtjCT2q7jjoevMmflKKSEKXygreJ1O+EfK1GTmLLnUWnDbYUwzt4P
	 aJ/Py92hAZ5EGjdCN6DmYT/L9n1m66rfOm4KgxIXub/zMl/mVvdj+m8T1f5wMIHR2s
	 eNXm9cVGwMCwcI5MJ6SLXaDMWV4H5M3dFy0lRVlosRmZjFVRMBBRdez+xyzxf+3WDm
	 NZ1CPS5uAiG4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53C8680EC8;
	Thu, 17 Sep 2026 07:44:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DFFA24D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 844E6400F6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OYuR3uYCaxR for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:44:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DC1EA400F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631096;
 b=g/ZjhcdcsuerkbeFyrZouSfjyAvY2LBAhImfIv0woRRpaNO/NfcEsrBxcsfPcuROnVj1
 6XrQ+JBribJQXy+8f7Z5+T6rswosLaC393eiX4oc068P9doLwEdvRXF3LNF9cFpuuG0id
 rvzHvRM0EFKc+S/7hBcI1wM1PZf1QiN9v0+dNnaUHurEE482Fum3n6znJj8s7w3NYP3BL
 q94FvTGjuE1VNG9I4FWbDPa0hyRZ1Ph0023NbSQeCtD0QV4aQFtzVdvciVUMWQC8Rkova
 2/K4vlw0A1aFjlwhO5oVfcEGwBxAsF3xJjQnbR5RJav29HzmvXcQm2hdu/SD7RNkzew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631096;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8/Wdwt5IcsjQzE7NKPPCUoIQUt8jHFEXch9N7v3EsiA=;
 b=c90HUYHzSDaMSTyQzj9Sje+l+Jn2SJptPcJgdAJtgoyYFZgmPdLjdPKSXTm4EiD+QkFq
 sbVfnMKhVkn3ZzTq/2UrVEzpVvZ2u/WKu1CkeoOyODOLhh5m/pMo61Qp+lUiccl6DEeSD
 ZPQVL68sr27lpU9kkrcyAjLIyju5fH66M0T0JyFEtO43krT92c/GS/TpYwODvatr5hX3d
 CqSL/DvKBkZcQlIDlkS87u9WeJkiFXel3sKGpxg5tYTwGeBO6HcGWfHPAuoASC8TMSIrc
 KQPJVfmeZ2WP6k9Mp5/XWacEch9Z0706ScBr8UQoSq2LdypVwzgjblWlj+/F9gdVqcA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC1EA400F3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:44:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26CB296B26; Thu, 17 Sep 2026 07:43:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 09:43:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1708d7055e0f9ee46b3223bf480dae07c58c915
X-Git-Newrev: bdf4dc05c55b2e578125ed8ab5ee0b440272bd16
X-Patchwork-Hint: ignore
Message-Id: <20260917074350.26CB296B26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdnsd: bump to version 1.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bdf4dc05c55b2e578125ed8ab5ee0b440272bd16
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Add support for running as an uprivileged user
 - Fix undefined behavior when caching malformed records

Release notes: https://github.com/troglobit/mdnsd/releases/tag/v1.2

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mdnsd/mdnsd.hash | 2 +-
 package/mdnsd/mdnsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdnsd/mdnsd.hash b/package/mdnsd/mdnsd.hash
index 024dc87cc1..e8c35b26ec 100644
--- a/package/mdnsd/mdnsd.hash
+++ b/package/mdnsd/mdnsd.hash
@@ -1,5 +1,5 @@
 # Upstream sha256 from GitHub
-sha256  b3f242415b2f29c510e709c862126ecab09d77e8dc1eecf1aefef879bce29003  mdnsd-1.1.tar.gz
+sha256  8f65b60c4e050f251db069bdde63c2eebcad7303f7a4638ef1a7cb423b8fb4c8  mdnsd-1.2.tar.gz
 
 # Locally computed
 sha256  89a722240ac1fdc0366696eaa5469968397ae274a0003e09a88d0686eeb3cd3e  LICENSE
diff --git a/package/mdnsd/mdnsd.mk b/package/mdnsd/mdnsd.mk
index ca443f6211..08fd1b569a 100644
--- a/package/mdnsd/mdnsd.mk
+++ b/package/mdnsd/mdnsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDNSD_VERSION = 1.1
+MDNSD_VERSION = 1.2
 MDNSD_SITE = https://github.com/troglobit/mdnsd/releases/download/v$(MDNSD_VERSION)
 MDNSD_LICENSE = BSD-3-Clause
 MDNSD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
