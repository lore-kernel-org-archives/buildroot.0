Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14178C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D164160E49;
	Fri, 18 Sep 2026 19:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyElBeJ1_iFy; Fri, 18 Sep 2026 19:39:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CA21060E72
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760359;
	b=PC6p6KqyuOxwUkzW6+N8e6AAO9g0wYmT6IlhZ7TMvw7iI7P4DDmavYt/dLWuWYRcgZup
	 CPRCEKMHK4nAngplScOG5lN3NQJBRq4OYVdyeaEk7X1uLdKbB769RJyg/8sgPAk/tBvN1
	 aCkoEb/4ksk/2TMeHvJMSNWvV1cpe3y3r5D+5Ez38xNG2l8YQ8LEf9TnT9m3gSqZxbncz
	 5oUXK1zqpE46HHKcJoKEay6zTTkok0khbCRK75FUnUxZuPOAhcFod3sZet2pQJrOHU2TD
	 gh48ISmqgqVbPN2Daxg9XuNdrc+sJ5yFQHCYrJ1apIHL7Vq5BpgEefCytYy2dXN93iw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760359;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4AspWsdrfqo3y+bMiwsXAumiCYPmOCP0V8sUALNWL8E=;
	b=e48yzTbUeTCfq68GJMB18Xo8XchYtb8sWt3kiLKWebUrdIxgFVDdr3sl0qRqS/BG3FF/
	 X1CGf116TToz+g1MJMVPqDNJcOc2ecSLm0LjF+8p3bhzGwOKeu5s6gJNcZdkHncVX5czc
	 H+j79mELy8Q9tRBsEmIjzLM18sYGUfHFeIZ3luiaJoLw+vmifM8DiBqGTHXgRj3sMQZGR
	 4Ogry8Ubfuutby5pXnF0CO0LwIkr67julF0Y2K6mvWZp2lQuYyauFA41DuLOpmberp+dC
	 xDhOvcaZxuABAPjWzgSMDvJgsON4XNU94rhafC3eJ7ZPrrEawyo5AiVDqXn4tZaK6uw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760359;
	bh=4AspWsdrfqo3y+bMiwsXAumiCYPmOCP0V8sUALNWL8E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dazp2a9GdSwz+Gko/MIpWZXxeXaXwG484ryJnqqLpc1mlfnFNd8aZj3/Y/PbSttxP
	 oQ9EcNxqFNgc394w6JAwFKk/BnVT76xCQYAKolLWDeEGm31tREuECnJFbFJdU8qPfS
	 7Y9qeBGEuZ1cu3W0zO/P9qsWW1NV/CED0quoInL7HtsneHstpPUEce4W+w7oJ8G9Za
	 TGdtJFsrle56rNUqKdqzmHhok4wD0wyQnmCV3n8Q95Ob0R/B28O0LCALBtr8zO8CB7
	 RZyC46j+lLdb9YXJDy84fH8fo9ypsICx5vTs6Yc77otdzVyw37C5W09rY4MmU92+b7
	 Z1/PtjttaEe6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA21060E72;
	Fri, 18 Sep 2026 19:39:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70D453B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5613D60E72
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PxxSEirpt1ew for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:39:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 89C3760E49
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760357;
 b=S6Rv6YtY/ntk/G7Uh8F7pWM3Kve+I87YVm3XK+Rzv8fj6beT4+mYXHtQMhhKRmbDfhDD
 HvQZd0OH88w7cTe9kcFYRIubFWXTieYTipVV10elyec2AJXVKqVVzCa3tmkMpXDzBIp/N
 WDVhGHHNvfKYb9ZXCKK4+7xBmJ7eJVSY4/CRf02YbO8SpndQhKOO+5cbmAopaMNMQ3Hvd
 uxqPVEJElPCvvdNv07GiZ4WBtZWW4rRXYEJJxDujdUj1+bPVpD/1KVHzNO7ZwNUayBqRs
 OmHoNidRmTxa0UaHULFlSJF1gukcv+581ASzcu3w5sE/GVrz79alXFNoub8SpKUD0Jw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760357;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=07IrMQuGoobwijq3Mk/XHTjHZ78Lb4GOq7WxTFzS/KM=;
 b=Q5rDy6g31zRjnAYCA45iHrlw2HRdbGt+qr8SShjtmxsBFxRiXYpNH+/ySsct5RhtK06c
 0tBlDN0mVbQVohiXfHZzaVwvcqdsWfFWLiDbiSzr7/iWbp8+W4bocWRHyMuV1IYgthj7Q
 by3xUSgzHYCwDbjpZF4XMmF/a+t6aNK9xwmi+3hheDyYbgVB27KmOGRPBSkiI/oYM3qZG
 gcUyv6AvwhthiRY8JGqSC7EQKf34QQPAGdhLsVYM0kHeTvD/gETxexTVjT4VYX2P8lVCg
 CiRwWtzARN7N5JDkuZEZGC6JTpcGy4lPqqbo4E+K4ptsXG2mHihXrhtNjnHnLcmByhQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89C3760E49
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11940976A4; Fri, 18 Sep 2026 19:38:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:38:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 318d4ce4e55e862f61f5c79b877d228e9a264da2
X-Git-Newrev: 83aefd8099ab70122620f7bd74c266c678604f36
X-Patchwork-Hint: ignore
Message-Id: <20260918193810.11940976A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oprofile: fix build with binutils
 2.47
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83aefd8099ab70122620f7bd74c266c678604f36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes build error using this defconfig:

BR2_BINUTILS_VERSION_2_47_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_OPROFILE=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0004-Fix-build-with-binutils-2.47.patch        | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/package/oprofile/0004-Fix-build-with-binutils-2.47.patch b/package/oprofile/0004-Fix-build-with-binutils-2.47.patch
new file mode 100644
index 0000000000..ab2b042ce4
--- /dev/null
+++ b/package/oprofile/0004-Fix-build-with-binutils-2.47.patch
@@ -0,0 +1,118 @@
+From 0a9a94a4f212fea58792e35b195587a153919968 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 30 Jul 2026 11:33:45 -0700
+Subject: [PATCH] Fix build with binutils 2.47
+
+binutils 2.47 removed the bfd_boolean compatibility define, together with
+the TRUE/FALSE macros that came along with it, see binutils commit
+1d95b744c069 ("Remove bfd_boolean definition from bfd").
+
+Use the C99 bool/false from <stdbool.h> instead, which is what the bfd
+API has been returning since binutils 2.36.
+
+While here, make _bfd_target_name a 'char const *' since that is the type
+of bfd_target::name; it is only ever read.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+
+Downloaded from
+https://git.openembedded.org/meta-openembedded/commit/?id=a884b55acd042b8ab29c70952c0d8daff48a1468
+
+Upstream: https://sourceforge.net/p/oprofile/bugs/296/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libopagent/opagent.c   |  5 +++--
+ opjitconv/create_bfd.c | 13 +++++++------
+ 2 files changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/libopagent/opagent.c b/libopagent/opagent.c
+index f280880..c3d1af9 100644
+--- a/libopagent/opagent.c
++++ b/libopagent/opagent.c
+@@ -52,6 +52,7 @@
+ 
+ #include "config.h"
+ #include <stdio.h>
++#include <stdbool.h>
+ #include <errno.h>
+ #include <string.h>
+ #include <stdint.h>
+@@ -70,7 +71,7 @@
+ #include "jitdump.h"
+ 
+ // Declare BFD-related global variables.
+-static char * _bfd_target_name;
++static char const * _bfd_target_name;
+ static int _bfd_arch;
+ static unsigned int _bfd_mach;
+ 
+@@ -78,7 +79,7 @@ static unsigned int _bfd_mach;
+ static int define_bfd_vars(void)
+ {
+ 	bfd * bfd;
+-	bfd_boolean r;
++	bool r;
+ 	int len;
+ #define MAX_PATHLENGTH 2048
+ 	char mypath[MAX_PATHLENGTH];
+diff --git a/opjitconv/create_bfd.c b/opjitconv/create_bfd.c
+index da1e6d2..3124d88 100644
+--- a/opjitconv/create_bfd.c
++++ b/opjitconv/create_bfd.c
+@@ -20,6 +20,7 @@
+ 
+ #include <bfd.h>
+ #include <assert.h>
++#include <stdbool.h>
+ #include <stdint.h>
+ #include <stdio.h>
+ 
+@@ -65,7 +66,7 @@ static int fill_symtab(void)
+ 		syms[i] = s;
+ 	}
+ 	r = bfd_set_symtab(cur_bfd, syms, entry_count);
+-	if (r == FALSE) {
++	if (r == false) {
+ 		bfd_perror("bfd_set_symtab");
+ 		rc = OP_JIT_CONV_FAIL;
+ 	}
+@@ -88,11 +89,11 @@ asection * create_section(bfd * abfd, char const * section_name,
+ 		goto error;
+ 	}
+ 	op_bfd_set_section_vma(abfd, section, vma);
+-	if (op_bfd_set_section_size(abfd, section, size) == FALSE) {
++	if (op_bfd_set_section_size(abfd, section, size) == false) {
+ 		bfd_perror("bfd_set_section_size");
+ 		goto error;
+ 	}
+-	if (op_bfd_set_section_flags(abfd, section, flags) == FALSE) {
++	if (op_bfd_set_section_flags(abfd, section, flags) == false) {
+ 		bfd_perror("bfd_set_section_flags");
+ 		goto error;
+ 	}
+@@ -134,7 +135,7 @@ static int create_text_section(int start_idx, int end_idx)
+ int fill_section_content(bfd * abfd, asection * section,
+ 			 void const * b, file_ptr offset, size_t sz)
+ {
+-	if (bfd_set_section_contents(abfd, section, b, offset, sz) == FALSE) {
++	if (bfd_set_section_contents(abfd, section, b, offset, sz) == false) {
+ 		bfd_perror("bfd_set_section_contents");
+ 		return OP_JIT_CONV_FAIL;
+ 	}
+@@ -257,11 +258,11 @@ bfd * open_elf(char const * filename)
+ 		bfd_perror("bfd_openw");
+ 		goto error1;
+ 	}
+-	if (bfd_set_format(abfd, bfd_object) == FALSE) {
++	if (bfd_set_format(abfd, bfd_object) == false) {
+ 		bfd_perror("bfd_set_format");
+ 		goto error;
+ 	}
+-	if (bfd_set_arch_mach(abfd, dump_bfd_arch, dump_bfd_mach) == FALSE) {
++	if (bfd_set_arch_mach(abfd, dump_bfd_arch, dump_bfd_mach) == false) {
+ 		bfd_perror("bfd_set_arch_mach");
+ 		goto error;
+ 	}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
