Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C1EE64018
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 10:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27CE080FC1;
	Sun,  5 Apr 2026 10:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwWaUrt7y1VM; Sun,  5 Apr 2026 10:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 423EC80FEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775386038;
	bh=GNYIqL9pda7TUoR0hUN9VMXGuZ0qTsBLF4XD41F/ARo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=TVZ+hCdWwpUAYtW/wQmrqQp9O9zVKbtr+JGkj7TPD6ed0RlhmEoZV94O+jdXp77n+
	 yiP0zpuU73egZdz3JMdALkCrdl6o5ak/Ue+MzjxOu07c4kiiohRbPVTCdyBNlrz7LM
	 JJoTJR4z/IxezZ4QDq+dZMXgXRF3cNsTTLKUc5GCaOj+cAMC/d8+u4hqZCxmKKcoxX
	 iheXffr73Iywok38rYmYBnURQJRJw4xrd4XLneJebOK7fp7UsQzTH2bgn98eNw6+QW
	 Bbq1UqHXYwGZvQX5wiBByoow4FldWnlTReAqTF7Cvbqf67mFkQ5HIQUhL4qW/I2/E9
	 bqtVjr1jkKesg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 423EC80FEF;
	Sun,  5 Apr 2026 10:47:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F25C22EF
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 10:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8C75400FB
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 10:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PxVv6amhq8L for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 10:47:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B25604005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B25604005B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B25604005B
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 10:47:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3D0BC5FFC0;
 Sun,  5 Apr 2026 12:47:12 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun,  5 Apr 2026 12:46:59 +0200
Message-ID: <20260405104659.51959-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775386033;
 bh=7axl7QjtGtrVY73mfCaez/QzHnY6E/3QkcNhYq2jtTw=;
 h=From:To:Cc:Subject:Date:From;
 b=p42cHnZRE0AydAKUt9JN077rdvO3qV9c6bMbzT+ofNM9tr1S5yBmHeQ6n7LigLX1R
 Oj5YmpcrvbtMSTg1lebgu4PbNu7urHbrAFmSc+ope6uR1LTJMqfjfq9+jNTzqUJzdW
 xtBYqpgpZu8zIZpYHTR/eJPReBLNDw/L9XKXKpwmaR4/yVmgzabLAzb4i5jhpCPZPs
 j1gdUW+6EG+WwqsVtRQ5iyGpgao73HrJSz4090YraqoQcBcNmyNYO9G9gGHszGccxN
 tWw0C8/5CsqKhjoTfP4JDhqKBLoh45TImv3MyYPZFDRL9Dcuf2Hoqb7IdEJfp1WBwX
 pzjBva/HGy+wA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p42cHnZR
Subject: [Buildroot] [PATCH 1/1] package/mkpasswd: add dependency to
 host-libxcrypt
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host-mkpasswd package needs the <crypt.h> header file installed
on the host. This file was initially provided by the libc headers,
as part of its libcrypt implementation. libcrypt was removed in
glibc 2.39. Most Linux distributions continued to ship a libcrypt
replacement such as libxcrypt in their default installation.

Some mainstream Linux distribution (such as Debian testing) are
now starting to remove this libcrypt and <crypt.h> header from their
default image (of development files).

In that case, host-mkpasswd is failing to build with the error:

    /buildroot/output/build/host-mkpasswd/mkpasswd.c:54:10: fatal error: crypt.h: No such file or directory

The issue can be reproduced by adapting the Buildroot Docker file,
by setting "FROM debian:testing-20260316" in [1] and removing
the build of tar.

Note: debian 13 (for example Docker tag trixie-20260316) still
includes the libcrypt-dev package by default, which provides crypt.h.

In Buildroot, there is already the host-heimdal and host-systemd
packages requiring host-libxcrypt. Also, the host-libxcrypt is a
small standalone package. For those reasons, instead of adding
the Buildroot prerequisite on the user host to provide a libcrypt
implementation, this commit simply add the package dependency to
host-libxcrypt, to make sure it will work in all situations.

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/support/docker/Dockerfile#L11

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mkpasswd/mkpasswd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mkpasswd/mkpasswd.mk b/package/mkpasswd/mkpasswd.mk
index c1117ef65c..6ab6419824 100644
--- a/package/mkpasswd/mkpasswd.mk
+++ b/package/mkpasswd/mkpasswd.mk
@@ -9,6 +9,8 @@
 # at revision 5a0f08500fa51608b6d3b73ee338be38c692eadb
 HOST_MKPASSWD_LICENSE = GPL-2.0+
 
+HOST_MKPASSWD_DEPENDENCIES = host-libxcrypt
+
 define HOST_MKPASSWD_EXTRACT_CMDS
 	cp $(HOST_MKPASSWD_PKGDIR)/*.c $(HOST_MKPASSWD_PKGDIR)/*.h $(@D)
 endef
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
