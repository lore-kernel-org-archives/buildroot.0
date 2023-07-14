Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528D5EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E409B4048F;
	Fri, 14 Jul 2023 21:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E409B4048F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYxaChlSTArV; Fri, 14 Jul 2023 21:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26C7A40541;
	Fri, 14 Jul 2023 21:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26C7A40541
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A02871BF983
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7832C417D0
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7832C417D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id meW1RmlrkUbd for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:20:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C961417CD
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C961417CD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67D17870B3; Fri, 14 Jul 2023 21:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 23:18:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52b325d1d4b884f661d143aa5311ba7737c77dd3
X-Git-Newrev: 0368cd816307ee961bbd17ce2d3827b955b0c204
X-Patchwork-Hint: ignore
Message-Id: <20230714212034.67D17870B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh: fix build with Thumb
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0368cd816307ee961bbd17ce2d3827b955b0c204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/home/buildroot/autobuild/instance-3/output-1/build/libssh-0.10.5/src/bignum.c:
 In function 'ssh_make_bignum_string':
/home/buildroot/autobuild/instance-3/output-1/build/libssh-0.10.5/src/bignum.c:64:1:
 sorry, unimplemented: '-fstack-check=specific' for Thumb-1

Fixes:
http://autobuild.buildroot.net/results/82c/82c8e3bb755bc8732a81f05a72f04a96ecc08b4e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libssh/libssh.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 3be6c6adaf..e770d2b924 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -17,6 +17,10 @@ LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
 	-DWITH_EXAMPLES=OFF
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBSSH_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSSH_SERVER),y)
 LIBSSH_CONF_OPTS += -DWITH_SERVER=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
