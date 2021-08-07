Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E06C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:03:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C71A760FD9
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C71A760FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93D4040777;
	Thu, 26 Aug 2021 22:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K15Kte7O9QlN; Thu, 26 Aug 2021 22:03:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD4014071D;
	Thu, 26 Aug 2021 22:03:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 374211C113E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB66882B8C
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RuEqhuCCw-J0 for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B2E982AC8
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C02A98DC50; Thu, 26 Aug 2021 22:01:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 10:21:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a9d585a41701d5ef1df7955faf0ee057132769e6
X-Git-Newrev: 5a9168edd446b9396080cf70d4b64f3717288837
X-Patchwork-Hint: ignore
Message-Id: <20210826220126.C02A98DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qemu: disable
 vhost-user with uclibc-ng
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a9168edd446b9396080cf70d4b64f3717288837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disable vhost-user on uclibc-ng as it raises build failures since bump
to version 6.0.0 in commit 6b86c9335fc3ff381878156c6243454d4b688df9 and
https://github.com/qemu/qemu/commit/810033be083040591fee2fc09f2f294670ed1930

The issue is that F_ADD_SEALS and F_SEAL_xxx variables are not defined on
uclibc-ng (even if MFD_ALLOW_SEALING is defined) resulting in the
following build failure:

../subprojects/libvhost-user/libvhost-user.c:1637:22: error: 'F_ADD_SEALS' undeclared (first use in this function)
 1637 |     ret = fcntl(*fd, F_ADD_SEALS, flags);
      |                      ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/9f393539931b51191cf7128e5c618c2398fc86c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: use conditional block like for all other OPTS]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 470c285f16..50ace104ce 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -56,6 +56,12 @@ endif
 
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+QEMU_OPTS += --disable-vhost-user
+else
+QEMU_OPTS += --enable-vhost-user
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_SLIRP),y)
 QEMU_OPTS += --enable-slirp=system
 QEMU_DEPENDENCIES += slirp
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
