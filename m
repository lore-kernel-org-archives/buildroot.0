Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3DCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6AE4168D;
	Sat, 14 May 2022 09:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTf5uHRrMp4C; Sat, 14 May 2022 09:54:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6929F4093D;
	Sat, 14 May 2022 09:54:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30FC41BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AD7583FB3
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vF-FaSb8hKsr for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9EAB83FB8
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 680C583769; Sat, 14 May 2022 09:39:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a0514c6e53cee4acd104b623ea8f347ad062cea
X-Git-Newrev: b980be3c5d4d1566fba8e20866bd88172084df5b
X-Patchwork-Hint: ignore
Message-Id: <20220514093944.680C583769@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcsc-lite: link with -latomic if
 needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=b980be3c5d4d1566fba8e20866bd88172084df5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link with -latomic if needed to avoid the following build failure since
bump to version 1.9.6 in commit b02f13cd54912f3dffd0e0863378050104430d77
and
https://github.com/LudovicRousseau/PCSC/commit/d56ed18dbebc4423506ce7f61d3e3bcf4bdc4cb0:

/nvmedata/autobuild/instance-11/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: pcscd-readerfactory.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'

Fixes:
 - http://autobuild.buildroot.org/results/80b2197a37073976a7dcec7b0f92dba1b26fb3f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pcsc-lite/pcsc-lite.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index a5ff074b2c..5bf9ce7f30 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -45,4 +45,8 @@ ifeq ($(PACKAGE_PCSC_LITE_EMBEDDED),y)
 PCSC_LITE_CONF_OPTS += --enable-embedded
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+PCSC_LITE_CONF_ENV += LIBS=-latomic
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
