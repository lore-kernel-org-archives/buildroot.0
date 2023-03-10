Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816DFC6FD1E
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 20:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01EF741705;
	Fri, 10 Mar 2023 20:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01EF741705
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e21FoL0HdfGK; Fri, 10 Mar 2023 20:55:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F7054170D;
	Fri, 10 Mar 2023 20:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F7054170D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E1F31BF97E
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 263734188B
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 263734188B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZ9C2-72Vd1b for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 20:54:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEA7D4160B
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 20:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEA7D4160B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBBA886E19; Fri, 10 Mar 2023 20:54:49 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Mar 2023 21:48:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37be4bda854d921e4db7f4202c3a99f98c1bfb69
X-Git-Newrev: 7ff3e631419ef59dd2c8f163cf1a3e534e118079
X-Patchwork-Hint: ignore
Message-Id: <20230310205449.CBBA886E19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbpf: Don't remove bpf.h
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ff3e631419ef59dd2c8f163cf1a3e534e118079
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libbpf >1.0.0 defines libbpf_bpf_link_type_str(enum bpf_link_type) in
src/libbpf.h, which is included by host-pahole.
bpf_link_type is defined in linux/bpf.h, therefore the comment stating
that pahole doesn't need bpf.h is no longer valid.

The original reason to remove bpf.h has been solved with the previous
commit: the linux build will prefer the internal bpf.h over the one in
HOST_DIR (or in /usr/include). So we can safely keep bpf.h.

Fixes:
- http://autobuild.buildroot.net/results/d126a4b6eca786402dc362c86f8df3addec3d217/

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libbpf/libbpf.mk | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index b498136ace..670dbee87e 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -39,26 +39,9 @@ define LIBBPF_INSTALL_TARGET_CMDS
 		-C $(@D)/src install DESTDIR=$(TARGET_DIR)
 endef
 
-# We need to install_uapi_headers so we have btf.h to compile
-# host-pahole.
-# Nonetheless, this target adds bpf.h which generates a conflict when
-# building the kernel:
-# In file included from libbpf_internal.h:17:0, from strset.c:9:
-# relo_core.h:10:6: error: nested redefinition of 'enum bpf_core_relo_kind'
-# enum bpf_core_relo_kind {
-# ^~~~~~~~~~~~~~~~~~
-# relo_core.h:10:6: error: redeclaration of 'enum bpf_core_relo_kind'
-# In file included from libbpf_legacy.h:13:0,
-# 		from libbpf_internal.h:16,
-# 		from strset.c:9:
-# /home/francis/buildroot/output/host/include/linux/bpf.h:6497:6: note: originally defined here
-# enum bpf_core_relo_kind {
-# So, better to remove remove it now since we do not need it to build
-# host-pahole, the only user of host-libbpf.
 define HOST_LIBBPF_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
 		-C $(@D)/src install install_uapi_headers DESTDIR=$(HOST_DIR)
-	rm $(HOST_DIR)/include/linux/bpf.h
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
