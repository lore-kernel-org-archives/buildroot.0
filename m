Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C23FC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:35:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7CD660FE6
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7CD660FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C16F828E3;
	Thu, 26 Aug 2021 22:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qA0khaUXNCAp; Thu, 26 Aug 2021 22:34:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F17B482849;
	Thu, 26 Aug 2021 22:34:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 151321BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 469A340790
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4k3J7Np6c-tf for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAD67407CF
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 293D58DC52; Thu, 26 Aug 2021 22:01:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 23 Aug 2021 23:37:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9aae755440d072ce91be6cc222570c40617e80ed
X-Git-Newrev: 912f9511de54f5a647e7aca52594c3020fe15ee8
X-Patchwork-Hint: ignore
Message-Id: <20210826220133.293D58DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/snort3: link with
 -latomic if needed
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=912f9511de54f5a647e7aca52594c3020fe15ee8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure raised since bump to version 3.1.6
in commit e66f2fd310374779d415fa683813cc5f5ccf6be9 and
https://github.com/snort3/snort3/commit/3e518d86040e74c328bcc0d5bbd49c1da6b7a3ec:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: service_inspectors/dce_rpc/CMakeFiles/dce_rpc.dir/dce_smb2_file.cc.o: undefined reference to symbol '__atomic_load_8@@LIBATOMIC_1.0'

Fixes:
 - http://autobuild.buildroot.org/results/df34a69175e61bc7b180d89c738747e19aaf13bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/snort3/snort3.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index aabc89e165..7495ab9b0f 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -54,4 +54,9 @@ else
 SNORT3_CONF_OPTS += -DHAVE_LZMA=OFF
 endif
 
+# Uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+SNORT3_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
