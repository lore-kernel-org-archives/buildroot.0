Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30CDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 15:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E7434047B;
	Sat, 30 Apr 2022 15:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbFXS_tGA4Bo; Sat, 30 Apr 2022 15:46:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9ED54040C;
	Sat, 30 Apr 2022 15:46:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45B291BF94D
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 15:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 350178407A
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 15:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qy6XB2WxJxEA for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 15:46:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12F2080D2A
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 15:46:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E5915846F0; Sat, 30 Apr 2022 15:35:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 17:41:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0b25f145469a14e3d85becf19aaca0a40fd4e25
X-Git-Newrev: 43b4017ba7c5f2636e6a3f674c63c50050956ea4
X-Patchwork-Hint: ignore
Message-Id: <20220430153553.E5915846F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbpf: build for host
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=43b4017ba7c5f2636e6a3f674c63c50050956ea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libbpf/libbpf.mk | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index d6914757d7..f50a82b581 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -10,6 +10,7 @@ LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
 LIBBPF_CPE_ID_VENDOR = libbpf_project
 LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf elfutils zlib
+HOST_LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf host-elfutils host-zlib
 LIBBPF_INSTALL_STAGING = YES
 
 define LIBBPF_BUILD_CMDS
@@ -38,4 +39,27 @@ define LIBBPF_INSTALL_TARGET_CMDS
 		-C $(@D)/src install DESTDIR=$(TARGET_DIR)
 endef
 
+# We need to install_uapi_headers so we have btf.h to compile
+# host-pahole.
+# Nonetheless, this target adds bpf.h which generates a conflict when
+# building the kernel:
+# In file included from libbpf_internal.h:17:0, from strset.c:9:
+# relo_core.h:10:6: error: nested redefinition of 'enum bpf_core_relo_kind'
+# enum bpf_core_relo_kind {
+# ^~~~~~~~~~~~~~~~~~
+# relo_core.h:10:6: error: redeclaration of 'enum bpf_core_relo_kind'
+# In file included from libbpf_legacy.h:13:0,
+# 		from libbpf_internal.h:16,
+# 		from strset.c:9:
+# /home/francis/buildroot/output/host/include/linux/bpf.h:6497:6: note: originally defined here
+# enum bpf_core_relo_kind {
+# So, better to remove remove it now since we do not need it to build
+# host-pahole, the only user of host-libbpf.
+define HOST_LIBBPF_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src install install_uapi_headers DESTDIR=$(HOST_DIR)
+	rm $(HOST_DIR)/include/linux/bpf.h
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
