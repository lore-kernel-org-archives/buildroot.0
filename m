Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C897C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:56:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB85560EC0
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB85560EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FCF482F9B;
	Sun,  8 Aug 2021 09:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3fcOMdXijXM; Sun,  8 Aug 2021 09:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC16082CA5;
	Sun,  8 Aug 2021 09:56:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00E411BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB34E82C98
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_inba4Qyof2 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:55:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D732582C1E
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:55:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7D6A08D205; Sun,  8 Aug 2021 09:54:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 11:26:59 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 5d5f3484d62333e51ff7cd7bd24a2c0f47977c46
X-Git-Newrev: 2f132f14161410f771298df7fee0188de3148829
X-Patchwork-Hint: ignore
Message-Id: <20210808095442.7D6A08D205@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/wireshark: link
 with -latomic if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f132f14161410f771298df7fee0188de3148829
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fix the following build failure raised since bump to version 3.4.7 in
commit bb75c4b541fac144b53b63248e235f22ba1d25ad:

/tmp/instance-5/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ui/qt/CMakeFiles/qtui.dir/sequence_diagram.cpp.o: undefined reference to symbol '__atomic_compare_exchange_4@@LIBATOMIC_1.0'
/tmp/instance-5/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /tmp/instance-5/output-1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

Fixes:
 - http://autobuild.buildroot.org/results/6617ee0e0046a0452a1515b89e9c704b1c125ec4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0344be5299259c9f3e2e928b51af6868948e78bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index e852083de6..6ee4b20391 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -43,6 +43,10 @@ endef
 
 WIRESHARK_PRE_BUILD_HOOKS += WIRESHARK_BUILD_LEMON_TOOL
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+WIRESHARK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 ifeq ($(BR2_GCC_ENABLE_LTO),y)
 WIRESHARK_CONF_OPTS += -DENABLE_LTO=ON
 else
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
