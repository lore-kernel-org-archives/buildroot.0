Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A549C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:24:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E72D361075
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E72D361075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB03440265;
	Sat,  7 Aug 2021 08:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqsaGdC5Uesj; Sat,  7 Aug 2021 08:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CD7D40233;
	Sat,  7 Aug 2021 08:24:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 051B41BF2FA
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5C52400E9
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4pYn0WQb5wh for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 08:24:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE701400D8
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 08:24:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E9EF685CD7; Sat,  7 Aug 2021 08:24:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 10:21:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9d585a41701d5ef1df7955faf0ee057132769e6
X-Git-Newrev: 5a9168edd446b9396080cf70d4b64f3717288837
X-Patchwork-Hint: ignore
Message-Id: <20210807082425.E9EF685CD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: disable vhost-user with
 uclibc-ng
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
