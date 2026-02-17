Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5677E909D5
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 16:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47C9D83F54;
	Tue, 17 Feb 2026 16:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbNJuO60EQ7E; Tue, 17 Feb 2026 16:21:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6495883F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771345280;
	bh=jqxUw5hZRhEqKd5t6l+PmP72PPU11AXfCG24KvXGX4M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rGmcPTIwoNXANY+BjqrEnbooA5UN7KmWUdlLD8RosG6VktAU370QPdwN1rGODBWxr
	 2GC27llAXcBbHtJJjyjI+7jscEW+heAo7ZtD8kOKbJevIdZm2RF5AgDH6M1UTCvfgL
	 xc2IRybTfrMTNhVNOGRY33T4gPpQqC10tsM8eOIZ6tTsuV9eV9Z/6l6rNhuFeoNVPn
	 QA/NH7A6BLySRs+Sy+RDJz8/dAVP6eh2mrYWgEOSls2zlC1+bUxgaARhanKvNUEQjl
	 rmi9im42BnxfKkKwK0/kgxU5eCd1lFj+Xx8sxgWZmBXprAuNwZe/HWBRfO1pEct+5P
	 cFvExdN9es5nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6495883F55;
	Tue, 17 Feb 2026 16:21:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03476206
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 16:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6EE440077
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 16:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gua3QqNmtPVM for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 16:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.36.140.181;
 helo=6.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79FE4407D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79FE4407D0
Received: from 6.mo533.mail-out.ovh.net (6.mo533.mail-out.ovh.net
 [54.36.140.181])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79FE4407D0
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 16:21:15 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net [152.228.215.222])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4fFkvv6Kr0z5vqp;
 Tue, 17 Feb 2026 16:03:39 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net. [127.0.0.1])
 by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Tue, 17 Feb 2026 16:03:39 +0000 (UTC)
Received: from mta6.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.168.160])
 by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4fFkvv54Y1z5vZY; Tue, 17 Feb 2026 16:03:39 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.9])
 (Authenticated sender: mooz@blockos.org)
 by mta6.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 41F8A8E1357; 
 Tue, 17 Feb 2026 16:03:39 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Cc: Vincent Cruz <mooz@blockos.org>,
	Vincent Jardin <vjardin@free.fr>
Date: Tue, 17 Feb 2026 17:00:24 +0100
Message-ID: <20260217160154.2037308-1-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260118213120.69615-2-vjardin@free.fr>
References: <20260118213120.69615-2-vjardin@free.fr>
MIME-Version: 1.0
x-ovh-tracer-id: 10473965360914549525
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEVXe7v25WjIm2AYro3m/GiCWSuAjjvMZTv3NU82K8oGdrYVFkbV2/KqSr2PLlF2dHo9kAOg1eYw1xDSoDIKs/lSavwGHVTj8PhMKV70NxPfnmLptMpJo1ybym3xJriy4ImPVSpX+XeCEuJHN+vaLWLgxdzRICt69cI8hAQvWeURaeoR4icLN0BEVpbEZ/J4HW8SAfwBakcXH7hmXnRPS74DnsjOcsCREgWsvQfS9gFZKYo6FBb4jdZfZ8hUjsS4lPtTuD2/HViLr+E9XPAt1F+IowlA8t4SB1J5YojBTqqg9wBkb6OGSMqHY8IO6J8ifA0YEIX9uC7lNFeL5LRSgnwMgvd9/PWUjzaFBnKYO7jvH5ibkrVMdqDuIrazDjPS8DIrLFJh0Ffh8+rLNtzBrXSzQXRLR3WU+A94iJrRM1C+VXp6BoFRyujZHpu9BdFDuuztDGuwOUfAhBKzCvMJPSRCNJMQe4Qo+z3je/Lw9O5rEQQbneT8A5+0YYexl3Yo1FlPOjB11bXdZJpbyKLiMGLq6OyG5pEcuy90c/Cj2nH+xoV7MqwGylUUbtQVGKsbguVxJ7ielGVPdJyAs1fte9u0EreaJwrXAiCk9K2yIWwRXR4/5ij0bNzEIefOU8B5i4u/YNR1fkuug2P7+n0wWjCkUheaZvLMklugFDOFepsRQ
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-111S0054f09899b-5385-433c-bb10-995d22f06c5d,
 A50BBDC4095FA4DBB1896327B39D412751EB2510) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH v2 1/1] package/sysrepo: fix build on riscv32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
  https://autobuild.buildroot.net/results/b0f/b0f30feeddad1a8d51ac87af8b7c56fd9a9b5ff6/build-end.log

Upstream: https://github.com/sysrepo/sysrepo/commit/a0661b7e6a7b2f784fe3222048066c31187c6f92

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Vincent Cruz <mooz@blockos.org>
---
v1 -> v2:
   - Backport upstream patch.

Tested with Buildroot gitlab CI:
  https://gitlab.com/v_cz/buildroot/-/pipelines/2331736795

 ...-sr_cond_futex-only-if-SYS_futex-sys.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch

diff --git a/package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch b/package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch
new file mode 100644
index 0000000000..d1d2eac758
--- /dev/null
+++ b/package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch
@@ -0,0 +1,33 @@
+From 6917e00fb6c99a97dacdae7040e5c4c53752b10f Mon Sep 17 00:00:00 2001
+From: Vincent Cruz <mooz@blockos.org>
+Date: Tue, 17 Feb 2026 14:14:06 +0100
+Subject: [PATCH 1/1] cmake UPDATE use sr_cond_futex only if SYS_futex syscall
+ is available
+
+Some architectures (for ex. riscv32) may not support SYS_futex system
+call, even though linux/futex.h include file is present.
+
+Upstream: https://github.com/sysrepo/sysrepo/commit/a0661b7e6a7b2f784fe3222048066c31187c6f92
+
+Signed-off-by: Vincent Cruz <mooz@blockos.org>
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9b36de44..e1b39c8c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -163,7 +163,8 @@ set(NACM_SRMON_DATA_PERM "600" CACHE STRING "NACM modules ietf-netconf-acm and s
+ # sr_cond implementation
+ if(NOT SR_COND_IMPL)
+     check_include_file("linux/futex.h" HAS_FUTEX)
+-    if(HAS_FUTEX)
++    check_symbol_exists(SYS_futex "sys/syscall.h" HAS_SYS_FUTEX)
++    if(HAS_FUTEX AND HAS_SYS_FUTEX)
+         set(SR_COND_IMPL "sr_cond_futex")
+     else()
+         set(SR_COND_IMPL "sr_cond_pthread")
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
